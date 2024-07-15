/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Order;

/**
 *
 * @author quyld
 */
public class ListOrderDeliveringServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListOrderDeliveringServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListOrderDeliveringServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        int id = account.getId();
        OrderDAO o = new OrderDAO();
        List<Order> listorder = o.getOrderOfShiperAcc(id);
        List<Order> listorder1 = o.getOrderOfShiperDelivering(id);

        request.setAttribute("order1", listorder1);
        request.setAttribute("order", listorder);
        request.getRequestDispatcher("ShipperDelivering.jsp").forward(request, response);
    }

}
