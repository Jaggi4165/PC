<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String name2=(String)session.getAttribute("usernamecom");
    String pas2 = (String) session.getAttribute("password");
    if(name2!=null)
    {
    String company = request.getParameter("company");
    String hr = request.getParameter("hr");
    String hrid = request.getParameter("hrid");
    String address = request.getParameter("address");
       
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "update recruiter_data set COMPANY_NAME=?,HR_NAME=?,HR_ID=?,COMPANY_ADDRESS=?  where COMPANY_MAIL=?";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, company);
            ps.setString(2, hr);
            ps.setString(3, hrid);
            ps.setString(4, address);
            ps.setString(5, name2);
            int x = ps.executeUpdate(); // execute it on test database
            if(x>0)
            {
                %>
                <script>
                    alert("SUCCESSFULLY UPDATED");
                    window.location="recruiterProfile.jsp";
                </script>
                <%
                //response.sendRedirect("index.html");
            }
            else
            {
                %>
                <script>
                    alert("upadation failed");
                    window.location="recruiter_editdetails.jsp";
                </script>
                <%
            }
        } catch (Exception e) {
         out.println("Exception : "+e);   
        }
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>