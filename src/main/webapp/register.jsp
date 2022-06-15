<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yeni Kullanıcı</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include  file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">                  

                    <div class="card">                        
                        <%@include  file="components/message.jsp" %>                        
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/add-friend.png"  style="max-width: 100px;" class="img-fluid" alt="">
                            </div>


                            <h3 class="text-center my-3">Kaydol</h3>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">Kullanıcı Adı</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Adınızı girin" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="email">E-mail</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Mail adresinizi girin" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="password">Şifre</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Şifrenizi girin" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">Telefon Numarası</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Telefon numaranızı girin" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">Adres</label>
                                    <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Adresinizi girin"></textarea>


                                </div>

                                <div class="container text-center"> 
                                    <button class="btn btn-outline-success">Kaydol</button>
                                    <button class="btn btn-outline-warning">Sıfırla</button>

                                </div>


                            </form>


                        </div>

                    </div>

                </div>
            </div>



        </div>
    </body>
</html>