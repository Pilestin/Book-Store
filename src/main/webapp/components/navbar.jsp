<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="entity.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>

<%@include file="common_css_js.jsp"%>

<nav class="navbar navbar-expand-lg navbar-dark  custom-bg">
	<div class="container">
		
<!-- 		<img alt="" src="img/logo/home-logo2.jpg" style="width: 40px ; height:40px; margin-right:20px"> -->
		<i class="fa-solid fa-book-open-reader" style="color: white; font-size:40px;margin-bottom:10px;margin-right:7px"></i> 
		<a class="navbar-brand" href="index.jsp"><h3 style="margin: 6px">MOY Store</h3> </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item active"><a class="nav-link"
					href="index.jsp" >Ana Sayfa <span class="sr-only">(current)</span></a>
				</li>


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Kategoriler </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>



			<ul class="navbar-nav ml-auto">

				<!--  Search bar  -->
				<div class="wrap">
					<div class="search">
						<input type="text" style="height: 30px" class="searchTerm"
							placeholder="Ne aradın ?">
							<i class="fa-solid fa-magnifying-glass" style="color:white;font-size :20px;margin-left:10px;margin-top:5px"></i>
<!-- 						<img alt="" src="img/search.png" style="width: 8% ; margin-left:20px;"> -->
					</div>
					
				</div>
					
					
				<!--  Sepet bölümü 🛒 -->
				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#cart"> <i
						class="" style="font-size: 20px;"></i><i class="fa-solid fa-cart-shopping" style="font-size:20px"></i></i><span
						class="ml-0 cart-items">( 0 )</span>
				</a></li>



				<%
				if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Giriş Yap </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Kaydol </a></li>
				
				<%
				} else {
				%>
				<li class="nav-item active"><a style="font-size:18px" class="nav-link"
					href="<%=user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%=user1.getUserName()%>
				</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet" style="font-size:17px">Çıkış Yap </a></li>



				<%
				}
				%>




			</ul>

		</div>

	</div>
</nav>