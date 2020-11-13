<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
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
#content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
}

.con-card-warp{
	width : 1200px;
	overflow: hidden;
	display: flex;
	flex-wrap: wrap;
}
.prod-card{
	width: 20%;
	overflow: hidden
}
.prod-card a{
	color: black;
}
.prod-card img{
	max-width: 100%;
	height: auto;
}
#tutorial{
	margin-top: 10px;
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
	<h1>SUGARSCARF</h1>
   <hr>
    <!-- slideshow -->
	<div id="slideshow" class="carousel slide" data-ride="carousel">
   		<div class="carousel-inner">
   			<div class="item active">
				<img src="/SugarScarf/Images/slideshow/Slideshow 2.jpg" style="width:100%">
			</div>
			<div class="item">
				<img src="/SugarScarf/Images/slideshow/Slideshow 3.jpg" style="width:100%">
			</div>
			<div class="item">
				<img src="/SugarScarf/Images/slideshow/Slideshow 4.jpg" style="width:100%">
			</div>
		</div>
	   <!-- Left and right controls -->
		<a class="left carousel-control" href="#slideshow" data-slide="prev">
		  <span class="glyphicon glyphicon-chevron-left"></span>
		  <span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#slideshow" data-slide="next">
		  <span class="glyphicon glyphicon-chevron-right"></span>
		  <span class="sr-only">Next</span>
		</a>       
    </div>
    
    <!-- New arrival -->
    <div class="product-display" align="center">
    	<h1>New Arrival</h1>
    	<hr>
		<div class="con-card-warp">
    		<?php while($product = mysqli_fetch_array($result)){?>
                <div class="prod-card" align="center">
                   <a href="Product.php?product_id=<?php echo $product['product_id'];?>" class="image">
                        <!-- <div>
                            <img src="<?php echo $product['product_imagepath']?>"/><br/>
                        </div>--.
                       <!-- <hr> --> 
                       <!--   <div>
                            <p><?php echo $product['product_name'] ?></p>
                            <?php if($product['product_amount']==0){?><p>Sold Out</p><?php }?>
                        </div> -->
                    </a>
                </div>
    		<?php }?>
   		</div>
	</div>
	
	<!--<div id="tutorial" align="center">
		<h1>Tutorial</h1>
		<hr>
		<div id="tutorial-warp">
			<iframe width="100%" height="300" src="https://www.youtube.com/">
			</iframe>
		</div>
	</div>-->
</div>
	

<div id="footer">
	<div id="f-column-warp">
		<div class="f-column">
		<h1>Navigation</h1>
		<hr>
		<a href="Home.jsp">Home</a>
		<a href="">About us</a>
		<a href="Register.jsp">Login</a>
		</div>
		<div class="f-column">
			<h1>Useful Links</h1>
			<hr>
			<a href="https://www.pinterest.com/pin/371969250447144816/">Tutorial</a>
			<a href="#">Trending</a>
			<a href="#">Size Chart</a>
		</div>
		<div class="f-column">
			<h1>Follow Us</h1>
			<hr>
			<a href="https://www.facebook.com/sugarscarf">Facebook</a>
			<a href="#">Twitter</a>
			<a href="https://www.instagram.com/sugarscarf/">Instagram</a>
			<a href="https://www.youtube.com/">Youtube</a>
		</div>
		<div class="f-column">
			<h1>Subscribe Us</h1>
			<hr>
			<p>Enter for latest update :</p>
			<p>&nbsp;</p>
			<form>
			<p><input type="text"><button type="button">JOIN</button></p>
			</form>
		</div>							
	</div>
</div>

</body>
<script>
</script>
</html>
