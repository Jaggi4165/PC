<%@page import="java.sql.*"%>
<html><head>
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
    <body
<%
    String name = (String) session.getAttribute("username");
    String pas=(String)session.getAttribute("password");
    if (name != null) {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
        String query1 = "select * from student_data where EMAIL=?";
        PreparedStatement pst = con.prepareStatement(query1);
        pst.setString(1, name);
        //pst.setString(2, pas);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
%>

<%@include file='sheader.jsp' %>
<form onsubmit="return validaton()" action="editedstudentregistrationdetailsstore.jsp" method="post">
 
        <div align="center" style="padding-top:30px;">
            <h4 align="center">EDIT YOUR DETAILS</h4><br>
        <table border="0" padding="50px" backgroundcolor="lightyellow">
                <tr align="left">
                    <td>NAME :</td>
                    <td><input type="text" value="<%=rs.getString(2) %>" name="studentname" size="40" required></td>
                </tr>
                <tr align="left">
                    <td>SEX :</td>
                    <td><input type="radio" name="gender" value="male" required/>male
                        <input type="radio" name="gender" value="female" required />female
                        <input type="radio" name="gender" value="other" required />other
                    
                </tr>
                <tr align="left">
                    <td>FATHER NAME :</td>
                    <td><input type="text" value="<%=rs.getString(4) %>" name="fname" size="40" required></td>
                </tr>
                <tr align="left">
                    <td>MOTHER NAME :</td>
                    <td><input type="text" value="<%=rs.getString(5) %>" name="mname" size="40" required></td>
                </tr>
                <tr align="left">
                    <td>DOB :</td>
                    <td><input type="number" value="<%=rs.getString(7) %>" size="40"name="dob" required></td>
                    
                </tr>
                <tr align="left">
                    <td>MOBILE NUMBER :</td>
                    <td><input type="number" value="<%=rs.getString(6) %>" name="mobile" size="40" required></td>
                </tr>
                <tr align="left">
                    <td>ADDRESS :</td>
                    <td><textarea type="text" rows="5" cols="20" value="<%=rs.getString(8) %>" size="40" name="address" required><%=rs.getString(8) %></textarea></td>
                    
                </tr>
                
                
                <tr align="left">
                    <td>QUALIFICATION :</td>
                    <td><select name="qual">
                        <option name=""><%=rs.getString(9) %></option>
                        <option name="one" value="3-YEARS DEGREE">3-YEARS DEGREE</option>
                        <option name="two" value="B.TECH">B.TECH</option>
                        <option name="three" value="MASTER OF COMPUTER APPLICATIONS">MASTER OF COMPUTER APPLICATIONS</option>
                        <option name="four" value="MASTER OF SCIENCE">MASTER OF SCIENCE</option>
                    </select>
                        
                    </td>
                    
                    
                </tr>
                <tr align="left">
                    <td>SPECIALIZATION :</td>
                    <td><select name="special">
                        <option name=""><%=rs.getString(10) %></option>
                        <option name="ekh" value="MATHEMATICS">MATHEMATICS</option>
                        <option name="dho" value="STATASTICS">STATASTICS</option>
                        <option name="theen" value="PHYSICS">PHYSICS</option>
                        <option name="char" value="CHEMISTRY">CHEMISTRY</option>
                        <option name="panch" value="COMPUTER SCIENCE">COMPUTER SCIENCE</option><select></td>
                    
                </tr>
                <tr align="left">
                    <td>PERCENTAGE :</td>
                    <td><input type="double" value="<%=rs.getString(12) %>" size="40" name="percent" required></td>
                    
                </tr>
                <tr align="left">
                    <td>YEAR OF PASSING :</td>
                    <td><input type="number" value="<%=rs.getString(11) %>" size="40" maxlength="4" name="yop" required></td>
                    
                </tr>
 </div>
</table><br>
                    
                    <a href="studentProfile.jsp"><input type="button" value="CANCEL" style="background-color:royalblue;color:white;width:100px;height:40px;"/></a>
                    
                    
                    <input type="submit" value="UPDATE" style="background-color:green;color:white;width:100px;height:40px;"/>
                    </form>
<%
            }
        //response.sendRedirect("studentLoginForm.jsp"); 
    }

                    
        else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}

%>
</body>
    <script>
        function validation()
        {
            var n=document.getElementByName("studentname");
            var f=document.getElementByName("fname");
            var m=document.getElementByName("fname");
            var a=document.getElementByName("address");
            var d=document.getElementByName("dob");
            var q=document.getElementByName("qual");
            var s=document.getElementByName("special");
            var g=document.getElementByName("gender");
            var mo=document.getElementByName("mobile");
            var p=document.getElementByName("percent");
            var y=document.getElementByName("yop");
            var e=document.getElementByName("exp");
            if(n=="" || f=="" || m=="" || a=="" || d=="" || q=="" || s=="" || g=="" || mo=="" || p==""  || y=="" || e=="")
            {
                alert("FILL ALL FIELDS");
                return false;
            }
            else
            {
                return true;
            }
            
            
            
        }
        </script>
        </html>
