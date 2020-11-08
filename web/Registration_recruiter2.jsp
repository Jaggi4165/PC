        <%@page import="java.sql.*"%>
       
<html><head>
                <link rel="stylesheet" type="text/css" href="css/sheet.css"></link>
    <style>

.login
{
background:#fff;
padding:1px;
width:400px;
margin:auto;
margin-top:10px;
height:300px;
}
form{
width:240px;
text-align:center;
background:#fff;
}
input , select{
width:240px;
text-align:left;
background:#ecf0f1;
border:2px solid transparent;
border-radius:3px;
font-size:16px;
padding:10px;
}
input[type=submit]
{
border:2px solid transparent;
background:#3498bd;
color:white;
font-size:16px;
line-height:25px;
}
input[type=submit]:hover
{
background:#2980b9;
}
h2{
color:brown;
}

</style>
<script>
    function() {
        document.open("checkstatus.jsp");
    }
    </script>

    </head><body>
        <%
            String c=(String)session.getAttribute("c"); //company mail id stored in variable "c"
        Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query = "select company_mail from RECRUITER_LOGINDATA_DUMMY where company_mail=?";
            PreparedStatement ps = con.prepareStatement(query); 
            ps.setString(1, c);
        %>
        
        
        <%@include file="header.jsp"%>
        <body>
            <a href="index.jsp"><b style="text-decoration: none;"> <- BACK</b></a>
            
<div class="login">
    <h2 align="center"><b>COMPANY REGISTRATION FORM : 2</b></h2>
    
    <form action="storerecruiterdetails2.jsp" method="post" onsubmit="return validation()">
<table>
    <table>
            <tr>
                <td>EMAIL : </td>
                <td><input type="text" value=<%=c%> name="email"/></td>
            </tr>
            <tr>
                <td>COMPANY_NAME : </td>
                <td><input type="text" name="cname"/></td>
            </tr>
            <tr>
                <td>H.R NAME :</td>
                <td><input type="text" name="hr"/></td>
            </tr>
            <tr>
                <td>H.R ID :  </td>
                <td><input type="text" name="hrid"/></td>
            </tr>
            <tr>
                <td>COMPANY ADDRESS :  </td>
                <td><input type="text" name="caddress"/></td>
            </tr>
            
				
<tr>
    <td colspan="2" align="center"><input type="submit" value="SUBMIT"></td>
</tr>
</table>
</form>
</body>
</html>