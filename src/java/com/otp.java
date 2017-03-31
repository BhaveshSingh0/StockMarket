
package com;

import java.io.IOException;
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


public class otp extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         int count = (Integer) request.getSession().getAttribute("OTP");
        HttpSession session = request.getSession(true);
         
         String o= request.getParameter("otp");
         int otp = Integer.parseInt(o);
         
         if(count == otp){
             
             
                String first = (String) session.getAttribute("fname");
                String lastname = (String) session.getAttribute("lname");
                String email = (String) session.getAttribute("email");
                String pass = (String) session.getAttribute("pass");
                String gender = (String) session.getAttribute("gender");
                String birth = (String) session.getAttribute("birth");
                String contact = (String) session.getAttribute("contact");
             
              
             
                
                StockUser  user = new StockUser();
                user.setBirth(birth);
                user.setContact(contact);
                user.setEmail(email);
                user.setFirstname(first);
                user.setLastname(lastname);
                user.setPassword(pass);
                user.setGender(gender);
                user.setMoney(0);
                
                
                  
        try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session session2=factory.openSession();  
     Transaction t=session2.beginTransaction();  
     
     
         session2.persist(user);
         t.commit();
      session2.close();
    
    
               session.invalidate();
                    request.setAttribute("sendSuccess", "block");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.forward(request, response);
        }
        
        
        catch(Exception e){
            
            request.setAttribute("dbError", "block");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
            
        }
        
                
             
             
             
             
             
            RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
            rd.forward(request, response);
             
         }
         else{
              request.setAttribute("dbError", "block");
            RequestDispatcher rd = request.getRequestDispatcher("confirm.jsp");
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
