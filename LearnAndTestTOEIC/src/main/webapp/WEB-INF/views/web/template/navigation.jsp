<%@ page import="com.learnandtesttoeic.until.SecurityUntil" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">

    <a class="navbar-brand logo-text page-scroll" href="<c:url value='/home'/>">LearnAndTestToeic</a>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto" style="align-items: center">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/home/#exam'/>">Thi thử</a>
            </li>
            <!-- Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="<c:url value='/home/#instructor'/>" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">Luyện tập</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="<c:url value='/home/#listening'/>"><span class="item-text">Luyện bài nghe</span></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:url value='/home/#reading'/>"><span class="item-text">Luyện bài đọc</span></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:url value='/home/#grammar'/>"><span class="item-text">Ngữ pháp</span></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:url value='/home/#vocabulary'/>"><span class="item-text">Từ vựng</span></a>
                </div>
            </li>
            <!-- end of dropdown menu -->
            <li class="nav-item"></li>
            <security:authorize access = "isAnonymous()">
                <li class="nav-item"><a class="nav-link" href="<c:url value='/login'/>">Đăng nhập</a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/register'/>">Đăng ký</a></li>
            </security:authorize>
            <security:authorize access = "isAuthenticated()">
                <li class="nav-item"><a class="nav-link" href="<c:url value='/user'/>">Xin chào, <%=SecurityUntil.getPrincipal().getFullName()%></a></li>
                <li class="nav-item">
                    <img src="${pageContext.request.contextPath}/resources/file/images/avatar_user/<%= SecurityUntil.getPrincipal().getImage() %>" width="50px" height="50px" class="rounded-circle" alt="User Image">
                </li>
                <li class="nav-item"><a class="nav-link" href="<c:url value='/logout'/>">Thoát</a></li>
            </security:authorize>
        </ul>
    </div>
</nav> <!-- end of navbar -->