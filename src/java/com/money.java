/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Bhavesh Singh
 */
public class money extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
      HttpSession session =  request.getSession(true);
     try{
        
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session session1=factory.openSession();  
     Transaction t=session1.beginTransaction();  
        
        
     int money =  Integer.parseInt(request.getParameter("money"));
    int m = 0;   
    int price;
           String UEmail = (String)session.getAttribute("email");
            price  = (Integer)session.getAttribute("price");
            session.removeAttribute("price");
            m = price + money;
            session.setAttribute("price", m);
          session1.createSQLQuery("UPDATE STOCK.STOCKUSER set MONEY="+m+"   WHERE EMAIL='"+UEmail+"'").executeUpdate();
         t.commit();
         session1.close();
          request.setAttribute("success", "suc");
           RequestDispatcher rd = request.getRequestDispatcher("DashBoard.jsp");
           rd.forward(request, response);
            }
            
            catch(Exception e){
                 request.setAttribute("success", "err");
                    RequestDispatcher rd = request.getRequestDispatcher("DashBoard.jsp");
                    rd.forward(request, response);
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
        processRequest(request, response);
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
