<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookHub: Settings</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>

</head>
<body style="background-color: #f7f7f7;">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
	<br>
	<h3 class="text-center">Hello, ${userobj.name }</h3>
		
		<div class="row p-5">

			<div class="col-md-4 mt-3">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4 mt-3">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Old Book</h4>
						</div>
					</div>
				</a>

			</div>
			
			<div class="col-md-4 mt-3">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			
			
			
			<div class="col-md-4 mt-4">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h4>your Address</h4>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-4">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			

			<div class="col-md-4 mt-4">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>

			
		</div>
	</div>
	
	
	<div class="fixed-bottom"><%@include file="all_component/footer.jsp"%></div>
	
</body>
</html>