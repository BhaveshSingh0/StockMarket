
package com;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Date;
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


public class auto extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter  out  =  response.getWriter();
        HttpSession session =  request.getSession(true);
   int i ;
   
        int size1= (Integer)session.getAttribute("size");
       //  int size1 = Integer.parseInt(request.getParameter("size1")) ;
       
            String[] email = new String[size1];
            String[] comp = new String[size1];
            int[] id = new int[size1];
            int[] share = new int[size1];
            int[] high = new int[size1];
            int[] low = new int[size1];
            int[] open = new int[size1];
   
            
            
            
            for(i = 0 ; i < size1 ; i++){
                
                email[i] = request.getParameter("email"+(i+1));
                comp[i] = request.getParameter("comp"+(i+1));
                id[i] = Integer.parseInt(request.getParameter("id"+(i+1)));
                share[i] = Integer.parseInt(request.getParameter("rate"+(i+1)));
                high[i] = Integer.parseInt(request.getParameter("high"+(i+1)));
                low[i] = Integer.parseInt(request.getParameter("low"+(i+1)));
                open[i] = Integer.parseInt(request.getParameter("open"+(i+1)));
                
            }
            
            
            Date d = new Date();
            
            List<ShareCom> obj = new ArrayList<>();
         
            for(i = 0 ; i < size1 ; i++){
              
               obj.add(new ShareCom(id[i], share[i],open[i], d, high[i], low[i], email[i], comp[i]));
                
            }
 
             try{
 Configuration cfg=new Configuration();  
cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
 SessionFactory factory=cfg.buildSessionFactory();  
  Session session3=factory.openSession();  
 Transaction t = session3.beginTransaction();
 for(ShareCom ss : obj){
      session3.update(ss);
    }
   
   t.commit();
    session3.close();
    
    
        out.println("success");
     
             }
             
             
             catch(Exception e4) {
                 out.println("eror");
                         e4.printStackTrace();e4.getMessage();
             }
            
            
    
        
        
        
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
