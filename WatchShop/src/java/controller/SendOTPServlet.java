package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Email;

public class SendOTPServlet extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();
    private final Email emailSender = new Email();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("tab", "3");
        request.getRequestDispatcher("confirm.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String newEmail = request.getParameter("newEmail");
        String newPhone = request.getParameter("newPhone");
        HttpSession session = request.getSession();

        // Check if email, newEmail, and newPhone are provided
        if (email == null || email.isEmpty() || newEmail == null || newEmail.isEmpty() || newPhone == null || newPhone.isEmpty()) {
            response.sendRedirect("confirm.jsp?error=Vui lòng nhập đầy đủ thông tin");
            return;
        }

        // Generate new OTP
        String otp = generateOTP();

        // Store OTP and email in session
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        session.setAttribute("newEmail", newEmail);
        session.setAttribute("newPhone", newPhone);

        // Send OTP to user's email
        String subject = "Xác nhận thay đổi thông tin tài khoản";
        String message = emailSender.messageOTP(LocalDateTime.now(), email, otp);
        boolean emailSent = emailSender.sendEmail(subject, message, email);

        // Redirect to confirm.jsp with success message
        if (emailSent) {
            response.sendRedirect("confirm.jsp?message=Đã gửi OTP đến email của bạn");
        } else {
            response.sendRedirect("confirm.jsp?error=Có lỗi xảy ra khi gửi OTP");
        }
    }

    private String generateOTP() {
        // Generate a 6-digit OTP
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
}
