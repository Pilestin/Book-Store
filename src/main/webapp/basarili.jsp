<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="components/import.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', 'sans-serif';
}

.container {
	width: 100%;
	height: 100vh;
	background: #3c5077;
	display: flex;
	align-items: center;
	justify-content: center;
}

.btn {
	padding: 10px 60px;
	background: #fff;
	border: 0;
	outline: none;
	cursor: pointer;
	font-size: pointer;
	font-weight: 500;
	border-radius: 30px;
}

.popup {
	width: 400px;
	background: #fff;
	border-radius: 6px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(1);
	text-align: center;
	padding: 0 30px 30px;
	color: #333;
	visibility: visible;
	transition: transform 0.4s, top 0.4s;
}

.popup img {
	width: 100px;
	margin-top: -50px;
	border-radius: 50%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.popup h2 {
	font-size: 38px;
	font-weight: 500;
	margin: 30px 0 10px;
}

</style>
<meta charset="ISO-8859-1">
<title>Redirecting</title>
<script type="text/javascript">
	
	function sleep (time) {
		  return new Promise((resolve) => setTimeout(resolve, time));
		}

		// Usage!
		sleep(5000).then(() => {
			deleteAllCart();
			window.location.href = "index.jsp";   	
	});
		
		
	</script>

</head>
<body>
	<div class="container">
		<div class="popup" id="popup">
			<img src="done.png">
			<h2>Tebrikler !</h2>
			<br>
			<p>siparişiniz başarılı bir şekilde alındı .</p>
			<br>
			<p>5 saniye içerisinde ana sayfaya yönlendirileceksiniz.</p>
		</div>
	</div>
</body>
</html>