<%-- 

    Document   : studentLoginValidation
    Created on : Jan 25, 2020, 8:59:12 AM
    Author     : user
--%>

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
        <style>
            h4 {
                margin:0;
                text-align:right;
                text-size:30px;
                padding-top:10px;
                padding-left:280px;
                padding-right:auto;
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

                        <header>
        <img src="images/bullayyalogo.png">
        <img src="images/logo2.jfif" style="float:right;">
        <h1 style='padding-top: 05px;font-size: 50px;color:blue; text-shadow: 2px 2px black;'>PLACEMENT CELL</h1>
        <h1 style='padding-top: 05px;font-size: 40px;color:blue;text-shadow: 2px 2px black;'>Dr Lankapalli Bullayya P.G College</h1>
        
	</header>
                        <div class="nav">
                        <ul>
                        <li><a href="recruiterModule.jsp">HOME</a></li>
                        <li><a href="recruiterProfile.jsp">PROFILE</a></li>
                        <li><a href="recruitmentdetails.jsp">RECRUITMENT</a></li>
                        <li><a href="recruiter_mydrives.jsp">My DRIVES</a></li>
                        <li><a href="mailboxR.jsp?mailbox=<%=name2%>">MAILBOX</a></li>
                        <li><a href="rcontact.jsp">CONTACT</a></li>
                        <li><a href="logout_company.jsp">LOGOUT</a></li>
                        <li><b>WELCOME : <%=name2%></b></li>
                        

                        </ul>
                        </div>
                        <div>
                         
                            
                            <p align="center" style="padding-top: 20px; padding-right: 20px;"> @ Designed & Maintained  by KUSUMURU JAGADEESWARA RAO</p>
                        </div>
                        
        <%

                        } 
                        
                } //response.sendRedirect("studentLoginForm.jsp"); 
                catch (Exception e)
                {
                    response.sendRedirect("studentModule.jsp");
                }
            }
                else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>
    </body>
</html>

