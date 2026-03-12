package controller;

import dao.AdminDAO;
import model.AdminBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminBean admin = new AdminBean();
        admin.setUsername(username);
        admin.setPassword(password);

        boolean status = AdminDAO.login(admin);

        if (status) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            
            boolean s = AdminDAO.login(admin);

System.out.println("Username: " + username);
System.out.println("Password: " + password);
System.out.println("Login status: " + s);

            response.sendRedirect("dashboard.jsp");

        } else {

            request.setAttribute("error", "Invalid Username or Password");

            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}