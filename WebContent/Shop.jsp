<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shop : </title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style>
#footer{
	width: 100%;
	height: 250px;
	margin-top: 10px;
	padding: 20px;
	background-color: gray;
}
#f-column-warp{
	display: block;
}
.f-column{
	float: left;
	width: 23.5%;
	margin: 8px;
	
}
.f-column h1{
	color: white;
	display: table-row;
}
.f-column a{
	color: white;
	display: table-row;
}
.f-column p{
	color: white;
	display: table-row;
}

/* CSS : product card */
#content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
	
}
#container{
	width : 1200px;
	overflow: hidden;
}
	
/* side bar */
#sidebar-warp{
	width: 20%;
	float: left;
	padding: 20px;
}
#sidebar-warp a{
	color: black;
	display: table-row;
}
	
/* product side */
#product-warp{
	width: 80%;
	float: right;
	padding: 20px;
	display: flex;
	flex-wrap: wrap;
}
.prod-card{
	width: 23%;
	box-shadow: 0 4px 10px 0 rgba(255, 0, 0, 0.2);
	margin:5px;
	overflow: hidden;
}
.prod-card a{
	color: black;
}
.prod-card img{
	max-width: 100%;
	height: auto;
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
        <li><a href="">Location</a></li>
        <li><a href="">About us</a></li>
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
	<div id="container">
		<div id="sidebar-warp">
			<a href="Shop.php?type=New"><b>NEW!!</b></a>
  			<hr>
  			<a href="ProductController?action=filter&type=Square"><b>Square</b></a>
  			<a href="ProductController?action=filter&type=Square Printed">Square Printed</a>
            <a href="ProductController?action=filter&type=Satin Ombre">Satin Ombre</a>
            <a href="ProductController?action=filter&type=Satin Printed">Satin Printed</a>
  			<hr>
  			<a href="ProductController?action=filter&type=Shawl"><b>Shawl</b></a>
			<a href="ProductController?action=filter&type=Plain Shawl">Plain Shawl</a>
			<a href="ProductController?action=filter&type=Ombre Shawl">Ombre Shawl</a>
			<a href="ProductController?action=filter&type=Neck Shawl">Neck Shawl</a>
			<a href="ProductController?action=filter&type=Ombre">Ombre</a>
			<a href="ProductController?action=filter&type=Floral">Floral</a>
  			<hr>
  			<a href="ProductController?action=filter&type=Inner Neck"><b>Inner Neck</b></a>
  			<hr>
  			<a><b>By Price</b></a>
  			<a href="ProductController?action=filter&type=100">RM1 - RM50</a>
  			<a href="ProductController?action=filter&type=200">RM51 - RM100</a>
  			<a href="ProductController?action=filter&type=300">RM101 - RM150</a>
  			<a href="ProductController?action=filter&type=400">RM151 - RM200</a>
  			<a href="ProductController?action=filter&type=rich">RM201 and Above</a>
   		</div>
   		
		<div id="product-warp">			
	   		<c:forEach items="${productList}" var="product">
				<div class="prod-card" align="center">
					<a href="/SugarScarf/ProductController?action=viewDetail&proId=<c:out value="${product.proId}"></c:out>">
						<div>
							<img src="<c:out value="/SugarScarf/Images/${product.proimage}"/>"/><br/>
						</div>
						<hr>
						<div>
							<p><c:out value="${product.proname }"/></p>
							<p><b>RM<c:out value="${product.proprice}"/></b></p>							
						</div>
						</hr>
					</a>
		
				</div>			
			</c:forEach>
		</div>
    </div>
</div>
</body>
</html>
