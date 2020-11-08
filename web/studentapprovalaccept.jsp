<%@page import="java.sql.*"%>
<%
    String student = request.getParameter("student");
    session.setAttribute("student1", student);
    String student1 = (String) session.getAttribute("student1");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
        String q1 = "insert into logindata_table (select * from logindata_table_dummy where email=?)";
        String q2 = "delete logindata_table_dummy where email=?";
        PreparedStatement pst = con.prepareStatement(q1);
        PreparedStatement pst2 = con.prepareStatement(q2);
        pst.setString(1,student1);
        pst2.setString(1,student1);
        pst.executeUpdate();
        pst2.executeUpdate();
        response.sendRedirect("admin_approvals.jsp");
    }
    catch(Exception e) {
        out.println(e);
    } 
%>