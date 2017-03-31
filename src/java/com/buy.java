/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class buy extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       int cost;
        HttpSession session =  request.getSession(true);
     try{
        
        Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     String UEmail = (String)session.getAttribute("email");
      int price = 0 ;
      
    price  =  (Integer)session.getAttribute("price");
     int i = Integer.parseInt(request.getParameter("i"));
  

        cost   =Integer.parseInt(request.getParameter("cost"));
     if(price<cost){
         out.println("You Dont have Enough Balance to purchase");
     }else{
     Date d = new Date();
       if(i == 1 ) {
           String comp =request.getParameter("comp");
           String email =request.getParameter("email");
           ShareBuy u =  new ShareBuy();
        
           u.setDate(d);
           u.setRate(cost);
           u.setSellerEmail(email);
           u.setUseremail(UEmail);
           u.setStatus("BUY");
           u.setCompany(comp);
           u.setEnd_rate(0);
           session1.persist(u);
            price = price - cost;  
             session.removeAttribute("price");
           
            session.setAttribute("price", price);
            t.commit();
          
      Transaction t1 = session1.beginTransaction(); 
      session1.createSQLQuery("UPDATE STOCK.STOCKUSER set MONEY="+price+"   WHERE EMAIL='"+UEmail+"' ").executeUpdate();
      t1.commit();
      int moneyStock = 0 ;
      Transaction t3 = session1.beginTransaction(); 
      List list= session1.createQuery("from com.StockUser Where EMAIL='"+email+"'").list();
      Iterator iterator = list.iterator(); 
      
             
      for(int j = 0; j < list.size(); j++)
{
             StockUser user =  (StockUser)iterator.next();
              moneyStock = user.getMoney();
    
}
         
         
 
       t3.commit();
       moneyStock = moneyStock + cost;
       Transaction t2 = session1.beginTransaction(); 
       session1.createSQLQuery("UPDATE STOCK.STOCKUSER set MONEY="+moneyStock+"   WHERE EMAIL='"+email+"' ").executeUpdate();
       t2.commit();
       out.print("Success")   ;
           
        Transaction t4 = session1.beginTransaction(); 
        TransactionT  tra = new TransactionT();
        tra.setAmount(cost);
        tra.setSellermail(email);
        tra.setStatus("S-U");
        tra.setD(d);
        tra.setUsermail(UEmail);
        session1.persist(tra);
         t4.commit();
        
       }
      
       
    }
     
     
      
           session1.close();
    }
   
    
     catch(Exception e1) {
      
     e1.printStackTrace();
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
