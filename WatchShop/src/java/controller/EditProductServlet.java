/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@MultipartConfig
@WebServlet(name = "EditProductServlet", urlPatterns = {"/editproduct"})
public class EditProductServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cadao = new CategoryDAO();
        BrandDAO bdao = new BrandDAO();
        Product p = pdao.getProductByID(id);
        List<Brand> listB = bdao.getAllBrand();
        List<Category> listC = cadao.getAllCategory();
        request.setAttribute("p", p);
        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("tab", "5");
        if (type.equals("edit")) {
            request.getRequestDispatcher("editproduct.jsp").forward(request, response);
        } else if (type.equals("add")) {
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String price = request.getParameter("price").replace(".", "");
        String quantity = request.getParameter("quantity");
        String sold = request.getParameter("sold");
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        String rate = request.getParameter("rate");
        String cateID1 = request.getParameter("cateID1");
        String cateID2 = request.getParameter("cateID2");
        String cateID3 = request.getParameter("cateID3");
        String brandID = request.getParameter("brandID");
        String type = request.getParameter("type");
        ProductDAO pdao = new ProductDAO();

        String img01 = request.getParameter("img01");
        String img02 = request.getParameter("img02");
        String img03 = request.getParameter("img03");
        String img04 = request.getParameter("img04");
        String customDirectory = getServletContext().getRealPath("/images");
        // Get the uploaded file part from the request
        Part img1 = request.getPart("img1");
        Part img2 = request.getPart("img2");
        Part img3 = request.getPart("img3");
        Part img4 = request.getPart("img4");

        String filename1 = null;
        String filename2 = null;
        String filename3 = null;
        String filename4 = null;
        if (img1 != null && img1.getSize() > 0) {
            filename1 = Paths.get(img1.getSubmittedFileName()).getFileName().toString();

            Path imagePath1 = Paths.get(customDirectory, filename1);

            if (!Files.exists(imagePath1.getParent())) {
                Files.createDirectories(imagePath1.getParent());
            }

            img1.write(imagePath1.toString());
            img01 = "images/" + filename1;
        }

        if (img2 != null && img2.getSize() > 0) {
            filename2 = Paths.get(img2.getSubmittedFileName()).getFileName().toString();

            Path imagePath2 = Paths.get(customDirectory, filename2);

            if (!Files.exists(imagePath2.getParent())) {
                Files.createDirectories(imagePath2.getParent());
            }

            img2.write(imagePath2.toString());
            img02 = "images/" + filename2;
        }

        if (img3 != null && img3.getSize() > 0) {
            filename3 = Paths.get(img3.getSubmittedFileName()).getFileName().toString();

            Path imagePath3 = Paths.get(customDirectory, filename3);

            if (!Files.exists(imagePath3.getParent())) {
                Files.createDirectories(imagePath3.getParent());
            }

            img3.write(imagePath3.toString());
            img03 = "images/" + filename3;
        }

        if (img4 != null && img4.getSize() > 0) {
            filename4 = Paths.get(img4.getSubmittedFileName()).getFileName().toString();

            Path imagePath4 = Paths.get(customDirectory, filename4);

            if (!Files.exists(imagePath4.getParent())) {
                Files.createDirectories(imagePath4.getParent());
            }

            img4.write(imagePath4.toString());
            img04 = "images/" + filename4;
        }
        if (type.equals("edit")) {
            pdao.editProduct(id, code, name, price, quantity, sold, date, description, rate, cateID1, cateID2, cateID3, brandID, img01, img02, img03, img04);
        }

        if (type.equals("add")) {
            List<Product> listP = pdao.getAllProduct();
            for (Product product : listP) {
                if (product.getName().equals(name) || product.getCode().equals(code)) {
                    request.setAttribute("mess", "Tên hoặc Mã Sản phẩm đã tồn tại");
                    request.setAttribute("code", code);
                    request.setAttribute("name", name);
                    request.setAttribute("price", price);
                    request.setAttribute("quantity", quantity);
                    request.setAttribute("sold", sold);
                    request.setAttribute("date", date);
                    request.setAttribute("description", description);
                    request.setAttribute("rate", rate);
                    request.setAttribute("cateID1", cateID1);
                    request.setAttribute("cateID2", cateID2);
                    request.setAttribute("cateID3", cateID3);
                    request.setAttribute("brandID", brandID);
                    request.setAttribute("img01", img01);
                    request.setAttribute("img02", img02);
                    request.setAttribute("img03", img03);
                    request.setAttribute("img04", img04);
                    CategoryDAO cadao = new CategoryDAO();
                    BrandDAO bdao = new BrandDAO();
                    Product p = pdao.getProductByID(id);
                    List<Brand> listB = bdao.getAllBrand();
                    List<Category> listC = cadao.getAllCategory();
                    request.setAttribute("p", p);
                    request.setAttribute("listB", listB);
                    request.setAttribute("listC", listC);
                    request.setAttribute("tab", "5");
                    request.getRequestDispatcher("addproduct.jsp").forward(request, response);
                    return;
                }
            }
            pdao.addProduct(code, name, price, quantity, sold, date, description, rate, cateID1, cateID2, cateID3, brandID, img01, img02, img03, img04);
        }
        response.sendRedirect("manageproduct");
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
