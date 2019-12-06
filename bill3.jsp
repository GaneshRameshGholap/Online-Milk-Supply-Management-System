<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
<title>customer list and quantity</title>
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
<li class="active"><a href="emloyeepage.html">Home</a></li>
<li><a href="editemployee.html">Edit Profile</a></li>
<li><a href="attendance.html">Attendance</a></li>
<li><a href="editattendance.html">Edit Attendance</a></li>
<li><a href=".html">View Salary Statement</a></li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">MENU<i class="icon-angle-down"></i></a>
<ul class="dropdown-menu">
<li><a href="services.html">Services</a></li>
<li><a href="portfolio.html">Portfolio</a></li>
<li><a href="about-us.html">About Us</a></li> 
<li><a href="contact-us.html">Contact</a></li>
</ul>
</li>
<li><a href="logout.jsp">Logout</a></li>
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
<h1>Quantity</h1>
</div>
<div class="span6">
<ul class="breadcrumb pull-right">
<li><a href="index.html"></a>Employee Home <span class="divider">/</span></li>
<li class="active">View Quantity</li>
</ul>
</div>
</div>
</div>
</section>
<!-- / .title -->  
<%   
try
{
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet res;
	String from,to,month,year;
	float sum,rate,m;
        int y;

         rate=Float.parseFloat(request.getParameter("rate"));

         int eid=Integer.parseInt(request.getParameter("eid"));
       
	 from=request.getParameter("from");
	 to=request.getParameter("to");
         month=request.getParameter("month");
	 year=request.getParameter("year");
         y=Integer.parseInt(year);

	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();

	if(con==null)
	{
		out.println("Not connected:");
	}
	else
	{         
                 
                  res=stmt.executeQuery("select sum(milk_qty) from combine where eid="+eid+" and date between '"+from+"' and '"+to+"'");
                  if(res.next())
                  {
                      m=Float.parseFloat(res.getString(1));
                      sum=(m*rate);
                      pstmt=con.prepareStatement("Insert into salary values(default,?,?,?,?,?,?)");
                          pstmt.setInt(1,eid);
			  pstmt.setFloat(2,rate);
			  pstmt.setFloat(3,m);
			  pstmt.setFloat(4,sum);
			  pstmt.setString(5,month);
                          pstmt.setInt(6,y);
			  int n=pstmt.executeUpdate();
                          if(n!=0)
                          {
                             session=request.getSession(true);
                             session.setAttribute("sal","1");
                             response.sendRedirect("salary.jsp");
                          }
                          else
                          {
                             session=request.getSession(true);
                             session.setAttribute("sal1","1");
                             response.sendRedirect("salary.jsp"); 
                          }
                  }//if

          
	}//else
}//try
catch(Exception e){}
%>

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
