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
        <%@include file="header.jsp"%>
        <body>
            <a href="Registration_student.jsp"><b style="text-decoration: none;"> <- BACK</b></a>
            
<div class="login">
    <h2 align="center"><b>COMPANY REGISTRATION FORM</b></h2>
    
    <form action="storerecruiterdetails.jsp" method="post" onsubmit="return validation()">
<table>
    <table>
            <tr>
                <td>EMAIL</td>
                <td><input type="text" name="email" required></td>
            </tr>
            <tr>
                <td>NAME</td>
                <td><input type="text" name="name" required/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="text" name="pass" required /></td>
            </tr>
            <tr>
                <td>Conform Password</td>
                <td><input type="password" name="cpass" required /></td>
            </tr>
            <tr>
                <td>QUESTION : </td>
                <td><select name="question" required >
                        <option name="" >SELECT YOUR SECURITY QUESTION </option>
                        <option name="q1" value="WHAT IS YOUR NAME ?">WHAT IS YOUR NAME ? </option>
                        <option name="q2" value="WHAT IS YOUR FATHER NAME ? ">WHAT IS YOUR FATHER NAME ? </option>
                        <option name="q3" value="WHAT IS YOUR MOTHER NAME ? ">WHAT IS YOUR MOTHER NAME ? </option>
                        <option name="q4" value="WHAT IS YOUR BIRTH PLACE ?">WHAT IS YOUR BIRTH PLACE ? </option>
                        <option name="q5" value="WHO IS YOUR BEST FRIEND ?">WHO IS YOUR BEST FRIEND ? </option>
                    </select></td>
            </tr>
            <tr>
                <td>ANSWER </td>
                <td><input type="text" name="answer"required/></td>
            </tr>
            
				
<tr>
    <td colspan="2" align="center"><input type="submit" value="SUBMIT"></td>
</tr>
</table>
</form>
</body>
</html>