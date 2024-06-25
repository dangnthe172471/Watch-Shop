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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "MangeProductServlet", urlPatterns = {"/manageproduct"})
public class MangeProductServlet extends HttpServlet {

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
            out.println("<title>Servlet MangeProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MangeProductServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO pdao = new ProductDAO();
        BrandDAO bdao = new BrandDAO();
        CategoryDAO cadao = new CategoryDAO();
        String sort_raw = request.getParameter("sort");
        String[] cid_raw1 = request.getParameterValues("cid1");
        String[] cid_raw2 = request.getParameterValues("cid2");
        String[] cid_raw3 = request.getParameterValues("cid3");
        String[] bid_raw = request.getParameterValues("bid");
        String key = request.getParameter("key");
        String fromdate_raw = request.getParameter("fromdate");
        String todate_raw = request.getParameter("todate");
        int[] cid1 = null;
        int[] cid2 = null;
        int[] cid3 = null;
        int[] bid = null;
        Date fromdate, todate;
        
        if (bid_raw != null) {
            bid = new int[bid_raw.length];
            for (int i = 0; i < bid.length; i++) {
                bid[i] = Integer.parseInt(bid_raw[i]);
            }
        }
        
        if (cid_raw1 != null) {
            cid1 = new int[cid_raw1.length];
            for (int i = 0; i < cid1.length; i++) {
                cid1[i] = Integer.parseInt(cid_raw1[i]);
            }
        }
        if (cid_raw2 != null) {
            cid2 = new int[cid_raw2.length];
            for (int i = 0; i < cid2.length; i++) {
                cid2[i] = Integer.parseInt(cid_raw2[i]);
            }
        }
        if (cid_raw3 != null) {
            cid3 = new int[cid_raw3.length];
            for (int i = 0; i < cid3.length; i++) {
                cid3[i] = Integer.parseInt(cid_raw3[i]);
            }
        }
        
        if (sort_raw == null) {
            sort_raw = "0";
        }
        int sort = Integer.parseInt(sort_raw);
        String indexpage = request.getParameter("index");
        int index;
        if (indexpage == null) {
            indexpage = "1";
        }
        
        index = Integer.parseInt(indexpage);
        fromdate = (fromdate_raw == null || fromdate_raw.equals(""))
                ? null : Date.valueOf(fromdate_raw);
        todate = (todate_raw == null || todate_raw.equals(""))
                ? null : Date.valueOf(todate_raw);
        int countP = pdao.countManageProduct(bid, cid1, cid2, cid3, key, fromdate, todate);
        int endpage = countP / 6;
        if (countP % 6 != 0) {
            endpage++;
        }
        
        List<Product> listP = pdao.getAllProduct(bid, cid1, cid2, cid3, key, sort, index, fromdate, todate);
        List<Brand> listB = bdao.getAllBrand();
        List<Category> listC = cadao.getAllCategory();
        request.setAttribute("listP", listP);
        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("bid", bid);
        request.setAttribute("cid1", cid1);
        request.setAttribute("cid2", cid2);
        request.setAttribute("cid3", cid3);
        request.setAttribute("key", key);
        request.setAttribute("page", index);
        request.setAttribute("sort", sort);
        request.setAttribute("endP", endpage);
        request.setAttribute("countP", countP);
        request.setAttribute("fromdate", fromdate);
        request.setAttribute("todate", todate);
        request.setAttribute("tab", "5");
        request.getRequestDispatcher("ManageProduct.jsp").forward(request, response);
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
        ProductDAO pdao = new ProductDAO();
        String pid = request.getParameter("pid");
        String type = request.getParameter("type");
        if (type == null) {
            type = "";
        }
        if (type.equals("delete")) {
            pdao.deleteProduct(pid);
            doGet(request, response);
        }
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
