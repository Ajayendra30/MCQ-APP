<%@ page import="java.sql.*"%>
<%
String id = request.getParameter("id");  // get SNO from hidden field

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

    PreparedStatement ps = con.prepareStatement("DELETE FROM mcqque WHERE sno=?");
    ps.setString(1, id);

    int i = ps.executeUpdate();
    con.close();

    if(i > 0) {
        out.println("<script>alert('Question Deleted Successfully!');window.location='viewque.jsp';</script>");
    } else {
        out.println("<script>alert('Error: Question Not Found!');window.location='ViewQuestions.jsp';</script>");
    }
} catch(Exception e) {
    out.println(e);
}
%>
