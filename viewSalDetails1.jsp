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
<title>View Salary Details</title>
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
<li class="active"><a href="adminpage.html">Back</a></li>
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
<h1>Admin</h1>
</div>
<div class="span6">
<ul class="breadcrumb pull-right">
<li><a href="adminpage.html"></a>Admin Home<span class="divider">/</span></li>
<li><a href="adminpage.html"></a>Employee<span class="divider">/</span></li>
<li class="active">Salary Details</li>
</ul>
</div>
</div>
</div>
</section>
<!-- / .title -->      
<section id="registration-page" class="container">
 <fieldset class="registration-form">
 <div class="control-group"> 
<center>
<%
try
{
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet res;


	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();

	if(con==null)
	{
		out.println("Not connected:");
	}
	else
	{
		out.println("<br><br><br>");
		out.println("<h4><center>");
                out.println("<center><table border=1>");
                out.println("<tr>");
                out.println("<th>Sid</th>");
                out.println("<th>Eid</th>");
                out.println("<th>Rate</th>");
                out.println("<th>Quantity</th>");
                out.println("<th>Salary</th>");
                out.println("<th>Month</th>");
                out.println("<th>Year</th>");
                out.println("</tr>");
		res=stmt.executeQuery("select * from salary");
		while(res.next())
		{
                       
			             out.println("<tr>");
                                     out.println("<td>"+res.getInt(1)+"</td>");
                                     out.println("<td>"+res.getInt(2)+"</td>");
                                     out.println("<td>"+res.getFloat(3)+"</td>");
                                     out.println("<td>"+res.getFloat(4)+"</td>");
                                     out.println("<td>"+res.getFloat(5)+"</td>");
                                     out.println("<td>"+res.getString(6)+"</td>");
                                     out.println("<td>"+res.getInt(7)+"</td>");
                                     out.println("</tr>");

		}
		out.println("</table></center></h4>");
                out.println("<br><br><br>");
	}

}
catch(Exception e){}
%>
</center>
</fieldset>
</section>
<!-- /#registration-page -->
<script src="js/vendor/jquery-1.9.1.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
