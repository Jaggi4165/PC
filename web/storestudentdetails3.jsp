<%@page import="java.sql.*"%>
<%
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
            String query = "insert into STUDENT_DATA2 values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, mail);
            ps.setString(2, sscht);
            ps.setString(3, sscyop);
            ps.setString(4, sscgp);
            ps.setString(5, interht);
            ps.setString(6, interyop);
            ps.setString(7, intergp);
            ps.setString(8, ught);
            ps.setString(9, ugyop);
            ps.setString(10, uggp);
            ps.setString(11,pght);
            ps.setString(12,pgyop);
            ps.setString(13,pggp);
            int x = ps.executeUpdate(); // execute it on test database
            if(x>0)
            {
                %>
                <script>
                    alert("REGISTRATION SUCCESS & PLEASE WAIT FOR THE ADMIN APPROVAL");
                    window.location="index.jsp";
                </script>
                <%
                //response.sendRedirect("index.html");
            }
            else
            {
                %>
                <script>
                    alert("upadation failed");
                    window.location="studentacedemicdetails.jsp";
                </script>
                <%
            }
        } catch (Exception e) {
         out.println("Exception : "+e);   
        }
%>