<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*,java.util.*,project.Question"%>
	<%
   String sub=request.getParameter("t");
   String uname=(String)session.getAttribute("us");
   
  ArrayList q=(ArrayList)session.getAttribute("tq");
  ArrayList testque=new <Question>ArrayList();
  for(int i=0;i<q.size();i++)
	  if(((Question)q.get(i)).getSUBJECT().equals(sub))
	  //if(((Question)q.get(i)).getSUBJECT().equals(sub))
		  testque.add(q.get(i));
  Collections.shuffle(testque);
 
   session.setAttribute(uname+"_exqu",testque);
   session.setAttribute(uname+"_tq",testque.size());
   session.setAttribute(uname+"_sub",sub);  
   response.sendRedirect("test.jsp");
%>

</body>
</html>