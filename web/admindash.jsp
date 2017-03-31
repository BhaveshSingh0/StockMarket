
<%
String username = (String)session.getAttribute("fname");
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
 	padding: 15px;
 	font-size: 25px;
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
     
    var num ;
    
   function formSubmit(){
   //alert($("#form1").serialize());
     $.ajax({
     url:'auto',
     data: $("#form1").serialize(),
     success: function (data) {
          
    }
    
});
}
   
        
 //-------------------------------------------------------------------------------       
        function bar(){ 
           
              var ele =[];
          var data =[];
          var rowCount = $('#example tr').length;
          var row = rowCount-1 ;
          
          for (i = 1; i <= row; i++) { 
       var comp = document.getElementById("comp"+i).value;
       var cost = parseInt(document.getElementById("rate"+i).value);
       
         ele.push(comp);
         data.push(cost);
          }
          
   var ctx = document.getElementById("myChart");
var myChart = Chart.Line(ctx, {

    data: {
        labels:ele ,
         datasets: [
        {
            label: "Stock_Market",
            fill: false,
            lineTension: 0.1,
            backgroundColor: "rgba(75,192,192,0.4)",
            borderColor: "rgba(75,192,192,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(75,192,192,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(75,192,192,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data:data ,
            spanGaps: false,
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
         
};


//---------------------------------------
      window.onload = function(){          
         updateValue();
        
     }
//-----------------------------------------     
     
     function updateValue(){
         
     mytimer = setInterval(changeValue,3000);
       mytimer = setInterval(bar,4000);
       mytimer = setInterval(formSubmit,4100);
      }
//-----------------------------------------------------      
      function changeValue(){
            
       var rowCount = $('#example tr').length;
          var row = rowCount-1 ;
    var i ;
       for (i = 1; i <= row; i++) { 
       var html1 = parseInt(document.getElementById("rate"+i).value);
       
       var html2 = parseInt(document.getElementById("low"+i).value);
       var html3 = parseInt(document.getElementById("high"+i).value);
    
       
       
       
       
       var randomNumber = Math.floor(Math.random() * 201) - 100;
       num = html1+randomNumber ;
       if(num<html2){
           document.getElementById("low"+i).value = num;
       }
       if(num>html3){
          document.getElementById("high"+i).value = num;
      }
       document.getElementById("rate"+i).value = num;
       
     
   }      }
      
      </script>
  
    
    <script>
        
        
   function myFunction(id) {
    window.open("http://localhost:8080/StockMarketProject/" +id+ ".jsp");
}
        </script>
    </head>
    <body>
            
            <div class="row">
                <div class="col-md-4" style=" margin-top:-10px;">
                    
                      <h2 class="elegantshd">Stock Market &nbsp;<i class="fa fa-line-chart"></i> </h2>
             
                </div>
                
                
             <div class="col-md-6 col-md-offset-2" >
                    
               <% String username1 = (String) session.getAttribute("fname"); 
                  String last = (String) session.getAttribute("lname"); 
               %>     
        
                       
                             
                             <ul>
                                 
                                 
                                     <li><a href=""><i class="fa fa-user" style="font-size: 30px;" aria-hidden="true"></i> &nbsp;Admin</a></li>
                                     <li>
                                    <button class="btn btn-default" data-toggle="modal" data-target="#myModalNorm">
                                     Add Share
                                    </button>
                                     </li> <li><a   id="adminr" onclick="myFunction(this.id)">Report</a></li>
                                     <li><a href="logout.jsp">Sign Out</a></li>
                             </ul>
                             
                             

                </div>
                
            </div>
            <div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="myModal">
                   Add Share
                </h3>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form role="form" action="addshare"  method="POST">
                  <div class="form-group">
                   <input type="hidden" value="1" name="form1" />   
                    <label for="exampleInputEmail1">Company Name:</label>
                      <input type="text" class="form-control"
                     name="comp" placeholder="Company Name"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Share Rate :</label>
                      <input type="number" name="rate" class="form-control"
                           placeholder="Share Rate"/>
                  </div>
                  
                  <button type="submit" class="btn btn-default">Submit</button>
                </form>
                
                
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                            Close
                </button>
                <button type="button" class="btn btn-primary">
                    Save changes
                </button>
            </div>
        </div>
    </div>
</div>   
               
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
                                            <th>Sr. No</th>
                                            <th>Company_Name</th>
                                            <th>Share_Rate</th>
                                            <th>Low_Rate</th>
                                            <th>High_Rate</th>
                                            <th>Opening_Rate</th>
                                         
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                         <%
         
         
     Criteria cr = session1.createCriteria(ShareCom.class); 
     List list=cr.list();
       
      Iterator iterator = list.iterator(); 
       session.setAttribute("size",list.size());
      %>
                                
  
      
           
      
      <%
      
      
      for (int i = 0; i < list.size(); i++)
{
             ShareCom user =  (ShareCom)iterator.next();
   
    
             %>
                                        
                                        
                                        
  <tr><td><input type="hidden"  name="email<%= user.getId() %>" value="<%= user.getEmail() %>"  ><input type="number" name="id<%= user.getId() %>" value="<%= user.getId() %>"  /></td><td><input type="text"   id="comp<%= user.getId() %>" name="comp<%= user.getId() %>" value="<%= user.getComp() %>"  ></td><td><input type="number"  id="rate<%= user.getId() %>" name="rate<%= user.getId() %>" value="<%= user.getShare_rate() %>"  ></td><td><input type="number"  id="low<%= user.getId() %>" name="low<%= user.getId() %>" value="<%= user.getLowrate() %>"  ></td><td><input type="number"  id="high<%= user.getId() %>" name="high<%= user.getId() %>" value="<%= user.getHighrate()   %>"  ></td><td><input type="number"  name="open<%= user.getId() %>" value="<%= user.getOpen_rate() %>"  ></td></tr>
                                      
                                        
                                          
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
        
        
        catch(Exception e){
            
            out.println(e);
            
        }
   
        %>                             
           
        
        
          </form>
        <div class="container">
            
            <div class="row">
                <div class="col-md-10" style=" height:100px">
                    
        <canvas id="myChart" ></canvas>
                </div>
            </div>
        </div>
                                        
                                        
     <script>
          

         
</script>
 <script type="text/javascript" src="js/pnotify.custom.min.js"></script>
                                      
     <script>
          

           <%
            if(request.getAttribute("success")!=null)
            {
                String status = (String)request.getAttribute("success");
                if(status.equalsIgnoreCase("suc"))
                {
                    %>
                        $(function(){
                                PNotify.prototype.options.styling = "bootstrap3";
                                    var notice = new PNotify({
                                    title: 'Success',
                                    text: " Success",
                                    type: 'success',
                                    buttons: {
                                        closer: false,
                                        sticker: false
                                    }
                                });
                                notice.get().click(function() {
                                    window.location.href = "admindash.jsp";
                                    notice.remove();
                                });
                        });
                        <%
                }
                else
                {
                        %>
                        $(function(){

                                PNotify.prototype.options.styling = "bootstrap3";
                                    var notice = new PNotify({
                                    title: 'Error',
                                    text: 'Something went wrong! Please contact developer.',
                                    type: 'error',
                                    buttons: {
                                        closer: false,
                                        sticker: false
                                    }
                                });
                                
                                
                                notice.get().click(function() {
                                    window.location.href = "admindash.jsp";
                                    notice.remove();
                                });
                        });
                        <%
                }
            }
        %>
            
    </script>


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
    
    
} );
</script>

<script>
        $(function(){
            $('[data-toggle="tooltip"]').tooltip();
          });
</script>
               
               
               
               
               
               
               
               
               
               
               
            
    </body>
</html>
