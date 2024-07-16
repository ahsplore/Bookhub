<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	  
	  <%
	  	int bid = Integer.parseInt(request.getParameter("bid"));
	  BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	  BookDtls b = dao.getBookById(bid);
	  %>
	  
 	<div class="container p-4">
		<div class="row p-5">
			<div class="col-md-6 text-center justify-content-center p-5 border bg-white">
				<img src="book/<%=b.getPhoto() %>" style="height: 190px; width: 150px">
				<br>
				<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>

				<h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>

				<h4>Category: <span class="text-success"><%=b.getBookCategory() %></span></h4>

			</div>
			
			<div class="col-md-6 text-center justify-content-center p-5 border bg-white">
				<h2><%=b.getBookname() %></h2>
				
				<%
					if ("Old".equals(b.getBookCategory())) 
					{
				%>
				<br>
				<h5 class="text-primary"><em>Contact To Seller</em></h5>
				<h4><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail() %></h4>
				
				<% }
				%>
				
				<br>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bills fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-right-arrow-left fa-2x"></i>
						<p>Easy Return</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-fast fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<br>
				
				<%
					if ("Old".equals(b.getBookCategory())) 
					{
				%>
				
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
					<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
				</div>
				
				<% } else { %>
				
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>
					<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
				</div>
				
				<% }
				%>
				
			</div>
		</div>
	</div>
	
</body>
</html>