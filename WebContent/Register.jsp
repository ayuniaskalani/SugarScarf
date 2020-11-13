<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login and Registration</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $("#t-header").load("C:/Software Engineering/SugarScarf/WebContent/header.jsp");
	$("#t-footer").load("C:/Software Engineering/SugarScarf/WebContentWebContent/footer.jsp");
    });
</script>
</head>

<!-- container style -->
<style>
#content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
}
#login td{
	padding:15px;
}
#register td{
	padding:15px;
}
#staff td{
	padding:15px;
}

div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}
div.tab button:hover {
    background-color: #ddd;
}
div.tab button.active {
    background-color: #ccc;
}
.tabcontent {
	min-height: 400px;
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    overflow: hidden;
}
</style>

<body>
<!-- just design -->
 <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <img src="/SugarScarf/Images/image/sugar-logo.png" height="40">
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/SugarScarf/Home.jsp">Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Collection<span class="caret"></span></a>
          <ul class="dropdown-menu">
           	<li class="dropdown-header">Square</li>
            <li><a href="ProductController?action=filter&type=Square Printed">Square Printed</a></li>
            <li><a href="ProductController?action=filter&type=Satin Ombre">Satin Ombre</a></li>
            <li><a href="ProductController?action=filter&type=Satin Printed">Satin Printed</a></li>
            
            <li role="separator" class="divider"></li>
            <li class="dropdown-header">Shawl</li>
            <li><a href="ProductController?action=filter&type=PLain Shawl">Plain Shawl</a></li>
            <li><a href="ProductController?action=filter&type=Ombre Shawl">Ombre Shawl</a></li>
            <li><a href="ProductController?action=filter&type=Neck Shawl">Neck Shawl</a></li>
            <li><a href="ProductController?action=filter&type=Ombre">Ombre</a></li>
            <li><a href="ProductController?action=filter&type=Floral">Floral</a></li>
            
            <li role="separator" class="divider"></li>
            <li class="dropdown-header">Inner Neck</li>
            <li><a href="ProductController?action=filter&type=Inner Neck">Inner Neck</a></li>
          </ul>
        </li>
        <li><a href="Location.php">Location</a></li>
        <li><a href="About_us.php">About us</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
      	<c:when test="${userType.equals('customer')}">
      		<li><a href="/SugarScarf/UserController">Detail</a>
      		<li><a href="/SugarScarf/ViewCartController">Cart</a></li>
      		<li><a href="/SugarScarf/LogoutController">Logout</a></li>
      	</c:when>
      	<c:when test="${userType.equals('staff')}">
      		<li><a href="/SugarScarf/ManageProductController">Manage Product</a></li>
      		<li><a href="/SugarScarf/LogoutController">Logout</a></li>
      	</c:when>
      	<c:otherwise>
      		<li><a href="Register.jsp">Login or Register</a></li>
      	</c:otherwise>
      </c:choose>	
      </ul>
    </div>
  </div>
</nav>


<!-- content -->
<div id="content" align="center">

	<div class="tab">
  		<button id="defaultOpen" class="tablinks" onclick="openTab(event, 'login')" >Login</button>
 		<button class="tablinks" onclick="openTab(event, 'register')">Register</button>
  		<button class="tablinks" onclick="openTab(event, 'staff')" >Staff Login</button>
	</div>


	<div id="login" class="tabcontent">
    <form method="post" action="LoginController">
	<table>
        <tr><td>Username : </td><td><input type="text" name="username" required></td></tr>
        <tr><td>Password : </td><td><input type="password" name="password" required></td></tr>
        <tr><td colspan="2" align="center"><input name="action" type="submit" value="LOGIN"/></td></tr>
    </table>
    </form>
    </div>
    
    <div id="register" class="tabcontent">
    <form method="post" action="UserController">
    <table>
    	<tr>
		  <td>Name: </td>
		  <td><input type="text" name="realname" required/></td>				
		</tr>
		<tr>
		  <td>Address: </td>
		  <td><input type="text" name="address" required/></td>				
		</tr>
    	<tr>
          <td>Username : </td>
          <td><input type="text" name="username" required/></td>
        </tr>
        
        <tr>
          <td>Email: </td>
          <td><input type="text" name="email" required/></td>
        </tr>
       
        <tr>
            <td>Password : </td>
            <td><input type="password" name="password1" required/></td>
        </tr>
        
        <tr>
            <td>Confirm Password : </td>
            <td><input type="password" name="password2" required/></td>
        </tr>
        
        <tr>
            <td>BirthDate : </td>
            <td><input type="date" name="birthdate" required/></td>
        </tr>
        
        <tr>
            <td>Gender : </td>
            <td>
                <select name="gender">
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                </select>
            </td>
        </tr>
        
        <tr>
            <td>Phone number : </td>
            <td><input type="text" name="phone" required/></td>
        </tr>
        
        <tr>
            <td align="center"></td>
            <td>
                <input name="action" type="submit" value="REGISTER"/>
                <input type="reset" value="RESET"/>
            </td>
        </tr>
    </table>
    </form> <!-- end customer registration form -->
    </div>
    
    
	<div id="staff" class="tabcontent">
	<form method="post" action="StaffController">
	<table>
    	<tr><td colspan="2"><?php echo $error ?></td></tr>
        <tr><td>Username : </td><td><input type="text" name="username" required></td></tr>
        <tr><td>Password : </td><td><input type="password" name="password" required></td></tr>
        <tr><td colspan="2" align="center"><input name="action" type="submit" value="STAFF LOGIN"/></td></tr>
    </table>
    </form>
    </div>
</div>

<!-- footer -->
<div id="t-footer"></div>

<!--javascript(design purpose only) -->
<!-- tab -->
<script type="text/javascript">
function openTab(evt, Tabname) {
    var i, tabcontent, tablinks;
	
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    document.getElementById(Tabname).style.display = "block";
    evt.currentTarget.className += " active";
    
}
document.getElementById("defaultOpen").click();
</script>

</body>
</html>