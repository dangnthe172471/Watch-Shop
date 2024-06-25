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
        if (isEmpty(username) || isEmpty(password)) {
            request.setAttribute("error", "Không được để trống tài khoản và mật khẩu");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        if (username == null || password == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        String hashedPassword = Mahoa.toSHA1(password);

        AccountDAO da = new AccountDAO();
        Account account = da.checkAccount(username, hashedPassword);

        HttpSession session = request.getSession();

        if (account == null) {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu sai!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (account.getStatus() == 1) {
                request.setAttribute("error", "Tài khoản bị khóa, vui lòng liên hệ nhân viên để được hỗ trợ!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }
            if (containsWhitespace(username) || containsWhitespace(password)) {
                request.setAttribute("error", "Tài khoản và mật khẩu không được có dấu cách.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            session.setAttribute("account", account);
            //login ADMIN
            if (account.getRoleID() == 1 || account.getRoleID() == 2) {
                request.getSession().setAttribute("account", account);
                response.sendRedirect(request.getContextPath() + "/AdminManage.jsp");
                return;
            } else if (account.getRoleID() == 3) {
                request.getSession().setAttribute("account", account);
                response.sendRedirect(request.getContextPath() + "/listorder");
            }

            String ttcart = (String) session.getAttribute("ttc");
            if (ttcart == null) {
                session.removeAttribute("ttc");
            } else {
                session.removeAttribute("ttc");
                response.sendRedirect("Cart.jsp");
            }

            //login User
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

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    private boolean containsWhitespace(String value) {
        return value.contains(" ");
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
