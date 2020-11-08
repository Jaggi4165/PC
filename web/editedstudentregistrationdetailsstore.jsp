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
    String name1 = request.getParameter("studentname");
    String sex = request.getParameter("gender");
    String father = request.getParameter("fname");
    String mother = request.getParameter("mname");
    String mobile = request.getParameter("mobile");
    String addr = request.getParameter("address");
    String dob = request.getParameter("dob");
    String qual = request.getParameter("qual");
     String special = request.getParameter("special");
    String percent = request.getParameter("percent");
    String year = request.getParameter("yop");
    
        // inserting data into oracle database
        //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "update student_data set STUDENT_NAME=?,FATHER_NAME=?,MOTHER_NAME=?,GENDER=?,MOBILE_NUMBER=?,ADDRESS=?,DATE_OF_BIRTH=?,HEIGHEST_QUALIFICATION=?,SPECIALIZATION=?,PERCENTAGE=?,YEAR_OF_PASSING=? where EMAIL=?";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, name1);
            ps.setString(2, father);
            ps.setString(3, mother);
            ps.setString(4, sex);
            ps.setString(5, mobile);
            ps.setString(6, addr);
            ps.setString(7, dob);
            ps.setString(8, qual);
            ps.setString(9, special);
            ps.setString(10,percent);
            ps.setString(11,year);
            ps.setString(12,name);
            
            

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
                %>
                <script>
                    alert("upadation failed");
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