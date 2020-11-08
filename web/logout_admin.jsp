<%
String user=(String)session.getAttribute("username");

String user2=(String)session.getAttribute("usernameadmin");
session.invalidate();
response.sendRedirect("index.jsp");
%>