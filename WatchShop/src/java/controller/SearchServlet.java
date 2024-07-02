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
public class SearchServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        // get data from html
        String[] cid_raw1 = request.getParameterValues("cid1");
        String[] cid_raw2 = request.getParameterValues("cid2");
        String[] cid_raw3 = request.getParameterValues("cid3");
        String[] bid_raw = request.getParameterValues("bid");
        String key = request.getParameter("key");
        String fromprice_raw = request.getParameter("fromprice");
        String toprice_raw = request.getParameter("toprice");
        String fromdate_raw = request.getParameter("fromdate");
        String todate_raw = request.getParameter("todate");

        Double fromprice, toprice;
        Date fromdate, todate;
        int[] cid1 = null;
        int[] cid2 = null;
        int[] cid3 = null;
        int[] bid = null;

        // get data from dao
        ProductDAO pdao = new ProductDAO();
        BrandDAO bdao = new BrandDAO();
        CategoryDAO cdao = new CategoryDAO();

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

        // get data from html
        String sort_raw = request.getParameter("sort");
        String indexpage = request.getParameter("index");
        int sort, index;
        if (indexpage == null) {
            indexpage = "1";
        }

        // convert the values
        index = Integer.parseInt(indexpage);
        sort = (sort_raw == null) ? 0 : Integer.parseInt(sort_raw);
        fromprice = (fromprice_raw == null || fromprice_raw.equals(""))
                ? null : Double.valueOf(fromprice_raw.replace(".", ""));
        toprice = (toprice_raw == null || toprice_raw.equals(""))
                ? null : Double.valueOf(toprice_raw.replace(".", ""));
        fromdate = (fromdate_raw == null || fromdate_raw.equals(""))
                ? null : Date.valueOf(fromdate_raw);
        todate = (todate_raw == null || todate_raw.equals(""))
                ? null : Date.valueOf(todate_raw);
        int countP = pdao.countSearchProduct(bid, cid1, cid2, cid3, key, fromprice, toprice, fromdate, todate);
        int endpage = countP / 9;
        if (countP % 9 != 0) {
            endpage++;
        }
        List<Brand> listB = bdao.getAllBrand();
        List<Category> listC = cdao.getAllCategory();
        List<Product> listP = pdao.search(bid, cid1, cid2, cid3, key, fromprice, toprice, fromdate, todate, sort, index);

        // set data from jsp
        request.setAttribute("fromdate", fromdate);
        request.setAttribute("todate", todate);
        request.setAttribute("fromprice", fromprice_raw);
        request.setAttribute("toprice", toprice_raw);
        request.setAttribute("key", key);
        request.setAttribute("bid", bid);
        request.setAttribute("cid1", cid1);
        request.setAttribute("cid2", cid2);
        request.setAttribute("cid3", cid3);
        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.setAttribute("listP", listP);
        request.setAttribute("page", index);
        request.setAttribute("sort", sort);
        request.setAttribute("endP", endpage);
        request.setAttribute("countP", countP);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
        doGet(request, response);
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
