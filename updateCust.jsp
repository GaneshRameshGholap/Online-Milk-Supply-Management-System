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
        int cid,eid;
        float qty,rate;
	String  fname,lname,add,email,contact,ctype,city,pwd;

	cid=Integer.parseInt(request.getParameter("cid"));
	fname=request.getParameter("fname");
	lname=request.getParameter("lname");
        add=request.getParameter("add");
	email=request.getParameter("email");
         contact=request.getParameter("contact");
          ctype=request.getParameter("ctype");
          city=request.getParameter("city");
           rate=Float.parseFloat(request.getParameter("rate"));
       qty=Float.parseFloat(request.getParameter("qty"));
      pwd=request.getParameter("pwd");
      eid=Integer.parseInt(request.getParameter("eid"));

         Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	pstmt=con.prepareStatement("update customer set first_name=?,last_name=?,address=?,email=?,contact=?,ctype=?,city=?,rate=?,milk_qty=?,password=?,eid=? where cid=?");
        stmt=con.createStatement();

	pstmt.setString(1,fname);
	pstmt.setString(2,lname);
	pstmt.setString(3,add);
        pstmt.setString(4,email);
        pstmt.setString(5,contact);
        pstmt.setString(6,ctype);
        pstmt.setString(7,city);
        pstmt.setFloat(8,rate);
        pstmt.setFloat(9,qty);
        pstmt.setString(10,pwd);
        pstmt.setInt(11,eid);
        pstmt.setInt(12,cid);
	int n=pstmt.executeUpdate();
        if(n!=0)
        {
        session=request.getSession(true);
        session.setAttribute("bill","1");
        response.sendRedirect("editcustomer.jsp");
        }
        else 
        {
         session=request.getSession(true);
        session.setAttribute("bill1","2");
        response.sendRedirect("editcustomer.jsp");
        }
}
catch(Exception e)
{}
%>
</body>
</html>

