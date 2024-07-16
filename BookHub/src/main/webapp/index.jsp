<%@page import="com.entity.User"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BookHub</title>
	<%@include file="all_component/allCss.jsp"%>
	<style type="text/css">
		.back-img {
			background: url("img/home_back_img.jpg");
			height: 30vh;
			width: 100%;
			background-size: cover;
			background-repeat: no-repeat;
		}
		.text {
			text-shadow: 2px 4px 4px rgb(33, 33, 33);
		}
		.crd-ho:hover {
			background-color: #fcfcfc;
		}
	</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<% User u =(User) session.getAttribute("userobj"); %>
	<div class="container-fluid back-img">
		<h2 class="h-100 d-flex align-items-center justify-content-center text text-white">BookHUB,
			where the world of books thrives in the virtual realm.</h2>
	</div>
	<!-- START recentBOOK -->
	<div class="container">
		<h3 class="text-center p-3">Recent Book</h3>
		<div class="row">
				<% BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list = dao.getRecentBooks();
					for (BookDtls b : list) { %>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>" style="width: 150px; height: 200px" class="img-thumblin">
						<P><%=b.getBookname() %></P>
						<p><%=b.getAuthor() %></p>
							<% if (b.getBookCategory().equals("Old")) { %>
							<p> Category: <%=b.getBookCategory()%></p>
							<div class="row justify-content-center">
							<% if (u == null) { %>
								<a href="login.jsp" class="btn btn-success btn-sm ml-1">View Details</a>
							<% } else { %>
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
							<% } %>
								<a href="" class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
							</div>
							<% } else { %>
								<p> Category: <%=b.getBookCategory()%></p>
							<div class="row justify-content-center">
								<% if (u == null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
								<% } else { %>
									<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
								<% } %>
								<a href="view_books.jsp?bid=<%=b.getBookId() %>"
									class="btn btn-success btn-sm ml-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
							</div>
							<% } %>
						</div>
				</div>
			</div>
				<% }%>
		<div class=" col text-center mt-1 py-3">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- END recent BOOK -->
	<!-- START New BOOK -->
	<div class="container">
		<h3 class="text-center p-3">Latest Book</h3>
		<div class="row">
				<% BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list2 = dao2.getNewBook();
					for (BookDtls b2 : list2) { %>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b2.getPhoto() %>" style="width: 150px; height: 200px" class="img-thumblin">
						<P><%=b2.getBookname() %></P>
						<p><%=b2.getAuthor() %></p>
						<p>Category: <%=b2.getBookCategory() %></p>
						<div class="row justify-content-center">
						<% if (u == null) { %>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<% } else { %>
								<a href="cart?bid=<%=b2.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<% } %>
							<a href="view_books.jsp?bid=<%=b2.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b2.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
				<% } %>
		<div class="col text-center mt-1 py-3">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- END new BOOK -->
	<!-- START OLD BOOK -->
	<div class="container">
		<h3 class="text-center p-3">Old Book</h3>
		<div class="row">
		<% BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b3 : list3) { %>
		<div class="col-md-3">
		<% if (b3.getBookCategory().equals("Old")) { %>
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b3.getPhoto() %>" style="width: 150px; height: 200px" class="img-thumblin">
						<P><%=b3.getBookname() %></P>
						<p><%=b3.getAuthor() %></p>
						<p>Category: <%=b3.getBookCategory()%></p>
							<div class="row justify-content-center">
								<% if (u == null) { %> 
								<a href="login.jsp" class="btn btn-success btn-sm ml-1">View Details</a>
								<% } else { %>
									<a href="view_books.jsp?bid=<%=b3.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
								<% } %>
								<a href="" class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b3.getPrice()%></a>
							</div>
					</div>
				</div>
			</div>
			<% } } %>
		</div>
		<div class="col text-center mt-1 py-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- END OLD BOOK -->
	</div>
	</div>
	<!-- FOOTER -->
	<%@include file="all_component/footer.jsp" %>
</body>
</html>