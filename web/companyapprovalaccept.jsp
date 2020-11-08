<%@page import="java.sql.*"%>
<%
    String k = request.getParameter("id2");
    session.setAttribute("company", k);
    String company = (String) session.getAttribute("company");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
        String q1 = "insert into recruiter_logindata (select * from recruiter_logindata_dummy where company_mail=?)";
        String q2 = "delete recruiter_logindata_dummy where company_mail=?";
        PreparedStatement pst = con.prepareStatement(q1);
        PreparedStatement pst2 = con.prepareStatement(q2);
        pst.setString(1,company);
        pst2.setString(1,company);
        pst.executeUpdate();
        pst2.executeUpdate();
        response.sendRedirect("admin_approvals.jsp");
    }
    catch(Exception e) {
        out.println(e);
    } 
%>