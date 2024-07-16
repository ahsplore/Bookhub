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
	<title>All Recent Books</title>
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
			
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
		
		
	</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u =(User) session.getAttribute("userobj");
	%>
	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	
	<c:remove var="addCart" scope="session"/>	
	
	</c:if>
	<div class="container-fluid" >
		<div class="row">
		
		<% 
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDtls> list = dao.getAllRecentBook();
					for (BookDtls b : list) {
				%>
				
			<div class="col-md-3 mt-3">
				<div class="card crd-ho">
					<div class="card-body text-center bg-white">
						<img alt="" src="book/<%=b.getPhoto() %>" style="width: 100px; height: 150px" class="img-thumblin">
						<P><%=b.getBookname() %></P>
						<p><%=b.getAuthor() %></p>
								<%
								if (b.getBookCategory().equals("Old")) {
								%>
							
								<p>
									Category:
									<%=b.getBookCategory()%></p>
							<div class="row justify-content-center">
								<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
							</div>
							<%
							} else {
							%>
								<p>
									Category:
									<%=b.getBookCategory()%></p>
									
							<div class="row justify-content-center">
								<% if (u == null) { %>
							
								<a href="login.jsp" class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
									
								<% } else { %>
									
									<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
								
								<% } %> <a href="view_books.jsp?bid=<%=b.getBookId() %>"
									class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%= b.getPrice() %></a>
							</div>
							<% } %>

						</div>
					</div>
				</div>
				<%
					}
				%>
	</div>
</body>
</html>