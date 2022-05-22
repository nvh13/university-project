<%@ page import="com.learnandtesttoeic.until.SecurityUntil" %>
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
    <title>Luyện bài nghe</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,600,700,700i&display=swap" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/bootstrap.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/fontawesome-all.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/swiper.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/magnific-popup.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/web/css/styles.css'/>" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="<c:url value='/resources/web/images/favicon.png'/>">
    <script async src="https://api.countapi.xyz/hit/learnandtesttoeicExam/842acfe5-9e41-4981-98e7-7bc7ea4e5367"></script>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

        .numberCircle {
            display: inline-block;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            font-size: 15px;
            line-height: 25px;
            text-align: center;
            border: 2px solid #666;
            margin: 5px 5px 5px 15px;
        }
        #time {
            background-color: #f66;
            padding: 20px;
            font-size: 25px;
            color: white;
            text-align: center;
        }
        #listQuestion {
            border-style: solid ;
            border-width: 0px 1px 1px ;
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
                <li class="breadcrumb-item active" aria-current="page">Làm bài thi thử</li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-12" id="exam"></div>
        </div> <!-- end of row -->
        <div class="row">
            <div class="col-9">
                <br>
                <div>
                    <span id='part1' style='background-color: #eee; padding: 15px'> Phần 1</span>&nbsp;&nbsp;
                    <span id='part2' style='background-color: #eee; padding: 15px'> Phần 2</span>&nbsp;&nbsp;
                    <span id='part3' style='background-color: #eee; padding: 15px'> Phần 3</span>&nbsp;&nbsp;
                    <span id='part4' style='background-color: #eee; padding: 15px'> Phần 4</span>&nbsp;&nbsp;
                    <span id='part5' style='background-color: #eee; padding: 15px'> Phần 5</span>&nbsp;&nbsp;
                    <span id='part6' style='background-color: #eee; padding: 15px'> Phần 6</span>&nbsp;&nbsp;
                    <span id='part7' style='background-color: #eee; padding: 15px'> Phần 7</span>
                </div>
                <br>
                <div id="description">
                </div>
                <br>
                <div id="examBody"></div>
            </div>
            <div class="col-3">
                    <br>
                    <div id="time"></div>
                    <div id="listQuestion">

                    </div>
                    <br>
                    <div class="d-flex justify-content-center">
                        <button type="button" class="btn btn-primary" onclick="warningBeforeCheck()"  id="btnResult" data-toggle="modal" >Chấm điểm</button> &nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-danger" onclick="warningBeforeReload()" id="btnSubmit">Làm lại</button> <br>
                    </div>
            </div>
        </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Kết quả bài thi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="popup-body">
                    <p>Listening: <span id="listeningResult">0</span></p>
                    <p>Reading: <span id="readingResult">0</span></p>
                    <p>Số câu đúng: <span id="numberCorrect">0</span></p>
                    <p>Tổng điểm: <span id="total">0</span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
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
<script src="<c:url value='/resources/sweetalert/sweetalert2.min.js'/>"></script>

<script>
    $(document).ready(function (){
        getAExam();
        getListQuestion();
        setTimeout(function (){
            index = $('#question1').attr("value");
            getExamQuestion();
        },200);
    });

    var exam_id = GetURLParameter('id');
    var index = 0;
    var size = 0;
    const numbers = new Map();
    const answers = new Map();

// COUNT DOWN TIMER
    var hour = 1;
    var min = 0;
    var countdown = (hour * 60 * 60 * 1000) + (min * 60 * 1000);
    var timeload = setInterval(function () {
        countdown -= 1000;
        var hr   = Math.floor( (countdown / (60 * 60 * 1000)) % 24 );
        var min = Math.floor( (countdown / (60 * 1000)) % 60 );
        var sec = Math.floor( (countdown / 1000) % 60 );

        if (countdown <= 0) {
            clearInterval(timeload);
            $("#btnResult").click();
        }
        else {
            $("#time").html(hr + " : " + min + " : " + sec);
        }
    }, 1000);
