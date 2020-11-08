<%@page import="java.sql.*"%>
<%
String name=(String)session.getAttribute("username");
String pas2=(String)session.getAttribute("password");

if(name!=null)
{
    //session.setAttribute("username", name);
String opass = request.getParameter("old");
//out.println("old password is: " +opass);
String new1 = request.getParameter("new1");
//out.println("\nnew password is  is :" +new1);
String new2 = request.getParameter("new2");
//out.println("\n retypr passwrd is: : "+new2);
//out.println("\n username  is: : "+name);
        try 
        {  
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","TPC","nanna");
            String query1= "update logindata_table set PASSWORD=? where EMAIL=? AND PASSWORD=?";
            PreparedStatement pst = con.prepareStatement(query1);
            pst.setString(1,new2);
            pst.setString(2,name);
            pst.setString(3,opass);
            int x=pst.executeUpdate();
            if(x>0)
            {
 %>       <script>
     alert("password changed successfully");
     window.location="studentmodulesession.jsp";
     </script><%
         }
        else
        {
            %>       <script>
     alert("ENTER CORRECT PASSWORD / NOT CHANGED.. ");
     window.location="studentpasswordchange2.jsp";
     </script> <%
        }
             //response.sendRedirect("studentModule.jsp");
        }
        catch(Exception e)
        {
             
        }
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
 %>