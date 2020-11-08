<%@page import="java.sql.*"%>
<%
            String name = (String) session.getAttribute("username");
            String pas2 = (String) session.getAttribute("password");         
            if(name!=null)
            {
                response.sendRedirect("studentModule.jsp");
            }
            else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
            
%>