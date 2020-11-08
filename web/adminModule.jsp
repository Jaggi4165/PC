 <%@page import="javax.swing.JFrame"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
        <head>
            <title>admin_homepage</title>
                <link rel="stylesheet" type="text/css" href="css/sheet.css">
    </head>
    <body>
         <header>
        <img src="images/bullayyalogo.png">
        <img src="images/logo2.jfif" style="float:right;">
        <h1 style='padding-top: 05px;font-size: 50px;color:blue; text-shadow: 2px 2px black;'>PLACEMENT CELL</h1>
        <h2 style='padding-top: 05px;font-size: 40px;color:blue;text-shadow: 2px 2px black;'>Dr Lankapalli Bullayya P.G College</h2>
        
	</header>
                        
<%
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");  
            
if(user2!=null)
{
    
    %>
    <div class="nav">
                        <ul>
                        <li><a href="adminModule.jsp">HOME</a></li>
                        <li><a href="admin_student.jsp">STUDENTS</a></li>
                        <li><a href="admin_company.jsp">COMPANIES</a></li>
                        <li><a href="admin_filter.jsp">SEARCH</a></li>
                        <li><a href="admin_approvals.jsp">APPROVALS</a></li>
                        <li><a href="mailbox.jsp?mailbox=<%=user2%>">MAILBOX</a></li>
                        <li><a href="logout_admin.jsp">LOGOUT</a></li>
                        <li><a href="acontact.jsp">CONTACT</a></li>
                        </ul>
                        </div>
    <center>
        <h1>WELCOME </h1>  <p style="color:red;size: 25;font-size: 100;"><b>Dr LANKAPALLI BULLAYYA P.G. COLLEGE</b></p>
    </center>
    <%
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>
    </body></html>