<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String name = (String) session.getAttribute("username");
    String pas2 = (String) session.getAttribute("password");
    
    if(name!=null)
    {
    String mail = request.getParameter("email");
    String sscht = request.getParameter("sscht");
    String sscyop = request.getParameter("sscyop");
    String sscgp = request.getParameter("sscgp");
    String interht = request.getParameter("interht");
    String interyop = request.getParameter("interyop");
    String intergp = request.getParameter("intergp");
    String ught = request.getParameter("ught");
     String ugyop = request.getParameter("ugyop");
    String uggp = request.getParameter("uggp");
    String pght = request.getParameter("pght");
    String pgyop = request.getParameter("pgyop");
    String pggp = request.getParameter("pggp");
        // inserting data into oracle database
        //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "update student_data2 set SSC_HTNO=?,SSC_YOP=?,SSC_PERCENTAGE=?,inter_htno=?,inter_yop=?,inter_percentage=?,ug_htno=?,ug_yop=?,ug_percentage=?,pg_htno=?,pg_yop=?,pg_percentage=? where EMAIL=?";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
           
            ps.setString(1, sscht);
            ps.setString(2, sscyop);
            ps.setString(3, sscgp);
            ps.setString(4, interht);
            ps.setString(5, interyop);
            ps.setString(6, intergp);
            ps.setString(7, ught);
            ps.setString(8, ugyop);
            ps.setString(9,uggp);
            ps.setString(10,pght);
            ps.setString(11,pgyop);
            ps.setString(12,pggp);
            
             ps.setString(13, mail);
            
            

            int x = ps.executeUpdate(); // execute it on test database
            
            
            if(x>0)
            {
                %>
                <script>
                    alert("SUCCESSFULLY UPDATED");
                    window.location="studentProfile.jsp";
                </script>
                <%
                //response.sendRedirect("index.html");
            }
            else
            {
              /*  out.println("sscht :"+sscht); out.println("sscht :"+sscyop); out.println("sscht :"+sscgp);
out.println("interht :"+interht); out.println("interht :"+interyop); out.println("interht :"+intergp);
out.println("ught :"+ught); out.println("ught :"+ugyop); out.println("ught :"+uggp);
out.println("pght :"+pght); out.println("pght :"+pgyop); out.println("pght :"+pggp); */
            %>
                <script>
                    alert("UPDATE FAILED....");
                    window.location="studentProfile.jsp";
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