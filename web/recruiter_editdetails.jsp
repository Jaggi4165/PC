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
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
         <style>
            h2 {
    
    text-align:right;
    text-size:30px;
    height:100px;
    padding-right: 20px;
    padding-top: 30px;
    background:none;
    font-size:30px;
    text-decoration:none;
    color:black;
}
.bg {
    padding-top:30px;
    background-image: url("F:\bgmodule.png");
    background-position: right top;
}
        </style>

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
                        
    <center>
     <h4>MY DETAILS<h4><br>
             <form method="post" action="recruiter_editdetailsupdate.jsp">
        <table border="1" padding="30px" backgroundcolor="lightyellow">
                <tr align="center">
                    <td>COMPANY_NAME :</td>
                    <td><input type="text"  value="<%=rs.getString(2)%>" name="company"></td>
                </tr>
                <tr align="center">
                    <td>NAME OF THE H.R :</td>
                    <td><input type="text" value="<%=rs.getString(3)%>" name="hr"></td>
                </tr>
                <tr align="center">
                    <td>H.R_ID :</td>
                    <td><input type="text" value="<%=rs.getString(4)%>" name="hrid"></td>
                </tr>
                <tr align="center">
                    <td>ADDRESS OF THE COMPANY :</td>
                    <td><input type="text" value="<%=rs.getString(5)%>" name="address"></td>
                </tr>
 </div>
</table><br>

<input type="submit" value="UPDATE" style="background-color:royalblue;color:white;width:100px;height:40px;"/>
             </form>
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