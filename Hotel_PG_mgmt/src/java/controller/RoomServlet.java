package controller;

import dao.RoomDAO;
import model.RoomBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomNumber = Integer.parseInt(request.getParameter("room_number"));
        String roomType = request.getParameter("room_type");
        int totalBeds = Integer.parseInt(request.getParameter("total_beds"));
        int occupiedBeds = Integer.parseInt(request.getParameter("occupied_beds"));
        String status = request.getParameter("status");

        RoomBean room = new RoomBean();

        room.setRoomNumber(roomNumber);
        room.setRoomType(roomType);
        room.setTotalBeds(totalBeds);
        room.setOccupiedBeds(occupiedBeds);
        room.setStatus(status);

        int result = RoomDAO.addRoom(room);

        if (result > 0) {
            response.sendRedirect("rooms.jsp");
        } else {
            response.getWriter().println("Room not added");
        }
    }
}