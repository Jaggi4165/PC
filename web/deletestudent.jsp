<%@page import="java.sql.*"%>
<%
    String student = request.getParameter("student");
    /*session.setAttribute("student1", student);
    String student1 = (String) session.getAttribute("student1");*/
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
        String q1 = "delete logindata_table_dummy where email=?";
        String q2 = "delete student_data where email=?";
        String q3 = "delete student_data2 where email=?";
        PreparedStatement pst = con.prepareStatement(q1);
        PreparedStatement pst2 = con.prepareStatement(q2);
        PreparedStatement pst3 = con.prepareStatement(q3);
        pst.setString(1,student);
        pst2.setString(1,student);
        pst3.setString(1,student);
        pst.executeUpdate();
        pst2.executeUpdate();
        pst3.executeUpdate();
        response.sendRedirect("admin_student.jsp");
    }
    catch(Exception e) {
        out.println(e);
    } 
%>
