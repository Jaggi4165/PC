<%@page import="java.sql.*"%>
<%@include file="sheader.jsp"%>
<div >
    <a href="inbox.jsp"><input type="button" value="INBOX"></a>
</div>
<%
            String name = (String) session.getAttribute("username");
            String pas2 = (String) session.getAttribute("password");
            
            //String pas = (String) session.getAttribute("password");

                if (name != null) 
                {
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select COMPANY_MAIL from recruiter_logindata";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        ResultSet rs = pst2.executeQuery();
                        %>
                        <form action="sendQueryto.jsp" method="post">
                        <center>
                            <table><tr><td>
                                        TO :<select name="email" required>
                                <option></option>
                                <%
                  while(rs.next())
                  {
%>                                <option><%=rs.getString("COMPANY_MAIL")%></option>
                    <% } %>
                            
                            </select></td><br>
                                <td><textarea name="message" rows="5" cols="25" placeholder="text your message here" required></textarea></td>
                                <td><input type="submit" value="SEND"></td>
                        </center>
                    </form>
                    <%
                       
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