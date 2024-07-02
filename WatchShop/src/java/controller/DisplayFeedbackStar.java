/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.FeedbackDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Brand;
import model.Category;
import model.Feedback;
import model.Product;

/**
 *
 * @author admin
 */
public class DisplayFeedbackStar extends HttpServlet {

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
            out.println("<title>Servlet DisplayFeedbackStar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayFeedbackStar at " + request.getContextPath() + "</h1>");
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
        FeedbackDAO fdao = new FeedbackDAO();
        ProductDAO pdao = new ProductDAO();
        BrandDAO bdao = new BrandDAO();
        CategoryDAO cdao = new CategoryDAO();
        String star = request.getParameter("star");
        String id = request.getParameter("pid");

        List<Feedback> listCo = fdao.listFeedbackByStar(star, id);
        Product p = pdao.getProductByID(id);
        List<Product> listP = pdao.listProductByPid(id);
        List<Brand> listB = bdao.getAllBrand();
        List<Category> listC = cdao.getAllCategory();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            request.removeAttribute("account");
        } else if (fdao.checkFeedback(account.getId(), p.getId())) {
            request.setAttribute("feedback", "1");
            List<Feedback> listE = fdao.checkEditFeedback(account.getId(), p.getId());
            request.setAttribute("listE", listE);
        }

        int star1 = fdao.countFeedbackByStar("1", id);
        int star2 = fdao.countFeedbackByStar("2", id);
        int star3 = fdao.countFeedbackByStar("3", id);
        int star4 = fdao.countFeedbackByStar("4", id);
        int star5 = fdao.countFeedbackByStar("5", id);

        request.setAttribute("star1", star1);
        request.setAttribute("star2", star2);
        request.setAttribute("star3", star3);
        request.setAttribute("star4", star4);
        request.setAttribute("star5", star5);
        // set data to jsp
        request.setAttribute("detail", p);
        request.setAttribute("listP", listP);
        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("listCo", listCo);
        request.getRequestDispatcher("productdetail.jsp").forward(request, response);
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
        processRequest(request, response);
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
