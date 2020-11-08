<%@include file='aheader.jsp' %>
<% 
String user2 = (String) session.getAttribute("usernameadmin");
String pas2 = (String) session.getAttribute("password");  
            
if(user2!=null)
{
    %>
    <html><head>
    <link rel="stylesheet" type="text/css" href="css/sheet.css"></link>
        
    </head><body>
<table align="center" style="padding-top:20px;">
                <tr align="center" size="30">
                    <td><b><u>TO HOD</td>
                    <td><b><u>To Principle</td>
                    <td><b><u>To Placement Officer</b></td>
                    </tr><span></span>
                    
                <tr align="center" size="30">
                    <td><img src="images/phone2.png" height="30px">97*****162</td>
                    <td><img src="images/phone2.png" height="30px">99*****244</td>
                    <td><img src="images/phone2.png" height="30px">91******23</td>
                </tr><span></span>
                
                <tr align="center" size="30">
                    <td><img src="images/mail.png" height="30px">ku*****@gmail.com</td>
                    <td><img src="images/mail.png" height="30px">ku****65@gmail.com</td>
                    <td><img src="images/mail.png" height="30px">pr*****787@gmail.com</td>
                </tr><span></span>
            </table>
        </div>
            <div>
                <div>
    <img src="images/hodsir.jpg" height="300px" width="1400px">
</div>
            </div></body></html><%
}
else {
    
}
%>