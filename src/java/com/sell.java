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


public class sell extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
       int moneyStock =0 ;  
       int money = 0 ;
     try{
        HttpSession session =  request.getSession(true);
      Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
   
     int p = (Integer)session.getAttribute("price");
     String UEmail = (String)session.getAttribute("email");
   
     Date d = new Date();
      
     int idx =  Integer.parseInt(request.getParameter("i"));
        String comp =request.getParameter("comp");
        String Owner_email =request.getParameter("email");
           
         System.out.println("id"+idx);
           System.out.println("c"+comp);
           System.out.println("email"+Owner_email);
           
     Transaction t3 = session1.beginTransaction(); 
      List list= session1.createQuery("from com.ShareCom Where COMP ='"+comp+"'").list();
      Iterator iterator = list.iterator(); 
      
             
      for(int j = 0; j < list.size(); j++)
{
            ShareCom user =  (ShareCom)iterator.next();
              moneyStock = user.getShare_rate();
    
}
         PrintWriter out =  response.getWriter();
      
 
       t3.commit();
       
       Transaction t4 = session1.beginTransaction(); 
      List list1= session1.createQuery("from com.StockUser Where EMAIL='"+Owner_email+"'").list();
        Iterator iterator1 = list1.iterator(); 
      
             
      for(int j = 0; j < list.size(); j++)
{
             StockUser user =  (StockUser)iterator1.next();
              money = user.getMoney();
    
}
         t4.commit();;
      
       money = money - moneyStock;
       Transaction t2 = session1.beginTransaction(); 
       session1.createSQLQuery("UPDATE STOCK.STOCKUSER set MONEY="+money+"   WHERE EMAIL='"+Owner_email+"' ").executeUpdate();
       t2.commit();
       
       p = p + moneyStock ;
       session.removeAttribute("price");
       session.setAttribute("price", p);
       Transaction t5 = session1.beginTransaction(); 
       session1.createSQLQuery("UPDATE STOCK.STOCKUSER set MONEY="+p+"   WHERE EMAIL='"+UEmail+"' ").executeUpdate();
       t5.commit();
     
       
       Transaction t1 = session1.beginTransaction(); 
       session1.createSQLQuery("UPDATE STOCK.ShareBuy set END_RATE="+moneyStock+"   WHERE USEREMAIL='"+UEmail+"' AND ID="+idx+" " ).executeUpdate();
       t1.commit();
       
       
        Transaction t6 = session1.beginTransaction(); 
       session1.createSQLQuery("UPDATE STOCK.ShareBuy set STATUS='SOLD'   WHERE USEREMAIL='"+UEmail+"' AND ID="+idx+" ").executeUpdate();
       t6.commit();
       
         Transaction to = session1.beginTransaction(); 
        TransactionT  tra = new TransactionT();
        tra.setAmount(moneyStock);
        tra.setSellermail(UEmail);
        tra.setStatus("S-U");
        tra.setD(d);
        tra.setUsermail(Owner_email);
        session1.persist(tra);
        
        to.commit();
       
         System.out.println(idx);
       
       out.print("Success");
       
       
     }
     catch(Exception ee) {
         ee.printStackTrace();
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
