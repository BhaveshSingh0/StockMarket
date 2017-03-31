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
     
    var num ;
    
    
    
    function  purchase(i){
        
       var comp1 = document.getElementById("comp"+i).innerHTML;
       var email = document.getElementById("email"+i).value;
       var cost1 = parseInt(document.getElementById("rate"+i).innerHTML);
      
        var id = 1 ;
      
         $.ajax({
                type: "POST",
                url: 'buy',
                data: 'comp='+comp1+'&cost='+cost1+'&i='+id+'&email='+email,
                success: function(data) {
           
                 alert(data);
                },
                 error: function() {
                    alert('it broke');
                }
                
            });
        
    }
    function formSubmit(){
 location.reload();
}
   
        
 //-------------------------------------------------------------------------------       
        function bar(){ 
           
              var ele =[];
          var data =[];
          var rowCount = $('#example tr').length;
          var row = rowCount-1 ;
          
          for (i = 1; i <= row; i++) { 
       var comp = document.getElementById("comp"+i).innerHTML;
       var cost = parseInt(document.getElementById("rate"+i).innerHTML);
    
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


//---   ------------------------------------
      window.onload = function(){          
         updateValue();
        
     }
//-----------------------------------------     
     
     function updateValue(){
         
             mytimer = setInterval(bar,4000);
    mytimer = setInterval(formSubmit,10000);
      }
//-----------------------------------------------------      
     
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
                
                
             <div class="col-md-8 " >
                    
               <% String username1 = (String) session.getAttribute("fname"); 
                  String last = (String) session.getAttribute("lname"); 
               %>     
        
                       
                             
                             <ul>
                                 
                                 
                                     <li><a href=""><i class="fa fa-user" style="font-size: 30px;" aria-hidden="true"></i> &nbsp;<%= username1%></a></li>
                                    <li><a   id="report" onclick="myFunction(this.id)">Report</a></li>
                                    
                                     <li>
                                      <button class="btn btn-default" data-toggle="modal" data-target="#myModalHorizontal">
                                                Add Money
                                            </button>

                                     </li>
                                     
                                     
                                     <li><a href="logout.jsp">Sign Out</a></li>
                             </ul>
       
   <!-- ------------------------------------------------------------------- -->                      
          
   <!-- ------------------------------------------------------------------- -->
   
    
<!-- Modal -->
<div class="modal fade" id="myModalHorizontal" tabindex="-1" role="dialog" 
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
                <h2 class="modal-title" id="myModalLabel">
                  Add Money
                </h2>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form class="form-horizontal" role="form" action="money" method="GET">
                     
                
                    <div class="form-group">
                    <label  class="col-sm-2 control-label"
                              for="inputEmail3">Money</label>
                    <div class="col-sm-10">
                      <input type="number" class="form-control"  name="money" placeholder="Money"/>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-default">Add</button>
                    </div>
                  </div>
                </form>
                
            </div></div></div></div></div></div>
                
                
                
        
    
   
   <!-- ------------------------------------------------------------------- -->
                      
                                     
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
                                            <th>BUY</th>
                                            
                                        <!--    <th>Ordered Time</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                         <%
         
         
     Criteria cr = session1.createCriteria(ShareCom.class); 
     List list=cr.list();
       
      Iterator iterator = list.iterator(); 
      
      %>
                                
            <span ></span>
      
      
      
      <%
      
      
      for (int i = 0; i < list.size(); i++)
{
             ShareCom user =  (ShareCom)iterator.next();
   
    
             %>
                                        
                                        
                                        
             <tr><td><%= user.getId() %></td><td id="comp<%= user.getId() %>"><%= user.getComp()%></td><td id="rate<%= user.getId() %>"><%= user.getShare_rate()%></td><td><%= user.getLowrate()%></td><td><%= user.getHighrate() %></td><td><%= user.getOpen_rate() %></td><td><input type="button"  class="btn-primary"  id="<%= user.getId() %>" onclick="purchase(this.id)" value="Buy"/><input type="hidden"  id="email<%= user.getId() %>" value="<%=user.getEmail() %>" </td></tr>
                                        
                                          
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
                                        
                                        
                
          <input type="hidden"   name="size"  value="<%= list.size() %>" />
           
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
                                    window.location.href = "DashBoard.jsp";
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
                                    window.location.href = "DashBoard.jsp";
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
