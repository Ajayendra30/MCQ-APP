<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere | Quiz Result</title>
<link rel="icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s"
	type="image/png">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(120deg, #1e3c72, #2a5298);
	color: #fff;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

header {
	margin-top: 40px;
}

header img {
	width: 80px;
	border-radius: 50%;
	box-shadow: 0 0 15px rgba(255, 255, 255, 0.5);
}

header h1 {
	font-size: 2.2em;
	margin-top: 15px;
	background: linear-gradient(45deg, #f8ffae, #43c6ac);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-shadow: 0 0 15px rgba(255, 255, 255, 0.4);
}

.result-box {
	background: rgba(255, 255, 255, 0.1);
	padding: 30px 40px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
	backdrop-filter: blur(10px);
	max-width: 500px;
	margin-top: 50px;
}

.result-box h2 {
	font-size: 1.8em;
	margin-bottom: 10px;
}

.result-box h3 {
	color: #ffeb3b;
	font-size: 1.3em;
}

button {
	margin-top: 20px;
	padding: 12px 25px;
	border: none;
	border-radius: 30px;
	font-size: 1em;
	font-weight: bold;
	color: #fff;
	cursor: pointer;
	transition: 0.3s;
}

button.certificate {
	background: #4CAF50;
}

button.certificate:hover {
	background: #66bb6a;
	transform: scale(1.05);
}

button.retry {
	background: #ff9800;
}

button.retry:hover {
	background: #ffa726;
	transform: scale(1.05);
}

footer {
	margin-top: auto;
	margin-bottom: 15px;
	color: #ccc;
	font-size: 0.9rem;
	text-align: center;
}
</style>
</head>
<body>

<header>
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s" alt="Logo">
	<h1>QuizSphere Result</h1>
</header>

<%
    int total = Integer.parseInt(request.getParameter("total"));
    int correct = Integer.parseInt(request.getParameter("correct"));
    double percentage = (correct * 100.0) / total;
    session.setAttribute("scorePercentage", percentage);
%>

<div class="result-box">
	<h2>Your Score: <%= correct %> / <%= total %></h2>
	<h3>Percentage: <%= String.format("%.2f", percentage) %>%</h3>

	<%
	if (percentage >= 70) {
	%>
		<p style="color: #4CAF50; font-weight: bold; margin-top: 15px;">🎉 Congratulations! You are eligible for the Certificate.</p>
		<form action="certificate.jsp">
			<button class="certificate">View Certificate</button>
		</form>
	<%
	} else {
	%>
		<p style="color: #ff5555; font-weight: bold; margin-top: 15px;">❌ Sorry, you need at least 70% to get the certificate.</p>
		<form action="testsub.jsp">
			<button class="retry">Try Again</button>
		</form>
	<%
	}
	%>
</div>

<footer>&copy; 2025 QuizSphere | Crafted by QuizSphere</footer>

</body>
</html>
