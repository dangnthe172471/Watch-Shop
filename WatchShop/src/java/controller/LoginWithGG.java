/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.GoogleLogin;

/**
 *
 * @author dung2
 */
@WebServlet(name="LoginWithGG", urlPatterns={"/logingg"})
public class LoginWithGG extends HttpServlet {
   
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
            out.println("<title>Servlet LoginWithGG</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginWithGG at " + request.getContextPath () + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        if (error != null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        model.GoogleAccount acc = gg.getUserInfo(accessToken);
        String email = acc.getEmail();
        AccountDAO adao = new AccountDAO();
        System.out.println("Email: " + email);
        Account account = adao.checkEmail(email);

        if (account != null) {
            // Login ADMIN
            if (account.getRoleID() == 1) {
                request.getSession().setAttribute("account", account);
                response.sendRedirect(request.getContextPath() + "/AdminManage.jsp");
                return;
            }

             request.setAttribute("error", "Tài khoản tồn tại, vui lòng đăng nhập!");
            request.getSession().setAttribute("account", account);
            response.sendRedirect("home");
        } else {
            
            String username = email.substring(0, email.indexOf('@'));

            request.setAttribute("email", email);
            request.setAttribute("avatar", acc.getPicture());
            request.setAttribute("token", accessToken);
            request.setAttribute("username", username);
            request.getRequestDispatcher("RegisterWithGG.jsp").forward(request, response);
        }
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
