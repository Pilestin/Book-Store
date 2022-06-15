<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="common_css_js.jsp"%>
<style>

h6{
	color:#3498DB;
	font-weight:bold;
}

p{
	color:#3498DB
}

i{
	color:white;
}

</style>
<footer>
	<!-- üstteki yazı bölümü-->
	<div class="jumbotron text-center" style="background-color: white;">
		<div class="row">
			<!--Grid column 1 -->
			<div class="col">
				<!--başlık-->
				<div class="footerYazıKont">
					<h6>About Store</h6>
					<!--divider - sarı çizgi -->
					<div class="mb-4">
						<hr class="solid">
					</div>
				</div>
				<!--içerik-->
				<!-- Düzgün ve hizalı olması için bir div içine alalım -->
				<div class="footerYazıKont">
					<!--sola eşit olması için bir kutu içerisine listeyi koydum-->
					<ul class="list-unstyled">
						<!--sitilsiz -->
						<li><a href="index.jsp" class="text-black-50"><p
									class="text-center">Home</p></a></li>
						<li><a href="index.jsp" class="text-black-50"><p
									class="text-center">Shop</p></a></li>
						<li><a href="index.jsp" class="text-black-50"><p
									class="text-center">Product</p></a></li>
						<li><a href="about.jsp" class="text-black-50"><p
									class="text-center">About Us</p></a></li>
						<li><a href="about.jsp" class="text-black-50"><p
									class="text-center">Contact Us</p></a></li>
					</ul>
				</div>
			</div>
			<!--Grid column 1 -->

			

			<!--Grid column 4 -->
			<div class="col">
				<!--başlık-->
				<div class="footerYazıKont">
					<h6>Support</h6>
					<!--divider - sarı çizgi -->
					<div class="mb-4">
						<hr class="solid">
					</div>
				</div>

				<!--içerik-->
				<!-- Düzgün ve hizalı olması için bir div içine alalım -->
				<div class="footerYazıKont">
					<ul class="list-unstyled" >
						<li><a href="#!" class="text-black-50"><p
									class="text-center">GDPR</p></a></li>
						<li><a href="#!" class="text-black-50"><p
									class="text-center">Cookie Policy</p></a></li>
						<li><a href="#!" class="text-black-50"><p
									class="text-center">Terms</p></a></li>
						<li><a href="#!" class="text-black-50"><p
									class="text-center">Abuse Policy</p></a></li>
						<li><a href="#!" class="text-black-50"><p
									class="text-center">Privacy Policy</p></a></li>
						<li><a href="#!" class="text-black-50"><p
									class="text-center">Contact Us</p></a></li>
					</ul>
				</div>

			</div>
			<!--Grid column 4 -->
		</div>
	</div>

	 <!--alttaki sosyal medya ve logo bölümü + easter egg :D-->
    <div class="container-fluid footerGriCizgi">
      <div class="row">
        <p style="margin: 20px 0px 0px 40px;color:#0A0708">❤️İsmail İşeri ❤️</p> 
		<div class="container" style="width:800px"> </div>
<!-- 			<i class="fa-brands fa-3x fa-instagram"></i> -->
<!-- 			<i class="fa-brands fa-3x fa-facebook"></i> -->
<!-- 			<i class="fa-brands fa-3x fa-linkedin"></i> -->
<!-- 			<i class="fa-brands fa-3x fa-twitter"></i> -->
          <img src="img/logo/face.png" class="img-fluid footerLogolari " alt="logo" >
          <img src="img/logo/twitter.png" class="img-fluid footerLogolari  " alt="logo" > 
          <img src="img/logo/linkedin.png" class="img-fluid footerLogolari " alt="logo" > 
      </div>
    </div>

</footer>