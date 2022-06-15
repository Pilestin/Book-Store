<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="helper.FactoryProvider"%>
<%@ page import="helper.Helper"%>
<%@ page import="entity.Category"%>
<%@ page import="dao.CategoryDao"%>
<%@ page import="entity.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.ProductDao"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ana Sayfa</title>
<!-- İmport işlemleri - Bootstrap ve js için -->


<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	
	<div class="container-fluid text-center" style="margin-top:50px">
		<h3 id="anabaslik">Tüm Kitaplar</h3>
	</div>
	<hr>
	 
	<div class="container">
		<div class="row mt-3 mx-2">

			<%
				String cat = request.getParameter("category");
				//out.println(cat);
				ProductDao dao = new ProductDao(FactoryProvider.getFactory());
				List<Product> list = null;

			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {

				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);

			}

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>

			


			<!--show products-->
			<div class="col-md-10">


				<!--row-->
				<div class="row">



					<!--col:12-->
					<div class="col-md-12">

						<div class="card-columns">

							<!--traversing products-->

							<%
							for (Product p : list) {
							%>

							<!--product card-->
							<div class="card product-card ">

								<div class="container text-center">
									<img src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 150px; width: auto;"
										class="card-img-top m-2" alt="...">

								</div>

								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>

									<p class="card-text">
										<%=Helper.get10Words(p.getpDesc())%>

									</p>

								</div>

								<div class="card-footer text-center">
									<button class="btn custom-bg text-white"
										onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Sepete
										Ekle</button>
									<button class="btn  btn-outline-success ">
										&#8378;
										<%=p.getpPrice()%>
										- <span class="text-secondary discount-label"> &#8378;
											<%=p.getpPrice()%> , <%=p.getpDiscount()%>% off
										</span>
									</button>

								</div>

							</div>


							<%
							}

							if (list.size() == 0) {
								out.println("<h3>Burada ürün bulunmamakta</h3>");
							}
							%>

						</div>
					</div>
				</div>
			</div>


			<!--show categories-->
			<div class="col-md-2">

				<div class="list-group mt-4">

					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active"> Tüm Kitaplar </a>

						<%
							for (Category c : clist) {
						%>
							<a  href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"> <%=c.getCategoryTitle()%> </a>
						
							
						<%
							}
						%>
				</div>

			</div>

		</div> 
	</div>

	<!--  -->
	<div class="container" style="margin-top: 400px"></div>

	<br>
	<br>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/common_modals.jsp"%>

</body>
</html>