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
import java.text.DecimalFormat;
import java.util.List;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchByAjax", urlPatterns = {"/searchbyajax"})
public class SearchByAjax extends HttpServlet {

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
            out.println("<title>Servlet SearchByAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchByAjax at " + request.getContextPath() + "</h1>");
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
        // get data from html
        String[] cid_raw = request.getParameterValues("cid");
        String[] bid_raw = request.getParameterValues("bid");
        String key = request.getParameter("key");
        String fromprice_raw = request.getParameter("fromprice");
        String toprice_raw = request.getParameter("toprice");
        String fromdate_raw = request.getParameter("fromdate");
        String todate_raw = request.getParameter("todate");

        Double fromprice, toprice;
        Date fromdate, todate;
        int[] cid = null;
        int[] bid = null;

        // get data from dao
        ProductDAO pdao = new ProductDAO();
        BrandDAO bdao = new BrandDAO();
        CategoryDAO cdao = new CategoryDAO();

        // If the string array is not null, then convert the string array to an int array
        if (bid_raw != null) {
            bid = new int[bid_raw.length];

            // convert the string array to an int array
            for (int i = 0; i < bid.length; i++) {
                bid[i] = Integer.parseInt(bid_raw[i]);
            }
        }

        // If the string array is not null, then convert the string array to an int array
        if (cid_raw != null) {
            cid = new int[cid_raw.length];

            // convert the string array to an int array
            for (int i = 0; i < cid.length; i++) {
                cid[i] = Integer.parseInt(cid_raw[i]);
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
                ? null : Double.valueOf(fromprice_raw);
        toprice = (toprice_raw == null || toprice_raw.equals(""))
                ? null : Double.valueOf(toprice_raw);
        fromdate = (fromdate_raw == null || fromdate_raw.equals(""))
                ? null : Date.valueOf(fromdate_raw);
        todate = (todate_raw == null || todate_raw.equals(""))
                ? null : Date.valueOf(todate_raw);
        int countP = pdao.countSearchProduct(bid, cid, key, fromprice, toprice, fromdate, todate);
        int endpage = countP / 9;
        if (countP % 9 != 0) {
            endpage++;
        }
        List<Product> listP = pdao.search(bid, cid, key, fromprice, toprice, fromdate, todate, sort, index);
        PrintWriter out = response.getWriter();
        for (Product o : listP) {
            out.println("<div class=\"col-12 col-md-4 col-lg-4\">\n"
                    + "                                        <div class=\"card\">\n"
                    + "                                            <a href=\"detail?pid=" + o.getId() + "\" class=\"motsanpham\" style=\"text-decoration: none; color: black;\" data-toggle=\"tooltip\" data-placement=\"bottom\">\n"
                    + "                                                <img class=\"card-img-top anh\" src=\"" + o.getPimage().getImg1() + "\" style=\"height: 250px\">\n"
                    + "                                                <div class=\"card-body noidungsp mt-3\">\n"
                    + "                                                        <div class=\"sale\">-10%</div>\n"
                    + "                                                    <h3 class=\"card-title ten\">" + o.getName() + "</h3>\n"
                    + "                                                    <div class=\"gia d-flex align-items-baseline\">\n"
                    + "                                                        <div class=\"giamoi\">" + formatNumber(o.getPrice()) + " vnđ</div>\n"
                    + "                                                        <div class=\"giacu text-muted ml-1\"><del>" + formatNumber(o.getPrice() + 350) + " vnđ</del></div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"danhgia\">\n"
                    + "                                                        Đã bán: " + o.getSold() + "\n"
                    + "                                                        <span style=\"margin-left:70px\">" + o.getRate() + "<i class=\"fa fa-star\" style=\"color: yellow\"></i></span>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </a>\n"
                    + "                                        </div> \n"
                    + "                                    </div>    ");
        }
    }

    private static String formatNumber(double number) {
        DecimalFormat formatter = new DecimalFormat("#,###,###.###");
        return formatter.format(number);
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
