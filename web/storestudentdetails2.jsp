<%@page import="java.sql.*"%>
<%
String name1 = request.getParameter("studentname");
String mail = request.getParameter("email");
    String sex = request.getParameter("gender");
    String father = request.getParameter("fname");
    String mother = request.getParameter("mname");
    String mobile = request.getParameter("mobile");
    String addr = request.getParameter("addr");
    String dob = request.getParameter("dob");
    String qual = request.getParameter("qual");
     String special = request.getParameter("special");
    String percent = request.getParameter("percent");
    String year = request.getParameter("yop");
    String exp = request.getParameter("exp");
        // inserting data into oracle database
        //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "insert into STUDENT_DATA values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, mail);
            ps.setString(2, name1);
            ps.setString(3, sex);
            ps.setString(4, father);
            ps.setString(5, mother);
            ps.setString(6, mobile);
            ps.setString(7, dob);
            ps.setString(8, addr);
            ps.setString(9, qual);
            ps.setString(10, special);
            ps.setString(11,year);
            ps.setString(12,percent);
            ps.execute(); // execute it on test database
            
                %>
                <script>
                    alert("STEP : 3");
                    window.location="studentacedemicdetails.jsp";
                </script>
                <%
        } catch (Exception e) {
         %>
                <script>
                    alert("SOME FIELDS ARE SET AS UNIQUE / ERROR");
                    window.location="studentpersonaldetails.jsp";
                </script>
                <%  
        }
%>