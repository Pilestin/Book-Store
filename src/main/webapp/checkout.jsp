<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "Giriş Yapılmadı , Lütfen önce giriş yapınız.");
        response.sendRedirect("login.jsp");
        return;

    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
         <script type="text/javascript">
        	
        </script>
	
	
    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">                

                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Sepetinizdeki Seçili Ürünler</h3>

                            <div class="cart-body">

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Bilgileriniz</h3>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">E-mail adresiniz</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="e-mail girin">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Adınız</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="İsminizi girin">
                                </div>


                                <div class="form-group">
                                    <label for="name">Telefon numaranız</label>
                                    <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Telefon numaranızı girin">
                                </div>


                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1" >Adresiniz</label>
                                    <input value="<%= user.getUserAddress() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Adresinizi girin">
                                </div>

                                <div class="container text-center">
                                	<input class="btn btn-outline-success" value="Siperişi Onayla" type="button" onclick="window.location = 'basarili.jsp'"> 
                                	<input class="btn btn-outline-primary" value="Alışverişe Devam Et" type="button" onclick="window.location = 'index.jsp'">                               	                          		
                                </div>

                            </form>    
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <%@include  file="components/common_modals.jsp" %>
    </body>
</html>