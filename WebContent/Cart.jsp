<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cart</title>
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
#content-warp{
	width: 1200px;
	overflow: hidden;
}
#product-detail-warp{
	float: left;
	min-height: 245px;
	width: 74%;
	margin-right: 5px;
	padding: 5px;
}
#order-summary{
	float: right;
	width: 24%;
	padding: 5px;
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

<div id="content">
	<div id=content-warp>
		<h1>Your Cart</h1>
		<div id="product-detail-warp">
			<table style="width:100%">
				<tr>
					<td style="width:20%">IMAGE</td>
					<td style="width:50%">DESCRIPTION</td>
					<td style="width:10%">PRICE</td>
					<td style="width:10%">QUANTITY</td>
					<td style="width:10%"></td>
				</tr>
				<tr><td colspan="5"><hr></td></tr>
				<c:forEach items="${cartList}" var="cart">
					<tr height="155">
						<td align="center">
						    <a href="/SugarScarf/ProductController?action=viewDetail&cartId=<c:out value="${cart.cartId}"/>">
						        <img src="<c:out value="/SugarScarf/Images/${cart.proimage}"/>" height="150" width="auto">
						    </a>
					    </td>
						<td><c:out value="${cart.prodesc}"/></td>
						<td>RM<c:out value="${cart.proprice}"/></td>
						<td><c:out value="${cart.proQuantity}"/></td>
						<td align="center"></td>
						<td>
						    <a href="/SugarScarf/DeleteCartController?proId=<c:out value="${cart.proId}"/>">REMOVE</a>
	                    </td>                    
					</tr>
				</c:forEach>
			</table>
			<!-- 
				<p>Your shopping cart is empty. Go to <a href="Shop.php?type=New">Shopping</a>.</p>
			 -->
		</div>
		<div id="order-summary">
			<p><b>Order Summary</b></p>
			<hr>
			<p>Total: <b>RM</b></p>
			<hr>
			<button id="proceed" onclick="window.location.href='checkout_ship.php'" disabled>PROCEED TO CHECKOUT</button>
		</div>
	</div>
</div>
<div id="t-footer"></div>
<script>
</script>
</body>
</html>