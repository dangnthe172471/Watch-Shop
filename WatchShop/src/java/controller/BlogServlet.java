/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.BrandDAO;
import dal.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Brand;
import model.Category;

/**
 *
 * @author admin
 */
public class BlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrandDAO brandDAO = new BrandDAO();
        BlogDAO blogDAO = new BlogDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Blog> listBl = blogDAO.getAllPublishedBlogs();
        List<Brand> listB = brandDAO.getAllBrand();
        List<Category> listC = categoryDAO.getAllCategory();

        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("listBl", listBl);

        request.getRequestDispatcher("blog.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles blog related requests";
    }
}
