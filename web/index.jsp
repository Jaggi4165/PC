<%@page import="java.sql.*"%>
<html>
<head>
<title> Training and placement cell </title>
<link rel="stylesheet" type="text/css" href="css/sheet.css"></link>
</head>
<body>
	<header>
        <img src="images/bullayyalogo.png">
        <img src="images/logo2.jfif" style="float:right;">
        <h1 style='padding-top: 05px;font-size: 50px;color:blue; text-shadow: 2px 2px black;'>PLACEMENT CELL</h1>
        <h2 style='padding-top: 05px;font-size: 40px;color:blue;text-shadow: 2px 2px black;'>Dr Lankapalli Bullayya P.G College</h2>
	
        
	</header>
<div class="nav">
<ul>
<li><a href="index.jsp"><img src="images/homeicon2.png" height="20px">Home</a></li>
<li><a href="loginpage.jsp"><img src="images/login.png" height="20px">Login</a></li>
<li><a href="Registration_student.jsp"><img src="images/regestration.png" height="20px">Registration</a></li>
<li><a href="gallery.jsp"><img src="images/gallerylogo2.png" height="20px">Gallery</a></li>
<li><a href="contact.jsp"><img src="images/phone.png" height="20px">Contact</a></li>
</ul>
</div>
    <link href='index.jsp'></link>
    <div>
        <marquee behavior="alternate" loop=10 direction="left">
            <img src="images/college1.jpg" height=200 width=300>
            <img src="images/college2.jpg" height=200 width=300>
            <img src="images/college3.jpg" height=200 width=300>
            <img src="images/college4.jfif" height=200 width=300>
            <img src="images/logo2.jfif" height=200 width=300>
            <img src="images/college5.jfif" height=200 width=300>
            <img src="images/college7.jpg" height=200 width=300>
            <img src="images/bullayyalogo.png" height=200 width=300>
            <img src="images/college8.jpg" height=200 width=300>
            
        </marquee>
    </div>
    <div  class="notifications" style="margin-right:800px;padding-left: 15px;">
        <h2 style="text-align: center;"><u><blink>NOTIFICATIONS</blink></u> : </h2><br> 
        
    <%  // NOTIFICATION FROM REQUIREMENT 
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna"); // TPC , nanna
 String query1= "select * from COMPANY_REQUIREMENT";
 PreparedStatement pst = con.prepareStatement(query1);
 ResultSet rs= pst.executeQuery();
 while(rs.next())
 {
 %> 
 <b><%=rs.getString(2)%></b> offers <b><%=rs.getString(3)%></b>.Apply Before <b style="color:maroon"><%=rs.getString(11)%></b><br>
 
 <% 
 }
%> 
</div>
 <%
}
catch(Exception e)
{
%><h5><%=e%></h5><%
}
%>
 
<div class="content">
<h1>About Dr. Lankapalli Bullayya P.G. College</h1>
<article>
    <p>Dr. Lankapalli Bullayya College or Dr. L. Bullayya College or Dr. L.B.College is an affiliated college of Andhra University established in 1973 named in honour of Dr. Lankapalli Bullayya who served as a vice-chancellor of Andhra University. The college campus is located in Resapuvanipalem, Visakhapatnam, Andhra Pradesh. This College was awarded A-grade by NAAC. 
<img src="images/college7.jpg" height=180 width=350>
<p>Academicians, bureaucrats and businessmen of Visakhapatnam formed into a not-for-profit education society called "The Society For Collegiate Education" with K. Jayabharat Reddy as President, Prof K.V. Sivayya as Secretary, Dr. M. Gopala Krishna Reddy as Treasurer, and started this college initially as a College of Commerce offering B.Com.

A wide variety of courses were added gradually and currently the College offers both the undergraduate as well as postgraduate courses in the Faculties of Commerce, Management, Arts and Sciences. In addition to these courses, College is also granted the status of Research Centre in some departments by Andhra University allowing students to pursue their M. Phil and Doctoral programmes.

Society for Collegiate Education has also started a Junior College in 1979 and a College of Engineering for Women in 2010.</p></div>

 <%@include file='sfooter.jsp' %>
 
 
</body>
</html>
