package dao;

import java.sql.*;
import java.util.ArrayList;
import model.PaymentBean;

public class PaymentDAO {

    public static int addPayment(PaymentBean payment) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO payment(tenant_id,amount,month,status,payment_date) VALUES(?,?,?,?,?)"
            );

            ps.setInt(1, payment.getTenantId());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getMonth());
            ps.setString(4, payment.getStatus());
            ps.setString(5, payment.getPaymentDate());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ArrayList<PaymentBean> getAllPayments() {

        ArrayList<PaymentBean> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM payment");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                PaymentBean p = new PaymentBean();

                p.setPaymentId(rs.getInt("payment_id"));
                p.setTenantId(rs.getInt("tenant_id"));
                p.setAmount(rs.getDouble("amount"));
                p.setMonth(rs.getString("month"));
                p.setStatus(rs.getString("status"));
                p.setPaymentDate(rs.getString("payment_date"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}