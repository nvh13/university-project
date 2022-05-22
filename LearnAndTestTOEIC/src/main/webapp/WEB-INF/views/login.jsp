<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="<c:url value='/resources/file/images/icons/favicon.ico'/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/fonts/iconic/css/material-design-iconic-font.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/animate/animate.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/css-hamburgers/hamburgers.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/animsition/css/animsition.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/select2/select2.min.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/daterangepicker/daterangepicker.css'/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/resources/file/images/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <form class="login100-form validate-form" action="j_spring_security_check" method="post">
					<span class="login100-form-title p-b-49" style="font-family: Arial; font-weight: bold">
						Đăng nhập
					</span>
            <div id="alert_message"></div>
                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger">
                        Tài khoản hoặc mật khẩu không đúng
                    </div>
                </c:if>

                <div class="wrap-input100 validate-input m-b-23" data-validate = "Không được để trống" >
                    <span class="label-input100" style="font-family: Arial">Tài khoản</span>
                    <input class="input100" type="text" name="username" placeholder="Nhập tài khoản của bạn" style="font-family: Arial">
                    <span class="focus-input100" data-symbol="&#xf206;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Không được để trống">
                    <span class="label-input100" style="font-family: Arial">Mật khẩu</span>
                    <input class="input100" type="password" name="password" placeholder="Nhập mật khẩu của bạn" style="font-family: Arial">
                    <span class="focus-input100" data-symbol="&#xf190;"></span>
                </div>

                <div class="text-right p-t-8 p-b-31" style="font-family: Arial; font-size: 14px; color: #666666">
                    <input type="checkbox" name="remember-me"/> Nhớ tài khoản
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button type="submit" class="login100-form-btn" style="font-family: Arial; font-weight: bold">
                            Đăng nhập
                        </button>
                    </div>
                </div>

                <div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17" style="font-family: Arial">
							Bạn chưa có tài khoản ?
						</span>

                    <a href="<c:url value='/register'/>" class="txt2" style="font-family: Arial">
                        Đăng ký
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/vendor/animsition/js/animsition.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/vendor/bootstrap/js/popper.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/vendor/select2/select2.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/vendor/daterangepicker/moment.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/daterangepicker/daterangepicker.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/vendor/countdowntime/countdowntime.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/resources/js/main.js'/>"></script>
<script>

    $(document).ready(function (){
        getMessage(code, message);
    });

    var message = GetURLParameter('message');
    var code = GetURLParameter('code');

    function GetURLParameter(sParam) {
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++){
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam)
            {
                return sParameterName[1];
            }
        }
    }

    function getMessage(code, message){
        if(code == 0){
            // $('#alert_message').append("<div class='alert alert-success' role='alert'>" +
            //     message+ "</div>")
            $('#alert_message').append("<div class='alert alert-success' role='alert'>Tạo tài khoản mới thành công</div>")
        }
    }
</script>
</body>
</html>