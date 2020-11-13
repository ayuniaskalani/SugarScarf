<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Product</title>
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
.content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
}
#product{
	width: 1200px;
	overflow: hidden;
}
#product_img{
	width: 45%;
	float: left;
	overflow: hidden;
}
#product_detail{
	width: 45%;
	float: right;
}
</style>

<!-- body -->
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


<!-- content(modify here only)-->
<div class="content" align="center">
	<div id="product">
        <div id="product_img">
        	<img name = "productImg" src="<c:out value="/SugarScarf/Images/${productDetail.proimage}"/>" style="width: 80%;"/>
        </div>
        <form method="post" action="/SugarScarf/AddCartController">
        <input type="hidden" name="productID" value="<c:out value="${productDetail.proId}"/>">
        <div id="product_detail" align="center">        
        		<div id="detail_card">
					<h1><input type="hidden" name="productName" value=<c:out value="${productDetail.proname }"/>></h1>
					<p><b>RM<input type="hidden" name="productPrice" value=<c:out value="${productDetail.proprice}"/>></b></p>
      				<hr>
      				<h1>Description</h1>
      				<p><input type="hidden" name="productDetail" value="<c:out value="${productDetail.prodesc}"/>"></p>
      				<hr>
      				<p>&nbsp;</p>
     
      				<div id="amount-warp">
      					<input type="button" id="minus_btn" value="-" onclick="minus()">
  						<input type="text" size="1" value="1" id="amount" name="productQuantity" required>
       					<input type="button" id="plus_btn" value="+" onclick="plus()">
					</div>
     			<p>&nbsp;</p>
      			<button type="submit" id="add_cart" name="add">Add To Cart</button>
       			</div>
       		</div>
       	</form>
	</div>
</div>

<!-- footer -->
<div id="t-footer"></div>
<!--javascript-->
<script type="text/javascript" >
// minus-input-plus
    var countEl= document.getElementById('amount');
	var count = 1;
    function plus(){
		if (count < 10) {
		count++;
        countEl.value = count;
        }  
    }
    function minus(){
      if (count > 1) {
		count--;
        countEl.value = count;
      }  
    }
</script>
</body>
</html>