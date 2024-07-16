<%@page import="com.entity.User"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<br>
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<br>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							
							
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookname()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-6">
				<br>
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id }" name="id"></input>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Name</label> <input name="username"
										type="text" class="form-control" id="inputEmail4" value="<%=u.getName()%>" readonly="readonly" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input name="email" type="email"
										class="form-control" id="inputEmail4" value="<%=u.getEmail()%>" readonly="readonly" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input name="phno" type="number"
										class="form-control" id="inputEmail4" value="<%=u.getPhno()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input name="address"
										type="text" class="form-control" id="inputPassword4" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input name="landmark" type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input name="city"
										type="text" class="form-control" id="inputPassword4" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input name="state" type="text"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input name="pincode"
										type="number" class="form-control" id="inputPassword4" required>
								</div>
							</div>
							
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
									<option value="ONLINE">Online Payment</option>
								</select>
							</div>
							
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>