<%@page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
    </head>
    <body>
        <%@include file='sheader.jsp' %>
<%
String name=(String)session.getAttribute("username"); 
if(name!=null)
{
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jaggi", "password");
        String query2 = "select * FROM COMPANY_REQUIREMENT WHERE PERCENTAGE<=(SELECT PERCENTAGE FROM STUDENT_DATA WHERE EMAIL=?)";
        PreparedStatement pst = con2.prepareStatement(query2);
        pst.setString(1,name);   
         ResultSet rs = pst.executeQuery();
         
        while(rs.next())
        {
            String cmail = rs.getString("COMPANY_MAIL");
            String cname = rs.getString("COMPANY_NAME");
            String job = rs.getString("JOB_DISCRIPTION");
            
            %>
            
            
            <div style="padding-top: 30px">   
                        <table border="1"  backgroundcolor="lightyellow" align="center" >
                <tr align="center">
                    <td>COMPANY MAIL :</td>
                    <td><%=rs.getString("COMPANY_MAIL") %></td>
                </tr>
                <tr align="center">
                    <td>COMPANY NAME :</td>
                    <td><%=rs.getString("COMPANY_NAME") %></td>
                </tr>
                <tr align="center">
                    <td>JOB DESCRIPTION :</td>
                    <td><%=rs.getString("JOB_DISCRIPTION") %></td>
                </tr>
                <tr align="center">
                    <td>LOCATION :</td>
                    <td><%=rs.getString("LOCATION") %></td>
                </tr>
                <tr align="center">
                    <td>SKILLS :</td>
                    <td><%=rs.getString("SKILLS") %></td>
                </tr>
                <tr align="center">
                    <td>QUALIFICATION :</td>
                    <td><%=rs.getString("QUALIFICATION") %></td>
                </tr>
                
                <tr align="center">
                    <td>PERCENTAGE :</td>
                    <td><%=rs.getString("PERCENTAGE") %></td>
                </tr>
                <tr align="center">
                    <td>SPECIALIZATION :</td>
                    <td><%=rs.getString("SPECIALIZATION") %></td>
                </tr>
                <tr align="center">
                    <td>YEAR OF PASSING :</td>
                    <td><%=rs.getString("YEAR_OF_PASSING") %></td>
                </tr>
                <tr align="center">
                    <td>DATE OF DRIVE :</td>
                    <td><%=rs.getString("DATE_OF_DRIVE") %></td>
                </tr>
                <tr align="center">
                    <td>LAST DATE TO APPLY :</td>
                    <td><%=rs.getString("APPLY_LASTDATE") %></td>
                </tr>
</table>
                <table align="center">
                <tr align="center">
               
                    <td><a href="applyjob.jsp?cmail=<%=cmail%>,cname=<%=cname%>"><input type="button" value="APPLY" style="background-color:royalblue;color:white;width:200px;height:40px;"/></a></td>
                </tr>
            </table>
                </div><br>
            <%
       }

         
       }
catch(Exception e)
{
out.println(e);
}
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
        
        
%>

</body>
</html>