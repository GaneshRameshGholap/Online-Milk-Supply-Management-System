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
       
	String  pdate,pstatus,pmode,billid;

	pdate=request.getParameter("paydate");
	pmode=request.getParameter("mode");
	pstatus=request.getParameter("status");
	billid=request.getParameter("bill");
	int bill=Integer.parseInt(billid);

         Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	pstmt=con.prepareStatement("update bill set paydate=?,pmode=?,status=? where bid=?");
        stmt=con.createStatement();

	pstmt.setString(1,pdate);
	pstmt.setString(2,pmode);
	pstmt.setString(3,pstatus);
	pstmt.setInt(4,bill);
	int n=pstmt.executeUpdate();
        if(n!=0)
        {
        session=request.getSession(true);
        session.setAttribute("bill","1");
        response.sendRedirect("updatebill.jsp");
        }
}
catch(Exception e)
{}
%>
</body>
</html>

