
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

public class auth extends HttpServlet {
      String emailx ;
      String passx ;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String name =  request.getParameter("email");
               
        String pass =  request.getParameter("pass");
        
       
        try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     
     
        
Criteria cr = session1.createCriteria(StockUser.class);
cr.add(Restrictions.eq("email", name));
cr.add(Restrictions.eq("password", pass));
        




     List list=cr.list();
     
    
      Iterator iterator = list.iterator(); 
      
      
      if(list.size() == 0){
          
       request.setAttribute("dbError", "block");
            RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
            rd1.forward(request, response);
          
      }
      
      
      for (int i = 0; i < list.size(); i++)
{
             StockUser user =  (StockUser) iterator.next();
  

             
             emailx=  user.getEmail();
             passx =user.getPassword();
                    session.setAttribute("sr", user.getId());
                    session.setAttribute("fname", user.getFirstname());
                    session.setAttribute("lname", user.getLastname());
                    session.setAttribute("email", user.getEmail());
                    session.setAttribute("pass", user.getPassword());
                    session.setAttribute("gender",user.getGender());
                    session.setAttribute("contact", user.getContact());
                    session.setAttribute("birth", user.getBirth());
                    session.setAttribute("price", user.getMoney());

}   
      
            
       
     t.commit();
     session1.close();
      
     
     if(emailx.equals("bhaveshsingh322@gmail.com")&& passx.equals("11111111")){
         RequestDispatcher rd1 = request.getRequestDispatcher("admindash.jsp");
            rd1.forward(request, response);
     }
     else{
          RequestDispatcher rd1 = request.getRequestDispatcher("DashBoard.jsp");
            rd1.forward(request, response);
     } 
     }
        
        
       
        catch(Exception e1){
            
            
          out.println("error");
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
