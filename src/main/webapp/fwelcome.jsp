<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>QuizSphere</title>
<link rel="icon"
  href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s"
  type="image/png">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

:root{
  --brand:#0a66c2;
  --glass:rgba(255,255,255,0.14);
  --glass-border:rgba(255,255,255,0.28);
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

/* NAVBAR */
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

/* MAIN LAYOUT */
main{
  display:flex;
  margin-top:96px;
  min-height:calc(100vh - 96px - 260px);
}

/* SIDEBAR (GLASS) */
.menu-section{
  width:35%;
  background:rgba(255,255,255,0.35);
  backdrop-filter:blur(10px);
  border-right:1px solid rgba(0,0,0,0.08);
  display:flex;flex-direction:column;align-items:center;justify-content:space-between;
  padding:28px 18px;
}

.menu-header{text-align:center}
.menu-header h1{font-size:30px;margin:0;color:var(--brand)}
.menu-header h2{font-size:16px;color:#355c7d;margin:6px 0 0 0}

.menu-table{width:100%;display:flex;flex-direction:column;align-items:center;gap:12px;margin:14px 0}
.menu-option{
  width:92%;
  background:var(--glass);
  border:1px solid var(--glass-border);
  border-radius:12px;
  transition:transform .25s, box-shadow .25s, border-color .25s, background .25s;
  text-align:center;
}
.menu-option:hover{
  transform:translateY(-3px);
  border-color:rgba(10,102,194,.45);
  box-shadow:0 10px 22px rgba(10,102,194,.12);
  background:rgba(255,255,255,0.22);
}
.menu-option a{
  color:#0b2540;text-decoration:none;font-weight:600;display:flex;flex-direction:column;align-items:center;
  padding:12px 10px;font-size:15px;gap:6px;
}
.menu-option i{
  font-size:22px;line-height:1;display:block;
}

.menu-option.logout:hover{
  background:rgba(255,71,71,0.12);
  border-color:rgba(255,71,71,0.45);
  box-shadow:0 10px 22px rgba(255,71,71,.18);
}

/* RIGHT CONTENT WITH TECH BG */
.content-section{
  width:65%;
  position:relative;
  display:flex;justify-content:center;align-items:center;
  background-color:#141a26; /* fallback so text stays readable while image loads */
  background-image:url("https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=1600&auto=format&fit=crop");
  background-position:center;
  background-size:cover;
  background-repeat:no-repeat;
}

/* Overlay */
.content-section::before{
  content:"";
  position:absolute;inset:0;
  background:rgba(0,0,0,0.45);
}

/* CENTERED TYPEWRITER TEXT */
.type-center{
  position:relative;
  z-index:2;
  text-align:center;
}
#typer{
  font-size:48px;
  font-weight:700;
  color:white;
  text-shadow:0 0 15px rgba(0,0,0,.65);
  white-space:nowrap;
}
.cursor{
  display:inline-block;width:3px;height:1em;margin-left:4px;
  background:#ffffff;animation:blink 0.9s steps(1) infinite;
}
@keyframes blink{50%{opacity:0}}

/* FOOTER */
.footer{
  background:#0b0d12;
  color:#d8e0ea;
  padding:60px 10% 25px;
  border-top:1px solid #1b1f26;
}
.footer-container{
  display:flex;justify-content:space-between;flex-wrap:wrap;gap:40px;
}
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
.footer-bottom{
  margin-top:40px;text-align:center;border-top:1px solid #1d232b;
  padding-top:15px;font-size:14px;color:#9ca7b8;
}
.footer-bottom a{color:var(--brand);text-decoration:none}
.footer-bottom a:hover{text-decoration:underline}

/* RESPONSIVE */
@media(max-width:900px){
  main{flex-direction:column;min-height:auto}
  .menu-section,.content-section{width:100%}
  #typer{font-size:32px}
  .footer-container{flex-direction:column;text-align:center}
  .footer-col p{margin:0 auto}
  .footer-social{justify-content:center}
}
</style>
</head>
<body>

<%
    String name = (String) session.getAttribute("us");
    if (name == null) { name = "Guest"; }
%>

<!-- NAVBAR -->
<nav>
  <h2>QuizSphere</h2>
  <ul>
    <li><a href="index.html">Home</a></li>
    <li><a href="#about">About Us</a></li>
    <li><a href="#contact">Contact Us</a></li>
    <li><a href="stlogin.html">Student Login</a></li>
    <li><a href="newreg.html">Register</a></li>
  </ul>
</nav>

<main>
  <!-- SIDEBAR -->
  <div class="menu-section">
    <div class="menu-header">
      <h1>Faculty DashBoard</h1>
      <h2>Welcome, <%= name %></h2>
    </div>

    <div class="menu-table">
      <div class="menu-option">
        <a href="fprofile.jsp">
          <i class="fas fa-user-circle" aria-hidden="true"></i>
          Profile
        </a>
      </div>

      <div class="menu-option">
        <a href="addque.jsp">
          <i class="fas fa-plus-square" aria-hidden="true"></i>
          Add Questions
        </a>
      </div>

      <div class="menu-option">
        <a href="viewque.jsp">
          <i class="fas fa-question-circle" aria-hidden="true"></i>
          View Questions
        </a>
      </div>

      <div class="menu-option">
        <a href="viewres.jsp">
          <i class="fas fa-chart-line" aria-hidden="true"></i>
          View Result
        </a>
      </div>

      <div class="menu-option logout">
        <a href="logout.jsp">
          <i class="fas fa-sign-out-alt" aria-hidden="true"></i>
          Logout
        </a>
      </div>
    </div>
  </div>

  <!-- RIGHT CONTENT -->
  <div class="content-section">
    <div class="type-center">
      <span id="typer"></span><span class="cursor"></span>
    </div>
  </div>
</main>

<!-- FOOTER -->
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
        <li><a href="#about">About Us</a></li>
        <li><a href="#contact">Contact Us</a></li>
        <li><a href="stlogin.html">Student Login</a></li>
        <li><a href="newreg.html">Create Account</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h3>Connect</h3>
      <div class="footer-social">
        <a href="#" class="icon linkedin" aria-label="LinkedIn"><i class="fab fa-linkedin"></i></a>
        <a href="#" class="icon github" aria-label="GitHub"><i class="fab fa-github"></i></a>
        <a href="mailto:quizsphere@gmail.com" class="icon email" aria-label="Email"><i class="fas fa-envelope"></i></a>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <p>© 2025 QuizSphere. All Rights Reserved.</p>
    <p><a href="#">Terms</a> • <a href="#">Privacy</a></p>
  </div>
</footer>

<!-- TYPEWRITER JS -->
<script>
(function(){
  const lines = ["Learn Faster","Practice Smarter","Compete With Confidence","Grow Every Day"];
  const el = document.getElementById("typer");
  let line = 0, i = 0, deleting = false;

  function tick(){
    const full = lines[line];
    if(!deleting){
      el.textContent = full.substring(0, i + 1);
      i++;
      if(i === full.length){
        deleting = true;
        return setTimeout(tick, 1200);
      }
      return setTimeout(tick, 70);
    }else{
      el.textContent = full.substring(0, i - 1);
      i--;
      if(i === 0){
        deleting = false;
        line = (line + 1) % lines.length;
        return setTimeout(tick, 300);
      }
      return setTimeout(tick, 45);
    }
  }
  tick();
})();
</script>

</body>
</html>
