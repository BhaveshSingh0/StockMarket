
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
        
        <style>
            .form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}
            
              h2 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 42px;
  padding: 0px 0px;
  margin-left: 10px;
  text-align:left;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
} 
    .elegantshd {
   
  letter-spacing: .15em;
  }
                        
      
  #dbError {
            display: <%= request.getAttribute("dbError") %>;
        }
      
            
            
            </style>
            
            
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        
        <div class="container">
            
            <div class="row">
                <div class="col-md-12">
                    
                      <h2 class="elegantshd">Stock Market &nbsp;<i class="fa fa-line-chart"></i> </h2>
             
                </div>
                
            </div>
            
            
        
        
            
            <br>
            <div class="row" >
                <div class="col-md-4 col-md-offset-4">
              
             <div class="alert alert-danger" id="dbError" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Please Enter valid  Email Id & password!</center>
                    </div>
                </div>
            </div>  
            <br>
       <div class="container">
    <div class="row">
        
        <br>
        <br>
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <h1 class="text-center login-title" style=" font-family:Lucida Console,Impact, Monaco, monospace ; ">Sign Up &nbsp;<i class="fa fa-sign-in" aria-hidden="true"></i> </h1>
             <br>
             <form class="form-signin" action="auth" method="POST">
                    <input type="text" class="form-control" placeholder="Email" name="email" required autofocus>
                <br>
                <input type="password" class="form-control" placeholder="Password" name="pass" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Sign in</button>
                
                <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            </div>
            <a href="#" class="text-center new-account">Create an account </a>
        </div>
    </div>
</div>  
    </body>
</html>
