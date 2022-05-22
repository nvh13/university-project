<%@ page import="com.learnandtesttoeic.until.SecurityUntil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý bài ngữ pháp</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value='/resources/plugins/fontawesome-free/css/all.min.css'/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value='/resources/dist/css/adminlte.min.css'/>">

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                        <a href="<c:url value='/admin/grammar'/>" class="nav-link active">
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
                    <div class="col-sm-6" id="alert_message">

                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<c:url value='/admin/grammar'/>">Quản lý ngữ pháp</a></li>
                            <li class="breadcrumb-item active">Chi tiết bài ngữ pháp</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                    <div class="row">
                        <div class="col-3 btn-group">
                            <button type='button' class='btn btn-primary' onclick='redirectUpdatePage()'><i class='fa fa-wrench' aria-hidden='true' ></i>&nbsp; Cập nhật</button>
                            <button type="button" class="btn btn-danger" id="btnDelete" onclick="warningBeforeDelete()"> <i class="fa fa-trash"></i>&nbsp;  Xóa</button>
                        </div>
                        <div class="col-12">
                            <table class="table table-bordered">
                                <thead style="background-color: #343a40; color: white" >
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Mô tả ngắn</th>
                                    <th scope="col">Ảnh bìa</th>
                                    <th scope="col">Ảnh nội dung</th>
                                    <th scope="col">Nội dung</th>
                                </tr>
                                </thead>
                                <tbody id="grammar">
                                </tbody>
                            </table>
                            <div class="float-right">
                                <ul class="pagination" id="pagination"></ul>
                            </div>
                        </div>
                    </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../template/footer.jsp"></jsp:include>
>
</div>
<!-- ./wrapper -->

<!-- jQuery -->

<script src="<c:url value='/resources/plugins/jquery/jquery.min.js'/>"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value='/resources/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/resources/dist/js/adminlte.min.js'/>"></script>
<!-- Page specific script -->
<script src="<c:url value='/resources/js/jquery.twbsPagination.js" type="text/javascript'/>"></script>

<script src="<c:url value='/resources/sweetalert/sweetalert2.min.js'/>"></script>
<script>
    $(document).ready(function (){
        getGrammar();
        getMessage(code, message);
    });
    var grammar_id = GetURLParameter('id');
    var code = GetURLParameter('code');
    var message = GetURLParameter('message');
    function getGrammar(){
        var url = '${pageContext.request.contextPath}/api/v1/grammarDetail?id='+grammar_id;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                    $('#grammar').append(
                        "<tr>" +
                        "<td>" + result.data.id + "</td> " +
                        "<td>" + result.data.name + "</td> " +
                        "<td>" + result.data.shortDescription + "</td> " +
                        "<td>" + result.data.imageOutside + "</td> " +
                        "<td>" + result.data.imageInside + "</td> " +
                        "<td>" + result.data.content + "</td> " +
                        "</tr>");
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

    function redirectUpdatePage(){
        window.location.href = "${pageContext.request.contextPath}/admin/grammarDetail/updated?id="+grammar_id;
    }
    function getMessage(code, message){
        if(code == 0){
            $('#alert_message').append("<div class='alert alert-success alert-dismissible'> " +
                "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button> " +
                "<h5><i class='icon fas fa-check'></i>" +message+ "</h5></div>")
        }
        if(code == 999){
            $('#alert_message').append("<div class='alert alert-danger alert-dismissible'> " +
                "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button> " +
                "<h5><i class='icon fas fa-info'></i>" +message+ "</h5></div>")
        }
    }

    function warningBeforeDelete(){
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Xác nhận xóa?',
            text: "Dữ liệu sẽ không thể khôi phục",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xác nhận!',
            cancelButtonText: 'Hủy bỏ!'
        }).then((result) => {
            if (result.isConfirmed) {
                deleteGrammar(grammar_id);
            } else if (
                result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithBootstrapButtons.fire(
                    'Đã hủy bỏ',
                    'Dữ liệu của bạn an toàn',
                    'error'
                )
            }
        })
    }
    function deleteGrammar(data) {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/grammar',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${pageContext.request.contextPath}/admin/grammar?code="+result.code+"&message="+result.message;
            }
        });
    }
</script>
</body>
</html>
