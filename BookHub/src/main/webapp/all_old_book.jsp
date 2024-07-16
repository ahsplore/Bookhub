<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Old Books</title>
	<%@include file="all_component/allCss.jsp"%>
	<style type="text/css">
		.back-img {
			background: url("img/home_back_img.jpg");
			height: 40vh;
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
	
	<div class="container-fluid">
		<div class="row">
		<% 
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getAllOldBook();
			for (BookDtls b3 : list3) {
		%>
		<div class="col-md-3 mt-3">
		<%
			if (b3.getBookCategory().equals("Old")) {
		%>
			
				<div class="card crd-ho">
					<div class="card-body text-center  bg-white">
						
						<img alt="" src="book/<%=b3.getPhoto() %>" style="width: 150px; height: 200px" class="img-thumblin">
						<P><%=b3.getBookname() %></P>
						<p><%=b3.getAuthor() %></p>
						<p>Category: <%=b3.getBookCategory()%></p>
							<div class="row justify-content-center">
								<a href="view_books.jsp?bid=<%=b3.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b3.getPrice()%></a>
							</div>
					</div>
				</div>
			
			<% } %>
			</div>
		
		<%
			}
		%>
	</div>
	
		</div>
</body>
</html>