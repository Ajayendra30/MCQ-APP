<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Verification</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        text-align: center;
        margin-top: 100px;
    }
    h2 {
        color: red;
        margin-top: 20px;
    }
    a {
        display: inline-block;
        margin-top: 15px;
        text-decoration: none;
        color: white;
        background-color: #007bff;
        padding: 10px 20px;
        border-radius: 5px;
    }
    a:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
    String uname = request.getParameter("u");
    String upass = request.getParameter("p");
    boolean wrongUser = false;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
        PreparedStatement ps = con.prepareStatement(
            "select urole from mcqreg where uname=? and upass=?");
        ps.setString(1, uname);
        ps.setString(2, upass);
        ResultSet rs = ps.executeQuery();
        session.setAttribute("us", uname);

        if (rs.next()) {
            if (rs.getString(1).equals("Student")) {
                response.sendRedirect("swelcome.jsp");
            } else {
                response.sendRedirect("fwelcome.jsp");
            }
        } else {
            wrongUser = true;
        }
        con.close();
    } catch (Exception e) {
        out.println(e);
    }

    if (wrongUser) {
%>
        <!-- Sad smiley image (keep your image in same folder or /images folder) -->
        <img src="sad.png" alt="Sad Smiley" width="500" height="500"><br>
        <h2>Wrong Username or Password!</h2>
        <a href="mcqhome.html">Go Back</a>
<%
    }
%>
</body>
</html>
