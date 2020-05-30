package web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/**
 * Filter out sensitive words
 */
@WebFilter("/*")
public class SensitiveWordsFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //Create Proxy for enhance getParameter method
        ServletRequest proxy_req = (ServletRequest) Proxy.newProxyInstance(req.getClass().getClassLoader(), req.getClass().getInterfaces(), new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                if ("getParameter".equals(method.getName())) {
                    String value = (String) method.invoke(req,args);
                    if(value != null){
                        for (String str : wordsList) {
                            if(value.contains(str)){
                                System.out.println("value=======================");
                                value = value.replaceAll(str,"**");
                            }
                        }
                    }

                    return  value;
                }

                //Other methods will stay the same
                return method.invoke(req,args);
            }
        });

        chain.doFilter(proxy_req, resp);
    }

    private List<String> wordsList = new ArrayList<>(); //for storing sensitive words
    public void init(FilterConfig config) throws ServletException {
        try{
            //get file real path
            ServletContext servletContext = config.getServletContext();
            String realPath = servletContext.getRealPath("/WEB-INF/classes/sensitiveWords.txt");

            BufferedReader br = new BufferedReader(new FileReader(realPath));
            //load data
            String line = null;
            while((line = br.readLine())!=null){
                wordsList.add(line);
            }

            br.close();

            System.out.println(wordsList);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
