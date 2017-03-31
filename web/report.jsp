<%-- 
    Document   : report
    Created on : Feb 27, 2017, 7:20:53 PM
    Author     : Bhavesh Singh
--%>


<%@page import="com.StockUser"%>
<%@page import="com.ShareBuy"%>
<%
String username = (String) session.getAttribute("fname");
if (null == username) {
   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
   rd.forward(request, response);
}

%>

<%@page import="com.ShareCom"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
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
    <style>
        
         ul{

       
	margin-top: 30px;
}

li:hover {
  
   background-color: #ddd;

   font-size: 28px;


}
  a{
   font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
   text-decoration: none;
  }
 li {

 	list-style-type: none ;
 	display: inline;
 	padding: 16px;
 	font-size: 22px;
 }

     h2 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 32px;
  padding: 10px 0px;
  margin-left: 10px;
  text-align:left;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
} 
   
.elegantshd {
   
  letter-spacing: .15em;
}
    
    </style>
   
    <script>
        
        
        
         function  sell(i){
        
       var comp1 = document.getElementById("comp"+i).innerHTML;
       var email = document.getElementById("sellemail"+i).innerHTML;
       var cost1 = parseInt(document.getElementById("rate"+i).innerHTML);
    
         $.ajax({
                type: "POST",
                url: 'sell',
                data: 'comp='+comp1+'&cost='+cost1+'&i='+i+'&email='+email,
                success: function(data) {
           
                 alert(data);
                },
                 error: function() {
                    alert('it broke');
                }
                
            });
        
    }
        </script>
    </head>
    <body>
        <br>
        <div class="container">
        <div class="row">
                <div class="col-md-5" style=" margin-top:-10px;">
                    
                      <h2 class="elegantshd">Stock Market &nbsp;<i class="fa fa-line-chart"></i> </h2>
             
                                
               <% String username1 = (String) session.getAttribute("fname"); 
                  
                 String email = (String) session.getAttribute("email"); 
               %>    
                </div>
                <%
            int moneyStock=0;        
    Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  

 Transaction t3 = session1.beginTransaction(); 
      List list= session1.createQuery("from com.StockUser Where EMAIL ='"+email+"'").list();
      Iterator iterator = list.iterator(); 
      
             
      for(int j = 0; j < list.size(); j++)
{
            StockUser user =  (StockUser)iterator.next();
              moneyStock = user.getMoney();
    
}
      
t3.commit();
                %>
                
             <div class="col-md-5 col-md-offset-2 " >
           
        <li><a href=""><i class="fa fa-user" style="font-size: 30px;" aria-hidden="true"></i> &nbsp; <%= username1%></a></li>
         <li><a href="logout.jsp"><i class="fa fa-sign-out" style="font-size: 30px;" aria-hidden="true"></i> &nbsp;Sign Out</a></li>
       
        <br>
        
        <h3> BALANCE: <li><%= moneyStock %><i class="fa fa-inr" aria-hidden="true"></i></li></ul></h3>
             </div></div>
        </div>
                 
        
        
                             <h2> Your purchased Shares</h2>
        
                             
                             
                             
                                    
                <% 
          try{
     
     Transaction t = session1.beginTransaction();  
     
     
     %>
           <table border="1" id="example" class="stripe" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Sr. No</th>
                                            <th>Company_Name</th>
                                            <th>Purchase Share_Rate</th>
                                     
                                            <th>Owner Mail-Id</th>
                                           <th>Date Of Purchase</th>
                                            <th>Sell</th>
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                                                <%
         
         
     Criteria cr3 = session1.createCriteria(ShareBuy.class); 
     List list3 =cr3.list();
       
      Iterator iterator3 = list3.iterator(); 
      
      %>
                                
            <span ></span>
      
      
      
      <%
      
      
      for (int i = 0; i < list3.size(); i++)
{
             ShareBuy user =  (ShareBuy)iterator3.next();
                  if((user.getUseremail().equalsIgnoreCase(email))&&(user.getEnd_rate()== 0)){
                      
                  }
                  else{
                      continue;
                  }
    
             %>
                                        
                                        
             <tr><td><%= user.getId() %></td><td  id="comp<%= user.getId() %>" ><%= user.getCompany()%></td><td id="rate<%= user.getId() %>"><%= user.getRate()%></td><td id="sellemail<%= user.getId() %>"><%= user.getSellerEmail() %></td><td><%= user.getDate() %></td><td><input type="button" class="btn-primary" id="<%= user.getId() %>" onclick="sell(this.id)"  value="Sell"  ></td></tr>                              
             <%
    
    
}
t.commit();

      %>
      
                                    </tbody>
                                </table>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
                                        
                                        
                
          <input type="hidden"   name="size"  value="<%= list.size() %>" />
           
      <%
      
      
   }
        
        
        catch(Exception e){
            
            out.println(e);
            
        }
   
        %>                             
           
        
        
        <br>
        <h2>Your History</h2>
        
        
        
                        
                             
                             
                                    
                <% 
          try{
 
     Transaction t = session1.beginTransaction();  
     
     
     %>
           <table border="1" id="example1" class="stripe" cellspacing="0" width="100%">
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
         
         
     Criteria cr1 = session1.createCriteria(ShareBuy.class); 
     List list1=cr1.list();
       
      Iterator iterator1 = list1.iterator(); 
      
      %>
                                
            <span ></span>
      
      
      
      <%
      
      
      for (int i = 0; i < list1.size(); i++)
{
             ShareBuy user =  (ShareBuy)iterator1.next();
                  if(((user.getUseremail().equalsIgnoreCase(email))||(user.getSellerEmail().equalsIgnoreCase(email)))&&(user.getEnd_rate()!= 0)){
                      
                  }
                  else{
                      continue;
                  }
    
             %>
                                        
                                        
             <tr><td><%= user.getId() %></td><td  id="comp<%= user.getId() %>" ><%= user.getCompany()%></td><td id="rate<%= user.getId() %>"><%= user.getRate()%></td><td><%= user.getEnd_rate()%></td><td id="sellemail<%= user.getId() %>"><%= user.getSellerEmail() %></td><td><%= user.getUseremail() %></td><td><%= user.getDate() %></td></tr>                              
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
          </div>
                                        
                                        
          <%
      
      
   }
        
        
        catch(Exception e1){
            
            out.println(e1);
            
        }
   
        %>                             
           
        
        
        
        
        
        
        
        
        
            <script src="js/jquery.min.js"></script>
                     <script src="js/bootstrap.min.js"></script>
                     <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
                     <script src="//cdn.dataTables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function() {
    var table = $('#example').dataTable();
     var table = $('#example1').dataTable();
   
    var tool = new $.fn.dataTable.TableTools(table,{
        
        
        'sSwfPath':'//cdn.dataTables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
    });
    $(tool.fnContainer()).insertBefore('#example_wrapper');
    
    
} );
</script>

<script>
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();
          });
</script>
        
    </body>
</html>
