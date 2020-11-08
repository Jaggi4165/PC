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
        </style>
    </head>
    <body>
        
<%
String name2=(String)session.getAttribute("usernamecom");
String pas2 = (String) session.getAttribute("password");
String viewcompany = request.getParameter("id");

%>
<%@include file='rheader.jsp' %>
    <center>
        <div>
            <h3 align="center">MY DRIVES</h3>
        </div>
    </center>
                         
<%
if(name2!=null)
{
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
        String query2 = "select * FROM COMPANY_REQUIREMENT WHERE COMPANY_MAIL=? or COMPANY_MAIL=?";
        PreparedStatement pst = con2.prepareStatement(query2);
        pst.setString(1,name2);
        pst.setString(2,viewcompany);
         ResultSet rs = pst.executeQuery();
        while(rs.next())
        { 
            String a = rs.getString("job_discription");
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
                <tr align="center">
                    <td>posted on :</td>
                    <td><%=rs.getString("POSTED_ON") %></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><a href="recruiter_deletedrive.jsp?id=<%=a%>"><input type="button" value="DELETE DRIVE"></a></td>
                    
                </tr>
                
</table>

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