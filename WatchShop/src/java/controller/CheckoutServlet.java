/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import model.Account;
import model.Cart;
import model.Email;

/**
 *
 * @author admin
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        String pttt = request.getParameter("pttt");
        if (pttt.equals("ttweb")) {
            doPost(request, response);
        }
        if (pttt.equals("ttpay")) {
//            request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
        }
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
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        OrderDAO odao = new OrderDAO();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        LocalDateTime currentDateTime = LocalDateTime.now();
        // có rồi
        if (o != null) {
            cart = (Cart) o;
            Account acount = null;
            Object a = session.getAttribute("account");
            if (a != null) {
                acount = (Account) a;
                if (acount.getAmount() >= cart.getTotalMoney()) {
                    odao.addOrder(acount, cart, address);
                    odao.updateAmount(acount, cart);
                    Email handleEmail = new Email();
                    String sub = handleEmail.subjectOrder(name);
                    String msg = handleEmail.messageOrder(currentDateTime, formatNumber(cart.getTotalMoney()), phone, name, address, cart);
                    handleEmail.sendEmail(sub, msg, email);
                    session.removeAttribute("cart");
                    session.setAttribute("size", 0);
                    response.sendRedirect("home");
                } else {
                    request.setAttribute("mess", "Tài khoản của bạn không đủ");
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                }
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
