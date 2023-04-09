<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MeriPanchayat</title>
	<!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- JQUERY -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
</head>
<body>
	<%@include file="header.jsp" %>
    <div class="container">
	    <h3 class="text-center mt-4 text-success">Welcome to Meri Panchayat</h3>
	    <div class="container">
		    <div class="row">
		    	<div class="col-md-12 mt-4">
				    <div class="card bg-light">
				      <div class="card-body text-center">
				      <p class="card-text text-success"><strong>Citizen/Panchayat Residents</strong></p>
				      <div class="row">
				      	<div class="col-md-6">
				      		<p class="text-secondary">New USER ?</p> 
				      	</div>
				      	<div class="col-md-6">
				      		<a href="/signup" class="btn btn-outline-success">SignUp</a>
				      	</div>
				      </div>
				      <div class="row mt-2">
				      	<div class="col-md-6">
				      		<p class="text-secondary">Existing USER ?</p> 
				      	</div>
				      	<div class="col-md-6">
				      		<a href="/login" class="btn btn-outline-success">LogIN</a>
				      	</div>
				      </div>
				        
				      </div>
				    </div>
				</div>
			</div>
		</div>
			
			
		<div class="container">
			<div class="row">
			    <div class="col-md-12 mt-4">
					<div class="card bg-light">
				      <div class="card-body text-center">
				        <p class="card-text text-success"><strong>official Users</strong></p>
				        <div class="row">
				      	<div class="col-md-6">
				      		<p class="text-secondary">Existing USER ?</p> 
				      	</div>
				      	<div class="col-md-6">
				      		<a href="/signup" class="btn btn-outline-success">SignUp</a>
				      	</div>
				      </div>
				      </div>
				    </div>
				</div>
			</div>
		</div>
    </div>
    <%@include file="footer.jsp" %>
    <!-- Bootstrap 4 JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>