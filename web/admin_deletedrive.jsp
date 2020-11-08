<%@page import="java.sql.*"%>
<% 
    String deletejob = request.getParameter("id");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = " delete from COMPANY_REQUIREMENT where JOB_DISCRIPTION=?";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1,deletejob);
                        pst2.executeQuery();
                        response.sendRedirect("recruiter2_mydrives.jsp");
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>