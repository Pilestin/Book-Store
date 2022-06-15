<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kullanıcı Girişi</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">

                        <div class="card-header custom-bg text-white">
                            <h3>Giriş Yap</h3>
                        </div>

                        <div class="card-body">                            
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email adresiz</label>
                                    <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email adresinizi girin">
                                    <small id="emailHelp" class="form-text text-muted">Mail adresiniz bizimle güvende.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Şifreniz</label>
                                    <input  name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Şifrenizi girin">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2"> Siteye kaydolmak için tıklayın </a>
                                <div class="container text-center"> 

                                    <button type="submit" class="btn btn-primary border-0 custom-bg ">Giriş Yap</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0 ">Sıfırla</button>
                                </div>

                            </form>

                        </div>


                    </div>




                </div>
            </div>
        </div>





    </body>
</html>