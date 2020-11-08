<%-- 
    Document   : studentLoginForm
    Created on : Jan 23, 2020, 11:13:29 AM
    Author     : user
--%>


<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='header.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>training and placementcell\studentloginpage</title>
        <link rel="stylesheet" type="text/css" href="css/loginformcss.css">
        <link rel="stylesheet" type="text/css" href="css/sheet.css">
        
            

    </head>
    <body>
        
       
        
        <div align="center">
        
        <button  onclick="document.getElementById('id01').style.display='block'" style="font-size:17px;border-radius: -50%;background-color:#ffbff9;color:black;width:200px;height:50px;">STUDENT LOGIN</button>
        <button  onclick="document.getElementById('id02').style.display='block'" style="font-size:17px;border-radius: -50%;background-color:#ffbff9;color:black;width:200px;height:50px;">RECRUITER LOGIN</button>
        <button  onclick="document.getElementById('id03').style.display='block'" style="font-size:17px;border-radius: -50%;background-color:#ffbff9;color:black;width:200px;height:50px;">ADMIN LOGIN</button>
        </div>
        


        <div id="id01" class="modal">
  
  <form class="modal-content animate" action="studentmodulesession0.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/user_image.png" alt="Avatar" class="avatar">
      <h1 alt="Avatar" class="avatar">STUDENT</h1>
    </div>
      

    <div class="container">
       
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="suname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="spsw" required>
      
      
      
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      
      <span  class="psw">Forgot <a href="studentpasswordchange3.jsp">password?</a></span>
      <span align="right">Forgot <a href="studentuseridchange.jsp">UserId?</a></span>
    </div>
  </form>
</div>
                      <script>
// Get the modal


var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script> 


        
        <div id="id02" class="modal">
  
  <form class="modal-content animate" action="recruitermodulesession0.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images\user_image.png" alt="Avatar" class="avatar">
      <h1 alt="Avatar" class="avatar">RECRUITER</h1>
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="runame" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="rpsw" required>
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>
        <script>
// Get the modal
var modal2 = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal2) {
        modal.style.display = "none";
    }
}
</script>

        
        
        
        <div id="id03" class="modal">
  
  <form class="modal-content animate" action="adminmodulesession0.jsp" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images\user_image.png" alt="Avatar" class="avatar">
      <h1 alt="Avatar" class="avatar">ADMIN</h1>
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="auname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="apsw" required>
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>


<script>
// Get the modal
var modal3 = document.getElementById('id03');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal3) {
        modal.style.display = "none";
    }
}
</script>
<script>
    function home() {
        window.location.href="index.html";
    }
</script>

<%@include file='sfooter.jsp' %>
    </body>
</html>
