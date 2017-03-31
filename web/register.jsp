
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (null == request.getAttribute("success_reg")) {
   request.setAttribute("success_reg", "none");
    }
    if (null == request.getAttribute("sendSuccess")) {
   request.setAttribute("sendSuccess", "none");
    }
    if (null == request.getAttribute("dbError")) {
   request.setAttribute("dbError", "none");
    }
     if (null == request.getAttribute("dbError1")) {
   request.setAttribute("dbError1", "none");
    }
    
%>
<!DOCTYPE html> 
<html lang="en">
  <head>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Stock Market</title>
    <link rel="shortcut icon" href="img/1487455018_10.png" type="image/png">
   
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        
        #sendSuccess{
            display: <%= request.getAttribute("sendSuccess") %>;
        }
         #dbError {
            display: <%= request.getAttribute("dbError") %>;
        }
        #dbError1 {
            display: <%= request.getAttribute("dbError1") %>;
        }
        .popover{
            width:200px;
            height:80px;
            left: 20px;
        }
        @media (max-width:767px){
            .mydivhelp{
                display:none;
            }
        }
        #wrong{
            display: none;
        }
        #db_wrong{
            display: <%= request.getAttribute("success_reg") %>;
        }
        
        
        
        li:hover{
           font-size: 20px; 
            
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
        
        
        
    </style>
  </head>
  <body style="
        background-repeat: no-repeat;
        background-attachment: fixed;
        font-family: Open Sans; ">
      
      <br>
      <nav class="navbar navbar-default" style="border: none; background-color: white; border-radius: 0;">
        <div class="container">
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                  
               <h2 class="elegantshd">Stock Market &nbsp;<i class="fa fa-line-chart"></i> </h2>
              </div>

              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav navbar-right" style="margin-top: 35px; font-size: 16px; color: black;">
                            <li><a href="homepage.jsp" >Home &nbsp;<i class="fa fa-home" style="font-size:24px"></i></a></li>
                           <li><a href="login.jsp">Login &nbsp;<i class="fa fa-sign-in" style="font-size:24px"></i></a></li>
                        </ul>
              </div>
            </div>
      </div>
     </nav>
      
      <br>
  <center>
      
       <div class="alert alert-danger" id="dbError1" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>It Seems You Have already Registered ! Please Enter another Mail Id .</center>
                    </div>
      <div class="alert alert-danger" id="dbError" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Something went seriously wrong!</center>
                    </div>
      <div class="alert alert-success" id="sendSuccess" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
       <center>Data Stored</center>
       </div>
      <div class="alert alert-danger" id="db_wrong" role="alert">
          You have already registered or something went wrong while registering the user into database. Please contact the admin or try again later!
      </div>
      <div class="alert alert-danger" id="wrong" role="alert">
          Your registeration form has got some errors that needs to be taken care of!
          <br>
          <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> : Success &nbsp;&nbsp;
          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> : Error &nbsp;&nbsp;
          <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> : Warning &nbsp;&nbsp;
          
      </div>
  </center>
      <div class="container">
            <div class="row">
               
                
                <div class="col-md-6 col-md-offset-6">
                    <div class="jumbotron" style="background-color: white; border-style: solid; border-width: 0px; border-color: black; box-shadow: 5px 5px 40px #D3D4D5">
                        <div class="jumbotron" style="margin-left: 0px; padding: 5px !important; background-color: #D3D4D5;">
                            <span><center><strong>REGISTRATION</strong></center></span>
                        </div>
                        
                        <form class="form-horizontal" id="myregform" style="margin-left: 10px; margin-right:10px;" action="Register" method="POST">
                           <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group has-feedback" style="margin-right: -10px;">
                                        <label for="fname">Name</label>
                                        <input type="text" tabindex="1" id="fname" name="fname" class="form-control" required placeholder="First">
                                        
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group has-feedback"  style="margin-right: -10px;">
                                        <label for="lname">&nbsp;</label>
                                        <input type="text" tabindex="2" id="lname" name="lname" class="form-control" required  placeholder="Last">
                                       
                                    </div>
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <label for="pass">Email Id</label>
                                <input type="email" tabindex="4" id="email" name="email_addr" class="form-control" required placeholder="Email ID">
                                 </div>
                            
                            <div class="form-group has-feedback">
                                <label for="pass">Create a Password</label>
                                <input type="password" tabindex="4" id="pass" name="pass" class="form-control" required placeholder="Password">
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="pass_confirm">Confirm your Password</label>
                                <input type="password" tabindex="5" id="pass_confirm" name="pass_confirm" class="form-control" required  placeholder="Confirm Password">
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            </div>
                            
                            
                            <div class="form-group has-feedback">
                                <label for="gender">Gender</label>
                                <select class="form-control has-feedback"  tabindex="6" id="Gender" name="Gender"  required>
                                    <option name="default" disabled selected style="display: none;">I am ..</option>
                                    <option name="male">Male</option>
                                    <option name="female">Female</option>
                                    <option name="other">Other</option>
                                </select>
                            </div>
                            
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="form-group has-feedback" style="margin-right: -5px;">
                                        <label for="day">Birthday</label>
                                        <select class="form-control has-feedback"  tabindex="7" id="Day" name="Day">
                                            <center>
                                                    <option name="default" selected disabled style="display: none;">Day</option>
                                                    <% for(int i=1; i<=31; i++){ %>
                                                    <option name="<%= i %>"> <%= i %></option>;
                                                    <% } %> 
                                                    
                                            </center>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-5">
                                    <div class="form-group has-feedback"  style="margin-right: -5px;">
                                        <label for="month">&nbsp;</label>
                                        <select class="form-control has-feedback" tabindex="8" id="Month" name="Month">
                                            <center>
                                                    <option name="default" selected disabled style="display: none;">Month</option>
                                                    <option name="January">January</option>
                                                    <option name="Februrary">February</option>
                                                    <option name="March">March</option>
                                                    <option name="April">April</option>
                                                    <option name="May">May</option>
                                                    <option name="June">June</option>
                                                    <option name="July">July</option>
                                                    <option name="August">August</option>
                                                    <option name="September">September</option>
                                                    <option name="October">October</option>
                                                    <option name="November">November</option>
                                                    <option name="December">December</option>
                                            </center>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="form-group has-feedback">
                                        <label for="year">&nbsp;</label>
                                        <input type="text" id="year" tabindex="9" class="form-control" maxlength="4" name="year" required placeholder="Year">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group has-feedback">
                                <label for="contact">Mobile Phone</label>
                                <div class="input-group has-feedback">
                                   
                                    <span class="input-group-btn">
                                      <button class="btn btn-default" type="button" disabled>+91</button>
                                    </span>
                                    <input type="text" name="contact" id="contact"  tabindex="10" class="form-control" data-toggle="popover" data-trigger="hover" data-placement="right"
                                           data-content="Your phone number helps us with things like keeping your account secure." placeholder="Example: 9004196353" />
                                    
                                </div>
                            </div>
                            
                            <div class="form-group has-feedback" style="margin-left: 10px;">
                                <label for="rights"></label>
                                <div class="checkbox has-feedback">
                                      <input type="checkbox" id="rights" name="rights"  tabindex="11" value="yes" required>
                                      <p style="font-size: 14.5px;">I agree to the Stock Market <a href="terms.html"><b>Terms of Service and Privacy Policy</b></a>.</p>
                                </div>
                            </div>
                            
                            <div class="form-group" style="margin-bottom: -20px;">
                              <div class="col-sm-offset-4 col-sm-12">
                                  <input type="button" id="reg_button" value="Register" class="btn btn-success"  tabindex="12">
                              </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
          </div>
      </div>
      <hr>
    
      
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <!-- Script for contact terms and service policy pop up -->
    <script>
        $('#contact').popover();
        $('#name').popover();
    </script>
    
    <!-- Script for validation of form goes right below, hoss!-->
    <script type="text/javascript">
        function validateName(name)
        {
            var string = $("#"+name).val();
            var regex = /^[a-zA-Z]*$/;
            if(string===null||string==="")
            {
                var div = $("#"+name).closest("div");
                div.addClass("has-warning");
                div.removeClass("has-success");
                div.removeClass("has-error");
                $('#error'+name).remove();
                
                if(name==='fname')
                    div.append('<span id="error'+name+'" style="color: red;font-size: 10px;display: none">Please enter your First Name</span>');
                if(name==='lname')
                    div.append('<span id="error'+name+'" style="color: red;font-size: 10px;display: none">Please enter your Last Name</span>');
                $('#error'+name).css({"display":"inline"});
                $("#glyphcn"+name).remove();
                div.append('<span id="glyphcn'+name+'"class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                return false;
            }
            else if (regex.test(string))
            {
                var div = $("#"+name).closest("div");
                
                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");
                
                $('#error'+name).remove();
                $('#error'+name).css({"display":"none"});
                $("#glyphcn"+name).remove();
                div.append('<span id="glyphcn'+name+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
            else
            {
                var div = $("#"+name).closest("div");
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                $("#error"+name).remove();
                div.append('<span id="error'+name+'" style="color: red;font-size: 10px;display: none">Enter only Alphabets.</span>');
                $('#error'+name).css({"display":"inline"});
                $("#glyphcn"+name).remove();
                div.append('<span id="glyphcn'+name+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                return false;
            }
        }
        
        function validatePassword(key1)
        {
            var keyLength = $("#"+key1).val().length;
            var string = $("#"+key1).val();
            var regex_space = new RegExp(" ");
            if(keyLength===0)
            {
                var div = $("#"+key1).closest("div");
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();
               
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter a Password.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            } 
            else 
            {
                if(regex_space.test(string))
                {
                    var div = $("#"+key1).closest("div");
                    $("#error"+key1).remove();
                    $('#glyphcn'+key1).remove();

                    div.addClass("has-warning");
                    div.removeClass("has-success");
                    div.removeClass("has-error");

                    div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                    div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Password must not contain any spaces.</span>');
                    $('#error').css({"display":"inline"});
                    return false;
                }
                else
                {
                    if(keyLength<8)
                    {
                        var div = $("#"+key1).closest("div");
                        $("#error"+key1).remove();
                        $('#glyphcn'+key1).remove();

                        div.addClass("has-warning");
                        div.removeClass("has-success");
                        div.removeClass("has-error");

                        div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                        div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Password must be greater than or equal to 8 characters.</span>');
                        $('#error'+key1).css({"display":"inline"});
                        return false;
                    }
                    else
                    {
                        var div = $("#"+key1).closest("div");
                        $("#error"+key1).remove();
                        $('#glyphcn'+key1).remove();

                        div.removeClass("has-warning");
                        div.addClass("has-success");
                        div.removeClass("has-error");

                        div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                        return true;
                    }
                }
            }
        }
        function passwordConfirmation(key1, key2)
        {
            var keyValue1 = $("#"+key1).val();
            var keyValue2 = $("#"+key2).val();
            
            var keyLength = $("#"+key1).val().length;
            if(keyLength===0)
            {
                var div = $("#"+key1).closest("div");
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();
               
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter the confirmation Password.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            } 
            else if(keyValue1===keyValue2)
            {
                var div = $("#"+key1).closest("div");
                $('#error'+key1).css({"display":"none"});
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();

                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");

                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
            else
            {
                var div = $("#"+key1).closest("div");
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();
               
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter the same password as above.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            }
        }
        function validateGenderDateMonth(key1)
        {
            var opt = document.getElementById(key1);
            var value = opt.options[opt.selectedIndex].text;
            if(value==="I am .."||value==="Day"||value==="Month")
            {
                var div = $("#"+key1).closest("div");
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();
               
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please select a '+key1+'.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            }
            else
            {
                var div = $("#"+key1).closest("div");
                $('#error'+key1).css({"display":"none"});
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();

                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");

                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
        }
        
        function validateYear(key1)
        {
            var value = $("#"+key1).val();
            if(value===null||value==="")
            {
                var div = $("#"+key1).closest("div");
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();
               
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter a year.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            }
            else if(value>=1900&& value<=(new Date().getFullYear()))
            {
                var div = $("#"+key1).closest("div");
                $('#error'+key1).css({"display":"none"});
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();

                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");

                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
            else
            {
                var div = $("#"+key1).closest("div");
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();
               
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                
                div.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter Valid Year. Year>=1900&Year<='+(new Date()).getFullYear()+'.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            }
        }
        function validateRights(key1)
        {
            var val = document.getElementById(key1).checked;
            if(!val)
            {
                var div = $("#"+key1).closest("div");
                div.append('<span id="glyphcn'+key1+'" style="margin-right: -20px;" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">You really need to check this before registeration.</span>');
                $('#error'+key1).css({"display":"inline"});
                return false;
            }
            else
            {
                var div = $("#"+key1).closest("div");
                $('#error'+key1).css({"display":"none"});
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();

                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");

                div.append('<span id="glyphcn'+key1+'" style="margin-right: -20px;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
        }
        function validateContact(key1)
        {
            var value = $("#"+key1).val();
            var regex = /[^0-9]/;
            if(value===null||value==="")
            {
                var div = $("#"+key1).closest("div");
                div.addClass("has-warning");
                div.removeClass("has-success");
                div.removeClass("has-error");
                $('#error'+key1).remove();
                
                $("#"+key1).css({"margin-top":"14px"});
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none;">Please enter your contact number.</span>');
                $('#error'+key1).css({"display":"table"});
                $("#glyphcn"+key1).remove();
                div.append('<span id="glyphcn'+key1+'" style="margin-top: 14px;" class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                return false;
            }
            else if(value.length!==10||regex.test(value))
            {
                var div = $("#"+key1).closest("div");
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                $('#error'+key1).remove();
                
                $("#"+key1).css({"margin-top":"14px"});
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none;">Please enter a valid contact number.</span>');
                $('#error'+key1).css({"display":"table"});
                $("#glyphcn"+key1).remove();
                div.append('<span id="glyphcn'+key1+'" style="margin-top: 14px;" class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                return false;
            }
            else
            {
                var div = $("#"+key1).closest("div");
                $('#error'+key1).css({"display":"none"});
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();

                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");

                $("#"+key1).css({"margin-top":" 0px"});
                div.append('<span id="glyphcn'+key1+'" style="margin-top: 0px;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
        }
        $(document).ready(
        
            function()
            {
                $("#reg_button").click(
                    function()
                    {
                        validateName("fname");
                        validateName("lname");
                        validatePassword("pass");
                        passwordConfirmation("pass_confirm","pass");
                        validateGenderDateMonth("Gender");
                        validateGenderDateMonth("Day");
                        validateGenderDateMonth("Month");
                        validateYear("year");
                        validateRights("rights");
                        validateContact("contact");
                        if(validateName("fname")&&validateName("lname")&&validatePassword("pass")&&passwordConfirmation("pass_confirm","pass")&&validateGenderDateMonth("Gender")&&validateGenderDateMonth("Day")&&validateGenderDateMonth("Month")&&validateYear("year")&&validateRights("rights")&&validateContact("contact"))
                            $("form#myregform").submit();
                        else
                            $("#wrong").css({"display": "block"});
                    }
                );
            }
            
        );
    </script>
  </body>
</html>
