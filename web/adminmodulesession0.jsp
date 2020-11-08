
<%@page import="java.sql.*"%>
<%
    
                    
    String uname = request.getParameter("auname");
    String pass = request.getParameter("apsw");
    session.setAttribute("usernameadmin", uname);
    String user2=(String)session.getAttribute("usernameadmin");
    if(user2!=null)
    {
    try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
            String query1 = "select USERNAME,PASSWORD from ADMIN_LOGINDATA";
            PreparedStatement pst = con.prepareStatement(query1);
            ResultSet rs = pst.executeQuery();
            while(rs.next()) 
            {
                String users = rs.getString("USERNAME");
                String pass1 = rs.getString("PASSWORD");
                session.setAttribute("password", pass1);
                String pas2 = (String) session.getAttribute("password");
                
                if(uname.equals(users) & pass.equals(pass1))
                {
                response.sendRedirect("adminmodulesession.jsp");
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
        }
    catch(Exception e)
    {
        out.println("Exception : "+e);
    }
    }
    else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
    
    
    
    
    
    
    
                     

   
   
  %>  