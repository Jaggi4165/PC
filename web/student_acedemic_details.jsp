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
         <%@include file='sheader.jsp' %>
<%
    String name = (String) session.getAttribute("username");

    if (name != null) {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
        String query1 = "select * from student_data2 where EMAIL=?";
        PreparedStatement pst = con.prepareStatement(query1);
        pst.setString(1, name);
        //pst.setString(2, pas);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
%>


<form onsubmit="return validaton()" action="editstudentdetails2store.jsp" method="post">
 
        <div align="center" style="padding-top:30px;">
            <h4 align="center">EDIT YOUR ACEDEMIC DETAILS</h4><br>
        <table border="0" padding="50px" backgroundcolor="lightyellow">
            
            <tr>
                <td>EMAIL</td>
                <td colspan="4"><input type="text" id="mail" size="40" name="email" value="<%=rs.getString(1)%>"></td>
            </tr>
            
            <tr>
                <td>.. </td>
                <td>HALL TICKET NO</td>
                <td>YEAR OF PASSING</td>
                <td>PERCENTAGE </td>
            </tr>
            <tr>
                <td> SSC </td>
                <td><input type="text" name="sscht" value="<%=rs.getString(2)%>"></td>
                <td><input type="text" name="sscyop" value="<%=rs.getString(3)%>"></td>
                <td><input type="text" name="sscgp" value="<%=rs.getString(4)%>"> </td>
            </tr>
            <tr>
                <td> INTER </td>
                <td><input type="text" name="interht" value="<%=rs.getString(5)%>"></td>
                <td><input type="text" name="interyop" value="<%=rs.getString(6)%>"></td>
                <td><input type="text" name="intergp" value="<%=rs.getString(7)%>"> </td>
            </tr>
            <tr>
                <td> DEGREE </td>
                <td><input type="text" name="ught" value="<%=rs.getString(8)%>"></td>
                <td><input type="text" name="ugyop" value="<%=rs.getString(9)%>"></td>
                <td><input type="text" name="uggp" value="<%=rs.getString(10)%>"></td>
            </tr>
            <tr>
                <td> PG </td>
                <td><input type="text" name="pght" value="<%=rs.getString(11)%>"></td>
                <td><input type="text" name="pgyop" value="<%=rs.getString(12)%>"></td>
                <td><input type="text" name="pggp" value="<%=rs.getString(13)%>"> </td>
            </tr>
            
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
</html>