<%@page import="java.sql.*"%>
<%
    String k = request.getParameter("id2");
    session.setAttribute("company", k);
    String company = (String) session.getAttribute("company");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
        String q1 = "delete RECRUITER_LOGINDATA_dummy where company_mail=?";
        String q2 = "delete RECRUITER_DATA where company_mail=?";
        String q3 = "delete COMPANY_REQUIREMENT where company_mail=?";
        PreparedStatement pst = con.prepareStatement(q1);
        PreparedStatement pst2 = con.prepareStatement(q2);
        PreparedStatement pst3 = con.prepareStatement(q3);
        pst.setString(1,company);
        pst2.setString(1,company);
        pst3.setString(1,company);
        pst.executeUpdate();
        pst2.executeUpdate();
        pst3.executeUpdate();
        response.sendRedirect("admin_approvals.jsp");
    }
    catch(Exception e) {
        out.println(e);
    } 
%>