<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Manage Product</title>

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

<!-- container style -->
<style>
#content{
	margin:10px;
	margin-top: 60px;
	padding:20px;
}
/*tab*/
#tab{
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}
#tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}
#tab button:hover {
    background-color: #ddd;
}
#tab button.active {
    background-color: #ccc;
}
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
	
/* add tab */
#Add td{
	padding:10px;
}
	
/* update tab */
#Update td{
	border:solid 1px black; 
	word-wrap:break-word;
}
#Update table{
	border-collapse:collapse; 
	table-layout:fixed; 
}
/* Pagination links */
.pagination a {
    color: black;
    padding: 0px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

/* Add a grey background color on mouse-over */
.pagination a:hover:not(.active) {background-color: #ddd;}
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
        <li><a href="+
        
        
        
        ">About us</a></li>
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


<!-- content -->
<div id="content">
	<div id="tab">
      <button class="tablinks" onclick="openTab(event, 'Add')">Add</button>
      <button id="defaultOpen" class="tablinks" onclick="openTab(event, 'Update')">Update</button>
      <button id="defaultOpen" class="tablinks" onclick="openTab(event, 'Report')">Search</button>
      
    </div>
    
    <!-- add tab -->
    <form method="post" action="/SugarScarf/AddProductController">
    <div id="Add" class="tabcontent" align="center">
		<table>
			<tr><td colspan="2" align="center"><h1>Add New Product</h1></td></tr>
      
      		<tr><td>Product Name :</td>
     		<td><input type="text" name="Add_name" /></td></tr>
      
      		<tr><td>Product Price :</td>
      		<td><input type="text" name="Add_price" /></td></tr>
      
		 	<tr><td>Product Category :</td>
		 	<td><select name="Add_type">
		 		<option value="">Select one</option>
		 		<option value="">____________</option>
				<option value="Square Printed">Square Printed</option>
				<option value="Satin Ombre">Satin Ombre</option>
				<option value="Satin Printed">Satin Printed</option>
				<option value="">____________</option>
				<option value="Plain Shawl">Plain Shawl</option>
				<option value="Satin Shawl">Satin Shawl</option>
				<option value="Neck Shawl">Neck Shawl</option>
				<option value="Ombre">Ombre</option>
				<option value="Floral">Floral</option>
				<option value="">____________</option>
				<option value="Inner Neck">Inner Neck</option>
		 	</select></td></tr>
      
      		<tr><td>Product Description :</td>
      		<td><textarea name="Add_descrip" rows="4"></textarea></td></tr>
      		      		      		
      		<tr><td>Product Image :</td>
     		<td><input type="file" name="Add_image" value=""/></td></tr>
      
      		<tr><td colspan="2" align="center"><input type="submit" name="action" value="Add Product"/>   
			<input type="reset" value="Reset"/></td></tr>
      	</table>
     </div>
     </form>
     
    <!-- update tab -->
    <div id="Update" class="tabcontent" align="center">
		<table>
			<!-- top pagenation no-->
			<tr>
				<td colspan="10" align="right">	
							
				</td>
			</tr>
			<tr>
				<td width="100px" align="center">Product Id</td>
				<td width="100px" align="center">Product Name</td>
				<td width="200px" align="center">Product Image</td>
				<td width="100px" align="center">Product Price</td>
				<td width="100px" align="center">Product Type</td>
				<td width="100px" align="center">Product Description</td>				
				<td width="70px">&nbsp;</td>
				<td width="70px">&nbsp;</td>
			</tr>
       <!-- create list from database  -->        
       <c:forEach items="${products}" var="product">
            <tr width="1000px">
              	<td width="100px" align="center"><c:out value="${product.proId}"/></td>
				<td width="100px"><c:out value="${product.proname}"/></td>
				<td width="200px" style="padding:10px;" align="center">
				    <img src="<c:out value="/SugarScarf/Images/${product.proimage}"/>"  height="170px" width="170px" alt="${product.proimage}">
				</td>
				<td width="100px" align="center"><c:out value="${product.proprice}"/></td>
				<td width="100px" align="center"><c:out value="${product.protype}"/></td>
				<td width="100px" align="center"><c:out value="${product.prodesc}"/></td>				
				<td width="70px" align="center"><a href="EditProductController?id=<c:out value="${product.proId}"/>">Edit</a></td>
				<td width="70px" align="center"><a href="DeleteProductController?id=<c:out value="${product.proId}"/>">Delete</a></td>
            </tr>
         </c:forEach>
        	<!-- botton pagenation no -->
            <tr>
                <td colspan="10" align="right">
                </td>
            </tr>
        </table>  
    </div>
    <div id="Report" class="tabcontent" align="center">
        <table>
			<tr>
				<td><a href="/SugarScarf/search.jsp"><input type=button value="search"></a></td>
			</tr>
        </table>
    </div>
</div>


<div id="t-footer"></div>

<!--javascript(design purpose only) -->

<!-- javascript for tab -->
<script type="text/javascript">
function openTab(evt, TabName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(TabName).style.display = "block";
    evt.currentTarget.className += " active";	
}
document.getElementById("defaultOpen").click();
</script>

</body>
</html>