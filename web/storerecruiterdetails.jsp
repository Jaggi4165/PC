<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%
    
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");
    String cname = request.getParameter("name");
   
    session.setAttribute("c", mail);
    //String name2 = (String) session.getAttribute("username2");
                     
    String c=(String)session.getAttribute("c");
    
    
    

        // inserting data into oracle database
        //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "insert into RECRUITER_LOGINDATA_DUMMY values(?,?,?,?,?,current_timestamp)";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, mail);
            ps.setString(2, cname);
            ps.setString(3, pass);
            ps.setString(4, question);
            ps.setString(5, answer);
            
            int x = ps.executeUpdate(); // execute it on test database
            if(x>0)
            {
                
                %>
                <script>
                    alert("FILL STEP : 2");
                  window.location="Registration_recruiter2.jsp";
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
         
            }
            
            ps.close();
            con.close();
        } catch (Exception e) {
         out.println(e);   
        }

%>