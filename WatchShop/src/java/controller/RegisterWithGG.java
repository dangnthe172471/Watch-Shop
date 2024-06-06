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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Account;

/**
 *
 * @author dung2
 */
@WebServlet(name = "RegisterWithGG", urlPatterns = {"/ggregister"})
public class RegisterWithGG extends HttpServlet {

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
            out.println("<title>Servlet RegisterWithGG</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterWithGG at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String avatar = request.getParameter("avatar");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String token = request.getParameter("token");
        // Server-side validation for empty fields
        if (isEmpty(username) || isEmpty(password) || isEmpty(email) || isEmpty(phone) || isEmpty(address)) {
            request.setAttribute("error", "Không được để trống.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Server-side validation for password
        if (!isValidPassword(password)) {
            request.setAttribute("error", "Mật khẩu phải dài ít nhất 8 ký tự, chứa ít nhất một chữ hoa, một chữ thường, một số và một ký tự đặc biệt.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }
        if (containsWhitespace(username) || containsWhitespace(password)|| containsWhitespace(email) || containsWhitespace(phone)) {
            request.setAttribute("error", "Lỗi dấu cách.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Server-side validation for email
        if (!isValidEmail(email)) {
            request.setAttribute("error", "Lỗi email, vui lòng nhập lại.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Server-side validation for phone number
        if (!isValidPhoneNumber(phone)) {
            request.setAttribute("error", "Lỗi số điện thoại, vui lòng nhập lại.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        Account newAccount = new Account();
        newAccount.setAvatar(avatar);
        newAccount.setUser(username);
        newAccount.setPass(Mahoa.toSHA1(password));
        newAccount.setEmail(email);
        newAccount.setPhone(phone);
        newAccount.setAddress(address);
        newAccount.setToken(token);

        AccountDAO adao = new AccountDAO();
        adao.AddAccountByGG(newAccount);

        request.getSession().setAttribute("account", newAccount);
        response.sendRedirect("home");
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    private boolean isValidPassword(String password) {
        if (password.length() < 8) {
            return false;
        }
        boolean hasUpperCase = !password.equals(password.toLowerCase());
        boolean hasLowerCase = !password.equals(password.toUpperCase());
        boolean hasNumber = password.matches(".*\\d.*");
        boolean hasSpecialChar = password.matches(".*[!@#$%^&*(),.?\":{}|<>].*");

        return hasUpperCase && hasLowerCase && hasNumber && hasSpecialChar;
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
        Pattern pat = Pattern.compile(emailRegex);
        Matcher matcher = pat.matcher(email);
        return matcher.matches();
    }

    private boolean isValidPhoneNumber(String phone) {
        String phoneRegex = "^[0-9]{10,11}$";
        Pattern pat = Pattern.compile(phoneRegex);
        Matcher matcher = pat.matcher(phone);
        return matcher.matches();
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
