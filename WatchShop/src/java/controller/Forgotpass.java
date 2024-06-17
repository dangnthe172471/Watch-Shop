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
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import model.Account;
import model.Email;

/**
 *
 * @author dung2
 */
public class Forgotpass extends HttpServlet {

    private static final SecureRandom random = new SecureRandom();
    private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    private static final String SPECIAL_CHAR = "!@#$%^&*()-_=+[{]}|;:'\",<.>/?";

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
            out.println("<title>Servlet Forgotpass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forgotpass at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String defaultPassword = generateRandomPassword();
        String encryptedPassword = Mahoa.toSHA1(defaultPassword);
        AccountDAO da = new AccountDAO();
        Account a = da.forgotAccount(user, email);
        HttpSession session = request.getSession();

        if (a != null) {
            a.setPass(encryptedPassword);
            da.changepass(a);
            LocalDateTime currentDateTime = LocalDateTime.now();
            Email handleEmail = new Email();
            String sub = handleEmail.forgotAccount(user);
            String msg = handleEmail.messagePass(currentDateTime, user, defaultPassword);
            handleEmail.sendEmail(sub, msg, email);
            session.setAttribute("account", a);
            request.setAttribute("mess", "Mật khẩu của bạn đã được cấp lại. Vui lòng kiểm tra email của bạn.");
            request.getRequestDispatcher("ChangePass.jsp").forward(request, response);
        } else {
            request.setAttribute("user", user);
            request.setAttribute("email", email);
            request.setAttribute("mess", "Thông tin của bạn không đúng.");
            request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
        }
    }

    private String generateRandomPassword() {
        StringBuilder password = new StringBuilder(8);
        String allCharacters = CHAR_LOWER + CHAR_UPPER + NUMBER + SPECIAL_CHAR;
        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(allCharacters.length());
            password.append(allCharacters.charAt(index));
        }
        return password.toString();
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
