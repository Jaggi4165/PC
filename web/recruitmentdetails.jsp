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
                        String query2 = "select * from recruiter_data where company_mail=? ";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1, name2);
                        //pst2.setString(2, pas2);
                        ResultSet rs = pst2.executeQuery();

                        if (rs.next()) 
                        {
                            //String password2 = rs.getString("PASS");

        %>
        <%@include file='rheader.jsp' %>
        
        
                        
                        <div align="center">
                            <p align="center"> <b>RECRUITMENT </b></p><br><br>
                            <form method="post" action="storedinto_company_requiretment_table.jsp">
                                <table>
                                    <tr>
                                        <td> COMPANY NAME : </td>
                                        <td><input type="text" size="40" name="company"  value="<%=rs.getString("company_name")%>" required></td>
                                    </tr>
                                    <tr>
                                        <td> EMAIL : </td>
                                        <td><input type="text" size="40" name="mail"  value="<%=rs.getString("company_mail")%>" required></td>
                                    </tr>
                                    <tr>
                                        <td> JOB DISCRIPTION : </td>
                                        <td><input type="text" size="40" name="job" required></td>
                                    </tr>
                                    <tr>
                                        <td> JOB LOCATION : </td>
                                        <td><input type="text" size="40" name="location" required></td>
                                    </tr>
                                    <tr>
                                        <td> REQUIRED SKILLS : </td>
                                        <td><input type="text" size="40" name="skills" required></td>
                                    </tr>
                                    <tr>
                                        <td> QUALIFICATION : </td>
                                        <td>
                                            <select  name="qual" required>
                                                <option>select your highest Qualification</option>
                                                <option>BSC</option>
                                                <option>B.TECH</option>
                                                <option>MSC</option>
                                                <option>MASTER OF COMPUTER APPLICATIONS</option>
                                                <option>M.TECH</option>
                                                
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> REQUIRED PERCENTAGE : </td>
                                        <td><input type="number" maxlength="4" minlength="4" size="40" name="percentage" required> (above)</td>
                                    </tr>
                                    <tr>
                                        <td> SPECIALIZATION : </td>
                                        <td>
                                            <select name="special" required>
                                                <option>select your Specialization</option>
                                                <option>COMPUTER SCIENCE</option>
                                                <option>PHYSICS</option>
                                                <option>STATASTICS</option>
                                                <option>MECHANICAL</option>
                                                <option>CHEMISTRY</option>
                                                
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> YEAR OF PASSING : </td>
                                        <td><input type="number" name="yop" required></td>
                                    </tr>
                                    <tr>
                                        <td> DATE OF DRIVE : </td>
                                        <td><input type="NUMBER" placeholder="dd/mm/yyyy" name="drive" required></td>
                                    </tr>
                                    <tr>
                                        <td> LAST DATE TO APPLY : </td>
                                        <td><input type="NUMBER" placeholder="dd/mm/yyyy" name="lastdate" required></td>
                                    </tr>
                                </table>
                            
                                
                                <input type="reset" value="RESET" style="background-color:royalblue;color:white;width:100px;height:40px;"/>
                                 <input type="submit" value="DONE" style="background-color:royalblue;color:white;width:100px;height:40px;"/>
                            </form>
                        </div>
                        
                        
                        
                        
                        
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