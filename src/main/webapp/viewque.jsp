<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background:
		linear-gradient(to bottom, rgba(255,255,255,0.92), rgba(255,255,255,0.92)),
		url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
		no-repeat center/cover;
	background-attachment: fixed;
}
h1 {
	text-align: center;
	padding: 20px;
	margin: 0;
	background: #2c3e50;
	color: white;
	font-size: 30px;
}

h2 {
	text-align: center;
	color: #2c3e50;
	margin: 20px 0;
}

.container {
	width: 90%;
	margin: auto;
	background: #ffffff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
	font-size: 16px;
}

th {
	background: #2980b9;
	color: white;
	padding: 12px;
	text-transform: uppercase;
}

td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	color: #2c3e50;
}

tr:nth-child(even) {
	background: #f9f9f9;
}

tr:hover {
	background: #ecf0f1;
	transition: 0.3s ease;
}

.b1, .b2, .btn-back {
	padding: 8px 15px;
	font-size: 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.b1 {
	background: #f1c40f;
	color: #2c3e50;
}

.b1:hover {
	background: #d4ac0d;
}

.b2 {
	background: #e74c3c;
	color: white;
}

.b2:hover {
	background: #c0392b;
}

.btn-back {
	background: #3498db;
	color: white;
	margin-top: 15px;
	text-decoration: none;
}

.btn-back:hover {
	background: #2980b9;
}

form {
	display: inline-block;
	margin: 2px;
}

.back-container {
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<h1>QuizSphere</h1>
	<div class="container">
		<h2>View Questions</h2>

		<table>
			<tr>
				<th>SNo</th>
				<th>Question</th>
				<th>Option1</th>
				<th>Option2</th>
				<th>Option3</th>
				<th>Option4</th>
				<th>Answer</th>
				<th>Level</th>
				<th>Action</th>
			</tr>

			<%
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
                PreparedStatement ps = con.prepareStatement("select * from mcqque");  
                ResultSet rs = ps.executeQuery();

                int sno = 1; // counter start from 1
                while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + sno + "</td>"); // serial no
                    out.println("<td>" + rs.getString(2) + "</td>");
                    out.println("<td>" + rs.getString(3) + "</td>");
                    out.println("<td>" + rs.getString(4) + "</td>");
                    out.println("<td>" + rs.getString(5) + "</td>");
                    out.println("<td>" + rs.getString(6) + "</td>");
                    out.println("<td>" + rs.getString(7) + "</td>");
                    out.println("<td>" + rs.getString(8) + "</td>");
                    out.println("<td>");
                    out.println("<form action='EditQuestion.jsp' method='post'>");
                    out.println("<input type='hidden' name='id' value='" + rs.getString(1) + "'>");
                    out.println("<input type='submit' value='Edit' class='b1'>");
                    out.println("</form>");
                    out.println("<form action='DeleteQuestion.jsp' method='post'>");
                    out.println("<input type='hidden' name='id' value='" + rs.getString(1) + "'>");
                    out.println("<input type='submit' value='Delete' class='b2'>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                    sno++; // increment counter
                }
                con.close();
            } catch(Exception e) {
                out.println(e);
            }
            %>
		</table>

		<!-- Back Button -->
		<div class="back-container">
			<a href="fwelcome.jsp" class="btn-back">Back</a>
		</div>
	</div>
</body>
</html>