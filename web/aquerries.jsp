<%@page import="java.sql.*"%>
<%@include file="aheader.jsp"%>
<div >
    <a href="ainbox.jsp"><input type="button" value="INBOX"></a>
</div>
<%
            String user2 = (String) session.getAttribute("usernameadmin");
            
            String rply=request.getParameter("chkby");

            
            //String pas = (String) session.getAttribute("password");

                if (user2 != null) 
                {
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jaggi", "password");
                        String query2 = "select EMAIL from logindata_table";
                        String q2="select COMPANY_MAIL from RECRUITER_LOGINDATA";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        PreparedStatement pst = con.prepareStatement(q2);
                        ResultSet rs = pst2.executeQuery();
                        ResultSet rs2 = pst.executeQuery();
                        %>
                        <form action="sendQuerytouser.jsp" method="post">
                        <center>
                            <table><tr><td>
                                        TO :<select name="email"  required>
                                <option><%=rply%></option>
                                
                                <%
                  while(rs.next())
                  {
%>                                <option><%=rs.getString("EMAIL")%></option>       
                                  

                                
                    <% } 
                    while(rs2.next()) {
%><option><%=rs2.getString("COMPANY_MAIL")%></option><%
}
                    
                    
                    
                    %>
                            
                            </select></td><br>
                                <td><textarea name="message" rows="5" cols="25" placeholder="text your message here" required></textarea></td>
                                <td><input type="submit" value="SEND"></td>
                        </center>
                    </form>
                    <%
                       
                }
                catch(Exception e)
                {

                }

                }

                else {
                    response.sendError(407,"Need Authentication...! Please Re-Login");
                }
%>            