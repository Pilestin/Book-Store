<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	
	<title>About Page</title>
	<!-- İmport işlemleri - Bootstrap ve js için -->
	<%@include file="components/common_css_js.jsp"%>
	
	<script src="jscr/script.js" type="text/javascript"></script>
	<style></style>
</head>
<body>
	<h1>About Page</h1>
	<%@include file="components/navbar.jsp" %>
	<div class="jumbotron">
            <h1>About My Cart website</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id, expedita, neque laudantium fugiat adipisci cumque impedit magni delectus debitis libero corporis nemo quis voluptate nobis at. Obcaecati, iste aspernatur dicta assumenda laboriosam nemo voluptatibus consectetur perspiciatis delectus temporibus! Cumque ipsa similique placeat eveniet doloribus corrupti facilis accusantium veniam neque autem!</p>
        </div>

        <%@include  file="components/common_modals.jsp" %>
</body>
</html>