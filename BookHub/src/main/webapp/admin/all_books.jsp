<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.user.servlet.LoginServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
.bg-custom {
	color: #4527a0;
}

</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp" %>
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	
	<h3 class="text-center"> Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
  <thead class="bg-custom text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Book Category</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
  <tbody>
  
  <%
  	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
  	List<BookDtls> list = dao.getAllBooks();
  	for (BookDtls b : list) {
  %>
  
   <tr>
      <td><%=b.getBookId()%></td>
      <td><img src="../book/<%=b.getPhoto()%>" 
      		style="width: 50px; height:50px;"></td>
      <td><%=b.getBookname()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getBookCategory()%></td>
      <td><%=b.getStatus()%></td>
      <td>
      	<a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i> Edit</a> 
      	<a href="" class="btn btn-sm btn-danger"><i class="fa-regular fa-trash-can"></i> Delete</a>
	  </td>
    </tr>
  
  <%
  	}
  %>
  
  </tbody>
</table>
<div style="margin-top: 409px;">
		<%@include file="footer.jsp" %>
	</div>

</body>
</html>