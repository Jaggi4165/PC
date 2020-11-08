<%@page import="java.sql.*"%>
<%@include file="rheader.jsp"%>
<div >
    <a href="rinbox.jsp"><input type="button" value="INBOX"></a>
    <
</div>
<%
            String name2=(String)session.getAttribute("usernamecom");
            String pas2 = (String) session.getAttribute("password");
            String rply=request.getParameter("chkby");
            String b=request.getParameter("chk1");
            
            //String pas = (String) session.getAttribute("password");

                if (name2 != null) 
                {
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select EMAIL from LOGINDATA_TABLE";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        ResultSet rs = pst2.executeQuery();
                        %>
                        <form action="sendQuerytos.jsp" method="post">
                        <center>
                            <table><tr><td>
                                        TO :<select name="email"  required>
                                <option><%=b%></option>
                              
                                
                                <%
                  while(rs.next())
                  {
%>                                <option><%=rs.getString("EMAIL")%></option>
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

                }

                }

                else {
                    response.sendError(407,"Need Authentication...! Please Re-Login");
                }
%>            