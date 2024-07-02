/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
import model.Account;

/**
 *
 * @author dung2
 */
@MultipartConfig
public class UpdateAvatar extends HttpServlet {

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
            out.println("<title>Servlet UpdateAvatar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAvatar at " + request.getContextPath() + "</h1>");
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
    public static final String UPLOAD_DIR = "img";
    public static final int AVATAR_WIDTH = 200;
    public static final int AVATAR_HEIGHT = 200;

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Account account = (Account) request.getSession().getAttribute("account");

    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String avatarUrl = request.getParameter("avatarUrl");
    if (avatarUrl != null && !avatarUrl.isEmpty()) {
        if (isValidImageUrl(avatarUrl)) {
            account.setAvatar(avatarUrl);
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.updateAccountAvatar(account);
            request.getSession().setAttribute("account", account);
            response.sendRedirect("ProfileUser.jsp");
        } else {
            request.setAttribute("error", "Đường dẫn ảnh không hợp lệ.");
            request.getRequestDispatcher("ProfileUser.jsp").forward(request, response);
        }
    } else {
        Part filePart = request.getPart("profilePicture");

        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("error", "Vui lòng chọn một ảnh để đổi.");
            request.getRequestDispatcher("ProfileUser.jsp").forward(request, response);
            return;
        }

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(uploadFilePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            String filePath = uploadFilePath + File.separator + fileName;
            filePart.write(filePath);

            String avatarPath = UPLOAD_DIR + "/" + "avatar_" + fileName;
            BufferedImage originalImage = ImageIO.read(new File(filePath));
            int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
            BufferedImage resizedImage = new BufferedImage(AVATAR_WIDTH, AVATAR_HEIGHT, type);
            Graphics2D g = resizedImage.createGraphics();
            g.drawImage(originalImage, 0, 0, AVATAR_WIDTH, AVATAR_HEIGHT, null);
            g.dispose();
            ImageIO.write(resizedImage, "jpg", new File(applicationPath + File.separator + avatarPath));
            account.setAvatar(avatarPath);
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.updateAccountAvatar(account);
            request.getSession().setAttribute("account", account);
            response.sendRedirect("ProfileUser.jsp");
        }
    }
}

    private boolean isValidImageUrl(String url) {
        // Check if the URL ends with common image file extensions
        String[] allowedExtensions = {".jpg", ".jpeg", ".png"};
        for (String ext : allowedExtensions) {
            if (url.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }


    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
