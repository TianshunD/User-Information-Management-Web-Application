package web.Servlet;

import domain.PageBean;
import domain.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findUserByPageServlet")
public class findUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPage = request.getParameter("currentPage");
        if (currentPage==null || "".equals(currentPage)) {
            currentPage="1";
        }
        UserService service = new UserServiceImpl();


        Map<String, String[]> condition = request.getParameterMap();
        PageBean<User> pb = service.findUserByPage(currentPage, 5, condition);

        System.out.println(pb);
        //Output example:PageBean{totalCount=6, totalPage=2, list=[User{id=10, name='cass', gender='Male', age=22, address='IL', qq='123', email='123@qq.com'}, User{id=11, name='sam', gender='Male', age=22, address='IL', qq='123', email='123@qq.com'}, User{id=12, name='dean', gender='Male', age=22, address='LA', qq='123', email='123@qq.com'}, User{id=13, name='henry', gender='Female', age=22, address='NY', qq='123', email='123@qq.com'}, User{id=14, name='morgan', gender='Male', age=24, address='IL', qq='123', email='123@qq.com'}], currentPage=1, rows=5}

        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);
        request.getRequestDispatcher("/list.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
