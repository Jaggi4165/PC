        <html><head>
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
    </head><body>
        <%@include file="header.jsp"%>
        <body>
            
<div class="login">
    <h2 align="center"><b>STUDENT REGISTRATION FORM:STEP-3</b></h2>
<form  action="storestudentdetails3.jsp" method="post">
        <table >
            <tr>
                <td>EMAIL</td>
                <td colspan="3"><input type="text" id="mail" size="40" name="email"></td>
            </tr>
            
            <tr>
                <td>.. </td>
                <td>HALL TICKET NO</td>
                <td>YEAR OF PASSING</td>
                <td>PERCENTAGE </td>
            </tr>
            <tr>
                <td> SSC </td>
                <td><input type="text" name="sscht"></td>
                <td><input type="text" name="sscyop"></td>
                <td><input type="text" name="sscgp"> </td>
            </tr>
            <tr>
                <td> INTER </td>
                <td><input type="text" name="interht"></td>
                <td><input type="text" name="interyop"></td>
                <td><input type="text" name="intergp"> </td>
            </tr>
            <tr>
                <td> DEGREE </td>
                <td><input type="text" name="ught"></td>
                <td><input type="text" name="ugyop"></td>
                <td><input type="text" name="uggp"></td>
            </tr>
            <tr>
                <td> PG </td>
                <td><input type="text" name="pght"></td>
                <td><input type="text" name="pgyop"></td>
                <td><input type="text" name="pggp"> </td>
            </tr>
           
        </table><br>
        <a href="index.html"><input type="button" value="CANCEL" style="background-color:royalblue;color:white;width:100px;height:40px;"/></a>
        <input type="submit" value= " REGISTER " style="background-color:royalblue;color:white;width:100px;height:40px;"/>
        
    </form>
</body>
</html>