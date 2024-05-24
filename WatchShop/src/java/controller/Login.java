/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author dung2
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
       String logout = request.getParameter("type");
        if (logout != null && logout.equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("account");
            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
       String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String rem = request.getParameter("rem");

        if (username == null || password == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        AccountDAO da = new AccountDAO();
        Account account = da.checkAccount(username, password);

        HttpSession session = request.getSession();

        if (account == null) {
            Account existingUser = da.checkAccountExist(username);
            if (existingUser != null) {
                existingUser.setPass(null);
                session.setAttribute("user", username);
                request.setAttribute("error", "Mật khẩu sai!!!");
            } else {
                session.removeAttribute("user");
                request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng !!!");
            }
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            session.setAttribute("account", account);

            Cookie cu = new Cookie("cuser", username);
            Cookie cp = new Cookie("cpass", password);
            Cookie cr = new Cookie("crem", rem);
            if (rem != null) {
                cu.setMaxAge(60 * 60 * 24 * 5);
                cp.setMaxAge(60 * 60 * 24 * 5);
                cr.setMaxAge(60 * 60 * 24 * 5);
            } else {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

//    private void handleGoogleLogin(HttpServletRequest request, HttpServletResponse response, String code)
//            throws ServletException, IOException {
//        GoogleLogin gg = new GoogleLogin();
//        String accessToken = gg.getToken(code);
//
//        if (accessToken == null || accessToken.isEmpty()) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//            return;
//        }
//
//        GoogleAccount acc = gg.getUserInfo(accessToken);
//
//        if (acc == null || acc.getEmail() == null) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//            return;
//        }
//
//        AccountDAO da = new AccountDAO();
//        Account existingAccount = da.findAccountByEmail(acc.getEmail());
//
//        if (existingAccount == null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("googleAccount", acc.getEmail());
//            response.sendRedirect("Register.jsp");
//        } else {
//            HttpSession session = request.getSession();
//            session.setAttribute("account", acc);
//
//            Cookie googleNameCookie = new Cookie("googleName", acc.getName());
//            Cookie googleEmailCookie = new Cookie("googleEmail", acc.getEmail());
//
//            int cookieMaxAge = 60 * 60 * 24 * 5;
//            googleNameCookie.setMaxAge(cookieMaxAge);
//            googleEmailCookie.setMaxAge(cookieMaxAge);
//
//            response.addCookie(googleNameCookie);
//            response.addCookie(googleEmailCookie);
//
//            response.sendRedirect(request.getContextPath() + "/home");
//        }
//    }

  
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
