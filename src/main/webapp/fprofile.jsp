<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere - Student Profile</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

:root{
  --brand:#0a66c2;
}

*{box-sizing:border-box}
body{
    margin:0;
    font-family:'Poppins',sans-serif;
    color:#0b1020;
    min-height:100vh;
    background:
        linear-gradient(to bottom, rgba(255,255,255,0.88), rgba(255,255,255,0.88)),
        url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
        no-repeat center/cover;
    background-attachment:fixed;
}

/* NAVBAR (same as stlogin) */
nav{
    width:100%;
    padding:16px 60px;
    background:#fff;
    border-bottom:1px solid #dcdcdc;
    display:flex;justify-content:space-between;align-items:center;
    position:fixed;top:0;left:0;z-index:50;
}
nav h2{font-size:28px;font-weight:700;color:var(--brand);margin:0}
nav ul{list-style:none;display:flex;gap:26px;margin:0;padding:0}
nav ul li a{
    text-decoration:none;color:#444;font-weight:600;font-size:15px;transition:.25s;
}
nav ul li a:hover{color:var(--brand);text-decoration:underline}

/* LAYOUT */
.page{
    margin-top:96px; /* space for fixed navbar */
    padding:24px 20px 0;
}

/* Heading */
.header{
    text-align:center;
    margin-bottom:10px;
}
.header h1{
    display:inline-block;
    margin:0;
    color:var(--brand);
    background:#fff;
    padding:14px 28px;
    border-radius:12px;
    box-shadow:0 6px 15px rgba(0,0,0,.12);
}
.header h2{margin:14px 0 0 0;color:#2c3e50;font-weight:600}

/* MENU (left-style card but centered like your original) */

table.full{width:100%;border-collapse:collapse}
th.m{
    font-size:18px;height:56px;border:none;border-radius:10px;margin:8px 0;
    background:linear-gradient(135deg, #56ccf2, #2f80ed);
    transition:.25s; box-shadow:0 4px 10px rgba(0,0,0,.12);
}
th.m:hover{background:linear-gradient(135deg,#3498db,#1d6fa5);transform:translateY(-3px)}
th.m a{display:block;line-height:56px;text-decoration:none;color:#fff;font-weight:700}

/* PROFILE CARD (right, absolute like your original) */
#profileCard{
    position:absolute;top:180px;right:30px;
    width:360px;background:#ffffffee;border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,.15);
    padding:20px;text-align:left;
}
#profileCard h3{margin:0 0 8px 0;color:#2c3e50}
#profileCard hr{border:none;height:3px;background:#d8dee9;border-radius:3px;margin:8px 0 12px}
#profileCard table td{font-size:16px;padding:7px 4px;color:#2c3e50}
#profileCard table td b{color:var(--brand)}

/* RESULTS TABLE */
.result-box{
    width:72%;
    margin:420px auto 50px auto; /* pushes below profile card */
    background:#ffffffdd;padding:22px;border-radius:16px;
    box-shadow:0 6px 18px rgba(0,0,0,.18);
}
.result-box h3{margin:0 0 10px 0;color:#2c3e50;font-size:22px}
.result-table{width:100%;border-collapse:collapse;margin-top:10px}
.result-table th{
    background:#2f80ed;color:#fff;padding:10px;text-align:center;font-weight:700
}
.result-table td{
    padding:10px;text-align:center;color:#2c3e50;border-bottom:1px solid #e6ecf3
}
.result-table td.score{font-weight:800;color:#27ae60}
.result-table td.dim{color:#555}

/* FOOTER (same as stlogin) */
.footer{
    background:#0b0d12;color:#d8e0ea;padding:60px 10% 25px;border-top:1px solid #1b1f26;
}
.footer-container{display:flex;justify-content:space-between;flex-wrap:wrap;gap:40px}
.footer-col{flex:1;min-width:240px}
.footer-logo{font-size:28px;font-weight:700;color:var(--brand)}
.footer-col h3{font-size:18px;margin-bottom:12px;color:#fff}
.footer-col p{font-size:14px;line-height:1.6;color:#b8c3d0;max-width:280px}
.footer-col ul{list-style:none;margin:0;padding:0}
.footer-col ul li{margin:6px 0}
.footer-col ul li a{text-decoration:none;color:#cfd6e3;font-size:15px;transition:.25s}
.footer-col ul li a:hover{color:var(--brand);margin-left:4px}
.footer-social{display:flex;gap:14px;margin-top:8px}
.footer-social .icon{font-size:20px;color:#cfd6e3;transition:.25s}
.footer-social .icon:hover{color:var(--brand);transform:translateY(-3px)}
.footer-bottom{margin-top:40px;text-align:center;border-top:1px solid #1d232b;padding-top:15px;font-size:14px;color:#9ca7b8}
.footer-bottom a{color:var(--brand);text-decoration:none}
.footer-bottom a:hover{text-decoration:underline}

/* Responsive */
@media(max-width:1100px){
  #profileCard{position:static;margin:18px auto 0 auto;width:92%}
  .result-box{margin:18px auto 50px auto;width:92%}
}
@media(max-width:900px){
  nav{padding:14px 20px}
  nav h2{font-size:24px}
  .menu-container{margin:14px auto}
}
</style>
</head>
<body>

<%
    String uname = (String)session.getAttribute("us");
%>

<!-- NAVBAR (same as stlogin) -->
<nav>
  <h2>QuizSphere</h2>
  <ul>
    <li><a href="swelcome.jsp">Home</a></li>
    <li><a href="#about">About</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="stlogin.html">Student Login</a></li>
    <li><a href="newreg.html">Register</a></li>
  </ul>
</nav>

<div class="page">
  <div class="header">
    <h1>QuizSphere</h1>
    <h2>Welcome <%= (uname==null?"Student":uname) %></h2>
  </div>

  

  <%@ page import="java.sql.*" %>
  <%
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

        // PROFILE: mcqreq (uname, email, urole)
        PreparedStatement ps = con.prepareStatement(
            "SELECT uname, email, urole FROM mcqreq WHERE uname=?");
        ps.setString(1, uname);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            out.println("<div id='profileCard'>"
                + "<h3>Student Profile</h3><hr>"
                + "<table>"
                + "<tr><td><b>Name:</b> " + rs.getString("uname") + "</td></tr>"
                + "<tr><td><b>Email:</b> " + rs.getString("email") + "</td></tr>"
                + "<tr><td><b>Role:</b> " + rs.getString("urole") + "</td></tr>"
                + "</table>"
                + "</div>");
        }
        rs.close(); ps.close();

        // TEST HISTORY: mcqres (tsub, tscore, tqno, tdate, uname)
        PreparedStatement psR = con.prepareStatement(
            "SELECT tsub, tscore, tqno, tdate FROM mcqres WHERE uname=? ORDER BY tdate DESC");
        psR.setString(1, uname);
        ResultSet rsR = psR.executeQuery();

        out.println("<div class='result-box'>"
            + "<h3>Test History</h3>"
            + "<table class='result-table'>"
            + "<tr><th>Subject</th><th>Score</th><th>Date Taken</th></tr>");

        boolean hasRows = false;
        while (rsR.next()) {
            hasRows = true;
            String sub = rsR.getString("tsub");
            int sc = rsR.getInt("tscore");
            int tot = rsR.getInt("tqno");
            String when = "" + rsR.getString("tdate");

            out.println("<tr>"
                + "<td>" + sub + "</td>"
                + "<td class='score'>" + sc + " / " + tot + "</td>"
                + "<td class='dim'>" + (when == null ? "-" : when) + "</td>"
                + "</tr>");
        }
        if (!hasRows) {
            out.println("<tr><td colspan='3' class='dim'>No attempts yet.</td></tr>");
        }
        out.println("</table></div>");

        rsR.close(); psR.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>"+ e +"</p>");
    }
  %>
</div>

<!-- FOOTER (same as stlogin) -->
<footer class="footer" id="contact">
  <div class="footer-container">
    <div class="footer-col">
      <h2 class="footer-logo">QuizSphere</h2>
      <p>Your smart companion for quizzes, learning and performance tracking.</p>
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
