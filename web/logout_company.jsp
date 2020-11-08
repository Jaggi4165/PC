


<% String name2=(String)session.getAttribute("usernamecom"); 


session.invalidate();
response.sendRedirect("index.jsp");
%>