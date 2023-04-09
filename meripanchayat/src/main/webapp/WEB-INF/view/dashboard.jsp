<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registration</title>
	<!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <!-- JQUERY -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<title>Welcome to Dashboard</title>
<style>
	.custom_image > img {
		height:300px; 
		width:300px;
		filter: drop-shadow(3px 3px 1px green);
	}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container text-center">
	<div class="mt-5 custom_image">
		<img class="rounded" src="images/panchayatPeople.jpg" />
	</div>
	<h3>Welcome to Dashboard - ${user.name}</h3>
	<c:if test="${user.userType eq '0'}">
	<a class="btn btn-success" href="/addcircular"> Add Circular</a>
	<a class="btn btn-success" href="/viewcircular"> View Circular</a>
	</c:if>
</div>
<%@include file="footer.jsp" %>
</body>
</html>