<%@page import="java.sql.*"%>
<%@include file='aheader.jsp' %>
<%
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");
String searchedelement = request.getParameter("search");
            
if(user2!=null)
{
    %>
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="css/sheet.css">
        </head>
        <body>
    
        <center>
            <div>
                <h2><b>STUDENTS</b></h2>
            </div>
            
               <%
                   try
                   {
                       Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from student_data where (student_name=? or email=?)";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1,searchedelement);
                        pst2.setString(2,searchedelement);
                        ResultSet rs = pst2.executeQuery();
                        %>
               <div style="padding-top:30px"><form  action="" method="post">
                SEARCH STUDENT : <input   type="text" size="50" name="search" value="<%=searchedelement%>" required>
                <input style="background-color:green;color:white;" type="submit" value="SEARCH"></form>
            </div>
            <div>
                
            </div>
            <div style="padding-top:30px">
            <table border="1">
                <tr>
                    <td colspan="4" align="center">LIST OF STUDENTS</td>
                </tr>
                
                <tr align="center">
                   <td>NAME OF THE STUDENT</td>
                   <td>EMAIL</td>
                   <td>DELETE</td>
                   <td>VIEW DETAILS</td>
                           </tr><%
                        if(rs.next())
                        {
               %>
               
               <tr align="center">
                   <td><%=rs.getString("STUDENT_NAME")%></td>
                   <td><%=rs.getString("EMAIL")%></td>
                   <td><a href="deletestudent.jsp?student=<%=rs.getString("EMAIL")%>"><input type="button" value="DELETE"></a></td>
                   <td><a href="viewstudent.jsp?student=<%=rs.getString("EMAIL")%>"><input type="button" value="VIEW"></a></td>
                           </tr>
                       <%
                        }
else {
%><tr><td colspan="4" align="center"><h5 style="color:red;" >DATA DOES NOT EXIST</h5></td></tr><%
}
                        
                    }
                   catch(Exception e)
                   {
                       
                   }
               %>
            </table>
            </div>
        </center>
        
        
        
        
        </body></html>
    <%
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>