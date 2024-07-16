<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Home</title>
</head>
<body>
	<h1>User: Home</h1>
	
	<c:if test="${not empty userobj }">
		<h3>Name: ${userobj.name}</h3>
		<h3>Email: ${userobj.email}</h3>
	</c:if>
	
	
</body>
</html>