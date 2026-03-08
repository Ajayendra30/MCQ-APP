<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.util.*,project.Question"%>
	<%
String uname=(String)session.getAttribute("us");
int qno=Integer.parseInt((String)session.getAttribute(uname+"_"+"qn"));

ArrayList q=(ArrayList)session.getAttribute(uname+"_exqu");
if(q.size()==(qno+1))
	response.sendRedirect("result.jsp");
else
{
String uans=request.getParameter("r");
if(uans==null)
	uans="";
out.println(qno);
if(uans.equals(((Question)q.get(qno)).getANS()))
	session.setAttribute(uname+"_"+"res",""+(Integer.parseInt((String)session.getAttribute(uname+"_"+"res"))+2));
 session.setAttribute(uname+"_"+"qn",""+(Integer.parseInt((String)session.getAttribute(uname+"_"+"qn"))+1));
 response.sendRedirect("test.jsp");
}		
%>
</body>
</html>