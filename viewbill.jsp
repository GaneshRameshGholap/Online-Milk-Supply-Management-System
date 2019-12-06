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
<title>View Bill</title>
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
                        <li class="active"><a href="customerpage.html">Home</a></li>
						<li><a href="setquantity.html">Change Quantity</a></li>
						<li><a href="viewbill.html">View Bill</a></li>
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
<h1>View Bill</h1>
</div>
<div class="span6">
<ul class="breadcrumb pull-right">
<li><a href="index.html"></a>Admin Home <span class="divider">/</span></li>
<li class="active">View Bill</li>
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
	int str1,str6;
        String str2,str4,str5,str7,str8;
         float str3;
	int cid=Integer.parseInt(request.getParameter("cno"));
         //out.println("<center><h1>"+cid+"</h1></center>");
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();

	if(con==null)
        {
		out.println("Not connected:");
	}
	else
	{
		res=stmt.executeQuery("select * from bill where cid="+cid);
		out.println("<center><h1>Bill</h1></center>");		
		out.println("<br><br><br>");
		out.println("<center><table border=2>");
                out.println("<tr><th></th><th></th></tr>");
		while(res.next())
		{
                       str1=res.getInt(1);
                     
                       str2=res.getString(2);
                      	
                       str3=res.getFloat(3);
                       	
                       str4=res.getString(4);
                      	
                       str5=res.getString(5);
                      	
                       str6=res.getInt(6);
                     	
                       str7=res.getString(7);
                      	
                       str8=res.getString(8);
                     	
                   
                     
		
	        out.println("<tr><td>Bill Id</td><td>"+str1+"</td></tr>");
                out.println("<tr><td>Paydate</td><td>"+str2+"</td></tr>");
                out.println("<tr><td>Total Ammount</td><td>"+str3+"</td></tr>");
                out.println("<tr><td>Payment mode</td><td>"+str4+"</td></tr>");
                out.println("<tr><td>Payment Status</td><td>"+str5+"</td></tr>");
 		out.println("<tr><td>Customer Id</td><td>"+str6+"</td></tr>");
		out.println("<tr><td>From Date</td><td>"+str7+"</td></tr>");
                out.println("<tr><td>To Date</td><td>"+str8+"</td></tr>");
               }

                out.println("</table></center>");
                out.println("<br><br><br>");
                
	}

}
catch(Exception e){}
%>	  



	<script src="js/vendor/jquery-1.9.1.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

	</body>
	</html>
