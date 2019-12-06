<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html> 	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<% 
       try
       {
	Connection con=null;
	Statement stmt=null;
     

	String username=request.getParameter("loginid");
	String password=request.getParameter("pwd");
        int id=Integer.parseInt(username);
        //out.println(id);
        
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:milk1","postgres","postgres");
	stmt=con.createStatement();
       
	ResultSet res=stmt.executeQuery("select password from Employee where eid="+id);
      //   out.println("hello");
	if(res.next())
	{
                String str=res.getString("password");
		if(password.equals(str))
		{
			session.setAttribute("username",username);
                        session.setAttribute("user",id);
			response.sendRedirect("employeepage.html");
		}
                else
	        {
                  session.setAttribute("wrong_uname_pass","1");
                  response.sendRedirect("employeelogin1.jsp");
            	}
        }
	else
	{
         session.setAttribute("wrong_uname_pass1","2");
          response.sendRedirect("employeelogin1.jsp");
	}
       
}catch(Exception e){}
%>
</body>
</html>
