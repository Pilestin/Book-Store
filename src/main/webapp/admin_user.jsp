<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="helper.FactoryProvider"%>
<%@ page import="helper.Helper"%>
<%@ page import="dao.UserDao"%>
<%@ page import="entity.User"%>
<%@ page import="java.util.List"%>

<%@include file="components/common_css_js.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tüm Kullanıcılar</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
	UserDao dao = new UserDao(FactoryProvider.getFactory());
	List<User> list = null;
	list = dao.getAllUsers();
	%>

	<%!public void userSil(int i) {
		
	}
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
						<th>Kullanıcı ID</th>
						<th>Kullanıcı Adı</th>
						<th>Kullanıcı E-mail</th>
						<th>Kullanıcı Şifre</th>
						<th>Kullanıcı Telefon No</th>
						<th>Kullanıcı Adresi</th>
						<th>Kullanıcı Fotoğrafı</th>
						<th>Kullanıcı Tipi</th>
					</tr>
				</thead>
				<tbody>

					<%
					for (User u : list) {
					%>

					<tr>
						<td><%=u.getUserID()%></td>
						<td><%=u.getUserName()%></td>
						<td><%=u.getUserEmail()%></td>
						<td><%=u.getUserPassword()%></td>
						<td><%=u.getUserPhone()%></td>
						<td><%=u.getUserAddress()%></td>
						<td><%=u.getUserPhoto()%></td>
						<td><%=u.getUserType()%></td>


						<td>&nbsp;&nbsp;&nbsp;&nbsp;
						
						<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
								<input type="hidden" name="operation" value="deleteuser" />
								<input type="hidden" name="uId" value=<%=u.getUserID()%> />
								<button>Delete</button>
							</form>
						
						</td>
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