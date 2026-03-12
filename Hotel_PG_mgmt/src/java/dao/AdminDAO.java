package dao;

import java.sql.*;
import model.AdminBean;

public class AdminDAO {

    public static boolean login(AdminBean admin) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM admin WHERE username=? AND password=?"
            );

            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}