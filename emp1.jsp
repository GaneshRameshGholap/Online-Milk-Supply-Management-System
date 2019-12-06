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
        int id;
        int nn;
	String ename,eadd,email,contact,city,pass1,pass2;
	id=Integer.parseInt(request.getParameter("empid"));
	ename=request.getParameter("empname");
	eadd=request.getParameter("empaddress");
	email=request.getParameter("empemail");
	contact=request.getParameter("empcontact");
	city=request.getParameter("city");
	pass1=request.getParameter("pwd");
	Class.forName("org.postgresql.Driver");

	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	pstmt=con.prepareStatement("Insert into Employee values(?,?,?,?,?,?,?)");

	pstmt.setInt(1,id);
	pstmt.setString(2,ename);
	pstmt.setString(3,eadd);
	pstmt.setString(4,email);
	pstmt.setString(5,contact);
	pstmt.setString(6,city);
	pstmt.setString(7,pass1);
	int n=pstmt.executeUpdate();
        if(n!=0)
        {
        session=request.getSession(true);
        session.setAttribute("record","1");
        response.sendRedirect("emp1.jsp");
        }
        else
        {
            session=request.getSession(true);
            session.setAttribute("record1","2");
            response.sendRedirect("emp1.jsp");
        }
}
catch(Exception e)
{}
%>
</body>
</html>

