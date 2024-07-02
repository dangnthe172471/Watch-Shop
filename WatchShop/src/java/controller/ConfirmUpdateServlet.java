package controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ConfirmUpdateServlet extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String otpReceived = request.getParameter("otp");

        String storedOTP = (String) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");
        String newEmail = (String) session.getAttribute("newEmail");
        String newPhone = (String) session.getAttribute("newPhone");

        if (storedOTP == null || email == null || otpReceived == null || otpReceived.isEmpty()) {
            response.sendRedirect("confirm.jsp?error=OTP không hợp lệ");
            return;
        }

        if (!otpReceived.equals(storedOTP)) {
            response.sendRedirect("confirm.jsp?error=OTP không đúng");
            return;
        }

        boolean success = accountDAO.updateContact(email, newEmail, newPhone);

        if (success) {
            session.removeAttribute("otp");
            session.removeAttribute("email");
            session.removeAttribute("newEmail");
            session.removeAttribute("newPhone");

            response.sendRedirect("Login.jsp");
        } else {
            response.sendRedirect("Login.jsp");
        }
    }
}
