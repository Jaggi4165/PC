<%@page import="java.sql.*"%>
<%
    
String reciever=request.getParameter("email");
String message = request.getParameter("message");
String name2=(String)session.getAttribute("usernamecom"); 

String sender = name2;


try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
    String query2 = "insert into MESSAGES values(?,?,?,current_timestamp)";
    PreparedStatement pst2 = con.prepareStatement(query2);
    pst2.setString(1, sender);
    pst2.setString(2, reciever);
    pst2.setString(3, message);
    pst2.executeQuery();
    response.sendRedirect("rinbox.jsp");
}
catch(Exception e) {
    out.println("error is :"+e);
}
%>