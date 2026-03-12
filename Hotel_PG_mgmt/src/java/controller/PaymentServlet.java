package controller;

import dao.PaymentDAO;
import model.PaymentBean;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int tenantId = Integer.parseInt(request.getParameter("tenant_id"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String month = request.getParameter("month");
        String status = request.getParameter("status");
        String paymentDate = request.getParameter("payment_date");

        PaymentBean payment = new PaymentBean();

        payment.setTenantId(tenantId);
        payment.setAmount(amount);
        payment.setMonth(month);
        payment.setStatus(status);
        payment.setPaymentDate(paymentDate);

        int result = PaymentDAO.addPayment(payment);

        if (result > 0) {
            response.sendRedirect("payments.jsp");
        } else {
            response.getWriter().println("Payment not added");
        }
    }
}