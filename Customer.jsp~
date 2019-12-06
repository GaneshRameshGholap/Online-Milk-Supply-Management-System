<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>JSP page</title>
</head>
<body>
<%
try
{
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet res;
        Float q;
	String first,last,add,email,contact,ctype,city,qty,pass1,pass2;
	first=request.getParameter("first");
	out.println("First name="+first);
	last=request.getParameter("last");
	out.println("last Name="+last);
	add=request.getParameter("address");
	out.println("address+"+add);
	email=request.getParameter("email");
	out.println("email="+email);
	contact=request.getParameter("contact");
	out.println("contact before="+contact);
	ctype=request.getParameter("type");
	out.println("ctype="+ctype);
	city=request.getParameter("city");
	out.println("city="+city);
	qty=request.getParameter("qty");
        out.println("Qty before="+qty);
	q=Float.parseFloat(qty);
	out.println("qty="+q);
	pass1=request.getParameter("pwd");
	out.println("Password="+pass1);
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	pstmt=con.prepareStatement("Insert into temp values(?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1,first);
	pstmt.setString(2,last);
	pstmt.setString(3,add);
	pstmt.setString(4,email);
	pstmt.setString(5,contact);
	pstmt.setString(6,ctype);
	pstmt.setString(7,city);
	pstmt.setFloat(8,q);
	pstmt.setString(9,pass1);
	int n=pstmt.executeUpdate();
        if(n!=0)
       {
           session=request.getSession(true);
           session.setAttribute("record","1");
           response.sendRedirect("registration.jsp");
       }
       else
       {
           session=request.getSession(true);
           session.setAttribute("record1","2");
           response.sendRedirect("registration.jsp");
       }
}
catch(Exception e){}
%>
</body>
</html>

