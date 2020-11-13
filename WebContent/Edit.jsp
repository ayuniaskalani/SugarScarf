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
</head>

<!-- container style -->
<style>
#content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
}
	
#Edit td{
	padding:10px;
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


<div id="content">
    <form method="post" action="/SugarScarf/UpdateProductController">
    
    <div id="Edit" align="center">
		<table>
			<tr><td colspan="2" align="center"><h1>Edit Product Details</h1></td></tr>
			<tr><td>Product Id :</td>
			<td><input type="text" name="productID" value="<c:out value="${product.proId}"/>" readonly/></td></tr>
      		
      		<tr><td>Product Name :</td>
     		<td><input type="text" name="Edit_name" value="<c:out value="${product.proname}"/>" required/></td></tr>
      
      		<tr><td>Product Price :</td>
      		<td><input type="text" name="Edit_price" value="<c:out value="${product.proprice}"/>" required/></td></tr>
      		
		 	<tr><td>Product Category :</td>
		 	<td><select name="Edit_type">
		 		<option value="">Select one</option>
		 		<option value="">____________</option>
		 		
				<option value="Square Printed" <c:if test="${product.protype.equals('Square Printed')}">Selected</c:if>>Square Printed</option>
				
				<option value="Satin Ombre" <c:if test="${product.protype.equals('Satin Ombre')}">Selected</c:if>>Satin Ombre</option>
				
				<option value="Satin Printed" <c:if test="${product.protype.equals('Satin Printed')}">Selected</c:if>>atin Printed</option>
				
				<option value="">____________</option>
				
				<option value="Plain Shawl" <c:if test="${product.protype.equals('Plain Shawl')}">Selected</c:if>>Plain Shawl</option>
				
				<option value="Satin Shawl" <c:if test="${product.protype.equals('Satin Shawl')}">Selected</c:if>>Satin Shawl</option>
				
				<option value="Neck Shawl"<c:if test="${product.protype.equals('Neck Shawl')}">Selected</c:if>>Neck Shawl</option>
				
				<option value="Ombre" <c:if test="${product.protype.equals('Ombre')}">Selected</c:if>>Ombre</option>
				
				<option value="Floral"<c:if test="${product.protype.equals('Floral')}">Selected</c:if>>Floral</option>
				
				<option value="">____________</option>
				
				<option value="Inner Neck" <c:if test="${product.protype.equals('Inner Neck')}">Selected</c:if>>Inner Neck</option>
				
		 	</select></td></tr>
      
      		<tr>
      		    <td>Product Description :</td>
      		    <td><textarea name="Edit_descrip" rows="4" required><c:out value="${product.prodesc}"/></textarea></td>
      		</tr>      		      	
      		
      		<tr>
				<td>Current Image :</td>
				<td><img src="<c:out value="/SugarScarf/Images/${product.proimage}"/>" height="100px" width="auto"></td>
     		</tr>
     		
     		<tr>
     			<td>Change Image :</td>
     			<td><input type="file" name="Edit_image"/></td>
     		</tr>
      
      		<tr>
      		    <td colspan="2" align="center">
      		        <input type="submit" value="Edit Product"/>   
			        <button onClick="window.location.href='manage_product.php'">Return</button>
                </td>
            </tr>
      	</table>
		</div>
    </form>
</div>

<div id="t-footer"></div>
</body>
</html>