<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
      String uname=request.getParameter("u");
      String upass=request.getParameter("p");   
      String uemail=request.getParameter("e");
	  String urole=request.getParameter("r");
	  try
	  {
		    Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		     PreparedStatement ps=con.prepareStatement("insert into mcqreg values(?,?,?,?)");  
		     ps.setString(1,uname);
		     ps.setString(2,upass);
		     ps.setString(3,uemail);
		     ps.setString(4,urole);
		     if(ps.executeUpdate()>=1)
		    	 response.sendRedirect("mcqhome.html");
		     con.close();
	  }
catch(Exception e)
	  {
		  out.println(e);
	  }
%>
</body>
</html>