<%@page import="java.sql.*" %>
<%
    
    String uname = request.getParameter("runame");
    String pass = request.getParameter("rpsw");
    session.setAttribute("usernamecom", uname);
    //String name2 = (String) session.getAttribute("username2");
                     
    String name2=(String)session.getAttribute("usernamecom");
    
    
    //String pas=(String)session.getAttribute("password");
    if(name2!=null)
    {
    try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
            String query1 = "select * from recruiter_logindata where COMPANY_MAIL=? AND PASSWORD=?";
            PreparedStatement pst = con.prepareStatement(query1);
            pst.setString(1,name2);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) 
            {
                String pass1 = rs.getString("PASSWORD");
                //String un = rs.getString("USERNAME");
                //session.setAttribute("username", un);
                session.setAttribute("password", pass1);
                //String name = (String) session.getAttribute("username");
                String pas2 = (String) session.getAttribute("password");
                response.sendRedirect("recruitermodulesession.jsp");

            }
            else
            {
                %>
                <script>
                    alert(" INVALID LOGIN CREDENTIALS ");
                    window.location="loginpage.jsp";
                </script>
                <%
            }
    }
    catch(Exception e)
    {
        out.println(e);
    }
    }
    else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
%>
    
    
    
    
    
    
    
                     

   
   
  %>  