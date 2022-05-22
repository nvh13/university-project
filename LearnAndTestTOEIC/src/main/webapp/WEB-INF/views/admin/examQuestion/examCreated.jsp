<%@ page import="com.learnandtesttoeic.until.SecurityUntil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm câu hỏi bài thi</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value='/resources/plugins/fontawesome-free/css/all.min.css'/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value='/resources/dist/css/adminlte.min.css'/>">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="<c:url value='/admin'/>" class="brand-link">
            <img src="<c:url value='/resources/dist/img/AdminLTELogo.png'/>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">LearnAndTestTOEIC</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="${pageContext.request.contextPath}/resources/file/images/avatar_user/<%= SecurityUntil.getPrincipal().getImage() %>" class="img-size-50 mr-3 img-circle" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block"><%= SecurityUntil.getPrincipal().getFullName() %></a>
                </div>
            </div>


            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="<c:url value='/admin'/>" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Thông số trang web
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/listening'/>" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Quản lý bài nghe
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/reading'/>" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Quản lý bài đọc
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/grammar'/>" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Quản lý ngữ pháp
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/vocabulary'/>" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Quản lý từ vựng
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/exam'/>" class="nav-link active">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Quản lý bài thi
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/user'/>" class="nav-link">
                            <i class="nav-icon fas fa-users"></i>
                            <p>
                                Quản lý người dùng
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item">Quản lý câu hỏi</li>
                            <li class="breadcrumb-item active">Thêm câu hỏi</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <!-- general form elements -->
                        <div class="card card-success">
                            <div class="card-header">
                                <h2 class="card-title">Thêm câu hỏi</h2>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id='formSubmit' enctype="multipart/form-data">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Câu hỏi</label>
                                        <input type="text" class="form-control" placeholder="Nhập câu hỏi" id="question" name="question">
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả</label>
                                        <input type="text" class="form-control" placeholder="Nhập mô tả" id="description" name="description">
                                    </div>
                                    <div class="form-group">
                                        <label for="part">Phần</label>
                                        <select class="form-control" id="part" name="part">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Ảnh</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="image" accept="image/*">
                                                <label class="custom-file-label" for="image">...</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="audio">Âm thanh</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="audio" accept="audio/*">
                                                <label class="custom-file-label" for="audio">...</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 1</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" name="option1">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 2</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" name="option2">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 3</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" name="option3">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 4</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" name="option4">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn đúng</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn đúng" name="correctOption">
                                    </div>
                                    <div class="form-group">
                                        <label>Đoạn văn</label>
                                        <textarea class="form-control" rows="5" placeholder="Nhập đoạn văn" name="paragraph"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhóm</label>
                                        <input type="number" class="form-control" placeholder="Nhập nhóm câu" id="group" name="group">
                                    </div>
                                    <div id="validate" style="color: red"></div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer float-right"  style="background-color: #fff">
                                    <button type="button" class="btn btn-success" id="createdButton">Xác nhận</button>&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-danger" id="cancelButton">Hủy bỏ</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../template/footer.jsp"></jsp:include>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<c:url value='/resources/plugins/jquery/jquery.min.js'/>"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/resources/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- bs-custom-file-input -->
<script src="<c:url value='/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/resources/dist/js/adminlte.min.js'/>"></script>

<!-- Page specific script -->
<script>
    var exam_id = GetURLParameter('exam_id');
    $(function () {
        bsCustomFileInput.init();
    });
    $('#createdButton').click(function (){
        var group = parseFloat($('#group').val());
        if(Number.isInteger(group) && group > 0){
            var form = $('#formSubmit')[0];
            var formData = new FormData(form);
            formData.append("imageFile", $('#image')[0].files[0]);
            formData.append("audioFile", $('#audio')[0].files[0]);
            addExam(formData);
        }else{
            $('#validate').html("*Nhóm phải là số nguyên dương")
        }
    })
    function addExam(data) {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/examQuestion?exam_id='+ exam_id +'',
            type: 'POST',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: data,
            success: function (result) {
                    window.location.href = "${pageContext.request.contextPath}/admin/examQuestion?id="+exam_id+"&code="+result.code+"&message="+result.message;
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

    $('#cancelButton').click(function (){
        window.location.href = "${pageContext.request.contextPath}/admin/examQuestion?id="+exam_id;
    })
</script>
</body>
</html>