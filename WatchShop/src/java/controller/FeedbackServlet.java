/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;

/**
 *
 * @author admin
 */
public class FeedbackServlet extends HttpServlet {

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
            out.println("<title>Servlet FeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        if (type.equals("edit")) {
            Feedback feeback = fdao.getFeedbackById(id);
            request.setAttribute("feeback", feeback);
            request.getRequestDispatcher("EditFeedback.jsp").forward(request, response);
            return;
        }
        String pid_raw = request.getParameter("pid");
        int pid = Integer.parseInt(pid_raw);
        if (type.equals("delete")) {
            fdao.deleteFeedback(id);
            response.sendRedirect("detail?pid=" + pid);
            return;
        }
        if (type.equals("feedback")) {
            String aid_raw = request.getParameter("aid");
            String content = request.getParameter("content");
            String voted_raw = request.getParameter("voted");
            int aid = Integer.parseInt(aid_raw);
            int voted = Integer.parseInt(voted_raw);
            fdao.AddFeedback(aid, pid, content, voted);
            response.sendRedirect("detail?pid=" + pid);
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
        String type = request.getParameter("type");
        String pid_raw = request.getParameter("pid");
        int pid = Integer.parseInt(pid_raw);
        if (type.equals("back")) {
            response.sendRedirect("detail?pid=" + pid);
            return;
        }
        FeedbackDAO fdao = new FeedbackDAO();
        if (type.equals("update")) {
            String id = request.getParameter("id");
            String content = request.getParameter("content");
            double voted = Double.parseDouble(request.getParameter("voted"));
            fdao.updateFeedback(id, content, voted);
            response.sendRedirect("detail?pid=" + pid);
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
