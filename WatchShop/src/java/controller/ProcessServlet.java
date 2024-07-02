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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author admin
 */
public class ProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        ProductDAO dao = new ProductDAO();
        OrderDAO odao = new OrderDAO();
        // có rồi
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String tnum = request.getParameter("num");
        if (tnum == null || tnum.equals("")) {
            tnum = "0";
        }
        String pid = request.getParameter("pid");
        String type = request.getParameter("type");
        if (type == null) {
            type = "change";
        }
        int id, num;
        id = Integer.parseInt(pid);
        num = Integer.parseInt(tnum);
        if (type.equals("remove")) {
            cart.removeItem(id);
        } else if (type.equals("sub")) {
            if (cart.getQuantityById(id) <= 1) {
                cart.removeItem(id);
            } else {
                Product p = dao.getProductByID(pid);
                double price = p.getPrice();
                Item t = new Item(p, -1, price);
                cart.addItem(t);
            }
        } else if (type.equals("add")) {
            Product p = dao.getProductByID(pid);
            double price = p.getPrice();
            Item t = new Item(p, 1, price);
            cart.addItem(t);
        } else {
            if (num == 0) {
                cart.removeItem(id);
            } else {
                Product p = dao.getProductByID(pid);
                double price = p.getPrice();
                Item t = new Item(p, num - cart.getQuantityById(id), price);
                cart.addItem(t);
            }
        }
        List<Item> list = cart.getItems();
        double totalMoney = 0;
        for (Item item : list) {
            totalMoney += item.getPrice() * item.getQuantity();
        }
        session.setAttribute("totalMoney", totalMoney);
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        response.sendRedirect(request.getHeader("referer"));
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
