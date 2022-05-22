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
    <title>Luyện bài đọc</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,600,700,700i&display=swap" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/fontawesome-all.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/swiper.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/magnific-popup.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/styles.css'/>" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="<c:url value='/resources/web/images/favicon.png'/>">
    <script async src="https://api.countapi.xyz/hit/learnandtesttoeicReading/8932661d-b3b9-4ea7-8b05-48dba0960e8a"></script>

    <style>
        input[type="radio"] {
            width: 40px;
            height: 40px;
            border-radius: 20px;
            border: 2px solid #17a2b8;
            background-color: white;
            -webkit-appearance: none; /*to disable the default appearance of radio button*/
            -moz-appearance: none;
        }

        input[type="radio"]:focus { /*no need, if you don't disable default appearance*/
            outline: none; /*to remove the square border on focus*/
        }

        input[type="radio"]:checked { /*no need, if you don't disable default appearance*/
            background-color: #17a2b8;
        }

        input[type="radio"]:checked ~ span:first-of-type {
            color: white;
        }

        label span:first-of-type {
            position: relative;
            left: -27px;
            font-size: 20px;
            color: #17a2b8;
        }

        label span {
            position: relative;
            top: -13px;
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
<div class="container"  id='anchor'>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><i class="fas fa-home"></i> <a href="<c:url value='/home'/>" style="font-weight: bold;  text-decoration: none">Trang chủ</a></li>
                <li class="breadcrumb-item" style="font-weight: bold">Bài đọc</li>
                <li class="breadcrumb-item active" aria-current="page" id="part-active"></li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10" id="reading"></div>
        </div> <!-- end of row -->
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10" id="readingBody"></div>
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
        $('#part-active').text(
            "Phần "+ part
        )
        getAReading();
        getReadingQuestion();
    });

    var reading_id = GetURLParameter('id');
    var part = GetURLParameter('part');
    var index = 0;
    var size = 0;
    var correctOption = [];

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

    function getAReading(){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/readingById?id='+reading_id,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#reading').append(
                    "<h1>"+ result.name + "</h1>" +
                    "<p><b><span style='background-color: #ef3e3f;color: white; padding: 9px'>Độ khó "+ result.level +"</span>" +" &nbsp;&nbsp;"+
                          "<span style='background-color: #ef3e3f;color: white; padding: 9px'> Phần "+ result.part +"</span></b></p>" +
                    "<p style='border-style: solid; padding: 7px'><b>" + result.description +"</b></p>"
                );
            }
        });
    }

    function getReadingQuestion(){
        var url = '${pageContext.request.contextPath}/api/v1/listReadingQuestion?reading_id='+reading_id+'&index='+index;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                size = result.totalPage;
                $('#readingBody').empty();
                correctOption.splice(0, correctOption.length);
                if(part == 5)
                    part5(result.data[0]);
                if(part == 6 || part == 7)
                    part6and7(result.data);

                $('#readingBody').append(
                    "<div style='text-align: center'>" +
                    "<button type='button' class='btn btn-outline-info' onClick='back()' id='btnBack'>Quay lại</button>&nbsp&nbsp&nbsp" +
                    "<button type='button' class='btn btn-info' onClick='check()' id='confirm'>Xác nhận</button>&nbsp&nbsp&nbsp" +
                    "<button type='button' class='btn btn-outline-info' onClick='next()'><span id='btnNext'>Tiếp theo</span></button>" +
                    "</div>"
                )

                if(index == 0) {
                    $('#btnBack').prop("disabled", true);
                }
                if(index == size - 1){
                    $('#btnNext').text('Hoàn thành');
                }
            }
        });
    }

    function check(){
        var temp = 0;
        var answers = $('input[type=radio]:checked').map(function () {
            return $(this).val();
        }).get();
        for(let i=0; i< correctOption.length; i++){
            $('#alert'+ (i+1)).empty();
            if(answers[i] == null){
                $('#alert'+ (i+1)).append(
                    "<div class='alert alert-warning' role='alert'>Vui lòng chọn đáp án trước</div>"
                )
            }else if(answers[i] == correctOption[i]){
                $('#alert'+ (i+1)).append(
                    "<div class='alert alert-success' role='alert'>Đáp án đúng</div>"
                )
                temp++;
            }else{
                $('#alert'+ (i+1)).append(
                    "<div class='alert alert-danger' role='alert'>Đáp án sai</div>"
                )
            }
        }
        if(temp == correctOption.length){
            $('#confirm').prop( "disabled", true );
        }
    }

    function next(){
        if(index == size - 1){
            window.location.href = "${pageContext.request.contextPath}/home";
        }else{
            index++;
            getReadingQuestion();
            window.location.href = "#anchor";
        }
    }
    function back(){
        index--;
        getReadingQuestion();
        window.location.href = "#anchor";
    }

    function part5(data){
        correctOption.push(data.correctOption);
        $('#readingBody').append(
            "<p><strong>Question "+ (index+1) +":</strong></p>" +
            "<p style='border-style: none; padding: 10px; background-color: #fcf8e3'><b>" + data.paragraph +"</b></p>" +
            "<div id='alert1'></div>" +
            "<label><input type='radio' name='options' value='"+ data.option1 +"'/><span>A</span><span>"+ data.option1 +"</span></label><br/>" +
            "<label><input type='radio' name='options' value='"+ data.option2 +"'/><span>B</span><span>"+ data.option2 +"</span></label><br/>" +
            "<label><input type='radio' name='options' value='"+ data.option3 +"'/><span>C</span><span>"+ data.option3 +"</span></label><br/>" +
            "<label><input type='radio' name='options' value='"+ data.option4 +"'/><span>D</span><span>"+ data.option4 +"</span></label><br/>"
        );
    }

    function part6and7(data) {
        var number = 1;
        correctOption.splice(0, correctOption.length);
        $('#readingBody').empty();
        $('#readingBody').append(
            "<div style='border-style: none; padding: 10px; background-color: #fcf8e3'>" + data[0].paragraph +"</div>"
        )
        $.each(data, function (key ,value) {
            var question;
            if(part == 7){
                question= "<p><strong>Question "+ number +": </strong>"+value.question +"</p>";
            }else{
                question ="<p><strong>Question "+ number +": </strong></p>";
            }
            $('#readingBody').append(
                question +
                "<div id='alert"+ number +"'></div>" +
                "<label><input type='radio' name='options"+ number +"' value='"+ value.option1 +"'/><span>A</span><span>"+ value.option1 +"</span></label><br/>" +
                "<label><input type='radio' name='options"+ number +"' value='"+ value.option2 +"'/><span>B</span><span>"+ value.option2 +"</span></label><br/>" +
                "<label><input type='radio' name='options"+ number +"' value='"+ value.option3 +"'/><span>C</span><span>"+ value.option3 +"</span></label><br/>" +
                "<label><input type='radio' name='options"+ number +"' value='"+ value.option4 +"'/><span>D</span><span>"+ value.option4 +"</span></label><br/>"
            );
            correctOption.push(value.correctOption);
            number++;
        });

    }
</script>
</body>
</html>