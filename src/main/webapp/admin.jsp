<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.UserDao"%>
<%@page import="entity.User"%>
<%@page import="entity.Product"%>
<%@page import="entity.Category"%>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%
	UserDao udao     = new UserDao(FactoryProvider.getFactory());
	List<User> ulist = udao.getAllUsers();
	int userCount    = ulist.size(); 
	
	CategoryDao cdao     = new CategoryDao(FactoryProvider.getFactory());
	List<Category> clist = cdao.getCategories();
	int categoryCount    = clist.size(); 
	
	ProductDao pdao     = new ProductDao(FactoryProvider.getFactory());
	List<Product> plist = pdao.getAllProducts();
	int productCount    = plist.size(); 
	

%>




<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>


</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container admin">


		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>




		<div class="row mt-3">

			<!--first col-->
			<div class="col-md-4">

				<!--first box-->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<a href="admin_user.jsp"><img style="width: 150px; height: 150px" class="img-fluid rounded-circle"
								src="img/admin/users.png" alt="user_icon">
								</a>
							

						</div>
						<h3><%=userCount %></h3>
						<h1 class="text-uppercase text-muted">Kullanıcılar</h1>

					</div>

				</div>



			</div>

			<!--second col-->

			<div class="col-md-4">


				<div class="card text-center">

					<div class="card-body">

						<div class="container">
							<a href="admin_category.jsp">
							<img style="width: 150px; height: 150px" class="img-fluid rounded-circle"
								src="img/admin/category.png" alt="user_icon">
							</a>
							

						</div>

						<h3><%=categoryCount %></h3>
						<h1 class="text-uppercase text-muted">Kategoriler</h1>

					</div>

				</div>


			</div>


			<!--third col-->
			<div class="col-md-4">


				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<a href="admin_product.jsp"><img style="width: 150px; height: 150px"
								class="img-fluid rounded-circle" src="img/admin/product.png"
								alt="user_icon"> </a>
						</div>

						<h3><%=productCount %></h3>
						<h1 class="text-uppercase text-muted">Ürünler</h1>

					</div>

				</div>


			</div>





		</div>

		<!--second row-->

		<div class="row mt-3">

			<!--second :row first col-->
			<div class="col-md-6">


				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/admin/keys.png" alt="user_icon">

						</div>

						<p class="mt-2">Yeni kategori ekle</p>
						<h1 class="text-uppercase text-muted">Kategori Ekle</h1>

					</div>

				</div>
			</div>

			<!--second row : second col-->

			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								src="img/admin/plus.png" alt="user_icon">

						</div>

						<p class="mt-2">Yeni ürün ekle</p>
						<h1 class="text-uppercase text-muted">Ürün ekle</h1>

					</div>

				</div>

			</div>
		</div>
	</div>




	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Kategori detayları</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">


						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Kategori adı girin" required />

						</div>


						<div class="form-group">
							<textarea style="height: 300px;" class="form-control"
								placeholder="Kategori açıklaması girin" name="catDescription"
								required></textarea>

						</div>

						<div class="cotnainer text-center">

							<button class="btn btn-outline-success">Kategori ekle</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Kapat</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!--End delete product modal-->

	<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

	<!--product modal-->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ürün Detayları</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--form-->

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct" />

						<!--product title-->

						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Ürün adını girin" name="pName" required />
						</div>

						<!--product description-->

						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Ürün açıklamasını girin" name="pDesc"></textarea>

						</div>

						<!--product price-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Ürün fiyatını girin" name="pPrice" required />
						</div>

						<!--product discount-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Ürün indirim miktarını girin" name="pDiscount" required />
						</div>


						<!--product quantity-->

						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Ürün miktarını girin" name="pQuantity" required />
						</div>


						<!--product category-->

						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
								for (Category c : clist) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%>
								</option>
								<%
								}
								%>
							</select>

						</div>



						<!--product file-->

						<div class="form-group">
						
							<label for="pPhoto">Ürün resmini seçin</label> <br> 
							<input type="file" id="pPhoto" name="pPhoto" required />

						</div>


						<!--submit button-->
						<div class="container text-center">
							<button class="btn btn-outline-success">Ürünü ekle</button>
						</div>
					</form>
					<!--end form-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Kapat</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="components/common_modals.jsp"%>

</body>
</html>