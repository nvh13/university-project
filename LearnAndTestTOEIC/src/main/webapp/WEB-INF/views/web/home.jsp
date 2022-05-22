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
    <title>Trang chủ</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,600,700,700i&display=swap" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/fontawesome-all.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/swiper.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/magnific-popup.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/styles.css'/>" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="<c:url value='/resources/web/images/favicon.png'/>">
    <script async src="https://api.countapi.xyz/hit/learnandtesttoeic/ad283c22-035b-42a9-b0d9-cb5fc48d4d69"></script>
    <style>
        .custom-link{
            text-decoration: none;
            color: #333;
        }
        .custom-link:hover{
            color: #d2d2d2;
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


<!-- Header -->
<header id="header" class="header">
    <jsp:include page="template/header.jsp"></jsp:include>
</header> <!-- end of header -->
<!-- end of header -->

<div id="instructor" class="form-1">
    <div class="container">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-5">
                <h2><a class="nav-link page-scroll custom-link" href="#listening"><i class="fas fa-headphones-alt"></i> Luyện bài nghe</a></h2>
                <h2><a class="nav-link page-scroll custom-link" href="#reading"><i class="fas fa-book-open"></i> Luyện bài đọc</a></h2>
                <h2><a class="nav-link page-scroll custom-link" href="#grammar"><i class="fas fa-spell-check"></i> Luyện ngữ pháp</a></h2>
                <h2><a class="nav-link page-scroll custom-link" href="#vocabulary"><i class="fas fa-book"></i> &nbsp;Luyện từ vựng</a></h2>
            </div> <!-- end of col -->
            <div class="col-lg-1"></div>
            <div class="col-lg-5">
                <h2><a class="nav-link page-scroll custom-link" href="#exam"><i class="fab fa-leanpub"></i> &nbsp;Thi thử</a></h2>
                <p>Luyện thi thử TOEIC online miễn phí tại LearnAndTestTOEIC giúp bạn cải thiện kỹ năng làm bài thi TOEIC nói riêng và kỹ năng tiếng Anh nói chung thông qua nhiều dạng bài tập ngữ pháp và từ vựng.</p>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div> <!-- end of form-1 -->

<!-- Description -->
<div id="listening" class="basic-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Luyện tập bài nghe</h2>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="row" id="listeningBody">

        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div>

<div id="reading" class="basic-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Luyện tập bài đọc</h2>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="row" id="readingBody">

        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div>

<div class="cards" id="grammar">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Luyện tập ngữ pháp</h2>
                <p class="p-heading">Các nhóm ngữ pháp theo chủ đề xuất hiện thường xuyên xuất hiện trong bài thi TOEIC</p>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="row">
            <div class="col-lg-12" id="grammarBody">

            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="float-right">
            <ul class="pagination" id="paginationGrammar"></ul>
        </div>
    </div> <!-- end of container -->
</div> <!-- end of cards -->
<!-- end of takeaways -->

<div class="cards" id="vocabulary">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Luyện tập từ vựng</h2>
                <p class="p-heading">Thi thử TOEIC Online với ngân hàng đề thi thử TOEIC 2022</p>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="row">
            <div class="col-lg-12" id="vocabularyBody">

            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="float-right">
            <ul class="pagination" id="paginationVocabulary"></ul>
        </div>
    </div> <!-- end of container -->
</div> <!-- end of cards -->
<!-- end of takeaways -->

<div id="exam" class="cards" style="background-color: #ffbd50">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Thi thử</h2>
                <p class="p-heading">Các nhóm từ vựng theo chủ đề xuất hiện thường xuyên xuất hiện trong bài thi TOEIC</p>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="row">
            <div class="col-lg-12" id="examBody">

            </div> <!-- end of col -->
        </div> <!-- end of row -->
        <div class="float-right">
            <ul class="pagination" id="paginationExam"></ul>
        </div>
    </div> <!-- end of container -->
</div> <!-- end of form-3 -->
<!-- end of contact -->


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
        getVocabulary(1);
        getListening();
        getReading();
        getGrammar(1);
        getExam(1);
    });
    function getListening(){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/listening',
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $.each(result, function (key ,value) {
                    $('#listeningBody').append(
                        "<div class='col-lg-4 my-4'>" +
                            "<img src='${pageContext.request.contextPath}/resources/file/images/listening/"+ value.image +"' class='float-left mr-2' width='200 px' height='200 px'>" +
                            "<div>" +
                                "<h4>"+ value.name +"</h4>" +
                                "<p>Phần: "+ value.part +"<br>Độ khó: "+ value.level +"</p>" +
                                "<button type='button' class='btn btn-primary' onClick='redirectListening("+ value.id +", "+ value.part +")'>Chi tiết</button>" +
                            "</div>" +
                        "</div>"
                    );
                });
            }
        });
    }

    function getReading(){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/reading',
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $.each(result, function (key ,value) {
                    $('#readingBody').append(
                        "<div class='col-lg-4 my-4'>" +
                        "<img src='${pageContext.request.contextPath}/resources/file/images/reading/"+ value.image +"' class='float-left mr-2' width='200 px' height='200 px'>" +
                        "<div>" +
                        "<h4>"+ value.name +"</h4>" +
                        "<p>Phần: "+ value.part +"<br>Độ khó: "+ value.level +"</p>" +
                        "<button type='button' class='btn btn-primary' onClick='redirectReading("+ value.id +", "+ value.part +")'>Chi tiết</button>" +
                        "</div>" +
                        "</div>"
                    );
                });
            }
        });
    }

    function getVocabulary(page){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/vocabulary?page='+ page +'&per_page=6',
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#vocabularyBody').empty();
                $.each(result.data, function (key ,value) {
                    $('#vocabularyBody').append(
                        "<div class='card'>" +
                            "<div class='card-image' > " +
                                "<img src='${pageContext.request.contextPath}/resources/file/images/vocabulary/"+ value.image +"' width='96px' height='96px'>" +
                        "</div>" +
                        "<div class='card-body'>" +
                                "<h4 class='card-title'>"+ value.name +"</h4>" +
                                "<button type='button' class='btn btn-primary' onClick='redirectVocabulary("+ value.id +")'>Chi tiết</button>" +
                            "</div>" +
                        "</div>"
                    );
                });
                pagingVocabulary(result.totalPage, page);
            }
        });
    }

    function pagingVocabulary(totalPage, currentPage) {
        window.pagObj = $('#paginationVocabulary').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage: currentPage,
            first:'Đầu',
            prev:'Trước',
            next:'Tiếp',
            last:'Cuối',
            onPageClick: function (event, page) {
                if (currentPage != page){
                    getVocabulary(page);
                    currentPage = page;
                }
            }
        });
    };

    function getGrammar(page){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/grammar?page='+ page +'&per_page=6',
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#grammarBody').empty();
                $.each(result.data, function (key ,value) {
                    $('#grammarBody').append(
                        "<div class='card'>" +
                            "<div class='card-image' > " +
                                "<img src='${pageContext.request.contextPath}/resources/file/images/grammar/"+ value.imageOutside +"' width='96px' height='96px'>" +
                            "</div>" +
                            "<div class='card-body'>" +
                                "<h4 class='card-title'>"+ value.name +"</h4>" +
                                "<button type='button' class='btn btn-primary' onClick='redirectGrammar("+ value.id +")'>Chi tiết</button>" +
                            "</div>" +
                        "</div>"
                    );
                });
                pagingGrammar(result.totalPage, page);
            }
        });
    }

    function pagingGrammar(totalPage, currentPage) {
        window.pagObj = $('#paginationGrammar').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage: currentPage,
            first:'Đầu',
            prev:'Trước',
            next:'Tiếp',
            last:'Cuối',
            onPageClick: function (event, page) {
                if (currentPage != page){
                    getGrammar(page);
                    currentPage = page;
                }
            }
        });
    };

    function getExam(page){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/exam?page='+ page +'&per_page=6',
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#examBody').empty();
                $.each(result.data, function (key ,value) {
                    $('#examBody').append(
                        "<div class='card' style='background-color: #ffedd0'>" +
                        "<div class='card-image' > " +
                        "<img src='${pageContext.request.contextPath}/resources/file/images/exam/"+ value.image +"' width='96px' height='96px'>" +
                        "</div>" +
                        "<div class='card-body'>" +
                        "<h4 class='card-title'>"+ value.name +"</h4>" +
                        "<button type='button' class='btn btn-primary' onClick='redirectExam("+ value.id +")'>Làm bài thi</button>" +
                        "</div>" +
                        "</div>"
                    );
                });
                pagingExam(result.totalPage, page);
            }
        });
    }

    function pagingExam(totalPage, currentPage) {
        window.pagObj = $('#paginationExam').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage: currentPage,
            first:'Đầu',
            prev:'Trước',
            next:'Tiếp',
            last:'Cuối',
            onPageClick: function (event, page) {
                if (currentPage != page){
                    getExam(page);
                    currentPage = page;
                }
            }
        });
    };

    function redirectListening(id, part){
        window.location.href = "${pageContext.request.contextPath}/listening?id="+id+"&part="+part;
    }
    function redirectReading(id, part){
        window.location.href = "${pageContext.request.contextPath}/reading?id="+id+"&part="+part;
    }
    function redirectGrammar(id){
        window.location.href = "${pageContext.request.contextPath}/grammar?id="+id;
    }
    function redirectVocabulary(id){
        window.location.href = "${pageContext.request.contextPath}/vocabulary?id="+id;
    }
    function redirectExam(id){
        window.location.href = "${pageContext.request.contextPath}/exam?id="+id;
    }
</script>
</body>
</html>