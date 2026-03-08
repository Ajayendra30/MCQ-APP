 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere Student</title>
<link rel="icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s"
	type="image/png">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

body {
	font-family: "Poppins", sans-serif;
	background:
		linear-gradient(to bottom, rgba(255,255,255,0.90), rgba(255,255,255,0.90)),
		url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
		no-repeat center/cover;
	background-attachment: fixed;
	margin: 0;
	padding: 0;
}

/* ✅ Restored original header */
.header {
	display: flex;
	align-items: center;
	justify-content: center;
	background: #003366;
	color: white;
	padding: 20px;
	margin: 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}
.header h1 {
	font-size: 32px;
	margin: 0 15px 0 0;
}
.header img {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
	transition: transform 0.4s ease;
}
.header img:hover { transform: scale(1.2); }

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

tr:nth-child(even) { background: #f9f9f9; }
tr:hover { background: #f1f7ff; transition: 0.3s ease-in-out; }

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

.low { background: #e74c3c; }
.medium { background: #f39c12; }
.high { background: #27ae60; }

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
.back-btn:hover { background: #218838; transform: scale(1.05); }

.welcome-message {
	text-align: center;
	font-size: 20px;
	margin-bottom: 20px;
	color: #444;
}

/* SOCIAL ICONS IN FOOTER */
/* DARK PREMIUM FOOTER */
.footer{
	background:#0b0d12;
	color:#d8e0ea;
	padding:60px 10% 25px;
	border-top:1px solid #1b1f26;
	margin-top:50px;
}
.footer-container{
	display:flex;
	justify-content:space-between;
	flex-wrap:wrap;
	gap:40px;
}

/* Columns */
.footer-col{
	flex:1;
	min-width:240px;
}
.footer-logo{
	font-size:28px;
	font-weight:700;
	color:#0a66c2;
}
.footer-col h3{
	font-size:18px;
	margin-bottom:12px;
	color:#fff;
}
.footer-col p{
	font-size:14px;
	line-height:1.6;
	color:#b8c3d0;
	max-width:260px;
}
.footer-col ul{
	list-style:none;
}
.footer-col ul li{
	margin:6px 0;
}
.footer-col ul li a{
	text-decoration:none;
	color:#cfd6e3;
	font-size:15px;
	transition:.25s;
}
.footer-col ul li a:hover{
	color:#0a66c2;
	margin-left:4px;
}

/* Social Icons */
.footer-social{
	display:flex;
	gap:14px;
	margin-top:8px;
}
.footer-social .icon{
	font-size:20px;
	color:#cfd6e3;
	transition:.25s;
}
.footer-social .icon:hover{
	color:#0a66c2;
	transform:translateY(-3px);
}

/* Bottom Bar */
.footer-bottom{
	margin-top:40px;
	text-align:center;
	border-top:1px solid #1d232b;
	padding-top:15px;
	font-size:14px;
	color:#9ca7b8;
}
.footer-bottom a{
	color:#0a66c2;
	text-decoration:none;
}
.footer-bottom a:hover{text-decoration:none}

</style>
</head>
<body>

	<%
    String uname = (String) session.getAttribute("us");
%>

	<!-- ✅ HEADER restored -->
	<div class="header">
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s"
			alt="QuizSphere Logo">
		<h1>Student Dashboard</h1>
	</div>

	<div class="container">
		<div class="welcome-message">
			<h2>Welcome , <%= uname %></h2>
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
            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM mcqres WHERE uname=? ORDER BY tscore DESC");
            ps.setString(1, request.getParameter("n"));

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
			<form action="swelcome.jsp">
				<input type="submit" class="back-btn" value=" Back">
			</form>
		</center>
	</div>

	<footer class="footer">
	<div class="footer-container">

		<!-- Footer Left : Brand -->
		<div class="footer-col">
			<h2 class="footer-logo">QuizSphere</h2>
			<p>Your smart companion for quizzes, learning, and performance tracking.</p>
		</div>

		<!-- Footer Center : Quick Links -->
		<div class="footer-col">
			<h3>Quick Links</h3>
			<ul>
				<li><a href="mcqhome.html?#home">Home</a></li>
				<li><a href="#about">About Us</a></li>
				<li><a href="#contact">Contact Us</a></li>
				<li><a href="stlogin.html">Student Login</a></li>
				<li><a href="newreg.html">Create Account</a></li>
			</ul>
		</div>

		<!-- Footer Right : Social Icons -->
		<div class="footer-col">
			<h3>Connect</h3>
			<div class="footer-social">
				<a href="#" class="icon linkedin"><i class="fab fa-linkedin"></i></a>
				<a href="#" class="icon github"><i class="fab fa-github"></i></a>
				<a href="mailto:quizsphere@gmail.com" class="icon email"><i class="fas fa-envelope"></i></a>
			</div>
		</div>

	</div>

	<!-- Bottom Bar -->
	<div class="footer-bottom">
		<p>© 2025 QuizSphere. All Rights Reserved.</p>
		<p><a href="#">Terms</a> <a href="#">Privacy</a></p>
	</div>
</footer>

</body>
</html>
