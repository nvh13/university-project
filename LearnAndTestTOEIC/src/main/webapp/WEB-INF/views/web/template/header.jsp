<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="text-container">
                    <div>
                        <p class="p-large">Trang web luyện và thi Toeic</p>
                    </div>
                    <h1>LearnAndTestToeic</h1>
                    <p class="p-large">Cải thiện cuộc sống thông qua giáo dục – Improving lives through education.</p>
                    <security:authorize access = "isAnonymous()">
                        <a class="btn-solid-lg page-scroll" href="<c:url value='/login'/>">Đăng nhập</a>
                        <a class="btn-outline-lg page-scroll" href="#instructor">Trải nghiệm</a>
                    </security:authorize>
                    <security:authorize access = "isAuthenticated()">
                        <a class="btn-solid-lg page-scroll" href="#instructor">Trải nghiệm</a>
                    </security:authorize>
                </div> <!-- end of text-container -->
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->

    <!-- Image Slider -->
    <div class="outer-container">
        <div class="slider-container">
            <div class="swiper-container image-slider-1">
                <div class="swiper-wrapper">

                    <!-- Slide -->
                    <div class="swiper-slide" >
                        <img class="img-fluid" src="<c:url value='/resources/file/images/slide/1.jpg'/>" alt="alternative">
                    </div>
                    <!-- end of slide -->

                    <!-- Slide -->
                    <div class="swiper-slide">
                        <img class="img-fluid" src="<c:url value='/resources/file/images/slide/2.jpg'/>" alt="alternative">
                    </div>
                    <!-- end of slide -->

                    <!-- Slide -->
                    <div class="swiper-slide">
                        <img class="img-fluid" src="<c:url value='/resources/file/images/slide/3.jpg'/>" alt="alternative">
                    </div>
                    <!-- end of slide -->

                    <!-- Slide -->
                    <div class="swiper-slide">
                        <img class="img-fluid" src="<c:url value='/resources/file/images/slide/4.jpg'/>" alt="alternative">
                    </div>
                    <!-- end of slide -->

                </div> <!-- end of swiper-wrapper -->

                <!-- Add Arrows -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <!-- end of add arrows -->

            </div> <!-- end of swiper-container -->
        </div> <!-- end of slider-container -->
    </div> <!-- end of outer-container -->
    <!-- end of image slider -->