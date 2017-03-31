<%-- 
    Document   : adminr
    Created on : Mar 20, 2017, 9:52:57 PM
    Author     : Bhavesh Singh
--%>

<%@page import="com.ShareBuy"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.ShareCom"%>
<%@page import="com.StockUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
                    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.dataTables.net/tabletools/2.2.4/css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
   
    <link href="css/pnotify.custom.min.css" media="all" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js" type="text/javascript" ></script>
   
    </head>
    <body>
        
        
        
        <br>
        <br>
        
<div class="container">
  
  <ul class="nav nav-tabs">
    <li class="active"><a  data-toggle="pill" href="#home">Users</a></li>
    <li><a data-toggle="pill" href="#menu1">Sold Share</a></li>
    <li><a data-toggle="pill" href="#menu2">Transactions</a></li>
    <li><a data-toggle="pill" href="#menu3">Menu 3</a></li>
  </ul>
   
               
            
     
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
        
        
        
        
        
              
     
     
        
            <% 
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
        
        
                 <div class="row">
          <div class="col-md-12">
             
                  <div class="form_div">
                      <form action="auto"  id="form1" >
                      
                          <div class="row">
                              <div class="col-md-12" style="background-color: white; padding: 40px; border:1px #080808; outline: none;">
                                  <table border="1" id="example" class="stripe" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                             <th >Sr No</th>
                                                            <th >First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Email</th>
                                                            <th>Gender</th>
                                                            <th>Contact</th>
                                                            <th>Birth</th>
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                         <%
         
         
     Criteria cr = session1.createCriteria(StockUser.class); 
     List list=cr.list();
       
      Iterator iterator = list.iterator(); 
      
      %>
                                
            <span ></span>
      
      
      
      <%
      
      
      for (int i = 0; i < list.size(); i++)
{
             StockUser user =  (StockUser)iterator.next();
   
    
             %>
                                        
                                        
                                        
             <tr><td><%= user.getId() %></td><td><%= user.getFirstname()%></td><td><%= user.getLastname()  %></td><td><%= user.getEmail()  %></td><td><%= user.getGender() %></td><td><%= user.getContact() %></td><td><%= user.getBirth() %></td></tr>
                                        
                                          
             <%
    
    
}
t.commit();
session1.close();
      %>
      
                                    </tbody>
                                </table>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
         
                                        
                                        
           
      <%
      
      
   }
        
        
        catch(Exception e){
            
            out.println(e);
            
        }
   
        %>           
        
        
        
        
        
        
        
        
        
        
        
        
      </div>
    <div id="menu1" class="tab-pane fade">
        
        
        
        
        
        
        
        
        
        
        
        
        
        
           
               
                <% 
          try {
              
         
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session2=factory.openSession();  
     Transaction t2 = session2.beginTransaction();  
     
     
     %>
     
     <br><br>
        
        
        
                                
            <table border="1" id="example2" class="stripe" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Company_Name</th>
                                            <th>Purchase Share_Rate</th>
                                     
                                            <th>Owner Mail-Id</th>
                                           <th>Date Of Purchase</th>
                                            
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                                                <%
         
         
     Criteria cr3 = session2.createCriteria(ShareBuy.class); 
     List list3 =cr3.list();
       
      Iterator iterator3 = list3.iterator(); 
      
      %>
                                
            <span ></span>
      
      
      
      <%
      
      
      for (int i = 0; i < list3.size(); i++)
{
             ShareBuy user =  (ShareBuy)iterator3.next();
                  if(user.getEnd_rate()== 0){
                      
                  }
                  else{
                      continue;
                  }
    
             %>
                                        
                                        
             <tr><td><%= user.getId() %></td><td  id="comp<%= user.getId() %>" ><%= user.getCompany()%></td><td id="rate<%= user.getId() %>"><%= user.getRate()%></td><td id="sellemail<%= user.getId() %>"><%= user.getSellerEmail() %></td><td><%= user.getDate() %></td></tr>                              
             <%
    
    
}
t2.commit();

      %>
      
                                    </tbody>
                              <%
      
      
   }
        
        
        catch(Exception e){
            
            out.println(e);
            
        }
   
        %>                             
           
        
        
       
            </table>
        
        
        
        
        
        
        
        
        
        
        
        
     </div>
    <div id="menu2" class="tab-pane fade">
        
        
        
        
                <% 
          try {
              
         
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session3=factory.openSession();  
     Transaction t3 = session3.beginTransaction();  
     
     
     %>
     <br><Br>
        
        
        <table border="1" id="example3" class="stripe" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Company_Name</th>
                                            <th>Purchase Share_Rate</th>
                                             <th>Sold Rate</th>
                                            <th>Owner Mail-Id</th>
                                            <th>User Mail-Id</th>
                                           <th>Date Of Purchase</th>
                                            
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                                                <%
         
         
     Criteria cr1 = session3.createCriteria(ShareBuy.class); 
     List list1=cr1.list();
       
      Iterator iterator1 = list1.iterator(); 
      
      %>
                                
            <span ></span>
      
      
      
      <%
      
      
      for (int i = 0; i < list1.size(); i++)
{
             ShareBuy user =  (ShareBuy)iterator1.next();
                  if(user.getEnd_rate()!= 0){
                      
                  }
                  else{
                      continue;
                  }
    
             %>
                                        
                                        
             <tr><td><%= user.getId() %></td><td  id="comp<%= user.getId() %>" ><%= user.getCompany()%></td><td id="rate<%= user.getId() %>"><%= user.getRate()%></td><td><%= user.getEnd_rate()%></td><td id="sellemail<%= user.getId() %>"><%= user.getSellerEmail() %></td><td><%= user.getUseremail() %></td><td><%= user.getDate() %></td></tr>                              
             <%
    
    
}
t3.commit();
session3.close();
      %>
      
                                    </tbody>
                                </table>
                           
                                        
                                        
          <%
      
      
   }
        
        
        catch(Exception e1){
            
            out.println(e1);
            
        }
   
        %>                             
           
        
        
        
        
        
        
        
        
     </div>
    <div id="menu3" class="tab-pane fade">
      </div>
  </div>
</div>

        
        
        
                     <script src="js/jquery.min.js"></script>
                     <script src="js/bootstrap.min.js"></script>
                     <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
                     <script src="//cdn.dataTables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
    var table = $('#example').dataTable();
    var tool = new $.fn.dataTable.TableTools(table,{
        
        
        'sSwfPath':'//cdn.dataTables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
    });
    $(tool.fnContainer()).insertBefore('#example_wrapper');
    
    var table2 = $('#example2').dataTable();
    var table3 = $('#example3').dataTable();
    var tool = new $.fn.dataTable.TableTools(table2,{
        
        
        'sSwfPath':'//cdn.dataTables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
    });
    $(tool.fnContainer()).insertBefore('#example2_wrapper');
    
    
} );
</script>

<script>
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();
          });
</script>
    </body>
</html>
