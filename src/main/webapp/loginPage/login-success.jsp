<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Success</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
<body>
	
	<%@page import="login.LoginBean"%> 
	
	<div class="alert alert-success">
  		<p>You are successfully logged in!</p> 
  		<%  
  			LoginBean bean= (LoginBean)request.getAttribute("bean");  
			out.print("Welcome, "+bean.getName());
		%>  
		<br>
		User is ${ param.name }  
		<!-- Expression Language  -->
	</div>
	 
</body>
</html>