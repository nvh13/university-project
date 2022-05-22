<%@ page import="com.learnandtesttoeic.until.SecurityUntil" %>
<%@ page import="com.mysql.cj.xdevapi.JsonArray" %>
<%@ page import="com.fasterxml.jackson.databind.util.JSONPObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description" content="Landing page template built with HTML and Bootstrap 4 for presenting training courses, classes, workshops and for convincing visitors to register using the form.">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
    <meta property="og:site_name" content="" /> <!-- website name -->
    <meta property="og:site" content="" /> <!-- website link -->
    <meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
    <meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
    <meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content="" /> <!-- where do you want your post to link to -->
    <meta property="og:type" content="article" />

    <!-- Website Title -->
    <title>Thông tin cá nhân</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,600,700,700i&display=swap" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/fontawesome-all.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/swiper.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/magnific-popup.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/styles.css'/>" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="<c:url value='/resources/web/images/favicon.png'/>">
    <style>
         #userInfo{
            font-size: 20px;
        }
         #userInfo tr td {
            padding-right: 10px;
            height: 50px;
        }
    </style>
</head>
<body data-spy="scroll" data-target=".fixed-top">

<!-- Preloader -->
<div class="spinner-wrapper">
    <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
    </div>
</div>
<!-- end of preloader -->


