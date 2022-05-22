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
    <title>Thêm người dùng</title>

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
                        <a href="<c:url value='/admin/exam'/>" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Quản lý bài thi
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value='/admin/user'/>" class="nav-link active">
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
                            <li class="breadcrumb-item">Quản lý người dùng</li>
                            <li class="breadcrumb-item active">Thêm người dùng</li>
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
                                <h2 class="card-title">Thêm người dùng</h2>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id='formSubmit'>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Tên tài khoản</label>
                                        <input type="text" class="form-control" placeholder="Nhập tên tài khoản" id="userName" name="userName">
                                        <div id="alert-userName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Mật khẩu</label>
                                        <input type="password" class="form-control" placeholder="Nhập mật khẩu" id="password" name="password">
                                        <div id="alert-password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Xác thực mật khẩu</label>
                                        <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" id="rePassword" name="rePassword">
                                        <div id="alert-rePassword">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên người dùng</label>
                                        <input type="text" class="form-control" placeholder="Nhập tên người dùng" id="fullName" name="fullName">
                                        <div id="alert-fullName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" class="form-control" placeholder="Nhập email" name="email" id="email">
                                        <div id="alert-email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="role">Quyền</label>
                                        <select class="form-control" id="role" name="role">
                                            <option>ROLE_USER</option>
                                            <option>ROLE_ADMIN</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                                <div id="alert"></div>
                                <div class="card-footer float-right"  style="background-color: #fff">
                                    <button type="button" class="btn btn-success" id="createdButton" onclick="check()">Xác nhận</button>&nbsp;&nbsp;&nbsp;
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
    $(function () {
        bsCustomFileInput.init();
    });
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
                    window.location.href="${pageContext.request.contextPath}/admin/user?code=" + result.code + "&message=" + result.message;
                }else{
                    $('#alert').empty();
                    $('#alert').append(
                        "<div class='alert alert-danger' role='alert'>" +
                        result.message +
                        "</div>"
                    );
                }
            }
        });
    }

    $('#cancelButton').click(function (){
        window.location.href = "${pageContext.request.contextPath}/admin/user";
    })
</script>
</body>
</html>
