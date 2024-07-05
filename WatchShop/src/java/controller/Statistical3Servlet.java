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
public class Statistical3Servlet extends HttpServlet {

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
            out.println("<title>Servlet Statistical3Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Statistical3Servlet at " + request.getContextPath() + "</h1>");
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
        String year_raw = request.getParameter("year");
        int y = Integer.parseInt(year_raw);
        int minYear = sdao.getMinYearOrder();

        LocalDate currentDate = LocalDate.now();
        int maxYear = currentDate.getYear();

        int[] totalsByMonth = new int[12]; // Mảng chứa tổng số theo tháng, kích thước là 12 tháng

        for (int i = 1; i <= 12; i++) {
            totalsByMonth[i - 1] = sdao.getTotalByMonth(i, y);
        }

        List<OrderDetail> listOD = sdao.getOrderDetailByYear(y);
        List<Brand> listB = bdao.getAllBrand();
        int[] data = new int[listB.size()];
        for (int i = 0; i < listB.size(); i++) {
            data[i] = sdao.getSumByBrandIDByYear(i + 1, y);
        }

        request.setAttribute("totalsByMonth", totalsByMonth);
        request.setAttribute("minYear", minYear);
        request.setAttribute("maxYear", maxYear);
        request.setAttribute("listOD", listOD);
        request.setAttribute("listB", listB);
        request.setAttribute("year", y);
        request.setAttribute("tab", "1");
        request.setAttribute("listBname", new Gson().toJson(listB));
        request.setAttribute("data", new Gson().toJson(data));
        request.setAttribute("totalsByMonths", new Gson().toJson(totalsByMonth));
        request.getRequestDispatcher("statistical3.jsp").forward(request, response);
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
