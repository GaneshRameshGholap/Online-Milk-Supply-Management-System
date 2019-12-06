<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Registration</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sl-slide.css">

  <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

  <!-- Le fav and touch icons -->
  <link rel="shortcut icon" href="images/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
  <script type='text/javascript'>
function validate()
{
	x=document.forms["reg"]["email"];
	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
		x.focus();
		return false;
	}
	x=document.forms["reg"]["pwd"];
	y=document.forms["reg"]["cpwd"];
	if(x.value!=y.value)
	{
		alert("Password and confirm password do not match.");
		x.focus();
		return false;
	}
x=document.forms["reg"]["contact"];
	if(!x.value.match(/^\d{10}$/))
	{
		alert("Invalid phone number.");
		x.focus();
		return false;
	}
	return true;
}
</script>
</head>

<body>

  <!--Header-->
  <header class="navbar navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <a id="" class="pull-left" href="index.html"></a>
        <div class="nav-collapse collapse pull-right">
          <ul class="nav">
            <li><a href="index.html">Home</a></li>
            <li><a href="about-us.html">About Us</a></li>
            <li><a href="contact-us.html">Contact</a></li>
          </ul>        
        </div><!--/.nav-collapse -->
      </div>
    </div>
  </header>
  <!-- /header -->


  <section class="title">
    <div class="container">
      <div class="row-fluid">
        <div class="span6">
          <h1>Registration</h1>
        </div>
        <div class="span6">
          <ul class="breadcrumb pull-right">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Registration</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  <!-- / .title -->       


  <section id="registration-page" class="container">
    <form class="center" action="Customer.jsp" name ="reg" method="POST" onsubmit="return validate()">
      <fieldset class="registration-form">
        <div class="control-group">
          <!-- First Name -->
          <div class="controls">
            <input type="text" id="first" name="first" placeholder="First Name" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- Last Name -->
          <div class="controls">
            <input type="text" id="last" name="last" placeholder="Last Name" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- Address -->
          <div class="controls">
            <input type="text" id="address" name="address" placeholder="ADDRESS" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- E-mail -->
          <div class="controls">
            <input type="text" id="email" name="email" placeholder="E-mail" class="input-xlarge" required>
          </div>
        </div>
         <div class="control-group">
          <!-- Contact -->
          <div class="controls">
            <input type="text" id="contact" name="contact" placeholder="Contact" maxlength=10 class="input-xlarge" required>
          </div>
        </div>
         <div class="control-group">
          <!-- Ctype -->
          <div class="controls">
            <input type="text" id="type" name="type" placeholder="Ctype" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- City -->
          <div class="controls">
            <input type="text" id="city" name="city" placeholder="City" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- qty -->
          <div class="controls">
            <input type="text" id="qty" name="qty" placeholder="Quntity" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- Password-->
          <div class="controls">
            <input type="password" id="pwd" name="pwd" placeholder="Password" class="input-xlarge">
          </div>
        </div>
        <div class="control-group">
          <!-- Password -->
          <div class="controls">
            <input type="password" id="cpwd" name="cpwd" placeholder="Password (Confirm)" class="input-xlarge">
          </div>
        </div>
        <%
         if(session.getAttribute("record")!=null)
         {
          session.removeAttribute("record");
         %>
         <script>
           alert("registration succussfull:");
         </script>
        <%
         }
         %>
         <%
          if(session.getAttribute("record1")!=null)
          {
           session.removeAttribute("record1");
          %>
          <script>
          alert("registration is not completed:");
           </script>
           <%
             }
           %>  
        <div class="control-group">
          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success btn-large btn-block">Register</button>
          </div
        </div>
      </fieldset>
    </form>
  </section>
  <!-- /#registration-page -->


