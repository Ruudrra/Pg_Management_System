package dao;

import java.sql.*;
import java.util.ArrayList;
import model.ComplaintBean;

public class ComplaintDAO {

    public static int addComplaint(ComplaintBean c) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO complaint(tenant_id,room_id,title,description,priority,status) VALUES(?,?,?,?,?,?)"
            );

            ps.setInt(1, c.getTenantId());
            ps.setInt(2, c.getRoomId());
            ps.setString(3, c.getTitle());
            ps.setString(4, c.getDescription());
            ps.setString(5, c.getPriority());
            ps.setString(6, c.getStatus());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ArrayList<ComplaintBean> getAllComplaints() {

        ArrayList<ComplaintBean> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM complaint");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                ComplaintBean c = new ComplaintBean();

                c.setComplaintId(rs.getInt("complaint_id"));
                c.setTenantId(rs.getInt("tenant_id"));
                c.setRoomId(rs.getInt("room_id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setPriority(rs.getString("priority"));
                c.setStatus(rs.getString("status"));
                c.setCreatedAt(rs.getString("created_at"));

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}