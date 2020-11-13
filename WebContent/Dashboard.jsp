<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $("#t-header").load("header.php");
	$("#t-footer").load("footer.php");
    });
</script>
</head>

<style>
#content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
}
#container{
	width: 1200px;
	padding :10px;
	overflow: hidden;
}
	
/* side bar */
#sidebar-warp{
	width: 25%;
	float:left;
}
#sidebar-warp a, #sidebar-warp h1{
	display: table-row;
}
	
/* tabcontent */
#tabcontent-warp{
	width: 70%;
	float:right;
}
.tabcontent{
	display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
	min-height: 300px;
}

/* tab-account-information */
#account-information{
	width: 100%;
	overflow: hidden;
}
#user-contact,#user-address{
	width: 50%;
	float:left;
}
#user-contact p{
	
}
/* tab-my-order */
	
/* tab-edit-account */
#edit_table td{
	padding: 10px;
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
      		<li><a href="/SugarScarf/UserController">Detail</a></li>
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


<div id="content" align="center">
	<div id="container">
		<!-- sidebar-warp -->
		<div id="sidebar-warp" align="left">
			<h1>MY ACCOUNT</h1>
			<hr>
			<a href="#" onclick="openTab(event, 'tab-account')" id="defaultOpen">Account Details</a>
			<a href="#" onclick="openTab(event, 'tab-order')">My Order</a>									
		</div> <!-- end of sidebar-warp -->
		
		<!-- tabcontent-warp -->
		<div id="tabcontent-warp">
			<!-- account tab -->
			<div id="tab-account" class="tabcontent">
				<h1 align="left">Account Details</h1>
				<p>&nbsp;</p>
				<p align="left"><b>Account Information</b></p>
				<hr>
				<div id="account-information">
					<div id="user-contact" align="left">
						<p><b>Contact Information</b><a href="#" onclick="openTab(event,'tab-setting')">Edit</a></p>
						<p><c:out value="${userDetail.name}"/></p>
						<p><c:out value="${userDetail.email}"/></p>
						<p><c:out value="${userDetail.phone}"/></p>
					</div>
					<div id="user-address" align="left">
						<p><b>Address Information</b>       <a href="#" onclick="openTab(event,'tab-setting')">Edit</a></p>
						<p><c:out value="${userDetail.address}"/></p>
					</div>
				</div>
				<hr>
			</div>
			<!-- end of tab-account -->
			
			<!-- order tab -->
			<div id="tab-order" class="tabcontent">
				<h1 align="left">My Order</h1>
				<p>&nbsp;</p>
				<p align="left"><b>Order Information</b></p>
				<hr>
				<div id="table">
				    <table width="100%">
				        <tr>
				            <td width="10%">Order Number</td>
				            <td width="10%">Date / Time</td>
				            <td width="15%">Total</td>
				            <td width="10%">Detail</td>
				        </tr>
				        <tr>
				            <td></td>
				            <td></td>
				            <td></td>
				            <td><a href="#">View Details</a></td>
				        </tr>
				        <?php }?>
				    </table>
				</div>
			</div><!-- end of tab-order-->
			
			<!-- account setting -->
			<div id="tab-setting" class="tabcontent">
				<h1 align="left">Setting</h1>
				<p>&nbsp;</p>
				<p align="left"><b>Edit Account Information</b></p>
				<hr>
				<div id="edit_table" align="left">
					<form action="/SugarScarf/UpdateUserController" method="post">
					<table>
						<!-- realname -->
						<tr>
							<td>Name: </td>
							<td><input type="text" name="realname" value="<c:out value="${userDetail.name}"/>" size="48"></td>
							
						</tr>
						<!-- address -->
						<tr>
							<td>Address: </td>
							<td><textarea name="address" rows="3" cols="50"><c:out value="${userDetail.address}"/></textarea></td>
							
						</tr>
						<!-- email -->
						<tr>
							<td>Email: </td>
							<td><input type="text" name="email" value="<c:out value="${userDetail.email}"/>" size="48" required></td>
							
						</tr>
						<!-- phone -->
						<tr>
							<td>Phone: </td>
							<td><input type="text" name="phone" value="<c:out value="${userDetail.phone}"/>" size="48" required></td>
							
						</tr>
						<!-- DoB -->
						<tr>
							<td>Birth Date:</td>
							<td><input type="date" name="birthdate" value="<c:out value="${userDetail.birthdate}"/>" required></td>
							 
						</tr>
						<!-- gender -->
						<tr>
							<td>Gender:</td>
							<td><select name="gender">							
							 	<option value="Male" <c:if test="${userDetail.gender.equals('Male')}">Selected</c:if>>Male</option>							
								<option value="Female" <c:if test="${userDetail.gender.equals('Female')}">Selected</c:if>>Female</option>
							</select></td>
						</tr>
						
						<!-- submit -->
						<tr>
							<td colspan="2" align="right">
								<input type="submit" name="action" value="Save">
								<input type="reset" value="Reset">
							</td>
						</tr>
					</table>
					</form>
				</div>
			</div> <!-- end of tab-setting -->
			
			<!-- change password -->
			<div id="tab-password" class="tabcontent">
				<h1 align="left">Change Password</h1>
				<p>&nbsp;</p>
				<p align="left"><b>Enter your new password</b></p>
				<hr>
				<div id="edit_table" align="left">
                <form action="php_lib/dash_pass_change.php" method="post">
				    <table>
                        <!-- old password -->
                        <tr>
                            <td>Old Password : </td>
                            <td><input type="text" name="old_password" required></td>
                        </tr>
                        <!-- new password -->
                        <tr>
                            <td>New Password : </td>
                            <td><input type="text" name="new_password1" required></td>
                        </tr>
                        <!-- confirm password -->
                        <tr>
                            <td>Confirm Password: </td>
                            <td><input type="text" name="new_password2" required></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <input type="submit" name="action" value="Change">
                                <input type="reset" value="Reset">
                            </td>
                        </tr>
				    </table>
				    </form>                              
				</div>
			</div> <!-- end of tab-password -->	
			
		</div><!-- end of tabcontent-warp -->
	</div><!-- end of container -->
</div><!-- end of content -->

<div id="t-footer"></div>

<!-- javascript -->
<script>
function openTab(evt, Tabname) {
    var i, tabcontent, tablinks;
	
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
	
    document.getElementById(Tabname).style.display = "block";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();
</script>
</body>
</html>