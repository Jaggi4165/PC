<%@page import="java.sql.*"%>
<%
   
String name2 = (String) session.getAttribute("usernamecom");
String chkby=request.getParameter("chkby");

String user2 = (String) session.getAttribute("usernameadmin");

if(name2!=null)
{
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
    String query2 = "delete messages where message=? and RECIEVER=?";
    PreparedStatement pst2 = con.prepareStatement(query2);
    pst2.setString(1,chkby);
    pst2.setString(2,name2);
    pst2.executeQuery();
    response.sendRedirect("rinbox.jsp");
}
catch(Exception e){
    out.println(e);
}
}
else if(user2!=null) {
    
    try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
    String query2 = "delete messages where message=? and RECIEVER=?";
    PreparedStatement pst2 = con.prepareStatement(query2);
    pst2.setString(1,chkby);
    pst2.setString(2,name2);
    pst2.executeQuery();
    response.sendRedirect("ainbox.jsp");
}
catch(Exception e){
    out.println(e);
}
    
}








%>