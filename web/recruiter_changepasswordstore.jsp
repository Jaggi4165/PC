<%@page import="java.sql.*"%>

<%
    String name2=(String)session.getAttribute("usernamecom");
String pas2 = (String) session.getAttribute("password");
 String newpass = request.getParameter("new1");
    if(name2!=null)
    {
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
        String query = "update recruiter_logindata set PASSWORD=? WHERE COMPANY_MAIL=?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1,newpass);
        pst.setString(2,name2);
        int x = pst.executeUpdate(); // execute it on test database
            if(x>0)
         {
         
         %>
                <script>
                    alert("PASSWORD CHANGED SUCCESSFULLY.");
                    window.location="recruiterProfile.jsp";
                </script>
                <%
                    }
             else
         {
         
         %>
                <script>
                    alert("FAILURE.");
                    window.location="recruiterModule.jsp";
                </script>
                <%
                    }
                    }
        catch(Exception e)
        {
            %>
            <script>
                    alert(e);
                    window.location="recruiterModule.jsp";
            </script>
            <%
        }
    }
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>