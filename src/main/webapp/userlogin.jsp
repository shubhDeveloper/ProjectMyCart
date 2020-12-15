<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
<%@include file="component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-1">
					<div class="card-header text-center custom-bg text-white">
						
						<div class = "container">
						<img class="mt-1"alt="" src="img/locks.png" style="height: 90px; width: 90px;">
					    </div>
					    <h3>Login Here</h3>
					</div>
					
					<div class="card-body back-bg">
						<form action="UserLogin" method="post">
						<%@include file = "component/message.jsp" %>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="email" id="exampleInputEmail1"
									aria-describedby="emailHelp"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="password" id="exampleInputPassword1">
							</div>
							
							<a href="register.jsp" class="text-center d-block">If not register click here</a><br>
							<div class="text-center">
							<button type="submit" class="btn btn-primary custom-bg border-0">Login</button>
							<button type="reset" class="btn btn-warning custom-bg border-0 text-white">reset</button>
						    </div>
						</form>


					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>