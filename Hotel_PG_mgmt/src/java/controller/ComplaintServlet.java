package controller;

import dao.ComplaintDAO;
import model.ComplaintBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ComplaintServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int tenantId = Integer.parseInt(request.getParameter("tenant_id"));
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");
        String status = request.getParameter("status");

        ComplaintBean complaint = new ComplaintBean();

        complaint.setTenantId(tenantId);
        complaint.setRoomId(roomId);
        complaint.setTitle(title);
        complaint.setDescription(description);
        complaint.setPriority(priority);
        complaint.setStatus(status);

        int result = ComplaintDAO.addComplaint(complaint);

        if (result > 0) {
            response.sendRedirect("complaints.jsp");
        } else {
            response.getWriter().println("Complaint not added");
        }
    }
}