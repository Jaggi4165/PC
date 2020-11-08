<%@page import="java.sql.*"%>
<%
     String name = (String) session.getAttribute("username");
     String chkr=request.getParameter("chkr");
    if(name!=null) {
    
    try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
    String query2 = "delete messages where message=? and RECIEVER=?";
    PreparedStatement pst2 = con.prepareStatement(query2);
    pst2.setString(1,chkr);
    pst2.setString(2,name);
    pst2.executeQuery();
    response.sendRedirect("inbox.jsp");
}
catch(Exception e){
    out.println("student :" +e);
}
} 
%>