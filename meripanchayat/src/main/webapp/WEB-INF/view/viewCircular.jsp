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
	<title>MeriPanchayat</title>
	<!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- JQUERY -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<title>CircularList</title>
</head>
<body>
<%@include file="header.jsp" %>


<div class="container">
  <h2 class="mt-5 text-center">Circular List</h2>          
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>S.No</th>
        <th>CircularNo</th>
        <th>Category</th>
        <th>File Description</th>
        <th>IssuedOn</th>
        <th>IssuedBy</th>
        <th>File Link</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${circularList}" var="circular" varStatus="sno">
      <tr>
        <td>${sno.index+1}</td>
        <td>${circular.circularNo}</td>
        <td>${circular.category}</td>
        <td>${circular.fileDescription}</td>
        <td>${circular.issuedOn}</td>
        <td>${circular.issuedBy}</td>
        <td><a href="${circular.file}" class="btn btn-info" target="_blank">View</a></td>
        <td><a href="/deletecircular/${circular.circularId}" class="btn btn-danger">Delete</a></td>
      </tr>
      </c:forEach>

    </tbody>
  </table>
</div>
<%@include file="footer.jsp" %>


</body>
</html>