<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registration</title>
	<!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <!-- JQUERY -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
#profile-container {
    width: 150px;
    height: 150px;
    margin-left:30%;
}

#profile-container img {
    width: 150px;
    height: 150px;
}
</style>
<body>
	<%@include file="header.jsp" %>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 mt-2">
        	<input type="hidden" id="phoneNumValid" value="<%=session.getAttribute("phoneValidity") %>">
        	<div class="alert alert-success mt-3 w-100 invalidfile" style = "display:none">Please choose a Image to upload</div>
        	<div class="alert alert-danger mt-3 w-100 invalidPhone" style = "display:none">Please enter a 10-digit phone number</div>
        	<div class="alert alert-info mt-3 w-100 invalidName" style = "display:none">Please enter valid name</div>
        	<div class="alert alert-dark mt-3 w-100 invalidMail" style = "display:none">Please Enter valid Email</div>
        	<div class="alert alert-danger mt-3 w-100 invalidNameAlphabetic" style = "display:none">Please Enter Alphabetic name</div>
        	<div class="alert alert-dark mt-3 w-100 invalidUserType" style = "display:none">Please must Select UserType</div>
        	<div class="alert alert-secondary mt-3 w-100 invalidPass" style = "display:none">Password must be at least 8 characters long</div>
        	<div class="alert alert-danger mt-3 w-100 invalidNum" style = "display:none">Please enter valid phone number</div>
        	<div class="alert alert-danger mt-3 w-100 alreadyExistPhone" style = "display:none">This Mobile No is already Exist</div>
        	<div class="alert alert-warning alert-dismissible fade show mt-3 w-100 alreadyExist" role="alert" style = "display:none">User is Already Exist</div>
          <div class="card">
            <div class="card-header bg-success text-white">
              <h6>Registration</h6>
            </div>
            <div class="card-body">
              <i class="fa fa-circle" style="position:absolute; z-index:4; margin-left:48%; font-size:40px;color:green"></i>
              <i class="fa fa-camera fa-beat" aria-hidden="true" style="position:absolute; z-index:5; margin-left:50%; margin-top:8px; font-size:20px;color:white"></i>
              <form:form action="/adduser" modelAttribute="user">
              <div class="mb-3">
              	  <div id="profile-container">
                  	<img class="btn" id="profileImage" src="https://i.stack.imgur.com/YQu5k.png" alt="userImage" />
                  </div>
                  <form:input type="file" accept="image/*" class="form-control" path="photo" style="display:none;"/>
                </div>
              <div class="mb-3">
                  <form:select class="form-control" path="userType">
                  		<form:option value="-1">---Select User Type---</form:option>
                  		<form:option value="0">OfficialUser</form:option>
                  		<form:option value="1">Citizen</form:option>
                  		<form:option value="2">NGO</form:option>
                  		<form:option value="3">Organization</form:option>
                  </form:select>
                </div>
                <div class="input-group mb-3">
				    <div class="input-group-prepend">
					    <span class="input-group-text text-success" id="basic-addon1"><i class="fa fa-phone" aria-hidden="true"></i></span>
					  </div>
				    <form:input type="number" class="form-control" path="mobileNo" placeholder="Enter your Mobile No"/>         
                </div>
                <div class="input-group mb-3">
				    <div class="input-group-prepend">
					    <span class="input-group-text text-success" id="basic-addon1"><i class="fa fa-user" aria-hidden="true"></i></span>
					  </div>
                  <form:input type="text" class="form-control" path="name" placeholder="Enter your Name"/>
                </div>
                <div class="input-group mb-3">
				    <div class="input-group-prepend">
					    <span class="input-group-text text-success" id="basic-addon1"><i class="fa fa-envelope"></i></span>
					  </div>
                  <form:input type="email" class="form-control" path="username" placeholder="Enter your email"/>
                </div>
                <div class="input-group mb-3">
				    <div class="input-group-prepend">
					    <span class="input-group-text text-success" id="basic-addon1"><i class="fa fa-key" aria-hidden="true"></i></span>
					  </div>
                  <form:input type="password" class="form-control" path="password" placeholder="Enter your password"/>
                </div>
                <button type="submit" class="btn btn-success">signUp</button>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
    
    //script for validation 
    $(document).ready(function() {
    	  $('#user').submit(function(e) {
    	    e.preventDefault();
    	    $('.alert').hide();
    	    var phoneNumValid = $('#phoneNumValid').val();
    	    var file = $('#file').val(); // get the value of the file input
    	    var phone = $('#mobileNo').val().replace(/\D/g, ''); // remove all non-digits
    	    var name = $('#name').val().trim();
    	    var email = $('#username').val(); // get the value of the email input
    	    var userType = $('#userType').find(":selected").val();
    	    // use a regular expression to check if the email address is valid
    	    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    	    var password = $('#password').val();
    	    var userRegex = /^[a-zA-Z]+$/;
    	    
    	    if(userType=='-1' ){
    	    	$('.invalidUserType').show();
    	    	return false;
    	    } else if (phone.length !== 10) {
    	    	$('.invalidPhone').show();
	    	      //alert('Please enter a 10-digit phone number.');
	    	      return false;
    	    } else if(phone.length==10 && phoneNumValid=='0'){
		    	var status = false;
		    	$.ajax({
		    		type:'POST',
		    		url:'/ajaxCheckPhoneNo',
		    		data:{'phone':phone},
		    		async:false
		    	}).done(function(result) {
		    		console.log("result : "+result)
	    			if(result=='1'){
	    				$('.alreadyExistPhone').show();
	    				$('#mobileNo').focus();
	    				status = false;
	     			} else {
	     				$('#phoneNumValid').val("1");
	     			}
		    	});
		    	if(status == false){
		    		return false;
		    	}
		    } else if(!(phone.startsWith('6') || phone.startsWith('7') || phone.startsWith('8') || phone.startsWith('9'))){
    	    	$('.invalidNum').show();
	  	    	  //alert('Please enter valid phone number.');
		    	  return false;
	     	} else if(name.length < 3){
	     		$('.invalidName').show();
	     		$('#name').focus();
	     		 // alert('Please enter valid name');
		    	return false;
	     	} else if(!userRegex.test(name)){
     			$('.invalidNameAlphabetic').show();
     			$('#name').focus();
     			return false;
     		}
	     	else if (!emailRegex.test(email)) {
	     	      //alert('Please enter a valid email address.');
	     	      $('.invalidMail').show();
	     	      $('#username').focus();
	     	      return false; // stop the form from submitting if the email is invalid
	     	} else if (password.length < 8) {
	     		$('.invalidPass').show();
	     	      //alert('Password must be at least 8 characters long.');
	     	      return false; // stop the form from submitting if the password is too short
	     	} else if(username!=''){
		    	var status = false;
		    	$.ajax({
		    		type:'POST',
		    		url:'/ajaxCheckUserValid',
		    		data:{'username':email},
		    		async:false
		    	}).done(function(result) {
		    		console.log("result : "+result)
	    			if(result=='1'){
	    				$('.alreadyExist').show();
	    				$('#username').focus();
	    				status = false;
	     			} else {
	     				status =  true;
	     			}
		    	});
		    	if(status==false){
		    		return false;
		    	}
		    }
    	    
    	      // submit form
    	    $(this).unbind('submit').submit();
    	    
    	  });
    	});
    
    
    $("#profileImage").click(function(e) {
		    $("#photo").click();
		});
		function fasterPreview(uploader) {
		    if(uploader.files && uploader.files[0] ){
		    	$('#profileImage').attr('src', window.URL.createObjectURL(uploader.files[0]));
		    	$('#photo').attr('value', window.URL.createObjectURL(uploader.files[0]));
		    }
		}
		
		$("#photo").change(function(){
		    fasterPreview(this);
		});
	</script>
    <!-- Bootstrap 4 JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>