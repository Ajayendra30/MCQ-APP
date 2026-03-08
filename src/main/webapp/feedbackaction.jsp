<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>QuizSphere - Feedback Status</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

/* ✅ Background same as stlogin */
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;

    background:
        linear-gradient(to bottom, rgba(255,255,255,0.88), rgba(255,255,255,0.9)),
        url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1920&auto=format&fit=crop')
        no-repeat center/cover;
    background-attachment: fixed;
}

/* ✅ Glassmorphic Box */
.message-box {
    width: 450px;
    padding: 45px;
    border-radius: 18px;
    background: rgba(255,255,255,0.18);
    backdrop-filter: blur(14px);
    border: 1px solid rgba(255,255,255,0.3);
    text-align: center;
    box-shadow: 0 8px 25px rgba(0,0,0,0.35);
    animation: fadeInUp 0.9s ease;
}

/* Headings */
h2 {
    font-size: 28px;
    font-weight: 700;
    color: #003366;
    margin-bottom: 8px;
}

p {
    font-size: 17px;
    margin-bottom: 10px;
    color: #333;
}

/* Success / Error Images */
.success-img, .error-img {
    width: 120px;
    height: 120px;
    margin-bottom: 18px;
    animation: bounce 2s infinite;
}

/* ✅ Button Styled Like Homepage */
a {
    display: inline-block;
    margin-top: 25px;
    padding: 12px 30px;
    background: linear-gradient(90deg, #ff416c, #ff4b2b);
    color: white;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 600;
    font-size: 16px;
    transition: all .3s ease;
}

a:hover {
    transform: scale(1.08);
    box-shadow: 0 6px 20px rgba(255, 75, 43, 0.6);
}



/* Animations */
@keyframes bounce {
    0%,100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>
<body>

<div class="message-box">
<%
try {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comments");

    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String pass = "system";

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(url, user, pass);

    String sql = "INSERT INTO FEEDBACK (NAME, EMAIL, RATING, COMMENTS) VALUES (?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, rating);
    ps.setString(4, comments);

    int rows = ps.executeUpdate();
    con.close();

    if (rows > 0) {
%>
        <img src="https://cdn-icons-png.flaticon.com/512/148/148767.png" class="success-img" alt="Success">
        <h2>Feedback Submitted!</h2>
        <p>Thank you, <%= name %>! Your feedback helps us improve </p>
<%
    } else {
%>
        <img src="https://cdn-icons-png.flaticon.com/512/463/463612.png" class="error-img" alt="Error">
        <h2>Something went wrong!</h2>
        <p>Please try again later.</p>
<%
    }
} catch (Exception e) {
%>
    <img src="https://cdn-icons-png.flaticon.com/512/463/463612.png" class="error-img" alt="Error">
    <h2>Error Occurred!</h2>
    <p><%= e.getMessage() %></p>
<%
}
%>
    <a href="swelcome.jsp">Back to Menu</a>
</div>



</body>
</html>