<!-- Navigation -->
<jsp:include page="template/navigation.jsp"></jsp:include>
<!-- end of navigation -->
<header id="header" class="header" style="padding: 50px">
</header> <!-- end of header -->
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><i class="fas fa-home"></i> <a href="<c:url value='/home'/>" style="font-weight: bold;  text-decoration: none">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin cá nhân</li>
        </ol>
    </nav>
    <div class="row"><h2 style="margin: 20px 0px">Thông tin cá nhân</h2></div>
    <div class="row">
        <div class="col-lg-6">
            <div class="text-container">

                <table id="userInfo">
                    <tr>
                        <td>
                            <i class="fas fa-user"></i><strong> Tên tài khoản</strong>
                        </td>
                        <td id="userName">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fas fa-user-circle"></i><strong> Họ và tên </strong>
                        </td>
                        <td id="fullNameUser">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fas fa-envelope"></i><strong> Email </strong>
                        </td>
                        <td id="emailUser">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fas fa-camera"></i><strong> Ảnh đại diện</strong>
                        </td>
                        <td id="avatar">
                        </td>
                    </tr>
                </table>
            </div> <!-- end of text-container -->
        </div> <!-- end of col -->
        <div class="col-lg-6">
            <h4 style="margin: 20px 0px">Cập nhật thông tin</h4>
            <div id="alert1"></div>
            <!-- Registration Form -->
            <div class="form-container">
                <form id="registrationForm" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                        <input type="text" class="form-control-input" id="fullName" name="fullName">
                        <label class="label-control" for="fullName">Họ và tên</label>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" accept="image/*">
                                <label class="custom-file-label" for="image"><span style="font-size: 14px">&nbsp;&nbsp;&nbsp;Ảnh đại diện</span></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control-input" id="email" name="email">
                        <label class="label-control" for="email">Email</label>
                        <div id="alert-email">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="form-control-submit-button" onclick="updateUser()">Cập nhật</button>
                    </div>
                </form>
            </div> <!-- end of form-container -->
            <br><br>

            <h4 style="margin: 20px 0px">Thay đổi mật khẩu</h4>
            <div id="alert2"></div>
            <!-- Registration Form -->
            <div class="form-container">
                <form id="changePassword" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                        <input type="password" class="form-control-input" id="oldPassword" name="oldPassword">
                        <label class="label-control" for="oldPassword">Mật khẩu cũ</label>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control-input" id="newPassword" name="newPassword">
                        <label class="label-control" for="newPassword">Mật khẩu mới</label>
                        <div id="alert-password"></div>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control-input" id="reNewPassword" name="reNewPassword">
                        <label class="label-control" for="reNewPassword">Nhập lại mật khẩu mới</label>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="form-control-submit-button" onclick="changePassword()">Đổi mật khẩu</button>
                    </div>
                </form>
            </div> <!-- end of form-container -->
            <!-- end of registration form -->
        </div> <!-- end of col -->
    </div> <!-- end of row -->
    <div class="row">
        <h4 style="margin: 20px 0px">&nbsp;&nbsp;<i class="fas fa-history"></i> Lịch sử thi thử</h4>
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Tên bài thi</th>
                <th scope="col">Điểm bài nghe</th>
                <th scope="col">Điểm bài đọc</th>
                <th scope="col">Số câu đúng</th>
                <th scope="col">Tổng điểm</th>
            </tr>
            </thead>
            <tbody id="resultHistory"></tbody>
        </table>
    </div>
</div> <!-- end of container -->
<!-- Footer -->
<jsp:include page="template/footer.jsp"></jsp:include>
<!-- end of footer -->




<!-- Scripts -->
<script src="<c:url value='/resources/web/js/jquery.min.js'/>"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
<script src="<c:url value='/resources/web/js/popper.min.js'/>"></script> <!-- Popper tooltip library for Bootstrap -->
<script src="<c:url value='/resources/web/js/bootstrap.min.js'/>"></script> <!-- Bootstrap framework -->
<script src="<c:url value='/resources/web/js/jquery.easing.min.js'/>"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
<script src="<c:url value='/resources/web/js/jquery.countdown.min.js'/>"></script> <!-- The Final Countdown plugin for jQuery -->
<script src="<c:url value='/resources/web/js/swiper.min.js'/>"></script> <!-- Swiper for image and text sliders -->
<script src="<c:url value='/resources/web/js/jquery.magnific-popup.js'/>"></script> <!-- Magnific Popup for lightboxes -->
<script src="<c:url value='/resources/web/js/validator.min.js'/>"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
<script src="<c:url value='/resources/web/js/scripts.js'/>"></script> <!-- Custom scripts -->
<script src="<c:url value='/resources/js/jquery.twbsPagination.js" type="text/javascript'/>"></script>
<script>
    $(document).ready(function (){
        getMessage(code, message);
    });
    var code = GetURLParameter('code');
    var message = GetURLParameter('message');

    $(function (){
        var url = '${pageContext.request.contextPath}/api/v1/userById?id=<%=SecurityUntil.getPrincipal().getId()%>';
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                    $('#userName').append(result.data.userName);
                    $('#fullNameUser').append(result.data.fullName);
                    $('#avatar').append("<img src='${pageContext.request.contextPath}/resources/file/images/avatar_user/"+ result.data.image +"' width='200px' height='200px' class='rounded' alt='User Image'>");
                    $('#emailUser').append(result.data.email);
            }
        });
    })
    $(function (){
        var url = '${pageContext.request.contextPath}/api/v1/resultByUserName?user_name=<%=SecurityUntil.getPrincipal().getUsername()%>';
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $.each(result.data, function (key ,value) {
                    var total = value.listeningScore + value.readingScore;
                    $('#resultHistory').append(
                        "<tr>" +
                        "<td>" + value.examName + "</td>" +
                        "<td>" + value.listeningScore + "</td>" +
                        "<td>" + value.readingScore + "</td>" +
                        "<td>" + value.numberCorrect + "</td>" +
                        "<td>" + total + "</td>" +
                        "</tr>"
                    );
                });
            }
        });
    })
function updateUser(){
    $('#alert1').empty();
        if($('#fullName').val().length === $('#email').val().length === $('#image')[0].files.length === 0){
            $('#alert1').append(
                "<div class='alert alert-warning' role='alert'>Nhập ít nhất một trường muốn thay đổi!</div>"
            );
        }else if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($('#email').val()) == false && $('#email').val() != ""){
            $('#alert-email').append(
                "<div style='color: red'>" +
                "*Sai định dạng</div>"
            );
        } else{
            var form = $('#registrationForm')[0];
            var formData = new FormData(form);
            formData.append("imageFile", $('#image')[0].files[0]);
            $.ajax({
                url: '${pageContext.request.contextPath}/api/v1/user?id=<%=SecurityUntil.getPrincipal().getId()%>',
                type: 'PUT',
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                data: formData,
                success: function (result) {
                    if(result.code == 0)
                        window.location.href="${pageContext.request.contextPath}/user?code=" + result.code + "&message=" + result.message;
                    else{
                        $('#alert1').empty();
                        $('#alert1').append("<div class='alert alert-danger alert-dismissible'> " +
                            "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button> " +
                            "<h5><i class='icon fas fa-info'></i>&nbsp;&nbsp;" +result.message+ "</h5></div>")
                    }
                }
            });
        }
}

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
            $('#alert1').empty();
            if(code == 0){
                $('#alert1').append("<div class='alert alert-success alert-dismissible'> " +
                    "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button> " +
                    "<h5><i class='icon fas fa-check'></i>" +message+ "</h5></div>")
            }
    }

    function changePassword(){
        $('#alert2').empty();
        if($('#oldPassword').val().length == 0 || $('#newPassword').val().length == 0 || $('#reNewPassword').val().length == 0){
            $('#alert2').append(
                "<div class='alert alert-warning' role='alert'>Phải điền đầy đủ!</div>"
            );
        }else if($('#newPassword').val().length < 6){
            $('#alert-password').append(
                "<div style='color: red'>" +
                "*Mật khẩu phải nhiều hơn 6 ký tự</div>"
            );
        }else{
                console.log($('#oldPassword').val());
                var data = {};
                var formData = $('#changePassword').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                $.ajax({
                    url: '${pageContext.request.contextPath}/api/v1/changePassword?id=<%=SecurityUntil.getPrincipal().getId()%>',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        var code = result.code;
                        if(code == 0){
                            code ++;
                            window.location.href="${pageContext.request.contextPath}/logout";
                        }
                        else{
                            $('#alert2').empty();
                            $('#alert2').append("<div class='alert alert-danger alert-dismissible'> " +
                                "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button> " +
                                "<h5><i class='icon fas fa-info'></i>&nbsp;&nbsp;" +result.message+ "</h5></div>"
                            )
                        }
                    }
                });
        }
    }
</script>
</body>
</html>