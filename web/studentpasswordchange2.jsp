

<%@page import="java.sql.*"%>
<%
    
    String name=(String)session.getAttribute("username"); 
if(name!=null)
{
    try
    {
         Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
 String query1= "select * from STUDENT_DATA where EMAIL=?";
 PreparedStatement pst = con.prepareStatement(query1);
 pst.setString(1,name);
 ResultSet rs= pst.executeQuery();
 if(rs.next())
 {
     
 %>
 <html>
     <head>
         <link rel="stylesheet" type="text/css" href="css/sheet.css">
         <link rel="stylesheet" type="text/css" href="css/loginformcss.css">
         
         
     </head>
     <body>
 
         <%@include file='sheader.jsp' %>
 <div class="bg" align="center" >
<body> 
        <form  align="center" onsubmit="return validate()" action="changepassword2_student.jsp" method="post" >
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
 </html><%
    }
}
    catch(Exception e)
    {
    
    }
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>