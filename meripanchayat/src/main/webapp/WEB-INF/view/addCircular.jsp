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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Add Circular</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">

	<div class="row">
		<div class="col-md-4">
			<h3>Add Circular</h3>
		</div>
		<div class="col-md-8">
			<div class="alert alert-success mt-1 mb-2 invalidfile" style = "display:none">Please choose file to upload</div>
    		<div class="alert alert-danger mt-1 mb-2  invalidCircular" style = "display:none">Please enter an valid CircularNo</div>
		</div>
	</div>
	<form:form action="/insertcircular" method="POST" modelAttribute="circular" enctype="multipart/form-data" >
		<div class="row mb-2">
			<div class="col-md-4">
				CircularNo<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:input type="numbers" path="circularNo" class="form-control" placeholder="Enter circular number in 5 digits"/>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				Subject<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:input type="text" path="subject" class="form-control" placeholder="Enter your subject"/>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				Category<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:select class="form-control" path="category">
					<form:option value="General Purpose">General Purpose</form:option>
					<form:option value="Official Purpose">Official Purpose</form:option>
					<form:option value="Transfer Purpose">Transfer Purpose</form:option>
				</form:select>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				File Language<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:select class="form-control" path="fileLanguage">
					<form:option value="Hindi">Hindi</form:option>
					<form:option value="English">English</form:option>
				</form:select>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				File Description<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:textarea rows="3" class="form-control" path="fileDescription" placeholder="Write your description here..."></form:textarea>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				IssuedOn<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:input type="date" path="issuedOn" class="form-control"/>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				IssuedBy<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<form:input type="text" path="issuedBy" class="form-control" placeholder="Enter Issuer name"/>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-md-4">
				Attach File<span class="text-danger">*</span>
			</div>
			<div class="col-md-8">
				<input type="file" accept=".pdf" class="" id="pdfFile" name="pdfFile"/>
			</div>
		</div>
		<div class="row mb-4">
			<div class="col-md-4">
			</div>
			<div class="col-md-8 text-right mb-5">
				<button class="btn btn-success" type="submit">Add Circular</button>
			</div>
		</div>
		
	</form:form>
	
</div>
<%@include file="footer.jsp" %>
<script>
	$(document).ready(function() {
		document.getElementById('issuedOn').valueAsDate = new Date();
		$('[type="date"]').prop('max', function(){
	        return new Date().toJSON().split('T')[0];
	    });
		
		  $('#circular').submit(function(e) {
		    e.preventDefault(); // prevent the form from submitting
	
		    var circularNo = $('#circularNo').val();
	
		    if (circularNo.length < 5 || circularNo.length > 5) {
		    	$('.invalidCircular').show();
		        return false; 
		    }
	
		    // if all field valid, submit the form
		    $(this).unbind('submit').submit();
		  });
		});
</script>
</body>
</html>