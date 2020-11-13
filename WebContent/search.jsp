<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "Bean.ProductBean,Dao.ProductDao,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% List<ProductBean> beans = ProductDao.getAllProduct(); %>
	<form method="post" action="SearchController">
		Search Product Name:<input type ="text" name = "productname">
		<input type = "submit" value = "Search">
	</form>
	
	<% String productname = request.getParameter("productname"); %>
	<table border="1">
		<tr>
			<td>Product Id</td>
			<td>Product Name</td>
			<td>Product Image</td>
			<td>Product Price</td>
			<td>Product Type</td>
			<td>Product Description</td>
			
		</tr>

		<%	for(ProductBean p:beans){ 
		if (p.getProname().equalsIgnoreCase(productname)){%>
<tr>
	<td><%= p.getProId()%></td>
	<td><%= p.getProname() %></td>
	<td><%= p.getProimage() %></td>
	<td><%= p.getProtype() %></td>
	<td><%= p.getProprice() %></td>
	<td><%= p.getProdesc() %></td>
	
<%}}%>
</tr>
</table><br>
<a href="Home.jsp"><input type="button" value="Back"></a><br>

</body>
</html>