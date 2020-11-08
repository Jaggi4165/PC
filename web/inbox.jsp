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
                        String query2 = "select * from MESSAGES where RECIEVER=? order by time";
                        PreparedStatement pst2 = con.prepareStatement(query2);
                        pst2.setString(1,name);
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
                            <tr align="center" ><td><%=rs.getString("SENDER")%></td>
                                <td size="250"><%=rs.getString("MESSAGE")%></td>
                            <td><%=rs.getString("TIME")%></td>
                            <td><a href="replytocom.jsp?chkby=<%=b%>">REPLY</a></td>
                            <td><a href="delmsgr.jsp?chkr=<%=a%>">DELETE</a></td></tr>
                            
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