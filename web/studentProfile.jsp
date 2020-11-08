
<%@page import="java.sql.*"%>
<%
    
    String name=(String)session.getAttribute("username"); 
if(name!=null)
{
%>
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
         <%@include file='sheader.jsp' %>
         
         <%
             try
             {
                 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
 String query1= "select * from STUDENT_DATA where EMAIL=?";
 PreparedStatement pst = con.prepareStatement(query1);
 pst.setString(1,name);
 ResultSet rs= pst.executeQuery();
 if(rs.next())
 {
     %>
     <div>
         <ul>
             <li><a href="studentpasswordchange2.jsp">CHANGE PASSWORD</a></li>
             <li><a href="student_acedemic_details.jsp" align="center">ACEDEMIC DETAILS</a></li>
          
         </ul>
     </div>
     
     <div > <h4>MY DETAILS<h4><br>
        <table align="center" border="1" backgroundcolor="lightyellow">
                <tr align="center">
                    <td>NAME :</td>
                    <td><%=rs.getString(2) %></td>
                </tr>
                <tr align="center">
                    <td>GENDER :</td>
                    <td><%=rs.getString(3) %></td>
                </tr>
                <tr align="center">
                    <td>FATHER NAME :</td>
                    <td><%=rs.getString(4) %></td>
                </tr>
                <tr align="center">
                    <td>MOTHER NAME :</td>
                    <td><%=rs.getString(5) %></td>
                </tr>
                <tr align="center">
                    <td>DOB :</td>
                    <td><%=rs.getString(7) %></td>
                </tr>
                <tr align="center">
                    <td>MOBILE :</td>
                    <td><%=rs.getString(6) %></td>
                </tr>
                
                <tr align="center">
                    <td>ADDRESS :</td>
                    <td><%=rs.getString(8) %></td>
                </tr>
                <tr align="center">
                    <td>QUALIFICATION :</td>
                    <td><%=rs.getString(9) %></td>
                </tr>
                <tr align="center">
                    <td>SPECIALIZATION :</td>
                    <td><%=rs.getString(10) %></td>
                </tr>
                <tr align="center">
                    <td>PERCENTAGE :</td>
                    <td><%=rs.getString(12) %></td>
                </tr>
                <tr align="center">
                    <td>YEAR OF PASSING :</td>
                    <td><%=rs.getString(11) %></td>
                </tr>
               
 </div>
</table><br>
<div align="center">
                
                <a href="editstudentdetails.jsp"><input type="button" value="EDIT" style="background-color:royalblue;color:white;width:100px;height:40px;"/></a>
       </div>         
                <% 
 }
 else
 {
     
 }
             }
             catch(Exception e)
             {
                 
             }
         %>
</body>
 </html>
 <% }
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}

 %>