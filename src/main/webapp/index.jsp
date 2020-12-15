<%@page import="com.halper.Helper"%>
<%@page import="com.entity.Category"%>
<%@page import="com.userdao.CategoryDao"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.userdao.ProductDao"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.halper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<%@include file="component/common_css_js.jsp"%>

<title>Home Page</title>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="row mt-3 mx-2">
		<%
		
		String cat = request.getParameter("category");
	
		
		ProductDao p = new ProductDao(FactoryProvider.getFactory());
		List<Product> list=null;
		
		
		
		if(cat==null || cat.trim().equals("all"))
		{
			 list = p.getAllProducts();
		}
		else
		{
			int cid = Integer.parseInt(cat.trim());
			list = p.getAllProductsById(cid);
		}
		
		

		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
		%>
		<!-- Show category -->
		<div class="col-md-2">
			<div class="list-group mt-3 ">

				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active ">
					All Categories </a>

			</div>


			<%
				for (Category c : clist) {
			%>


			<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action list-card"> <%=c.getCategoryTital()%>
			</a>


			<%
				}
			%>


		</div>

		<!-- Show product -->
		<div class="col-md-10 mt-3">

			<div class="row-mt-4">
				<div class="col-md-12">
					<div class="card-columns">
						<%
							for (Product ps : list) {
						%>

						<div class="card product-card">
						    <div class="conteiner text-center">
                            <img src="img/products/<%=ps.getpPic() %>" class="card-img-top m-2" style="max-height: 120px; max-width: 100%; width: auto;" alt="...">
                            </div>
                            
							<div class="card-body">
							
							<h5 class="card-tital"><%= ps.getpName() %></h5>
							
							<p class="card-text">
							<%= Helper.get10Words(ps.getpDisc()) %>
							</p>
							
							</div>
							
							<div class="card-footer text-center">
							<button class="btn custom-bg text-white" onclick="add_to_cart(<%=ps.getpId()%>,'<%=ps.getpName() %>',<%=ps.getPriceAfterDiscount() %>)">Add To Cart</button>
							<button class="btn btn-outline-success ">&#8377;<%=ps.getPriceAfterDiscount() %>/- <b><span class="text-secondary discount-label">&#8377;<%=ps.getpPrice() %>, <%=ps.getpDiscount() %>% off</span></b></button>
							</div>
							
							
						</div>

						<%
							}
						    if(list.size()==0)
						    {
						    	out.print("<h5>No item in this category</h5>");
						        
						    }
						
						
						    
						%>

					</div>


				</div>
			</div>


		</div>

	</div>
</body>
</html>
