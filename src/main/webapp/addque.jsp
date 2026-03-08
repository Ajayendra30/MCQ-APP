<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere - Add Question</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	
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
	width: 50%;
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
	text-align: left;
}

th, td {
	border: 2px solid #2a3d66;
	padding: 12px;
}

th {
	background: #2c3e50;
	color: white;
	text-align: center;
	font-size: 18px;
}

td {
	color: #2c3e50;
	font-weight: 500;
}

tr:hover td {
	background: #f0f8ff;
}

input[type="text"], select {
	width: 95%;
	padding: 8px;
	border: 1px solid #2980b9;
	border-radius: 6px;
	outline: none;
	font-size: 15px;
}

input[type="text"]:focus, select:focus {
	border-color: #16a085;
	box-shadow: 0 0 6px #16a085;
}

.btn {
	padding: 10px 20px;
	font-size: 15px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: 0.3s ease;
	margin: 5px;
}

.btn-reset {
	background: #e74c3c;
	color: white;
}

.btn-reset:hover {
	background: #c0392b;
}

.btn-submit {
	background: #27ae60;
	color: white;
}

.btn-submit:hover {
	background: #1e8449;
}

.btn-back {
	background: #3498db;
	color: white;
	text-decoration: none;
}

.btn-back:hover {
	background: #2980b9;
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
	margin-left:6px;
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
.footer-bottom a:hover{text-decoration:underline}

</style>
</head>
<body>
	<h1>QuizSphere</h1>
	<div class="container">
		<h2>Add Questions</h2>
		<form action="addqueaction.jsp" method="post">
			<table>
				<tr>
					<th colspan="2">Enter Question Details</th>
				</tr>
				<tr>
					<td>Question</td>
					<td><input type="text" name="q" required></td>
				</tr>
				<tr>
					<td>Option 1</td>
					<td><input type="text" name="op1" required></td>
				</tr>
				<tr>
					<td>Option 2</td>
					<td><input type="text" name="op2" required></td>
				</tr>
				<tr>
					<td>Option 3</td>
					<td><input type="text" name="op3" required></td>
				</tr>
				<tr>
					<td>Option 4</td>
					<td><input type="text" name="op4" required></td>
				</tr>
				<tr>
					<td>Answer</td>
					<td><input type="text" name="an" required></td>
				</tr>
				<tr>
					<td>Level</td>
					<td><select name="l" required>
							<option value="Easy">Easy</option>
							<option value="Medium">Medium</option>
							<option value="Hard">Hard</option>
					</select></td>
				</tr>
				<tr>
					<td>Subject</td>
					<td><select name="sb" required>
							<option value="Java">Java</option>
							<option value="C">C</option>
							<option value="Python">Python</option>
							<option value="Aptitude">Aptitude</option>
							<option value="Reasoning">Reasoning</option>
							<option value="General Knowledge">GK</option>
							<option value="Operating System">OS</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="reset" value="Reset" class="btn btn-reset"> <input
						type="submit" value="Add Question" class="btn btn-submit">
						<a href="fwelcome.jsp" class="btn btn-back">Back</a></td>
				</tr>
			</table>
		</form>
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
