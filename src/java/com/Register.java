
package com;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;


public class Register extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String temp1 = request.getParameter("fname");
        String firstName = temp1.substring(0, 1).toUpperCase() + temp1.substring(1);
        
        String temp2 = request.getParameter("lname");
        String lastName = temp2.substring(0, 1).toUpperCase() + temp2.substring(1);
        
        String emailAddress = request.getParameter("email_addr");
        String password = request.getParameter("pass");
        String gender = request.getParameter("Gender");
        String birthDay = request.getParameter("Day");
        String birthMonth = request.getParameter("Month");
        String birthYear = request.getParameter("year");
        String birth = birthDay + "/" + birthMonth + "/" + birthYear;
        String contactNumber = request.getParameter("contact");
        
        
                            
                HttpSession session = request.getSession(true);
           
                    session.setAttribute("fname",firstName );
                    session.setAttribute("lname",lastName );
                    session.setAttribute("email",emailAddress );
                    session.setAttribute("pass", password);
                    session.setAttribute("gender",gender );
                    session.setAttribute("contact", contactNumber);
                    session.setAttribute("birth",birth);

                
              
                       try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session session2=factory.openSession();  
     Transaction t=session2.beginTransaction();  
     
      /*              
           
    Criteria criteria = session2.createCriteria(StockUser.class);
    criteria.add(Restrictions.eq("email", emailAddress));
    criteria.setProjection(Projections.rowCount());
    long count = (Long) criteria.uniqueResult();
    session2.getTransaction().commit();
   if(count != 0){
      
       
       
       
       request.setAttribute("dbError1", "block");
            RequestDispatcher rd1 = request.getRequestDispatcher("register.jsp");
            rd1.forward(request, response);
            
         t.commit();
      session2.close();
 
   }
   
   
   else{
       */
                SendMail s =new SendMail();
                int n = s.send(emailAddress, firstName, lastName);
                session.setAttribute("OTP",n);

           if(n == 1){
              request.setAttribute("success_reg", "block");
            RequestDispatcher rd1 = request.getRequestDispatcher("register.jsp");
            rd1.forward(request, response);
                      
           }
           else{   
                
		   RequestDispatcher  rd  = request.getRequestDispatcher("confirm.jsp");
                     rd.forward(request, response);
                     
                   
                    
           }    
                    
                    
                
  // }
       
     
                      
                    
                    
                   
                      }
                       
                       
                       catch(Exception e2){
                           
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
