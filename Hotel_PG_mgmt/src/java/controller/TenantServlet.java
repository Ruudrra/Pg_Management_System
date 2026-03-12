package controller;

import dao.TenantDAO;
import model.TenantBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class TenantServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String joinDate = request.getParameter("join_date");
        String status = request.getParameter("status");

        TenantBean tenant = new TenantBean();

        tenant.setName(name);
        tenant.setPhone(phone);
        tenant.setRoomId(roomId);
        tenant.setJoinDate(joinDate);
        tenant.setStatus(status);

        int result = TenantDAO.addTenant(tenant);

        if (result > 0) {
            response.sendRedirect("tenants.jsp");
        } else {
            response.getWriter().println("Tenant not added");
        }
    }
}