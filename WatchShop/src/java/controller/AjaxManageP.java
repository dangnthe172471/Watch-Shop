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
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
public class AjaxManageP extends HttpServlet {

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
            out.println("<title>Servlet AjaxManageP</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjaxManageP at " + request.getContextPath() + "</h1>");
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
        int countP = pdao.countManageProduct(bid, cid1, cid2, cid3, key, fromdate, todate, "0");
        int endpage = countP / 6;
        if (countP % 6 != 0) {
            endpage++;
        }
        List<Product> listP = pdao.manageProduct(bid, cid1, cid2, cid3, key, sort, index, fromdate, todate, "0");
        List<Brand> listB = bdao.getAllBrand();
        List<Category> listC = cadao.getAllCategory();
        // Định dạng đầu vào tương ứng với chuỗi ngày tháng ban đầu
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");

        // Định dạng đầu ra theo yêu cầu
        SimpleDateFormat outputFormatDTB = new SimpleDateFormat("dd-MM-yyyy");

        PrintWriter out = response.getWriter();
        for (Product o : listP) {
            try {
                java.util.Date date = inputFormat.parse(o.getReleaseDate().toString());
                String redate = outputFormatDTB.format(date);
                out.println(" <tr>\n"
                        + "                                        <td style=\"text-align: left;display: table-cell;vertical-align: middle;\">" + o.getCode() + "</td>\n"
                        + "                                        <td><span style=\"display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;font-size: 14px;\" title=\"" + o.getName() + "\">" + o.getName() + "</span>\n"
                        + "                                            <div class=\"khoianh\">\n"
                        + "                                                <div class=\"anhto mb-2\">\n"
                        + "                                                    <img id=\"main-image\" class=\"product-image\" src=\"" + o.getPimage().getImg1() + "\" style=\"width: 100%;height: 200px;border-radius: 0%\">\n"
                        + "                                                </div>\n"
                        + "                                                <div class=\"list-anhchitiet d-flex\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg1() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg2() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg3() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg4() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                </div>\n"
                        + "                                            </div>\n"
                        + "                                        </td>                                               \n"
                        + "                                        <td style=\"text-align: center\">\n");

                for (Brand b : listB) {
                    if (Integer.parseInt(b.getBid()) == o.getBrandID()) {
                        out.println("" + b.getBname() + "<br>");
                        if (b.getDeleted().equals("1")) {
                            out.println("(đã xóa)\n");
                        }
                    }
                }
                out.println("</td>\n"
                        + "<td style=\"text-align: center\">\n");
                for (Category c : listC) {
                    if (Integer.parseInt(c.getCid()) == o.getCateID1()) {
                        out.println("<p>" + c.getCname() + "<br>");
                        if (c.getDeleted().equals("1")) {
                            out.println("(đã xóa)");
                        }
                        out.println("</p>\n");
                    }
                    if (Integer.parseInt(c.getCid()) == o.getCateID2()) {
                        out.println("<p>Chống nước:<br>" + c.getCname() + "<br>");
                        if (c.getDeleted().equals("1")) {
                            out.println("(đã xóa)");
                        }
                        out.println("</p>\n");
                    }
                    if (Integer.parseInt(c.getCid()) == o.getCateID3()) {
                        out.println("<p>Đường kính mặt số:<br>" + c.getCname() + "<br>");
                        if (c.getDeleted().equals("1")) {
                            out.println("(đã xóa)");
                        }
                        out.println("</p>\n");
                    }
                }
                out.println(" </td>\n"
                        + "                                        <td style=\"text-align: center\">" + formatNumber(o.getPrice()) + "</td>\n"
                        + "                                        <td style=\"text-align: center\">" + o.getQuantity() + "</td>\n"
                        + "                                        <td style=\"text-align: center\">" + o.getSold() + " (" + o.getRate() + "⭐)</td>\n"
                        + "                                        <td style=\"text-align: center\">" + redate + "</td>\n"
                        + "          <td style=\"text-align: center;font-size: 20px;\">\n"
                        + "                                            <a  href=\"editproduct?type=edit&id=" + o.getId() + "\"><i class=\"fa fa-edit\" style=\"color: blue\"></i></a>&nbsp;&nbsp;\n"
                        + "                                            <a href=\"#\" onclick=\"deleteProduct(event, '" + o.getId() + "')\"><i class=\"fa fa-trash\" style=\"color: red\"></i></a>\n"
                        + "                                        </td>\n"
                        + "                                    </tr>");
            } catch (ParseException ex) {
            }

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
        int countP = pdao.countManageProduct(bid, cid1, cid2, cid3, key, fromdate, todate, "1");
        int endpage = countP / 6;
        if (countP % 6 != 0) {
            endpage++;
        }
        List<Product> listP = pdao.manageProduct(bid, cid1, cid2, cid3, key, sort, index, fromdate, todate, "1");
        List<Brand> listB = bdao.getAllBrand();
        List<Category> listC = cadao.getAllCategory();
        // Định dạng đầu vào tương ứng với chuỗi ngày tháng ban đầu
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");

        // Định dạng đầu ra theo yêu cầu
        SimpleDateFormat outputFormatDTB = new SimpleDateFormat("dd-MM-yyyy");

        PrintWriter out = response.getWriter();
        for (Product o : listP) {
            try {
                java.util.Date date = inputFormat.parse(o.getReleaseDate().toString());
                String redate = outputFormatDTB.format(date);
                out.println(" <tr>\n"
                        + "                                        <td style=\"text-align: left;display: table-cell;vertical-align: middle;\">" + o.getCode() + "</td>\n"
                        + "                                        <td><span style=\"display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;font-size: 14px;\" title=\"" + o.getName() + "\">" + o.getName() + "</span>\n"
                        + "                                            <div class=\"khoianh\">\n"
                        + "                                                <div class=\"anhto mb-2\">\n"
                        + "                                                    <img id=\"main-image\" class=\"product-image\" src=\"" + o.getPimage().getImg1() + "\" style=\"width: 100%;height: 200px;border-radius: 0%\">\n"
                        + "                                                </div>\n"
                        + "                                                <div class=\"list-anhchitiet d-flex\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg1() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg2() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg3() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                    <img class=\"thumb-img mr-3\" src=\"" + o.getPimage().getImg4() + "\" class=\"img-fluid\" style=\"cursor: pointer;\">\n"
                        + "                                                </div>\n"
                        + "                                            </div>\n"
                        + "                                        </td>                                               \n"
                        + "                                        <td style=\"text-align: center\">\n");

                for (Brand b : listB) {
                    if (Integer.parseInt(b.getBid()) == o.getBrandID()) {
                        out.println("" + b.getBname() + "<br>");
                        if (b.getDeleted().equals("1")) {
                            out.println("(đã xóa)\n");
                        }
                    }
                }
                out.println("</td>\n"
                        + "<td style=\"text-align: center\">\n");
                for (Category c : listC) {
                    if (Integer.parseInt(c.getCid()) == o.getCateID1()) {
                        out.println("<p>" + c.getCname() + "<br>");
                        if (c.getDeleted().equals("1")) {
                            out.println("(đã xóa)");
                        }
                        out.println("</p>\n");
                    }
                    if (Integer.parseInt(c.getCid()) == o.getCateID2()) {
                        out.println("<p>Chống nước:<br>" + c.getCname() + "<br>");
                        if (c.getDeleted().equals("1")) {
                            out.println("(đã xóa)");
                        }
                        out.println("</p>\n");
                    }
                    if (Integer.parseInt(c.getCid()) == o.getCateID3()) {
                        out.println("<p>Đường kính mặt số:<br>" + c.getCname() + "<br>");
                        if (c.getDeleted().equals("1")) {
                            out.println("(đã xóa)");
                        }
                        out.println("</p>\n");
                    }
                }
                out.println(" </td>\n"
                        + "                                        <td style=\"text-align: center\">" + formatNumber(o.getPrice()) + "</td>\n"
                        + "                                        <td style=\"text-align: center\">" + o.getQuantity() + "</td>\n"
                        + "                                        <td style=\"text-align: center\">" + o.getSold() + " (" + o.getRate() + "⭐)</td>\n"
                        + "                                        <td style=\"text-align: center\">" + redate + "</td>\n"
                        + "          <td style=\"text-align: center;font-size: 20px;\">\n"
                        + "                                            <a href=\"#\" onclick=\"deleteProduct(event, '" + o.getId() + "')\"><i class=\"fa fa-history\"></i></a>\n"
                        + "                                        </td>\n"
                        + "                                    </tr>");
            } catch (ParseException ex) {
            }

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