<!--Bottom-->
<section id="bottom" class="main">
    <!--Container-->
    <div class="container">

        <!--row-fluids-->
        <div class="row-fluid">

            <!--Contact Form-->
            <div class="span3">
                <h4>ADDRESS</h4>
                <ul class="unstyled address">
                    <li>
                        <i class="icon-home"></i><strong>Address:</strong>Shedthal,Tal. Shirol<br>District.Kholapur
                    </li>
                    <li>
                        <i class="icon-envelope"></i>
                        <strong>Email: </strong> support@email.com
                    </li>
                    <li>
                        <i class="icon-globe"></i>
                        <strong>Website:</strong> www.abc.com
                    </li>
                    <li>
                        <i class="icon-phone"></i>
                        <strong>Mobile Number:</strong> 9145525890<br>(Pawan Kumar Jain)
                    </li>
                </ul>
            </div>
            <!--End Contact Form-->

            <!--Skills-->
            <div id="tweets" class="span3">
                <h4>WHY US</h4>
                <div>
                    <ul class="arrow">
                        <li><a>Quality Products</a></li>
                        <li><a>Flexible Customer Service</a></li>
                        <li><a>Reasonable Rates</a></li>
                        <li><a>Trusted Service</a></li>
                        <li><a>Quick Support</a></li>
                    </ul>
                </div>  
            </div>
            <!--Important Links-->

            <!--OUR PRODUCTS-->
            <div id="archives" class="span3">
                <h4>OUR PRODUCTS</h4>
                <div>
                    <ul class="arrow">
                        <li><a>Milk</a></li>
                        <li><a>Paneer</a></li>
                        <li><a>Ghee</a></li>
                        <li><a>Khoya</a></li>
                        <li><a>Yogurt</a></li>
                        <li><a>Basundi</a></li>
                    </ul>
                </div>
            </div>
            <!--End Archives-->

            <div class="span3">
                <h4>FLICKR GALLERY</h4>
                <div class="row-fluid first">
                    <ul class="thumbnails">
                      <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829540293/" title="01 (254) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7003/6829540293_bd99363818_s.jpg" width="75" height="75" alt="01 (254)"></a>
                    </li>
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829537417/" title="01 (196) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7013/6829537417_465d28e1db_s.jpg" width="75" height="75" alt="01 (196)"></a>
                    </li>
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829527437/" title="01 (65) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7021/6829527437_88364c7ec4_s.jpg" width="75" height="75" alt="01 (65)"></a>
                    </li>
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829524451/" title="01 (6) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7148/6829524451_a725793358_s.jpg" width="75" height="75" alt="01 (6)"></a>
                    </li>
                </ul>
            </div>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829524451/" title="01 (6) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7148/6829524451_a725793358_s.jpg" width="75" height="75" alt="01 (6)"></a>
                    </li>
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829540293/" title="01 (254) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7003/6829540293_bd99363818_s.jpg" width="75" height="75" alt="01 (254)"></a>
                    </li>
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829537417/" title="01 (196) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7013/6829537417_465d28e1db_s.jpg" width="75" height="75" alt="01 (196)"></a>
                    </li>
                    <li class="span3">
                        <a href="http://www.flickr.com/photos/76029035@N02/6829527437/" title="01 (65) by Victor1558, on Flickr"><img src="http://farm8.staticflickr.com/7021/6829527437_88364c7ec4_s.jpg" width="75" height="75" alt="01 (65)"></a>
                    </li>
                </ul>
            </div>

        </div>

    </div>
    <!--/row-fluid-->
</div>
<!--/container-->

</section>
<!--/bottom-->

<!--Footer-->
<footer id="footer">
    <div class="container">
        <div class="row-fluid">
            <div class="span5 cp">
                <a>&copy; 2019</a> <a>Designed By </a><a>Aniket & Ganesh</a>
            </div>
            <!--/Copyright-->

            <div class="span6">
                <ul class="social pull-right">
                    <li><a><i class="icon-facebook"></i></a></li>
                    <li><a><i class="icon-twitter"></i></a></li>
                    <li><a><i class="icon-pinterest"></i></a></li>
                    <li><a><i class="icon-linkedin"></i></a></li>
                    <li><a><i class="icon-google-plus"></i></a></li>                       
                    <li><a><i class="icon-youtube"></i></a></li>
                    <li><a><i class="icon-tumblr"></i></a></li>                        
                    <li><a><i class="icon-dribbble"></i></a></li>
                    <li><a><i class="icon-rss"></i></a></li>
                    <li><a><i class="icon-github-alt"></i></a></li>
                    <li><a><i class="icon-instagram"></i></a></li>                   
                </ul>
            </div>

            <div class="span1">
                <a id="gototop" class="gototop pull-right" href="#"><i class="icon-angle-up"></i></a>
            </div>
            <!--/Goto Top-->
        </div>
    </div>
</footer>
<!--/Footer-->

<script src="js/vendor/jquery-1.9.1.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
