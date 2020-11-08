<%@page import="java.sql.*"%>
<%
    String student = request.getParameter("student");
    session.setAttribute("student1", student);
    String student1 = (String) session.getAttribute("student1");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","jaggi","password");
        String q1 = "delete logindata_table_dummy where email=?";
        PreparedStatement pst = con.prepareStatement(q1);
        pst.setString(1,student1);
        pst.executeUpdate();
        response.sendRedirect("admin_approvals.jsp");
    }
    catch(Exception e) {
        out.println(e);
    } 
%>
