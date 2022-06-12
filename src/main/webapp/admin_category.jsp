<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="helper.FactoryProvider"%>
<%@ page import="helper.Helper"%>
<%@ page import="dao.CategoryDao"%>
<%@ page import="entity.Category"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tüm Kategoriler</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%@include file="components/common_css_js.jsp"%>
	<%
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
	%>


	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<br>
			<h3 class="text-center">Kategori Listeleme</h3>
			<hr>
			<br>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Kategori ID</th>
						<th>Açıklama</th>
						<th>Kategori Adı</th>
					</tr>
				</thead>
				<tbody>

					<%
					for (Category c : clist) {
					%>

					<tr>
						<td><%=c.getCategoryId()%></td>
						<td><%=c.getCategoryDescription()%></td>
						<td><%=c.getCategoryTitle()%></td>

					
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>