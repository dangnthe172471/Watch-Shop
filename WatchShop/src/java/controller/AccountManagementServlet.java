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
public class AccountManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountManagementServlet at " + request.getContextPath() + "</h1>");
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
        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");
        if (sortField == null) {
            sortField = "user";
        }
        if (sortOrder == null) {
            sortOrder = "asc";
        }

        int page = 1;
        int pageSize = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        AccountDAO dao = new AccountDAO();
        List<Account> accounts = dao.getAllAccountsSorted(sortField, sortOrder);
        int totalAccounts = accounts.size();
        int totalPages = (int) Math.ceil((double) totalAccounts / pageSize);

        List<Account> pagedAccounts = dao.getStaffByPage(accounts, page, pageSize);

        request.setAttribute("accounts", pagedAccounts);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("totalAccounts", totalAccounts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("tab", "9");
        request.getRequestDispatcher("ManageAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String accountIdParam = request.getParameter("accountId");

        if (accountIdParam != null && !accountIdParam.isEmpty()) {
            try {
                int accountId = Integer.parseInt(accountIdParam);
                AccountDAO dao = new AccountDAO();
                if ("block".equals(action)) {
                    dao.updateUserStatus(accountId, 1);
                } else if ("restore".equals(action)) {
                    dao.updateUserStatus(accountId, 0);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("manageAccounts");
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
