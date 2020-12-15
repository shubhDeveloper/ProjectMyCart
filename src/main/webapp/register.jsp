<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- REGISTRATION FORM -->

	<div class="container-fluid">

		<div class="row mt-4">
			<div class="col-md-6 offset-md-3">

             

				<div class="card">
				
				<div class="card-header text-center custom-bg text-white">
				
				
				
							<img class="mt-3"alt="" src="img/boys.png"
								style="height: 100px; width: 100px">
								<h3 class="text-center my-3">Sign up here</h3>
					
						
				
				</div>
					<div class="card-body back-bg">
					<%@include file = "component/message.jsp" %>
					
						
						<form action="UserServlet" method="post">

							<div class="form-group">
								<label for="name">Username</label> <input type="text"
									class="form-control" name="username" id="name"
									aria-describedby="name" required="required" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="email"
									id="exampleInputEmail1" required="required" aria-describedby="emailHelp"
									placeholder="Enter here"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" required="required" name="password"
									id="exampleInputPassword1" placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="name">Phone Number</label> <input type="num"
									class="form-control" id="num" required="required" name="phone"
									 placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="name">Address</label>
								<textarea type="text" name="address" required="required" class="form-control"
									style="height: 200px" placeholder="Enter Your Address"></textarea>
							</div>

							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="gender" required="required" value="male" name="gender">Male
								<input type="radio" id="gender" required="required" name="gender" value="female">Female
							</div>
                            <a href="userlogin.jsp" class="text-center d-block">If you'r already register click here</a>
							<div class="container text-center">
								<button type="submit"   class="btn btn-outline-primary custom-bg text-white border-0">Register</button>
								<button type="reset" class="btn btn-outline-warning m-1 border-0 custom-bg text-white">Reset</button>
							</div>



						</form>


					</div>

				</div>
				<br>

			</div>
		</div>
	</div>
</body>
</html>