<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Đăng ký</title>

    <!-- Icons font CSS-->
    <link href="<c:url value='/resources/vendor/mdi-font/css/material-design-iconic-font.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor/font-awesome-4.7/css/font-awesome.min.css'/>" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="<c:url value='/resources/vendor/select2-Register/select2.min.css'/>" rel="stylesheet" media="all">
    <link href="<c:url value='/resources/vendor/datepicker/daterangepicker.css'/>" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="<c:url value='/resources/css/mainRegister.css'/>" rel="stylesheet" media="all">
    <style>
        .alert-danger{
            padding: 10px;
            background-color: #ff4b5a;
            margin-bottom:  20px;
            color: white;
        }
    </style>
</head>

<body>
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">Đăng ký</h2>
            </div>
            <div class="card-body">
                <div id="alert"></div>
                <form id="formSubmit">
                    <div class="form-row">
                        <div class="name">Tên người dùng</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="text" name="fullName" id="fullName">
                                <div id="alert-fullName">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Email</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="email" name="email" id="email">
                                <div id="alert-email">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Tên tài khoản</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="text" name="userName" id="userName">
                                <div id="alert-userName">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Mật khẩu</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="password" name="password" id="password">
                                <div id="alert-password">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Nhập lại mật khẩu</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-5" type="password" name="rePassword" id="rePassword">
                            </div>
                            <div id="alert-rePassword">
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn--radius-2 btn--green" type="button" onclick="check()">Đăng ký</button>
                        <button type="button" class="btn btn--radius-2 btn--red" onclick="cancel()" id="cancelButton">Hủy bỏ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Jquery JS-->
<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
<!-- Vendor JS-->
<script src="<c:url value='/resources/vendor/select2-Register/select2.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/datepicker/moment.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/datepicker/daterangepicker.js'/>"></script>

<!-- Main JS-->
<script src="<c:url value='/resources/js/global.js'/>"></script>

<script>
    function check(){
        var num = 0;
        $.each($('#formSubmit').serializeArray(), function (i, v) {
            $('#alert-'+v.name).empty();
            if(v.value == ""){
                $('#alert-'+v.name).append(
                    "<div style='color: red'>" +
                    "*Không được để trống</div>"
                );
                num++;
            }
        });
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($('#email').val()) == false && $('#email').val() != ""){
            $('#alert-email').append(
                "<div style='color: red'>" +
                "*Sai định dạng</div>"
            );
            num++;
        }
        if ($('#password').val().length < 6 && $('#password').val() != ""){
            $('#alert-password').append(
                "<div style='color: red'>" +
                "*Mật khẩu phải nhiều hơn 6 ký tự</div>"
            );
            num++;
        }

        if(num == 0){
            addUser();
        }
    }
    function addUser() {
        var data = {};
        $.each($('#formSubmit').serializeArray(), function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/user',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                if(result.code == 0){
                    window.location.href="${pageContext.request.contextPath}/login?code=" + result.code + "&message=" + result.message;
                }else{
                    $('#alert').empty();
                    $('#alert').append(
                        "<div class='alert-danger'>" +
                        result.message +
                        "</div>"
                    );
                }
            }
        });
    }

    function cancel(){
        window.location.href="${pageContext.request.contextPath}/login";
    }
</script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->