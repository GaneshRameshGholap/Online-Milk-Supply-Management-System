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
         int n,m;
       
       String ss=(String)session.getAttribute("username");
       int id=Integer.parseInt(ss);
       dd=request.getParameter("dd");
  
   
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();
        pstmt=con.prepareStatement("Insert into combine values(?,?,?,?)");
	if(con==null)
	{
		out.println("Not connected:");
	}
	else
	{
		res=stmt.executeQuery("select eid,cid,qty,changedate from updated where changedate='"+dd+"' and eid="+id);
                 out.println("Hello");
		while(res.next())
		{  
                        out.println(""+res.getInt("eid")+" "+res.getInt("cid")+" "+res.getFloat("qty")+" "+res.getString("changedate"));       
			pstmt.setInt(1,res.getInt("eid"));
			pstmt.setInt(2,res.getInt("cid"));
			pstmt.setFloat(3,res.getFloat("qty"));
			pstmt.setString(4,res.getString("changedate"));
			 n=pstmt.executeUpdate();         	
		}
                  
		res=stmt.executeQuery("select eid,cid,milk_qty from customer where eid="+id+" and cid not in(select cid from updated where eid="+id+" and changedate='"+dd+"')");
                out.println("hello");
		while(res.next())
		{
                        out.println(" "+res.getInt("eid")+" "+res.getInt("cid")+" "+res.getFloat("milk_qty"));
                        pstmt.setInt(1,res.getInt("eid"));
			pstmt.setInt(2,res.getInt("cid"));
			pstmt.setFloat(3,res.getFloat("milk_qty"));
			pstmt.setString(4,dd);
			 m=pstmt.executeUpdate();     
		}
                
             session=request.getSession(true);
             session.setAttribute("add","1");
             response.sendRedirect("attendance.jsp");
	}
}
catch(Exception e){}
%>
</body>
</html>

