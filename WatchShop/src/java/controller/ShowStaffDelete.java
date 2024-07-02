/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;

/**
 *
 * @author dung2
 */
public class ShowStaffDelete extends HttpServlet {
    private static final int PAGE_SIZE = 10; 
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ShowStaffDelete</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowStaffDelete at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String pageParam = request.getParameter("page");
        int page = pageParam == null ? 1 : Integer.parseInt(pageParam);

        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "user"; 
        }
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "asc"; 
        }

        AccountDAO dao = new AccountDAO();
        List<Account> sortedAccounts = dao.getAllBlockedStaffSorted(sortField, sortOrder);
        List<Account> pagedAccounts = dao.getStaffByPage(sortedAccounts, page, PAGE_SIZE);
        int totalStaff = sortedAccounts.size();
        int totalPages = (int) Math.ceil((double) totalStaff / PAGE_SIZE);

        request.setAttribute("blockedAccounts", pagedAccounts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalStaff", totalStaff);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);
        request.getRequestDispatcher("DeleteStaff.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
