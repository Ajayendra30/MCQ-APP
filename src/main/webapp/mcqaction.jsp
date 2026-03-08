<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>confirmed question</title>
</head>
<body>
	<%@page import="java.sql.*"%>
	<%
String que=request.getParameter("q");
String ans=request.getParameter("n");
String opt=request.getParameter("a");
String opt1=request.getParameter("e");
String opt2=request.getParameter("i");
String opt3=request.getParameter("o");
String leb=request.getParameter("c");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
    PreparedStatement ps=con.prepareStatement("insert into MCQ values(?,?,?,?,?,?,?)");
    ps.setString(1,que);
    ps.setString(2,opt);
    ps.setString(3,opt1);
    ps.setString(4,opt2);
    ps.setString(5,opt3);
    ps.setString(6,leb);
    ps.setString(7,ans);
    int res= ps.executeUpdate();
    if(res>=1)
        out.println("1 record is inserted..");
     con.close();
 }
 catch(Exception e)
 {
	   out.println(e);
	   
 }
%>
</body>
</html>