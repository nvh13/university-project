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
    <title>Cập nhật câu hỏi bài đọc</title>

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
                        <a href="<c:url value='/admin/reading'/>" class="nav-link active">
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
                        <a href="<c:url value='/admin/exam'/>" class="nav-link">
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
                            <li class="breadcrumb-item active">Cập nhật câu hỏi</li>
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
                        <div class="card card-primary">
                            <div class="card-header">
                                <h2 class="card-title">Cập nhật câu hỏi</h2>
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
                                        <label>Lựa chọn 1</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" id="option1" name="option1">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 2</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" id="option2" name="option2">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 3</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn" id="option3" name="option3">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn 4</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn"  id="option4"name="option4">
                                    </div>
                                    <div class="form-group">
                                        <label>Lựa chọn đúng</label>
                                        <input type="text" class="form-control" placeholder="Nhập lựa chọn đúng"  id="correctOption"name="correctOption">
                                    </div>
                                    <div class="form-group">
                                        <label>Đoạn văn</label>
                                        <textarea class="form-control" rows="10" placeholder="Nhập đoạn văn" id="paragraph" name="paragraph"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Giải thích</label>
                                        <textarea class="form-control" rows="5" placeholder="Nhập lời giải thích" id="reason" name="reason"></textarea>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer float-right"  style="background-color: #fff">
                                    <button type="button" class="btn btn-success" id="updatedButton">Xác nhận</button>&nbsp;&nbsp;&nbsp;
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
    var reading_id = GetURLParameter('reading_id');
    var id = GetURLParameter('id');
    $(function () {
        bsCustomFileInput.init();
    });
    $('#updatedButton').click(function (){
        var form = $('#formSubmit')[0];
        var formData = new FormData(form);
        updateReading(formData);
    })
    function updateReading(data) {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/readingQuestion?reading_id='+ reading_id +'&id='+id,
            type: 'PUT',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            data: data,
            success: function (result) {
                window.location.href = "${pageContext.request.contextPath}/admin/readingQuestion?id="+reading_id+"&code="+result.code+"&message="+result.message;
            }
        });
    }
    $(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/readingQuestionById?id='+id,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $.each(result.data, function (key ,value) {
                        $('#' + key).val(value);
                });
            }
        });
    });
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
        window.location.href = "${pageContext.request.contextPath}/admin/readingQuestion?id="+reading_id;
    })
</script>
</body>
</html>
