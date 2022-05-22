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
    <title>Luyện ngữ pháp</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,600,700,700i&display=swap" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/fontawesome-all.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/swiper.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/magnific-popup.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/styles.css'/>" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="<c:url value='/resources/web/images/favicon.png'/>">
    <script async src="https://api.countapi.xyz/hit/learnandtesttoeicGrammar/717819d0-36fb-4dd7-b816-2323ce8e1c09"></script>
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
                <li class="breadcrumb-item active" aria-current="page">Bài ngữ pháp</li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10" id="grammarBody"></div>
        </div> <!-- end of row -->
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
        getGrammar();
    });
    var grammar_id = GetURLParameter('id');
    function getGrammar(){
        var url = '${pageContext.request.contextPath}/api/v1/grammarDetail?id='+grammar_id;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#grammarBody').append(
                    "<h1>"+ result.data.name +"</h1>" +
                    "<p><b>"+ result.data.shortDescription +"</b></p>" +
                    "<img src='${pageContext.request.contextPath}/resources/file/images/grammar/"+ result.data.imageInside +"' class='img-fluid' style='margin-bottom: 100px'>" +
                    result.data.content
                );
            }
        });
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
</script>
</body>
</html>