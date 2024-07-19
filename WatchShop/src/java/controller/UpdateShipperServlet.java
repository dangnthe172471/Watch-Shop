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
import model.Account;

@MultipartConfig
public class UpdateShipperServlet extends HttpServlet {

    public static final String UPLOAD_DIR = "img";
    public static final int AVATAR_WIDTH = 200;
    public static final int AVATAR_HEIGHT = 200;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            String id = request.getParameter("id");
            String user = request.getParameter("user");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Part filePart = request.getPart("avatar");

            // Tạo đối tượng Account từ dữ liệu form
            Account account = new Account();
            account.setId(Integer.parseInt(id));
            account.setUser(user);
            account.setEmail(email);
            account.setPhone(phone);
            account.setAddress(address);

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

                BufferedImage originalImage = ImageIO.read(new File(filePath));
                if (originalImage != null) {
                    String avatarPath = UPLOAD_DIR + "/" + fileName;
                    int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
                    BufferedImage resizedImage = new BufferedImage(AVATAR_WIDTH, AVATAR_HEIGHT, type);
                    Graphics2D g = resizedImage.createGraphics();
                    g.drawImage(originalImage, 0, 0, AVATAR_WIDTH, AVATAR_HEIGHT, null);
                    g.dispose();
                    ImageIO.write(resizedImage, "jpg", new File(applicationPath + File.separator + avatarPath));
                    account.setAvatar(avatarPath);
                } else {
                    request.setAttribute("error", "Không thể đọc ảnh tải lên.");
                    request.getRequestDispatcher("shipper").forward(request, response);
                    return;
                }
            }

            AccountDAO dao = new AccountDAO();
            dao.updateAccount(account);

            // Cập nhật thông tin thành công, chuyển hướng về trang shipper
            response.sendRedirect("shipper");
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("shipper").forward(request, response);
        }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
