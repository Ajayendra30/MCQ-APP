<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere-Faculty Dashboard</title>

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
	background: #003366;
	color: white;
	padding: 20px;
	margin: 0;
	font-size: 32px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

h2 {
	text-align: center;
	color: #003366;
	margin: 20px 0;
}

.container {
	width: 90%;
	max-width: 1100px;
	margin: 30px auto;
	background: #fff;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	font-size: 16px;
	border-radius: 10px;
	overflow: hidden;
}

th, td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

th {
	background: #003366;
	color: white;
}

tr:nth-child(even) {
	background: #f9f9f9;
}

tr:hover {
	background: #f1f7ff;
	transition: 0.3s ease-in-out;
}

.progress-bar {
	width: 100%;
	background: #eee;
	border-radius: 10px;
	overflow: hidden;
	height: 18px;
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.2);
}

.progress {
	height: 100%;
	text-align: center;
	color: white;
	font-size: 12px;
	font-weight: bold;
	line-height: 18px;
}

.low {
	background: #e74c3c;
}

.medium {
	background: #f39c12;
}

.high {
	background: #27ae60;
}

.back-btn {
	display: inline-block;
	margin-top: 20px;
	padding: 12px 25px;
	background: #28a745;
	color: white;
	font-size: 16px;
	border: none;
	border-radius: 25px;
	cursor: pointer;
	text-decoration: none;
	transition: 0.3s;
}

.back-btn:hover {
	background: #218838;
	transform: scale(1.05);
}

.welcome-message {
	text-align: center;
	font-size: 20px;
	margin-bottom: 20px;
	color: #444;
}
</style>
</head>
<body>

	<%
    String uname = (String) session.getAttribute("us");
%>

	<h1>Faculty Dashboard</h1>

	<div class="container">
		<div class="welcome-message">
			<h2>
				Welcome Faculty,
				<%= uname %></h2>
		</div>

		<table>
			<tr>
				<th>Serial No</th>
				<th>Test Subject</th>
				<th>Total Score</th>
				<th>Questions Attempted</th>
				<th>Percentage</th>
				<th>Participant Name</th>
				<th>Test Date</th>
			</tr>

			<%@ page import="java.sql.*"%>
			<%
        float per = 0.0f;
        int sno = 0;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            PreparedStatement ps = con.prepareStatement("select * from mcqres order by tscore desc");
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                per = (float) rs.getInt(3) / (rs.getInt(4) * 2);
                float percentValue = per * 100;
                
                String progressClass = "low";
                if (percentValue >= 75) progressClass = "high";
                else if (percentValue >= 50) progressClass = "medium";

                out.println("<tr>");
                out.println("<td>" + (++sno) + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getInt(3) + "</td>");
                out.println("<td>" + rs.getInt(4) + "</td>");
                out.println("<td><div class='progress-bar'><div class='progress " + progressClass + "' style='width:" + percentValue + "%'>" + (int)percentValue + "%</div></div></td>");
                out.println("<td>" + rs.getString(6) + "</td>");
                out.println("<td>" + rs.getDate(5) + "</td>");
                out.println("</tr>");
            }
            con.close();
        } catch (Exception e) {
            out.println(e);
        }
        %>

		</table>

		<center>
			<form action="fwelcome.jsp">
				<input type="submit" class="back-btn" value="Back">
			</form>
		</center>
	</div>

</body>
</html>
