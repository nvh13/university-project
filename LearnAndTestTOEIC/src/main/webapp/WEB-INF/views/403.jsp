<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>403 error</title>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/403.css'/>"/>
    <!--===============================================================================================-->
</head>
<body>
    <div class="wrapper">
        <div class="box">
            <h1>403</h1>
            <p>Xin lỗi, bạn không có quyền truy cập vào trang này</p>
            <p><a href="<c:url value='/'/>">Nhấp vào đây để quay lại trang chủ</a></p>
        </div>
    </div>
</body>