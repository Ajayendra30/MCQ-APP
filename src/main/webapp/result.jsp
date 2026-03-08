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
   String uname=(String)session.getAttribute("us");
   int qno=Integer.parseInt((String)session.getAttribute(uname+"_"+"qn"));
   int res = Integer.parseInt((String) session.getAttribute(uname + "_res"));
   String sub=(String)session.getAttribute(uname+"_sub");
   int tqno=(Integer)session.getAttribute(uname+"_tq");
   out.println("Practice Subject:"+sub);
   out.println("Total Attempted:"+qno);
   out.println("Total Result:"+res);
       try
       {
        int n=0;
         Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
     PreparedStatement ps=con.prepareStatement("select tno from mcqres order by tno desc");  
     ResultSet rs=ps.executeQuery();
     if(rs.next())
     n=rs.getInt(1)+1;
     else
      n=1;
     PreparedStatement p=con.prepareStatement("insert into mcqres values(?,?,?,?,sysdate,?)");  
     p.setInt(1,n);
     p.setString(2,sub);
     p.setInt(3,res);
     p.setInt(4,tqno);
     p.setString(5,uname);
     if(p.executeUpdate()>=1)
     {
    session.setAttribute(uname + "_res", "0");
           session.setAttribute(uname + "_qn", "0");
           response.sendRedirect("testsub.jsp");
     }
     con.close();
     
       }
       catch(Exception e)
       {
        out.println(e);
       }


   
%>

</body>
</html>


