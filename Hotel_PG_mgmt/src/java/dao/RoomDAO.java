package dao;

import java.sql.*;
import java.util.ArrayList;
import model.RoomBean;

public class RoomDAO {

    public static int addRoom(RoomBean room) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO room(room_number,room_type,total_beds,occupied_beds,status) VALUES(?,?,?,?,?)"
            );

            ps.setInt(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setInt(3, room.getTotalBeds());
            ps.setInt(4, room.getOccupiedBeds());
            ps.setString(5, room.getStatus());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ArrayList<RoomBean> getAllRooms() {

        ArrayList<RoomBean> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM room");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                RoomBean r = new RoomBean();

                r.setRoomId(rs.getInt("room_id"));
                r.setRoomNumber(rs.getInt("room_number"));
                r.setRoomType(rs.getString("room_type"));
                r.setTotalBeds(rs.getInt("total_beds"));
                r.setOccupiedBeds(rs.getInt("occupied_beds"));
                r.setStatus(rs.getString("status"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}