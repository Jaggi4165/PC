<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%
    
    
    String cname = request.getParameter("cname");
    String hr = request.getParameter("hr");
    String hrid = request.getParameter("hrid");
    String caddress = request.getParameter("caddress");
    String c=(String)session.getAttribute("c");
    
    
    

        // inserting data into oracle database
        //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "insert into RECRUITER_DATA values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query); // generates sql query
            ps.setString(1, c);
            ps.setString(2, cname);
            ps.setString(3, hr);
            ps.setString(4, hrid);
            ps.setString(5, caddress);
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
                    alert("REGISTRATION FAILED");
                    window.location="index.jsp";
                </script>
                <%
         response.sendRedirect("");
            }
            
            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            
        }

%>