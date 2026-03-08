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
     String qt=request.getParameter("q");
    String op1=request.getParameter("op1");
    String op2=request.getParameter("op2");
    String op3=request.getParameter("op3");
    String op4=request.getParameter("op4");
    String ans=request.getParameter("an");
    String lv=request.getParameter("l");
    String sub=request.getParameter("sb");
    try
    {
    	 int n=0;
    	  Class.forName("oracle.jdbc.driver.OracleDriver");
		  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		  PreparedStatement ps=con.prepareStatement("select sno from mcqque order by sno desc");  
		  ResultSet rs=ps.executeQuery();
		  if(rs.next())
			  n=rs.getInt(1)+1;
		  else
			   n=1;
		  PreparedStatement p=con.prepareStatement("insert into mcqque values(?,?,?,?,?,?,?,?,?)");  
		  p.setInt(1,n);
		  p.setString(2,qt);
		  p.setString(3,op1);
		  p.setString(4,op2);
		  p.setString(5,op3);
		  p.setString(6,op4);
		  p.setString(7,ans);
		  p.setString(8,lv);
		  p.setString(9,sub);
	      if(p.executeUpdate()>=1)
	    	  response.sendRedirect("addque.jsp");
		  con.close();
		  
    }
    catch(Exception e)
    {
    	out.println(e);
    }
%>
</body>
</html>