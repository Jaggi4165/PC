<%@page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
        <link rel="stylesheet" type="text/css" href="css/loginformcss.css">
        
        <style>
             h2 {
    
    text-align:center;
    text-size:30px;
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
if(name2!=null)
{
%>
<%@include file='rheader.jsp' %>
                         

<form  align="center" onsubmit="return validate()" action="recruiter_changepasswordstore.jsp" method="post" >
            <h2 align="center"><u><b>CHANGE YOUR PASSWORD</b></u></h2><br>
    <div style="padding-left:30%;padding-right:30%;">
      <label for="uname" align="left"><b>ENTER YOUR OLD PASSWORD</b></label>
      <input type="text" placeholder="Enter Old Password" name="old" required><br>

      <label><b>ENTER YOUR NEW PASSWORD</b></label>
      <input type="password" placeholder="Enter New Password" name="new1" id="new1" required><br>
      <label><b>RE-ENTER YOUR NEW PASSWORD</b></label>
      <input type="password" placeholder="Re Enter New Password" name="new2" id="new2" required><br>
      <div id="label"></div>
      <button type="submit">SET</button>
    </div>
  </form>
    </body>
    <script>
        function validate()
        {
            //String name=(String)session.getAttribute("username");
            var one=document.getElementById("new1").value;
            var two = document.getElementById("new2").value;
            if(one!==two)
            {
                alert("PASSWORD DOES NOT MATCHING");
                return false;
            }
            else
            {	
	       return true;
            }
        }
    </script> 
    <%
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
        
        
%>
</html>