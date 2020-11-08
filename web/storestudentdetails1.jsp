<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%
    
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer"); 
    

        // inserting data into oracle database
        //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "insert into logindata_table_dummy values(?,?,?,?,current_timestamp)";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, mail);
            ps.setString(2, pass);
            ps.setString(3, question);
            ps.setString(4, answer);
            
            
            

            int x = ps.executeUpdate(); // execute it on test database
            if(x>0)
            {
                %>
                <script>
                    alert(" FILL STEP : 2 ");
                  window.location="studentpersonaldetails.jsp";
                </script>
                <%
                //response.sendRedirect("index.html");
            }
            else
            {
                %>
                <script>
                    alert("REGISTRATION FAILED");
                    window.location="index.jsp";
                </script>
                <%
         response.sendRedirect("");
            }
            
            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println(e);
        }

%>