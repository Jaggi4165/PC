<%@page import="java.sql.*"%>
<%@include file="rheader.jsp"%>
<div >
    <a href="rinbox.jsp"><input type="button" value="INBOX"></a>
</div>
<%
            String name2 = (String) session.getAttribute("usernamecom");
            
            
            //String pas = (String) session.getAttribute("password");

                if (name2 != null) 
                {
                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TPC", "nanna");
                        String query2 = "select * from MESSAGES where RECIEVER=? order by time desc";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1,name2);
                        ResultSet rs = pst2.executeQuery();
                        %>
                        <center>
                        <table border="1"><tr align="center"><td>SENDER</td>
                                <td>MESSAGE</td>
                                <td>RECIEVED TIME</td><td>REPLY</td><td>DELETE</td></tr>
                        <%
                        while(rs.next())
                        {
                            String a=rs.getString(3);
                            String b=rs.getString(1);
                            
                            
                            
                            %>
                            <tr align="center"><td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><a href="rquerries.jsp?chk1=<%=b%>">REPLY</a></td>
                            <td><a href="delmsg.jsp?chkby=<%=a%>">DELETE</a></td></tr>
                            
                            <%
                        }
                        %>
                        </center>
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