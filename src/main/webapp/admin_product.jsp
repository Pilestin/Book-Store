<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="helper.FactoryProvider"%>
<%@ page import="helper.Helper"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="entity.Product"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tüm Ürünler</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
	//out.println(cat);
	ProductDao dao = new ProductDao(FactoryProvider.getFactory());
	List<Product> list = null;
	list = dao.getAllProducts();
	%>
	<div class="list-group mt-4">

		<div class="row">
			<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

			<div class="container">
				<h3 class="text-center">Ürün Listesi</h3>
				<hr>

				<br>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Ürün ID</th>
							<th>Ürün Adı</th>
							<th>Açıklama</th>
							<th>İndirim</th>
							<th>Ürün Fiyatı</th>
							<th>Stok Miktarı</th>
						</tr>
					</thead>
					<tbody>

						<%
						for (Product p : list) {
						%>

						<tr>
							<td><%=p.getpId()%></td>
							<td><%=p.getpName()%></td>
							<td><%=p.getpDesc()%></td>
							<td><%=p.getpDiscount()%></td>
							<td><%=p.getpPrice()%></td>


							<td>
							<form action="ProductOperationServlet" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="operation" value="changeproductquantity" />
								<input type="hidden" name="pId" value=<%=p.getpId()%> />
								<input type="text" value=<%=p.getpQuantity()%> name="pQuantity" />
								<button type="button" hidden>Güncelle</button>
							</form>
							</td>
							<td>
								<form action="ProductOperationServlet" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="operation" value="deleteproduct" />
									<input type="hidden" name="pId" value=<%=p.getpId()%> />
									<button>Sil</button>
								</form>
							</td>

						</tr>
						<%
						}
						%>
					</tbody>
					</div>
					</div>
					</div>
</body>
</html>