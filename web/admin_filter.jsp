<%@page import="java.sql.*"%>
<%@include file='aheader.jsp' %>
<%
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");  
            
if(user2!=null)
{
    %>
    <html>
        <head>
            <title>search student</title>
            <link rel="stylesheet" type="text/css" href="css/sheet.css">
        </head>
        <body>
    
        <center>
            <div>
                <h2><B>SEARCH</B></h2></div>
            <div style="padding-top:30px">
                
                    
                    <div>
                        <form action="afterfilter.jsp" method="post">
        <table>
           
            <tr>
                <td>GENDER </td>
                <td><input type="radio" value="male" name="gender" />Male
                    <input type="radio" value="female" name="gender" />Female</td>
            </tr>
          
            <tr>
                <td>QUALIFICATION</td>
                <td><select name="qual" required>
                        <option name="">HEIGHEST QUALIFICATION</option>
                        <option name="one" value="3-YEARS DEGREE">3-YEARS DEGREE</option>
                        <option name="two" value="B.TECH">B.TECH</option>
                        <option name="three" value="MASTER OF COMPUTER APPLICATIONS">MASTER OF COMPUTER APPLICATIONS</option>
                        <option name="four" value="MSC">MASTER OF SCIENCE</option>
                    </select></td>
            </tr>
            <tr>
                <td>SPECIALIZATION</td>
                <td><select name="special" required>
                        <option name="">SPECIALIZATION</option>
                        <option name="ekh" value="MATHEMATICS">MATHEMATICS</option>
                        <option name="dho" value="STATASTICS">STATASTICS</option>
                        <option name="theen" value="PHYSICS">PHYSICS</option>
                        <option name="char" value="CHEMISTRY">CHEMISTRY</option>
                        <option name="panch" value="COMPUTER SCIENCE">COMPUTER SCIENCE</option><select></td>
            </tr>
            <tr>
                <td>PERCENTAGE</td>
                <td><input type="number" id="percent" name="percent" required/></td>
            </tr>
            <tr>
                <td>YEAR_OF_PASSING</td>
                <td><input type="number" id="yop" name="yop" required/></td>
            </tr>
           
        </table><br>
        
                    
                    
                    
                    
                    </div>   
                    
                    
                    
                    
                    
                    
                    
                    
                    
                <input style="background-color:green;color:white;" type="submit" value="SEARCH">
</form>
            </div>
           
        
        
        
        
        </body></html>
    <%
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>