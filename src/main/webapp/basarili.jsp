<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
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
	<!--  CSS UYGULANACAK  -->
	<h3 class="alert alert-success" id="p">
		Tebrikler
		</p>
</body>
</html>