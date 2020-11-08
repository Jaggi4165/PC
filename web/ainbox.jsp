<%@page import="java.sql.*"%>
<%@include file="aheader.jsp"%>
<div >
    <a href="ainbox.jsp"><input type="button" value="INBOX"></a>
</div>
<%
    
            String user2 = (String) session.getAttribute("usernameadmin");
            
            String admin="LBC_COLLEGE";
            //String pas = (String) session.getAttribute("password");

                if (user2 != null) 
                {
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "jaggi", "password");
                        String query2 = "select * from querries where RECIEVER=? order by time desc";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1,admin);
                        ResultSet rs = pst2.executeQuery();
                        
                        %>
                        <center>
                        <table border="1"><tr align="center"><td>SENDER</td>
                                <td>MESSAGE</td>
                                <td>RECIEVED TIME</td><td>REPLY</td><td>DELETE</td></tr>
                        <%
                        while(rs.next())
                        {
                            String a=rs.getString("MESSAGE");
                            String b=rs.getString("SENDER");
                            
                            
                            %>
                            <tr align="center"><td><%=rs.getString("SENDER")%></td>
                                <td><%=rs.getString("MESSAGE")%></td>
                            <td><%=rs.getString("TIME")%></td>
                            <td><a href="aquerries.jsp?chkby=<%=b%>">REPLY</a></td>
                            <td><a href="delmsg.jsp?chkby=<%=a%>">DELETE</a></td></tr></table>
                            
                            <%
                                
                        }
                        %>
                        </center>
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