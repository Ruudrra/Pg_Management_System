package dao;

import java.sql.*;
import java.util.ArrayList;
import model.TenantBean;

public class TenantDAO {

    public static int addTenant(TenantBean tenant) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO tenant(name,phone,room_id,join_date,status) VALUES(?,?,?,?,?)"
            );

            ps.setString(1, tenant.getName());
            ps.setString(2, tenant.getPhone());
            ps.setInt(3, tenant.getRoomId());
            ps.setString(4, tenant.getJoinDate());
            ps.setString(5, tenant.getStatus());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ArrayList<TenantBean> getAllTenants() {

        ArrayList<TenantBean> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM tenant");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                TenantBean t = new TenantBean();

                t.setTenantId(rs.getInt("tenant_id"));
                t.setName(rs.getString("name"));
                t.setPhone(rs.getString("phone"));
                t.setRoomId(rs.getInt("room_id"));
                t.setJoinDate(rs.getString("join_date"));
                t.setStatus(rs.getString("status"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}