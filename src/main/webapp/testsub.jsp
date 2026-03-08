<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere | Practice Tests</title>
<link rel="icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s"
	type="image/png">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

/* ✅ Same background as stlogin */
body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	background:
		linear-gradient(to bottom, rgba(255,255,255,0.88), rgba(255,255,255,0.88)),
		url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
		no-repeat center/cover;
	background-attachment:fixed;
	color: #0b1020;
}

/* HEADER */
header {
	text-align: center;
	margin-top: 40px;
}
header img {
	width: 90px;
	border-radius: 50%;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
}
header h1 {
	margin-top: 15px;
	font-size: 2.5em;
	color:#0a66c2;
	font-weight:700;
}
.intro {
	font-size: 1.1em;
	text-align: center;
	max-width: 700px;
	margin-top: 10px;
	color:#333;
	line-height: 1.6;
}

/* ✅ Card Grid */
.grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 25px;
	margin-top: 40px;
	padding: 0 20px;
	width: 90%;
	max-width: 1000px;
}
.card {
	background: rgba(255, 255, 255, 0.35);
	border-radius: 18px;
	padding: 25px;
	text-align: center;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.18);
	backdrop-filter: blur(10px);
	transition: all 0.3s ease;
}
.card:hover {
	transform: translateY(-8px) scale(1.03);
	box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
	background: rgba(255, 255, 255, 0.5);
}
.card img {
	width: 60px;
	height: 60px;
	margin-bottom: 15px;
}
.card a {
	text-decoration: none;
	font-weight: 600;
	font-size: 1.2em;
	color:#0b2540;
	display: block;
	margin-top: 8px;
}
.card span {
	color:#0a66c2;
	font-size:0.95em;
	font-weight:600;
}

/* ✅ Back button styled like swelcome */
.back-btn {
	margin: 50px 0 30px;
	background: #0a66c2;
	color: #fff;
	padding: 14px 28px;
	border-radius: 30px;
	font-size: 1rem;
	font-weight: bold;
	text-decoration: none;
	letter-spacing: 1px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	transition: 0.3s ease;
}
.back-btn:hover {
	background:#004182;
	transform: scale(1.05);
}

/* ✅ FOOTER SAME AS stlogin */
.footer{
	background:#0b0d12;
	color:#d8e0ea;
	padding:60px 10% 25px;
	border-top:1px solid #1b1f26;
	width:100%;
	margin-top:40px;
}
.footer-container{
	display:flex;justify-content:space-between;flex-wrap:wrap;gap:40px;
}
.footer-col{flex:1;min-width:240px}
.footer-logo{font-size:28px;font-weight:700;color:#0a66c2}
.footer-col h3{font-size:18px;margin-bottom:12px;color:#fff}
.footer-col p{font-size:14px;line-height:1.6;color:#b8c3d0;max-width:280px}
.footer-col ul{list-style:none;margin:0;padding:0}
.footer-col ul li{margin:6px 0}
.footer-col ul li a{text-decoration:none;color:#cfd6e3;font-size:15px;transition:.25s}
.footer-col ul li a:hover{color:#0a66c2;margin-left:4px}
.footer-social{display:flex;gap:14px;margin-top:8px}
.footer-social .icon{font-size:20px;color:#cfd6e3;transition:.25s}
.footer-social .icon:hover{color:#0a66c2;transform:translateY(-3px)}
.footer-bottom{
	margin-top:40px;text-align:center;border-top:1px solid #1d232b;
	padding-top:15px;font-size:14px;color:#9ca7b8;
}
.footer-bottom a{color:#0a66c2;text-decoration:none}
.footer-bottom a:hover{text-decoration:underline}

@media(max-width:900px){
	.footer-container{flex-direction:column;text-align:center}
	.footer-col p{margin:0 auto}
	.footer-social{justify-content:center}
}
</style>
</head>
<body>

<header>
	
	<h1>QuizSphere Practice Hub</h1>
	<p class="intro">Choose a subject to begin your practice test. Each quiz helps you enhance your understanding and track your progress!</p>
</header>

<%@page import="java.sql.*,java.util.*,project.Question"%>
<div class="grid">
<%
       ArrayList<Question> que = new ArrayList<Question>();
       try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            PreparedStatement ps = con.prepareStatement("select subject,count(subject) from mcqque group by subject order by count(subject) desc");  
            PreparedStatement ps1 = con.prepareStatement("select * from mcqque");  
            ResultSet rs1 = ps1.executeQuery();
            ResultSet rs = ps.executeQuery();
            String uname = (String)session.getAttribute("us");
            session.setAttribute(uname+"_res","0");
            session.setAttribute(uname+"_qn", "0");
            session.setAttribute(uname+"_tqn", "0");
            
            while(rs.next()) {
                out.println("<div class='card'>"
                    + "<img src=\"https://cdn-icons-png.flaticon.com/512/3135/3135810.png\" alt='quiz'>"
                    + "<a href='preloader.jsp?t="+rs.getString(1)+"&n="+rs.getString(2)+"'>"+rs.getString(1)+" Test</a>"
                    + "<span>("+rs.getString(2)+" Questions)</span>"
                    + "</div>");   
            }

            while(rs1.next()) {
                if(rs1.getString(2)!=null) {
                    que.add(new Question(
                        rs1.getString(2),
                        rs1.getString(3),
                        rs1.getString(4),
                        rs1.getString(5),
                        rs1.getString(6),
                        rs1.getString(7),
                        rs1.getString(9)
                    ));
                }
            }

            session.setAttribute("tq", que);
            con.close();
       }
       catch(Exception e) {
          out.println("<p style='color:red;'>Error: "+e+"</p>");
       } 
%>
</div>

<a class="back-btn" href="swelcome.jsp">Back</a>

<!-- ✅ FOOTER ADDED -->
<footer class="footer">
	<div class="footer-container">
		<div class="footer-col">
			<h2 class="footer-logo">QuizSphere</h2>
			<p>Your smart companion for quizzes, learning and performance tracking.</p>
		</div>
		<div class="footer-col">
			<h3>Quick Links</h3>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="swelcome.jsp">Dashboard</a></li>
				<li><a href="stlogin.html">Student Login</a></li>
				<li><a href="newreg.html">Create Account</a></li>
			</ul>
		</div>
		<div class="footer-col">
			<h3>Connect</h3>
			<div class="footer-social">
				<a href="#" class="icon linkedin"><i class="fab fa-linkedin"></i></a>
				<a href="#" class="icon github"><i class="fab fa-github"></i></a>
				<a href="mailto:quizsphere@gmail.com" class="icon email"><i class="fas fa-envelope"></i></a>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<p>© 2025 QuizSphere. All Rights Reserved.</p>
		<p><a href="#">Terms</a> • <a href="#">Privacy</a></p>
	</div>
</footer>

</body>
</html>
