<%-- 
    Document   : studentLoginValidation
    Created on : Jan 25, 2020, 8:59:12 AM
    Author     : user
--%>

<%@page import="javax.swing.JFrame"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/sheet.css"></link>
    </head>
    <body>
                                
                        

                        
        <%
            String name2=(String)session.getAttribute("usernamecom");
            String pas2 = (String) session.getAttribute("password");
            
            //String pas = (String) session.getAttribute("password");

                if (name2 != null) 
                {
                    try 
                    {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from recruiter_data where COMPANY_MAIL=? ";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1, name2);
                        //pst2.setString(2, pas2);
                        ResultSet rs = pst2.executeQuery();
                  

                        if (rs.next()) 
                        {
                            //String password2 = rs.getString("PASS");

        %>
        
        <%@include file='rheader.jsp' %>
                        
      
                        <ul align="bottom left">
                        <li><a href="recruiter_changepassword.jsp">change password</a></li>
                        
                        </ul>
    <center>                 
     <h4>MY DETAILS<h4><br>
        <table border="1" padding="30px" backgroundcolor="lightyellow">
                <tr align="center">
                    <td>COMPANY_MAIL ID :</td>
                    <td><%=rs.getString(1) %></td>
                </tr>
                <tr align="center">
                    <td>COMPANY_NAME :</td>
                    <td><%=rs.getString(2) %></td>
                </tr>
                <tr align="center">
                    <td>NAME OF THE H.R :</td>
                    <td><%=rs.getString(3) %></td>
                </tr>
                <tr align="center">
                    <td>H.R_ID :</td>
                    <td><%=rs.getString(4) %></td>
                </tr>
                <tr align="center">
                    <td>ADDRESS OF THE COMPANY :</td>
                    <td><%=rs.getString(5) %></td>
                </tr>
 </div>
</table><br>

<a href="recruiter_editdetails.jsp"><input type="button" value="EDIT" style="background-color:royalblue;color:white;width:100px;height:40px;"/></a>
</center>                
                
                

        <%

                        } 
                        
                } //response.sendRedirect("studentLoginForm.jsp"); 
                catch (Exception e)
                {
                    out.println("exception:"+e);
                }
            }
                else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>
    </body>
</html>