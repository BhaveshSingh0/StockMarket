<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>loading...</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

   
  </head>
  <body style="font-family: Open Sans;">
  
    <div class="container" style="margin-top: 10%;">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <center>
                    <strong> Loading <%= session.getAttribute("email") %>@mymail.com </strong>
                </center>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" id="progress-bar1" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 100%;"></div>
                </div>
                <center>
                    <h3>Please wait!</h3>
                </center>
            </div>
            <div class="col-md-3"></div>
        </div>
        

    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.progresstimer.js"></script>
    <script>
    var progress = $("#progress-bar1").progressTimer({
        timeLimit: 2,
        onFinish: function () {
            window.location = "account.jsp";
        }
    });
    
    </script>
  </body>
</html>
