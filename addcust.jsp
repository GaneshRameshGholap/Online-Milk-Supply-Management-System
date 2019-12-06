<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>JSP page</title>
</head>
<body>
<form method=POST action="">
<table border=1>
<%
try
{
	Connection con;
	Statement stmt;
        PreparedStatement pstmt;
	ResultSet res;
        int q;
	String first,last,add,email,contact,ctype,city,qty,pass1,pass2;
/*	first=request.getParameter("first");
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
	q=Integer.parseInt(qty);
	out.println("qty="+q);
	pass1=request.getParameter("pwd");
	out.println("Password="+pass1);*/
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();
	res=stmt.executeQuery("select * from temp");
	while(res.next())
	{
		first=res.getString(1);
		last=res.getString(2);
		add=res.getString(3);
		email=res.getString(4);
		contact=res.getString(5);
		ctype=res.getString(6);
		city=res.getString(7);
		q=res.getInt(8);
		pass1=res.getString(9);
%>
<tr><td><input type=text name="id" placeholder="id"></td><td><input type=text name="first" value=
<% out.println(first); %> 
></td>
<td><input type=text name="last" value=
<% out.println(last); %>
></td>
<td><input type=text name="add" value=
<% out.println(add) %>
></td>
<td><input type=text name="email" value=<% out.println(email); %>
></td>
<td><input type=text name="contact" value=
<% out.println(contact);%>
></td>
<td><input type=text name="ctype" value=
<% out.println(ctype);%>
></td>
<td><input type=text name="city" value=<% out.println(city);%>
></td>
<td><input type=text name="qty" value=
<% out.println(q);%>
></td>
<td><input type="text" name="pwd" value=
<% out.println(pass1);%>
></td></tr>
<%   
		/*
		   pstmt.setString(1,first);
		   pstmt.setString(2,last);
		   pstmt.setString(3,add);
		   pstmt.setString(4,email);
		   pstmt.setString(5,contact);
		   pstmt.setString(6,ctype);
		   pstmt.setString(7,city);
		   pstmt.setInt(8,q);
		   pstmt.setString(9,pass1);
		   pstmt.executeUpdate();*/
       }
}
catch(Exception e)
{}
finally
{
con.close();
}
%>
</table>
</form>
</body>
</html>

