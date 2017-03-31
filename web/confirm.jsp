<%-- 
    Document   : confirm
    Created on : Feb 19, 2017, 10:05:33 PM
    Author     : Bhavesh Singh
--%>



<%



if (null == request.getAttribute("dbError")) {
   request.setAttribute("dbError", "none");
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <style>
           h2 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 42px;
  padding: 0px 0px;
  margin-left: 10px;
  text-align:left;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
} 


  #dbError {
            display: <%= request.getAttribute("dbError") %>;
        }

.loader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 120px;
    height: 120px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
input[type=text] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
}

input[type=text]:focus {
    border: 3px solid #555;
}
.elegantshd {
   
  letter-spacing: .15em;
}
     
          </style>
    </head>
    <body>
      
        
        
        <%! 

        
        
        %>
        <div class="container">
            
            <div class="row">
                <div class="col-md-12">
                    
                      <h2 class="elegantshd">Stock Market &nbsp;<i class="fa fa-line-chart"></i> </h2>
             
                </div>
                
            </div>
            
            
            
            <br>
            <br><br>
            <div class="alert alert-danger" id="dbError" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Please Enter Correct OTP !</center>
                    </div>
                    
            
             <div class="alert alert-danger" id="dbError1" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Please Enter OTP  Sent To your Email Id!</center>
                    </div>
                    
     
            
            
            
            <br>
            <br>
            
            
            <div class="row">
                <div class="col-md-6 col-md-offset-5">
                   <div class="loader"></div>
                </div>
                
            </div>
            <br>
            <div class="row">
                <div class="col-md-3 col-md-offset-5">
                    
                    <form action="otp">
                   <div class="form-group">
                    <label for="email">Enter OTP :</label>
                     <input type="text" class="form-control" id="email" name="otp">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
                    
            
            
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script>
        $('#contact').popover();
        $('#name').popover();
    </script>
    </body>
</html>
