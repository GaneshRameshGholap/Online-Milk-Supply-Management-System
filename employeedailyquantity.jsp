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
	String dd; 
        float no1,no2,sum=0;
	String m,mn;
        String ss=(String)session.getAttribute("username");
        int id=Integer.parseInt(ss);
	dd=request.getParameter("dd");

        session.setAttribute("date",dd);
 

	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();

	if(con==null)
	{
		out.println("Not connected:");
	}
	else
	{
		res=stmt.executeQuery("select  sum(qty) from updated where changedate='"+dd+"' and eid="+id);
		if(res.next())
		{
			m=res.getString(1);
                      no1=Float.parseFloat(m);
			out.println("m="+no1);
                    	sum=sum+no1;
		}
		res=stmt.executeQuery("select sum(milk_qty) from customer where eid="+id+" and cid not in(select cid from updated where eid="+id+" and changedate='"+dd+"')");
		if(res.next())
		{
                        mn=res.getString(1);
                        no2=Float.parseFloat(mn);
                        sum=sum+no2;
			out.println("result="+no2);
                        session.setAttribute("quantity",sum);
                         response.sendRedirect("veiwquantity.jsp");
		}
	}
	
}
catch(Exception e){}
%>
</body>
</html>

