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
        int eid;
       
	String  ename,add,email,contact,city,pwd;

	eid=Integer.parseInt(request.getParameter("eid"));
	ename=request.getParameter("ename");
	add=request.getParameter("eaddress");
	email=request.getParameter("email");
        contact=request.getParameter("contact");
        city=request.getParameter("city");
        pwd=request.getParameter("pwd");
      eid=Integer.parseInt(request.getParameter("eid"));

         Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	pstmt=con.prepareStatement("update Employee set ename=?,eaddress=?,email=?,contact=?,city=?,password=? where eid=?");
        stmt=con.createStatement();

	pstmt.setString(1,ename);
	pstmt.setString(2,add);
	pstmt.setString(3,email);
        pstmt.setString(4,contact);
        pstmt.setString(5,city);
        pstmt.setString(6,pwd);
        pstmt.setString(7,eid);
       
	int n=pstmt.executeUpdate();
        if(n!=0)
        {
        session=request.getSession(true);
        session.setAttribute("upd","1");
        response.sendRedirect("editemployee.jsp");
        }
        else 
        {
         session=request.getSession(true);
         session.setAttribute("upd1","2");
         response.sendRedirect("editemployee.jsp"):
        }
}
catch(Exception e)
{}
%>
</body>
</html>

