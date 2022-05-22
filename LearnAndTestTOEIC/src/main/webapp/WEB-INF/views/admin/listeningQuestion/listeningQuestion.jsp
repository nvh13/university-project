<%@ page import="com.learnandtesttoeic.until.SecurityUntil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý câu hỏi bài nghe</title>

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
                        <a href="<c:url value='/admin/listening'/>" class="nav-link active">
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
                            <li class="breadcrumb-item"><a href="<c:url value='/admin/listening'/>">Quản lý bài nghe</a></li>
                            <li class="breadcrumb-item active">Quản lý câu hỏi</li>
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
                            <button type="button" class="btn btn-success" onclick="redirectAddPage()"><i class="fa fa-plus-square"></i>&nbsp; Thêm</button>
                            <button type="button" class="btn btn-danger" id="btnDelete" onclick="warningBeforeDelete()"> <i class="fa fa-trash"></i>&nbsp;  Xóa</button>
                        </div>
                        <div class="col-4 btn-group"></div>
                        <div class="col-5 input-group">
                            <input type="text" class="form-control" id="keyword" placeholder="Nhập từ khóa ....">
                            <button class="btn btn-success" type="button" id="search">Tìm kiếm</button>
                            <button class="btn btn-danger" type="button" id="cancelSearch">Hủy bỏ</button>
                        </div>
                        <div class="col-12">
                            <table class="table table-bordered">
                                <thead style="background-color: #343a40; color: white" >
                                <tr>
                                    <th scope="col"><input type="checkbox" id="checkAll">&nbsp;&nbsp; Id</th>
                                    <th scope="col">Câu hỏi</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col">Âm thanh</th>
                                    <th scope="col">Lựa chọn 1</th>
                                    <th scope="col">Lựa chọn 2</th>
                                    <th scope="col">Lựa chọn 3</th>
                                    <th scope="col">Lựa chọn 4</th>
                                    <th scope="col">Lựa chọn đúng</th>
                                    <th scope="col">Giải thích</th>
                                    <th scope="col">Cập nhật</th>
                                </tr>
                                </thead>
                                <tbody id="listening">
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
        getListening(1);
        getMessage(code, message);
    });
    var listening_id = GetURLParameter('id');
    var code = GetURLParameter('code');
    var message = GetURLParameter('message');
    function getListening(page){
        var url = '${pageContext.request.contextPath}/api/v1/listeningQuestion?page='+ page +'&per_page=10&id='+listening_id;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                $('#listening').empty();
                $.each(result.data, function (key ,value) {
                    $('#listening').append(
                        "<tr>" +
                        "<td><div class='custom-control custom-checkbox'> " +
                            "<input type='checkbox' class='custom-control-input' id='check"+ value.id +"' value='" + value.id + "'> " +
                            "<label class='custom-control-label' for='check"+ value.id +"'>" + value.id + "</label></div></td>" +
                        "<td>" + value.question + "</td> " +
                        "<td>" + value.image + "</td> " +
                        "<td>" + value.audio + "</td> " +
                        "<td>" + value.option1 + "</td> " +
                        "<td>" + value.option2 + "</td> " +
                        "<td>" + value.option3 + "</td> " +
                        "<td>" + value.option4 + "</td> " +
                        "<td>" + value.correctOption + "</td> " +
                        "<td>" + value.reason + "</td> " +
                        "<td><button type='button' class='btn btn-primary' onclick='redirectUpdatePage(" + value.id + ")'><i class='fa fa-wrench' aria-hidden='true' ></i></button></td>" +
                        "</tr>");
                });
                paging(result.totalPage, page);
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

    function paging(totalPage, currentPage) {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage: currentPage,
            first:'Đầu',
            prev:'Trước',
            next:'Tiếp',
            last:'Cuối',
            onPageClick: function (event, page) {
                if (currentPage != page){
                    getListening(page);
                    currentPage = page;
                }
            }
        });
    };

    function redirectAddPage(){
        window.location.href = "${pageContext.request.contextPath}/admin/listeningQuestion/created?listening_id="+listening_id;
    }

    function redirectUpdatePage(id){
        window.location.href = "${pageContext.request.contextPath}/admin/listeningQuestion/updated?listening_id="+listening_id+"&id="+id;
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
                var ids = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val();
                }).get();
                deleteListening(ids);
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
    function deleteListening(data) {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/v1/listeningQuestion',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${pageContext.request.contextPath}/admin/listeningQuestion?id="+listening_id+"&code="+result.code+"&message="+result.message;
            }
        });
    }

    $('#checkAll').click(function () {
        $('input:checkbox').prop('checked', this.checked);
    });

    $('#search').click(function (){
        var keyword = $('#keyword').val();
        var url = '${pageContext.request.contextPath}/api/v1/listeningQuestion/search?id='+listening_id+"&keyword="+keyword;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'JSON',
            success: function (result) {
                if(result.code == 0){
                    $('#listening').empty();
                    $.each(result.data, function (key ,value) {
                        $('#listening').append(
                            "<tr>" +
                            "<td><div class='custom-control custom-checkbox'> " +
                            "<input type='checkbox' class='custom-control-input' id='check"+ value.id +"' value='" + value.id + "'> " +
                            "<label class='custom-control-label' for='check"+ value.id +"'>" + value.id + "</label></div></td>" +
                            "<td>" + value.question + "</td> " +
                            "<td>" + value.image + "</td> " +
                            "<td>" + value.audio + "</td> " +
                            "<td>" + value.option1 + "</td> " +
                            "<td>" + value.option2 + "</td> " +
                            "<td>" + value.option3 + "</td> " +
                            "<td>" + value.option4 + "</td> " +
                            "<td>" + value.correctOption + "</td> " +
                            "<td>" + value.reason + "</td> " +
                            "<td><button type='button' class='btn btn-primary' onclick='redirectUpdatePage(" + value.id + ")'><i class='fa fa-wrench' aria-hidden='true' ></i></button></td>" +
                            "</tr>");
                    });
                }
                getMessage(result.code, result.message);
            }
        });
        $('#pagination').empty();
    })

    $('#cancelSearch').click(function (){
        window.location.href = "${pageContext.request.contextPath}/admin/listeningQuestion?id="+listening_id;
    })
</script>
</body>
</html>
