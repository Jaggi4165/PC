<%@page import="java.sql.*"%>
<%
            String name2=(String)session.getAttribute("usernamecom");
            String pas2 = (String) session.getAttribute("password");        
            if(name2!=null)
            {
                response.sendRedirect("recruiterModule.jsp");
            }
            else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
            
%>