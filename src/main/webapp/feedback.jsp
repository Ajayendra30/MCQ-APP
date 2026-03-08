<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere - Feedback</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

body {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	color: #fff;

	/* ✅ Same background as stlogin */
	background:
		linear-gradient(to bottom, rgba(255,255,255,0.85), rgba(255,255,255,0.88)),
		url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
		no-repeat center/cover;
	background-attachment: fixed;
}

/* ✅ Glass Container (like stlogin) */
.container {
	max-width: 800px;
	margin: 60px auto;
	padding: 35px;
	border-radius: 14px;
	background: rgba(255,255,255,0.15);
	backdrop-filter: blur(12px);
	border: 1px solid rgba(255,255,255,0.25);
	box-shadow: 0 8px 28px rgba(0,0,0,0.35);
	color: #fff;
	text-align: center;
}

/* Header Title */
h1 {
	font-size: 38px;
	font-weight: 700;
	background: linear-gradient(90deg, #00c6ff, #0072ff);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	margin: 0 0 10px 0;
}

/* Subheading */
h2 {
	font-size: 20px;
	color: #003366;
	margin-bottom: 25px;
}

/* Form Styling */
form {
	width: 80%;
	margin: auto;
	display: flex;
	flex-direction: column;
}

label {
	font-size: 17px;
	margin: 10px 0 6px;
	color: #003366;
	font-weight: 600;
}

input[type="text"], input[type="email"], textarea, select {
	padding: 12px;
	font-size: 16px;
	border-radius: 8px;
	border: 1px solid #ccc;
	margin-bottom: 16px;
	width: 100%;
	background: rgba(255,255,255,0.75);
	color: #003366;
}

/* Submit Button */
input[type="submit"] {
	background: linear-gradient(90deg, #ff416c, #ff4b2b);
	color: white;
	font-size: 18px;
	padding: 12px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	transition: 0.3s;
	font-weight: 600;
}

input[type="submit"]:hover {
	transform: scale(1.08);
	background: #ff4b2b;
}

/* Back Button */
.back-btn {
	display: inline-block;
	margin-top: 25px;
	padding: 12px 30px;
	background: #ff4d4d;
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-weight: 600;
	transition: 0.3s;
}

.back-btn:hover {
	transform: scale(1.08);
	background: #d63031;
}

/* ✅ Footer (same as stlogin) */
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
.footer-bottom a:hover{text-decoration:underline}

</style>
</head>
<body>

	<div class="container">
		<h1>Feedback Form</h1>

		<%
        String name = (String) session.getAttribute("us");
    %>

		<h2>Hello, <%= name %>. We value your feedback!</h2>

		<form action="feedbackaction.jsp" method="post">
			<label for="fname">Name</label>
			<input type="text" id="fname" name="name"
				value="<%= name != null ? name : "" %>" required>

			<label for="email">Email</label>
			<input type="email" id="email" name="email"
				placeholder="Enter your email" required>

			<label for="rating">Rating</label>
			<select id="rating" name="rating" required>
				<option value="">--Select--</option>
				<option value="Excellent">Excellent</option>
				<option value="Good">Good</option>
				<option value="Average">Average</option>
				<option value="Poor">Poor</option>
			</select>

			<label for="comments">Comments</label>
			<textarea id="comments" name="comments" rows="5"
				placeholder="Enter your feedback..." required></textarea>

			<input type="submit" value="Submit Feedback">
		</form>

		<a class="back-btn" href="swelcome.jsp">Back to Menu</a>
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
