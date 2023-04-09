<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	<!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- JQUERY -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<%@include file="header.jsp" %>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 mt-5">
          <div class="card">
            <div class="card-header bg-success text-white">
              <h4>Login</h4>
            </div>
            <div class="card-body">
              <form action="/login" id="login" method="POST">
                <div class="input-group mb-3">
				    <div class="input-group-prepend">
					    <span class="input-group-text text-success" id="basic-addon1"><i class="fa fa-user" aria-hidden="true"></i></span>
					  </div>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter your email or mobileNo">
                </div>
                <div class="input-group mb-3">
				    <div class="input-group-prepend">
					    <span class="input-group-text text-success" id="basic-addon1"><i class="fa fa-key" aria-hidden="true"></i></span>
					  </div>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password"><i id="togglePassword" style="cursor: pointer; z-index: 1;margin-left: -25px; margin-right:5px; margin-top: 10px;" class ="fa fa-eye-slash"></i>
                </div>
                <button type="submit" class="btn btn-success">Login</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="row justify-content-center">
      		<div class="alert alert-success mt-3 col-md-4 invalidUsername" style = "display:none">*Username field not be blank</div>
      		<div class="alert alert-success mt-3 col-md-4 invalidPassword" style = "display:none">*Password field not be blank</div>
      		<div class="alert alert-danger mt-3 col-md-4 invalidUserExist" style = "display:none">*Invalid Username or Password </div>
      </div>
      
    </div>
    <%@include file="footer.jsp" %>
    <!-- Bootstrap 4 JavaScript -->
    <script>
    $(document).ready(function() {
    	const togglePassword = document.querySelector("#togglePassword");
        const password = document.querySelector("#password");

        togglePassword.addEventListener("click", function () {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
            
            // toggle the icon
            this.classList.toggle("fa-eye");
        });

        // prevent form submit
        const form = document.querySelector("form");
        form.addEventListener('submit', function (e) {
            e.preventDefault();
        });
    	
    	
		  $('#login').submit(function(e) {
		    e.preventDefault(); // prevent the form from submitting
			
		    $('.alert').hide();
		    var username = $('#username').val();
		    var password = $('#password').val();
	
		    if (username=='') {
		    	//alert("Username field not be blank");
		    	$('.invalidUsername').show();
		    	$('#username').focus();
		        return false; 
		    } else if(password==''){
		    	$('.invalidPassword').show();
		    	$('#password').focus();
		    	return false;
		    } else if(username!=''){
		    	var status = false;
		    	$.ajax({
		    		type:'POST',
		    		url:'/ajaxCheckUser',
		    		data:{'username':username,'password':password},
		    		async:false
		    	}).done(function(result) {
		    		console.log("result : "+result)
	    			if(result=='0'){
	    				$('.invalidUserExist').show();
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
		    // if all field valid, submit the form
		    $(this).unbind('submit').submit();
		  });
		  
		  
		});
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>