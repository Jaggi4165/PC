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
input[type=text],input[type=number] {
    width:240px;
text-align:left;
background:#ecf0f1;
border:2px solid transparent;
border-radius:3px;
font-size:16px;
padding:10px;
}
input , select  {
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
    <h2 align="center"><b>STUDENT REGISTRATION FORM:STEP-2</b></h2>
<form action="storestudentdetails2.jsp" method="post">
        <table>
            <tr>
                <td>EMAIL</td>
                <td><input type="text" id="mail" name="email" required /></td>
            </tr>
            <tr>
                <td>STUDENT NAME</td>
                <td><input type="text" id="pass" name="studentname" required/></td>
            </tr>
            <tr>
                <td>GENDER </td>
                <td><input type="radio" value="male" name="gender" />Male
                    <input type="radio" value="female" name="gender" />Female</td>
            </tr>
            <tr>
                <td>FATHER NAME</td>
                <td><input type="text" id="fname" name="fname" required/></td>
            </tr>
            <tr>
                <td>MOTHER NAME</td>
                <td><input type="text" id="mname" name="mname" required/></td>
            </tr>
            <tr>
                <td>MOBILE NUMBER</td>
                <td><input type="text" id="mobile" name="mobile" required/></td>
            </tr>
            <tr>
                <td>DOB</td>
                <td><input type="date" format="dd/mm/yyyy" placeholder="dd/mm/yyyy" id="dob" name="dob" required/></td>
            </tr>
            <tr>
                <td>ADDRESS</td>
                <td><input type="text" id="addr" name="addr" required/></td>
            </tr>
            <tr>
                <td>QUALIFICATION</td>
                <td><select name="qual" required>
                        <option name="">HEIGHEST QUALIFICATION</option>
                        <option name="one" value="3-YEARS DEGREE">3-YEARS DEGREE</option>
                        <option name="two" value="B.TECH">B.TECH</option>
                        <option name="three" value="MASTER OF COMPUTER APPLICATIONS">MASTER OF COMPUTER APPLICATIONS</option>
                        <option name="four" value="MSC">MASTER OF SCIENCE</option>
                    </select></td>
            </tr>
            <tr>
                <td>SPECIALIZATION</td>
                <td><select name="special" required>
                        <option name="">SPECIALIZATION</option>
                        <option name="ekh" value="MATHEMATICS">MATHEMATICS</option>
                        <option name="dho" value="STATASTICS">STATASTICS</option>
                        <option name="theen" value="PHYSICS">PHYSICS</option>
                        <option name="char" value="CHEMISTRY">CHEMISTRY</option>
                        <option name="panch" value="COMPUTER SCIENCE">COMPUTER SCIENCE</option><select></td>
            </tr>
            <tr>
                <td>PERCENTAGE</td>
                <td><input type="number" id="percent" name="percent" required/></td>
            </tr>
            <tr>
                <td>YEAR_OF_PASSING</td>
                <td><input type="number" id="yop" name="yop" pattern="[0-9]{4}" required/></td>
            </tr>
            
           
        </table><br>
        <a href="index.html"><input type="button" value="CANCEL" style="background-color:royalblue;color:white;width:100px;height:40px;"/></a>
        <input type="submit" value= " REGISTER " style="background-color:royalblue;color:white;width:100px;height:40px;"/>
        
    </form>
</body>
</html>