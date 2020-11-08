<%@page import="java.sql.*"%>
<%
String name2=(String)session.getAttribute("usernamecom");
String pas2 = (String) session.getAttribute("password");

String company = request.getParameter("company");
String email = request.getParameter("mail");
String job = request.getParameter("job");
String loc = request.getParameter("location");
String skill = request.getParameter("skills");
String qual = request.getParameter("qual");
int percent = Integer.parseInt(request.getParameter("percentage"));
String special = request.getParameter("special");
int yop = Integer.parseInt(request.getParameter("yop"));
String drive = request.getParameter("drive");
String lastdate = request.getParameter("lastdate");

if(name2!=null)
{
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
        String query2 = "insert into COMPANY_REQUIREMENT values(?,?,?,?,?,?,?,?,?,?,?,current_timestamp)";
        PreparedStatement pst = con.prepareStatement(query2);
        pst.setString(1,email);
        pst.setString(2,company);
        pst.setString(3,job);
        pst.setString(4,loc);
        pst.setString(5,skill);
        pst.setString(6,qual);
        pst.setInt(7,percent);
        pst.setString(8,special);
        pst.setInt(9,yop);
        pst.setString(10,drive);
        pst.setString(11,lastdate);
        
        
        int r = pst.executeUpdate();
        if(r>0)
        {
            %><script>
                alert("SUBMITTED");
                window.location("recruitmentdetails.jsp");
            </script><%
                
        }
        else
        {
            %><script>
                alert("insert Failure");
                window.location("recruitmentdetails.jsp");
            </script><%
        }
        
        
    }
    catch(Exception e)
    {
        out.println("Exception  :  "+e);
    }
}
else {
response.sendError(407,"Need Authentication...! Please Re-Login");
}
    
%>