package web.Servlet;

import domain.User_Login;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceImpl;
import util.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String verifycode = request.getParameter("verifycode");
        Object checkcode_server = request.getSession().getAttribute("CHECKCODE_SERVER");
        request.getSession().removeAttribute("CHECKCODE_SERVER"); //make sure the check code is valid for only once
        String checkCode = checkcode_server.toString();

        if (checkCode.equalsIgnoreCase(verifycode)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserService service = new UserServiceImpl();
            User_Login user_login = service.findUser(username, password);

            if (user_login != null) {
                request.getSession().setAttribute("user_login",user_login);
                request.getSession().setAttribute("login_name",service.findName(user_login));
                response.sendRedirect(request.getContextPath() + "/index.jsp");

            } else {
                request.setAttribute("error_msg","Wrong username or password!");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }

        } else {
            request.setAttribute("error_msg","Wrong verify code!");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
