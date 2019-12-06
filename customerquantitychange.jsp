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
	String qty,dd;
	int c,eid;
        Double q;
        String cn;

	c=Integer.parseInt(request.getParameter("cid"));
        cn=request.getParameter("cname");
	dd=request.getParameter("dd");
	q=Double.parseDouble(request.getParameter("qty"));
        eid=Integer.parseInt(request.getParameter("eid"));

	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	if(con==null)
        {
		out.println("Not connected:");
        }
	else
	{
		pstmt=con.prepareStatement("Insert into updated values(?,?,?,?,?)");
		pstmt.setInt(1,c);
		pstmt.setString(2,dd);
		pstmt.setDouble(3,q);
                pstmt.setInt(4,eid);
                pstmt.setString(5,cn);
		pstmt.executeUpdate();
	}
}
catch(Exception e){}
%>
</body>
</html>

