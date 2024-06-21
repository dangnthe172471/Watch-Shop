/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package VNPay;

import dal.OrderDAO;
import dal.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import model.Account;
import model.Cart;
import model.EmailOrder;
import model.Payment;

/**
 *
 * @author admin
 */
@WebServlet(name = "ReturnResult", urlPatterns = {"/result"})
public class ReturnResult extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReturnResult</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReturnResult at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        OrderDAO odao = new OrderDAO();

        String name = (String) session.getAttribute("name");
        String phone = (String) session.getAttribute("phone");
        String email = (String) session.getAttribute("email");
        String address = (String) session.getAttribute("address");
        String note = (String) session.getAttribute("note");
        String dateShip = (String) session.getAttribute("dateShip");
        String timeShip = (String) session.getAttribute("timeShip");
        if (note == null) {
            note = "";
        }
        LocalDateTime currentDateTime = LocalDateTime.now();
        if (o != null) {
            cart = (Cart) o;
            Account acount = null;
            Object a = session.getAttribute("account");
            if (a != null) {
                acount = (Account) a;
                String vnp_TxnRef = request.getParameter("vnp_TxnRef");
                String vnp_Amount = request.getParameter("vnp_Amount");
                vnp_Amount = vnp_Amount.substring(0, vnp_Amount.length() - 2);
                String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
                String vnp_BankCode = request.getParameter("vnp_BankCode");
                String vnp_PayDate_raw = request.getParameter("vnp_PayDate");
                String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");

                PaymentDAO padao = new PaymentDAO();
                // Định dạng đầu vào tương ứng với chuỗi ngày tháng ban đầu
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

                // Định dạng đầu ra theo yêu cầu
                SimpleDateFormat outputFormatDTB = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat outputFormatWeb = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                try {
                    // Chuyển chuỗi ngày tháng thành đối tượng Date
                    Date date = inputFormat.parse(vnp_PayDate_raw);

                    // Chuyển đối tượng Date thành chuỗi định dạng mong muốn
                    String vnp_PayDateWeb = outputFormatWeb.format(date);
                    String vnp_PayDateDTB = outputFormatDTB.format(date);
                    request.setAttribute("vnp_PayDate", vnp_PayDateWeb);

                    Payment p = new Payment("", vnp_TxnRef, vnp_Amount, vnp_OrderInfo, vnp_ResponseCode, vnp_TransactionNo, vnp_BankCode, vnp_PayDateDTB, vnp_TransactionStatus, acount.getId());
                    padao.addPayment(p);
                    if (vnp_TransactionStatus.equals("00")) {
                        odao.addOrder(acount, cart, email, phone, address, note, dateShip, timeShip);
                        EmailOrder handleEmail = new EmailOrder();
                        String sub = handleEmail.subjectOrder(name);
                        String msg = handleEmail.messageOrder(currentDateTime, formatNumber(cart.getTotalMoney()), phone, name, address, note, cart);
                        handleEmail.sendEmail(sub, msg, email);
                        session.removeAttribute("cart");
                        session.removeAttribute("name");
                        session.removeAttribute("phone");
                        session.removeAttribute("email");
                        session.removeAttribute("address");
                        session.removeAttribute("note");
                        session.setAttribute("size", 0);
                    }
                } catch (ParseException e) {
                }
                request.setAttribute("vnp_TxnRef", vnp_TxnRef);
                request.setAttribute("vnp_Amount", vnp_Amount);
                request.setAttribute("vnp_OrderInfo", vnp_OrderInfo);
                request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                request.setAttribute("vnp_TransactionNo", vnp_TransactionNo);
                request.setAttribute("vnp_BankCode", vnp_BankCode);
                request.setAttribute("vnp_TransactionStatus", vnp_TransactionStatus);
                request.getRequestDispatcher("thanks.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }
        }
    }

    private static String formatNumber(double number) {
        DecimalFormat formatter = new DecimalFormat("#,###,###.###");
        return formatter.format(number);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
