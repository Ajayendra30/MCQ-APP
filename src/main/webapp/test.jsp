<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,project.Question" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>QuizSphere - Test</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Favicon -->
<link rel="icon"
	href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5E6t_-UAilINNhPZ0TZ5oBxODN8HK0GM1jg&s"
	type="image/png">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background:
		linear-gradient(to bottom, rgba(255,255,255,0.92), rgba(255,255,255,0.92)),
		url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
		no-repeat center/cover;
        min-height: 100vh;
        color: #fff;
        text-align: center;
    }

    /* ✅ Updated Blue Title */
    h1 {
        margin-top: 20px;
        font-size: 2.5rem;
        letter-spacing: 1px;
        color: #0072ff; /* BLUE */
        text-shadow: 0 0 15px rgba(0, 114, 255, 0.3);
    }

    /* ✅ Blue Timer */
    #t {
        position: fixed;
        top: 20px;
        right: 30px;
        font-size: 18px;
        font-weight: bold;
        color: #0072ff;
        padding: 10px 20px;
        border: 2px solid #0072ff;
        border-radius: 12px;
        background: rgba(255,255,255,0.65);
        backdrop-filter: blur(10px);
        box-shadow: 0 0 12px rgba(0,114,255,0.5);
    }

    /* ✅ Score & Question Badges */
    .info-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        margin: 10px 0 20px 0;
    }
    .badge {
        background: rgba(0, 114, 255, 0.10);
        border: 2px solid #0072ff;
        color: #0072ff;
        padding: 10px 20px;
        border-radius: 20px;
        font-size: 17px;
        font-weight: 600;
        box-shadow: 0 0 15px rgba(0, 114, 255, 0.25);
        transition: 0.3s;
    }
    .badge:hover {
        transform: scale(1.05);
        box-shadow: 0 0 25px rgba(0, 114, 255, 0.6);
    }

    /* Quiz Container */
    .quiz-container {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(15px);
        border-radius: 25px;
        padding: 30px 40px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
        width: 65%;
        max-width: 600px;
        margin: auto;
    }

    /* ✅ Question Text = Blue */
    h3 {
        text-align: left;
        margin-bottom: 25px;
        font-size: 22px;
        color: #0072ff; /* BLUE */
        font-weight: 700;
    }

    /* Options */
    input[type=radio] { display:none; }
    .option-label {
        display: block;
        background: rgba(255, 255, 255, 0.12);
        border: 2px solid rgba(255, 255, 255, 0.2);
        border-radius: 15px;
        padding: 12px 20px;
        font-size: 17px;
        margin: 8px 0;
        color: #000;
        background: #fff;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }
    .option-label:hover {
        border-color: #0072ff;
        box-shadow: 0 0 12px #0072ff;
        transform: scale(1.03);
    }
    input[type=radio]:checked + .option-label {
        background: linear-gradient(90deg, #00e5ff, #0072ff);
        color: #fff;
        font-weight: 700;
        box-shadow: 0 0 20px rgba(0, 229, 255, 0.8);
        transform: scale(1.04);
    }

    .btns {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    input[type=submit], .back-btn {
        background: linear-gradient(45deg, #ff416c, #ff4b2b);
        border: none;
        color: white;
        padding: 10px 25px;
        border-radius: 25px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        text-decoration: none;
    }
    input[type=submit]:hover, .back-btn:hover {
        background: linear-gradient(45deg, #ff9966, #ff5e62);
        transform: scale(1.05);
    }
</style>

<script>
    var val = 30;
    function tim() {
        document.getElementById("t").innerHTML = ' ' + val + "s left";
        val--;
        if (val <= 10) document.getElementById("t").style.color = "#ff5252";
        if (val == 0) {
            document.getElementById("fm").action = "checkres.jsp";
            document.getElementById("fm").submit();
        }
        setTimeout("tim()", 1000);
    }
</script>

</head>
<body onload="tim();">

<%
    String uname = (String) session.getAttribute("us");
    ArrayList q = (ArrayList) session.getAttribute(uname + "_exqu");
    int res = Integer.parseInt((String) session.getAttribute(uname + "_res"));
    int qno = Integer.parseInt((String) session.getAttribute(uname + "_qn"));
%>

<div id="t"></div>

<h1>QuizSphere Challenge</h1>

<div class="info-bar">
    <div class="badge"> Score: <%= res %></div>
    <div class="badge"> Question: <%= qno %></div>
</div>

<div class="quiz-container">
    <form action="checkres.jsp" id="fm">
        <h3>Q<%= qno %>. <%= ((Question) q.get(qno)).getQT() %></h3>

        <input type="radio" id="op1" name="r" value="<%= ((Question)q.get(qno)).getOP1() %>">
        <label for="op1" class="option-label">A. <%= ((Question)q.get(qno)).getOP1() %></label>

        <input type="radio" id="op2" name="r" value="<%= ((Question)q.get(qno)).getOP2() %>">
        <label for="op2" class="option-label">B. <%= ((Question)q.get(qno)).getOP2() %></label>

        <input type="radio" id="op3" name="r" value="<%= ((Question)q.get(qno)).getOP3() %>">
        <label for="op3" class="option-label">C. <%= ((Question)q.get(qno)).getOP3() %></label>

        <input type="radio" id="op4" name="r" value="<%= ((Question)q.get(qno)).getOP4() %>">
        <label for="op4" class="option-label">D. <%= ((Question)q.get(qno)).getOP4() %></label>

        <div class="btns">
            <a href="testsub.jsp" class="back-btn">Back</a>
            <input type="submit" value="Next">
        </div>
    </form>
</div>

</body>
</html>
