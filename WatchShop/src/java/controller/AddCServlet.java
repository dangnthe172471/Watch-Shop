/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;

/**
 *
 * @author quyld
 */
@WebServlet(name = "AddCServlet", urlPatterns = {"/addcategory"})
public class AddCServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("cid");
        CategoryDAO c = new CategoryDAO();
        c.blockCategoryById(id);
        response.sendRedirect("category");
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
        String name = request.getParameter("cname").trim();
        String type = request.getParameter("type").trim();
        Category cate = new Category("", name, type, "0");
        CategoryDAO c = new CategoryDAO();
        Category check = c.getCategoryByName(name);
        String err = "";

        if (request.getParameter("add") != null) {
            if (name.isBlank()) {
                err = "Chưa có tên thương hiệu";
            } else if (type.isBlank()) {
                err = "Chưa có hình ảnh";
            } else {
                if (check != null) {
                    err = "Dòng sản phẩm đã tồn tại";
                } else {
                    c.addCategory(cate);
                }
            }
            if (!err.isEmpty()) {
                request.getSession().setAttribute("err", err);
                request.getSession().setAttribute("keepModalOpen", true);
                response.sendRedirect("category");
            } else {
                request.getSession().setAttribute("name", name);
                request.getSession().removeAttribute("err");
                request.getSession().removeAttribute("keepModalOpen");
                response.sendRedirect("category");
            }
        }
    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