// END
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

    function getAExam(){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/examById?id='+exam_id,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#exam').append(
                    "<h3>"+ result.data.name + "</h3>"
                );
            }
        });
    }

    function getListQuestion(){
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/examQuestionAll?exam_id='+exam_id,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $.each(result.data, function (key ,value) {
                    size++;
                    $('#listQuestion').append(
                        "<button type='button' value='"+ value.group +"' onclick='redirectQuestion("+ value.group +")' name='question_list' id='question"+ size +"' class='numberCircle'>"+ size +"</button>"
                    );
                    numbers.set(value.id, size);
                });
            }
        });
    }

    function getExamQuestion(){
        var url = '${pageContext.request.contextPath}/api/v1/listExamQuestion?exam_id='+exam_id+'&index='+index;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                part = result.data[0].part
                $("#part"+part).css("background-color", "#ef3e3f");
                $("#part"+part).css("color", "white");

                $('#description').empty();
                $('#description').append(
                    "<p style='border-style: solid; padding: 7px'><b>" + result.data[0].description +"</b></p>"
                );

                $('#examBody').empty();
                if(part == 1)
                    part1(result.data[0]);
                else if(part == 2)
                    part2(result.data[0]);
                else if(part == 3 || part == 4)
                    part3and4(result.data);
                else if(part == 5)
                    part5(result.data[0]);
                else if(part == 6 || part == 7)
                    part6and7(result.data);
                $('#examBody').append(
                    "<div style='text-align: center' id='btnGroup'>" +
                    "<button type='button' class='btn btn-outline-info' onClick='back()' id='btnBack'>Quay lại</button>&nbsp&nbsp&nbsp" +
                    "<button type='button' class='btn btn-info' onClick='next()' id='btnNext'>Tiếp theo</button>" +
                    "</div>"
                )

                if(index == $('#question1').attr("value")) {
                    $('#btnBack').prop("disabled", true);
                }
                if(index == $('#question'+size).attr("value")){
                    $('#btnNext').prop("disabled", true);
                }
                changeColor();
                if($('#btnResult').attr("disabled") == "disabled" ){
                    $('#btnGroup').append(
                        "&nbsp&nbsp&nbsp<button type='button' class='btn btn-success' onClick='getCorrectOption()' id='btnCorrect'>Hiện đáp án</button>"
                    )}
                window.location.href = "#anchor";

            }
        });
    }

    function next(){
        let count = 0;
        for (let i = 1; i <= size; i++) {
            let temp = parseInt($('#question'+i).attr("value"));
            if(index == temp){
                count ++;
            };
            if(index != temp && count != 0){
                index = temp;
                break;
            }
        }
        getExamQuestion();
    }
    function back(){
        let count = 0;
        for (let i = size; i >= 1; i--) {
            let temp = parseInt($('#question'+i).attr("value"));
            if(index == temp){
                count ++;
            };
            if(index != temp && count != 0){
                index = temp;
                break;
            }
        }
        getExamQuestion();
    }

    function part1(data) {
        $('#examBody').append(
            "<div style='text-align: center'><p><img src='${pageContext.request.contextPath}/resources/file/images/exam/"+ data.image +"'></p> " +
            "<p><audio controls>" +
            "<source src='${pageContext.request.contextPath}/resources/file/audio/exam/"+ data.audio +"' type='audio/mpeg'>" +
            "</audio></p></div>" +
            "<p><strong>Question "+ numbers.get(data.id) +":</strong></p>" +
            "<div id='alert1'></div>" +
            "<label><input type='radio' id='A"+ data.id +"' name='options' value='"+ data.option1 +"' onClick='getAnswer("+ data.id +", \""+ data.option1 +"\")'/><span>A</span><span>"+ data.option1 +"</span></label><br/>" +
            "<label><input type='radio' id='B"+ data.id +"' name='options' value='"+ data.option2 +"' onClick='getAnswer("+ data.id +", \""+ data.option2 +"\")'/><span>B</span><span>"+ data.option2 +"</span></label><br/>" +
            "<label><input type='radio' id='C"+ data.id +"' name='options' value='"+ data.option3 +"' onClick='getAnswer("+ data.id +", \""+ data.option3 +"\")'/><span>C</span><span>"+ data.option3 +"</span></label><br/>" +
            "<label><input type='radio' id='D"+ data.id +"' name='options' value='"+ data.option4 +"' onClick='getAnswer("+ data.id +", \""+ data.option4 +"\")'/><span>D</span><span>"+ data.option4 +"</span></label><br/>"
        );
        if(numbers.has(data.id)){
            answered(data.id);
        }
    }

    function part2(data) {
        $('#examBody').append(
            "<div style='text-align: center'><p><audio controls>" +
            "<source src='${pageContext.request.contextPath}/resources/file/audio/exam/"+ data.audio +"' type='audio/mpeg'>" +
            "</audio></p></div>" +
            "<p><strong>Question "+ numbers.get(data.id) +":</strong></p>" +
            "<div id='alert1'></div>" +
            "<label><input type='radio' id='A"+ data.id +"' name='options' value='"+ data.option1 +"' onClick='getAnswer("+ data.id +", \""+ data.option1 +"\")'/><span>A</span><span>"+ data.option1 +"</span></label><br/>" +
            "<label><input type='radio' id='B"+ data.id +"' name='options' value='"+ data.option2 +"' onClick='getAnswer("+ data.id +", \""+ data.option2 +"\")'/><span>B</span><span>"+ data.option2 +"</span></label><br/>" +
            "<label><input type='radio' id='C"+ data.id +"' name='options' value='"+ data.option3 +"' onClick='getAnswer("+ data.id +", \""+ data.option3 +"\")'/><span>C</span><span>"+ data.option3 +"</span></label><br/>"
        );
        if(numbers.has(data.id)){
            answered(data.id);
        }
    }

    function part3and4(data){
        var number = 1;
        $('#examBody').append(
            "<div style='text-align: center'><p><audio controls>" +
            "<source src='${pageContext.request.contextPath}/resources/file/audio/exam/"+ data[0].audio +"' type='audio/mpeg'>" +
            "</audio></p></div>"
        )
        $.each(data, function (key ,value) {
            $('#examBody').append(
                "<p><strong>Question "+ numbers.get(value.id) +": </strong>"+value.question +"</p>" +
                "<div id='alert"+ number +"'></div>" +
                "<label><input type='radio' id='A"+ value.id +"' name='options"+ number +"' value='"+ value.option1 +"' onClick='getAnswer("+ value.id +", \""+ value.option1 +"\")'/><span>A</span><span>"+ value.option1 +"</span></label><br/>" +
                "<label><input type='radio' id='B"+ value.id +"' name='options"+ number +"' value='"+ value.option2 +"' onClick='getAnswer("+ value.id +", \""+ value.option2 +"\")'/><span>B</span><span>"+ value.option2 +"</span></label><br/>" +
                "<label><input type='radio' id='C"+ value.id +"' name='options"+ number +"' value='"+ value.option3 +"' onClick='getAnswer("+ value.id +", \""+ value.option3 +"\")'/><span>C</span><span>"+ value.option3 +"</span></label><br/>" +
                "<label><input type='radio' id='D"+ value.id +"' name='options"+ number +"' value='"+ value.option4 +"' onClick='getAnswer("+ value.id +", \""+ value.option4 +"\")'/><span>D</span><span>"+ value.option4 +"</span></label><br/>"
            );
            number++;
            if(numbers.has(value.id)){
                answered(value.id);
            }
        });
    }

    function part5(data){
        $('#examBody').append(
            "<p><strong>Question "+ numbers.get(data.id) +":</strong></p>" +
            "<p style='border-style: none; padding: 10px; background-color: #fcf8e3'>"+ data.question +"</p>" +
            "<div id='alert1'></div>" +
            "<label><input type='radio' id='A"+ data.id +"' name='options' value='"+ data.option1 +"' onClick='getAnswer("+ data.id +", \""+ data.option1 +"\")'/><span>A</span><span>"+ data.option1 +"</span></label><br/>" +
            "<label><input type='radio' id='B"+ data.id +"' name='options' value='"+ data.option2 +"' onClick='getAnswer("+ data.id +", \""+ data.option2 +"\")'/><span>B</span><span>"+ data.option2 +"</span></label><br/>" +
            "<label><input type='radio' id='C"+ data.id +"' name='options' value='"+ data.option3 +"' onClick='getAnswer("+ data.id +", \""+ data.option3 +"\")'/><span>C</span><span>"+ data.option3 +"</span></label><br/>" +
            "<label><input type='radio' id='D"+ data.id +"' name='options' value='"+ data.option4 +"' onClick='getAnswer("+ data.id +", \""+ data.option4 +"\")'/><span>D</span><span>"+ data.option4 +"</span></label><br/>"
        );
        if(numbers.has(data.id)){
            answered(data.id);
        }
    }
    function part6and7(data) {
        var number = 1;
        $('#examBody').empty();
        $('#examBody').append(
            "<div style='border-style: none; padding: 10px; background-color: #fcf8e3'><img src='${pageContext.request.contextPath}/resources/file/images/exam/"+ data[0].image +"' width='730'></div>"
        )
        $.each(data, function (key ,value) {
            var question;
            if(part == 7){
                question= "<p><strong>Question "+ numbers.get(value.id) +": </strong>"+value.question +"</p>";
            }else{
                question ="<p><strong>Question "+ numbers.get(value.id) +": </strong></p>";
            }
            $('#examBody').append(
                question +
                "<div id='alert"+ number +"'></div>" +
                "<label><input type='radio' id='A"+ value.id +"' name='options"+ number +"' value='"+ value.option1 +"' onClick='getAnswer("+ value.id +", \""+ value.option1 +"\")'/><span>A</span><span>"+ value.option1 +"</span></label><br/>" +
                "<label><input type='radio' id='B"+ value.id +"' name='options"+ number +"' value='"+ value.option2 +"' onClick='getAnswer("+ value.id +", \""+ value.option2 +"\")'/><span>B</span><span>"+ value.option2 +"</span></label><br/>" +
                "<label><input type='radio' id='C"+ value.id +"' name='options"+ number +"' value='"+ value.option3 +"' onClick='getAnswer("+ value.id +", \""+ value.option3 +"\")'/><span>C</span><span>"+ value.option3 +"</span></label><br/>" +
                "<label><input type='radio' id='D"+ value.id +"' name='options"+ number +"' value='"+ value.option4 +"' onClick='getAnswer("+ value.id +", \""+ value.option4 +"\")'/><span>D</span><span>"+ value.option4 +"</span></label><br/>"
            );
            number++;
            if(numbers.has(value.id)){
                answered(value.id);
            }
        });
    }

    function redirectQuestion(index){
        this.index = index;
        getExamQuestion();
    }

    function changeColor(){
        for (let i = 1; i <= size; i++) {
            if($('#question'+i).attr("value") == index){
                $('#question'+i).css("color",'#0059ff');
                $('#question'+i).css("border-color",'#0059ff');
            }else{
                $('#question'+i).css("color",'black');
                $('#question'+i).css("border-color",'black');
            }
        }
    }

    function getAnswer(id, answer){
        answers.set(id, answer);
        $('#question'+ numbers.get(id)).css("background-color",'#727272');
    }

    function answered(id){
        if(answers.get(id) == $('#A'+id).val()){
            $('#A'+id).prop("checked",true);
        }else if(answers.get(id) == $('#B'+id).val()){
            $('#B'+id).prop("checked",true);
        }else if(answers.get(id) == $('#C'+id).val()){
            $('#C'+id).prop("checked",true);
        }else if(answers.get(id) == $('#D'+id).val()){
            $('#D'+id).prop("checked",true);
        }
    }

    function getScore() {
        const obj = Object.fromEntries(answers);
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/result?exam_id='+exam_id+'&userName=<%=SecurityUntil.getPrincipal().getUsername()%>',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(obj),
            dataType: 'json',
            success: function (result) {
                $('#listeningResult').text(result.data.listeningScore);
                $('#readingResult').text(result.data.readingScore);
                $('#numberCorrect').text(result.data.numberCorrect);
                $('#total').text(result.data.listeningScore + result.data.readingScore);
                $.each(result.data.indexTrue, function (key, value){
                    value++;
                    $('#question'+value).css('background-color','green');

                })
                $.each(result.data.indexFalse, function (k, v){
                    v++;
                    $('#question'+ v).css('background-color','red');
                })
                $('#btnResult').prop("disabled", true);
                $('#question1').click();
                clearInterval(timeload);
            }
        });
    }

    function getCorrectOption(){
        $('#btnCorrect').prop("disabled", true);
        $(':radio:not(:checked)').attr('disabled', true);
        var url = '${pageContext.request.contextPath}/api/v1/listExamQuestion?exam_id='+exam_id+'&index='+index;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                var alertNum = 1;
                $.each(result.data, function (k, v){
                    console.log('alert'+ alertNum);
                    $('#alert'+ alertNum).append(
                        "<div class='alert alert-success' role='alert'>Đáp án đúng: "+ v.correctOption+"</div>"
                    )
                    alertNum++;
                })
            }
        });
    }

    function warningBeforeReload(){
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Xác nhận làm lại?',
            text: "Dữ liệu sẽ không thể khôi phục",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xác nhận!',
            cancelButtonText: 'Hủy bỏ!'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.reload();
            } else if (
                result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithBootstrapButtons.fire(
                    'Mời bạn tiếp tục làm bài!'
                )
            }
        })
    }

    function warningBeforeCheck(){
        if(answers.size < size){
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })

            swalWithBootstrapButtons.fire({
                title: 'Xác nhận Chấm điểm?',
                text: "Bạn chưa hoàn thành tất cả các câu!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Xác nhận!',
                cancelButtonText: 'Hủy bỏ!'
            }).then((result) => {
                if (result.isConfirmed) {
                    getScore();
                    $('#exampleModalCenter').modal('show');
                } else if (
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons.fire(
                        'Mời bạn tiếp tục làm bài!'
                    )
                }
            })
        }else{
            getScore();
            $('#exampleModalCenter').modal('show');
        }
    }
</script>
</body>
</html>