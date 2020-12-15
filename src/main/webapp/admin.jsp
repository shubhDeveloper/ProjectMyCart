<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.halper.FactoryProvider"%>
<%@page import="com.userdao.CategoryDao"%>
<%@page import="com.entity.User"%>

<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in");
	response.sendRedirect("userlogin.jsp");
	return;
} else {
	if (user.getStatus().equals("Y")) {
		session.setAttribute("message", "you'r not admin ! Do not access this page");
		response.sendRedirect("userlogin.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<%@include file="component/common_css_js.jsp"%>

</head>
<body class="back-bg">
	<%@include file="component/navbar.jsp"%>

	<div class="container admin">
		<!-- First Row -->
		
		<div class= "container-fluid mt-3">
		
		 <%@include file = "component/message.jsp" %>
		
		</div>
		
		
		<div class="row mt-4">
		
		
		

			<!-- column 1 -->

			<div class="col-md-4">

				<!-- <a style="text-decoration: none; color: black;" href="index.jsp"> -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/users.png">
						</div>
						<h2>1234</h2>
						<h2 class="text-uppercase text-muted">Users</h2>

					</div>
				</div>
				<!-- </a> -->
			</div>

			<!-- column 2 -->

			<div class="col-md-4">
				<!-- <a style="text-decoration: none; color: black;" href="index.jsp"> -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/categoru.png">
						</div>
						<h2>12444</h2>
						<h2 class="text-uppercase text-muted">Categories</h2>
					</div>
				</div>
				<!-- </a> -->
			</div>

			<!-- column 3 -->

			<div class="col-md-4">
				<!-- <a style="text-decoration: none; color: black;" href="index.jsp"> -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/products.png">
						</div>
						<h2>12444</h2>
						<h2 class="text-uppercase text-muted">Products</h2>
					</div>
				</div>
				<!-- </a> -->
			</div>
		</div>


		<!-- Second row -->
		<div class="row mt-4">
			<div class="col-md-6">
				<!-- <a style="text-decoration: none; color: black;" href="index.jsp"> -->
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/interface.png">
						</div>
						<p>Click here to add new product.</p>
						<h2 class="text-uppercase text-muted">Add Category</h2>
					</div>
				</div>
				<!--  </a> -->
			</div>

			<div class="col-md-6">
				<!-- <a style="text-decoration: none; color: black;" href="index.jsp"> -->
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/computer.png">
						</div>
						<p>Click here to add new product.</p>
						<h2 class="text-uppercase text-muted">Add Product</h2>
						</a>
					</div>
				</div>
				<!-- </a> -->
			</div>


		</div>

		<!-- Modal start -->

		<!-- Button trigger modal -->
		<!-- 
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#add-category-modal">Launch demo modal</button> -->

		<!-- Modal for Add category-->
		<div class="modal fade" id="add-category-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill category
							details</h5>
						<button type="button" class="close text-white"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">


						<form action="CategoryServlet" method="post">
						
						<input type="hidden" name="operation" value="addcategory" >

							<div class="form-group">

								<input type="text" class="form-control" name="cattital"
									placeholder="category tital" required="required">

							</div>

							<div class="form-group">
								<textarea style="height: 200px" class="form-control"
									placeholder="Category discription" name="catdisc" required="required"></textarea>
							</div>


							<div class="container text-center">

								<button class="btn btn-outline-success">Add category</button>
								<button type="button" class="btn btn-outline-danger"
									data-dismiss="modal">Close</button>

							</div>
						</form>


					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>



		<!-- Modal end -->



		<!-- Modal for Add product-->
		<div class="modal fade" id="add-product-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill product
							details</h5>
						<button type="button" class="close text-white"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">


						<form action="CategoryServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct" >
                            
							<div class="form-group">
								<input type="text" class="form-control" name="pname"
									placeholder="Enter product name" required="required">
							</div>
							
							<div class="form-group">
								<input type="number" class="form-control" name="pprice"
									placeholder="Enter product price" required="required">
							</div>
							
							
							<div class="form-group">
								<input type="number" class="form-control" name="pdisc"
									placeholder="Enter product discount" required="required">
							</div>
							
							
							<div class="form-group">
								<input type="number" class="form-control" name="pqty"
									placeholder="Enter product Quentity" required="required">
							</div>
							
						<!-- 	Product category -->
							
							<%
							CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
							List<Category> list = cdao.getCategories();
							
							
							%>
							
							
							
							
							
							
							<div class="form-group">
								<select name="pcatid" class="form-control" id="">
								
								<%
								for(Category c:list)
								{
								%>
								<option value="<%= c.getCategoryId()%>"><%=c.getCategoryTital() %></option>
								<%} %>
								
								</select>
							</div>
							
							
							
							

							<div class="form-group">
								<textarea style="height: 200px" class="form-control"
									placeholder="Enter product discription" name="pdiscr" required="required"></textarea>
							</div>



                            <!-- Product File -->
                            
                            <div class="form-group">
                            <label for="" id="ppic">Select Picture of Product</label><br>
                            <input type="file" id="ppic" name="ppic" required="required">
                            
                            </div>
                          



							<div class="container text-center">

								<button class="btn btn-outline-success">Add product</button>
								<button type="button" class="btn btn-outline-danger"
									data-dismiss="modal">Close</button>

							</div>
						</form>


					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>



		<!-- Modal end -->
</body>
</html>