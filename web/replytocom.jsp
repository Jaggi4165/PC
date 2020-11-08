<%@page import="java.sql.*"%>
<%@include file="sheader.jsp"%>
<div >
    <a href="inbox.jsp"><input type="button" value="INBOX"></a>
</div>
<%
            String name = (String) session.getAttribute("username");
            String pas2 = (String) session.getAttribute("password");
            String chk = request.getParameter("chkby");
            
            //String pas = (String) session.getAttribute("password");

                if (name != null) 
                {
                    %>
                        <form action="sendQueryto.jsp" method="post">
                        <center>
                            <table><tr><td>
                                        TO :<select name="email" required>
                                <option ><%=chk%></option>
                       
                            
                            </select></td><br>
                                <td><textarea name="message" rows="5" cols="25" placeholder="text your message here" required></textarea></td>
                                <td><input type="submit" value="SEND"></td>
                        </center>
                    </form>
                    <%
                

                }

                else {
                    response.sendError(407,"Need Authentication...! Please Re-Login");
                }
%>            