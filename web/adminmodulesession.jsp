<%@page import="java.sql.*"%>
<%
            String user2 = (String) session.getAttribute("usernameadmin");
            String pas2 = (String) session.getAttribute("password");         
            if(user2!=null)
            {
                response.sendRedirect("adminModule.jsp");
            }
            else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
            
%>