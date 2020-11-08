
<%
    
String name=(String)session.getAttribute("username"); 


session.invalidate();


    response.sendRedirect("index.jsp");


    %>