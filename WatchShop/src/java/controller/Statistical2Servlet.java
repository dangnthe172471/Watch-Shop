/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.BrandDAO;
import dal.StatisticalDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;
import model.Account;
import model.Brand;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author admin
 */
public class Statistical2Servlet extends HttpServlet {

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
            out.println("<title>Servlet Statistical2Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Statistical2Servlet at " + request.getContextPath() + "</h1>");
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
        StatisticalDAO sdao = new StatisticalDAO();
        BrandDAO bdao = new BrandDAO();
        int minYear = sdao.getMinYearOrder();
        
        LocalDate currentDate = LocalDate.now();
        
        // Lấy năm hiện tại
        int maxYear = currentDate.getYear();
        
        int[] year = new int[maxYear - minYear + 1];

        for (int i = minYear; i <= maxYear; i++) {
            year[i - minYear] = sdao.getTotalByYear(i);
        }
        int ro = sdao.getSumByBrandID("1");
        int ca = sdao.getSumByBrandID("2");
        int au = sdao.getSumByBrandID("3");
        int pa = sdao.getSumByBrandID("4");

        
        List<Account> listA = sdao.getTopTN();
        List<Order> listO = sdao.getAllOrder();
        List<OrderDetail> listOD = sdao.getAllOrderDetail();
        List<Brand> listB = bdao.getAllBrand();

        request.setAttribute("year", year);
        request.setAttribute("ro", ro);
        request.setAttribute("ca", ca);
        request.setAttribute("au", au);
        request.setAttribute("pa", pa);
        request.setAttribute("minYear", minYear);
        request.setAttribute("maxYear", maxYear);
        request.setAttribute("listA", listA);
        request.setAttribute("listO", listO);
        request.setAttribute("listOD", listOD);
        request.setAttribute("listB", listB);
        request.setAttribute("tab", "1");
        request.setAttribute("years", new Gson().toJson(year));
        request.getRequestDispatcher("statistical2.jsp").forward(request, response);

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
