<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 15.
  Time: 오후 6:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>main page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="<c:url value='/resources/css/search_product.css' />" rel="stylesheet" type="text/css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-3d/dist/chartjs-plugin-3d.min.js"></script>

    <link rel="stylesheet" href="https://uicdn.toast.com/editor/3.0.2/toastui-editor.min.css">
    <script src="https://uicdn.toast.com/editor/3.0.2/toastui-editor-all.min.js"></script>

    <style>
        .product-title {
            text-align:center;
            display:table;
            border:1px solid #cecece;
            width:280px;
            height:250px;
        }

        .product-img-div {
            display:table-cell;
            vertical-align:middle;
        }

        .product-img {
            max-width:180px;
            max-height:180px;
        }
        .box {
            width: 80%;
            height: 900px; /* 세로 높이 조정 */
            margin: 100px auto;
            padding: 10px;
            border: 1px solid red;
            border-radius: 10px;
            box-shadow: 2px 2px 10px #999;
            overflow-y: auto; /* 세로 스크롤 가능 */
        }

        .header {
            display: flex;
            justify-content: space-between; /* 양쪽 끝으로 요소 배치 */
            padding: 10px;
            background-color: #f8f8f8;
            align-items: center; /* 수직 중앙 정렬 */
        }

        /* 로그인 상태 */
        .login-status {
            list-style-type: none; /* 리스트 스타일 제거 */
            margin: 0; /* 기본 마진 제거 */
            padding: 0; /* 기본 패딩 제거 */
            display: flex; /* 가로 정렬 */
        }

        .login-status li {
            margin-left: 10px; /* 리스트 아이템 간의 간격 */
        }

        .search:focus {
            outline: none;
        }

        .search-box,
        .search-box * {
            box-sizing: border-box;
        }

        .search-box {
            background: rgba(255, 255, 255, 0.09);
            border-radius: 15px;
            border-style: solid;
            border-color: #339c9c;
            border-width: 2px;
            padding: 12px 56px 12px 40px;
            display: flex;
            flex-direction: row;
            gap: 12px;
            align-items: center;
            justify-content: flex-start;
            height: 65px;
            position: relative;
        }

        /* Banner */
        #banner {
            background: #CCE8F4 url("../../images/pic01.jpg");
            background-position: center center;
            background-size: auto 100%;
            background-repeat: no-repeat;
            text-align: center;
            position: relative;
            padding: 8em 0;
            margin: 4em 0 0 0;
        }

        /*#banner header {*/
        /*    background-color: rgba(34, 30, 31, 0.98);*/
        /*    display: inline-block;*/
        /*    padding: 2.5em 5em;*/
        /*    border-radius: 5px;*/
        /*}*/

        #banner header h2 {
            color: #fff;
            font-weight: 700;
            font-size: 2.5em;
            margin: 0 0 0.65em 0;
        }

        #banner header p {
            color: #d52349;
            padding: 0;
            font-style: normal;
            margin: 0;
            font-size: 1.5em;
        }

        /* Intro */
        #intro {
            text-align: center;
            overflow: hidden;
        }

        #intro section {
            margin: 3em 0;
            padding: 2.5em 0;
            background: rgba(255, 255, 255, 0.8); /* 배경을 약간 투명하게 */
            border-radius: 10px; /* 둥근 모서리 */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
        }

        #intro h2 {
            font-size: 1.75em;
            color: #333; /* 제목 색상 */
        }

        #intro p {
            margin: 0;
            color: #666; /* 본문 색상 */
        }

        #intro .middle {
            position: relative;
            z-index: 1;
        }

        #intro .middle:before,
        #intro .middle:after {
            /* 이 부분을 주석 처리하거나 삭제 */
            /* content: ''; */
            /* width: 32px; */
            /* height: 100%; */
            /* position: absolute; */
            /* top: 0; */
            /* display: block; */
            /* z-index: -1; */
            /* box-shadow: 32px 0 0 0 #fff, 0 -32px 0 0 #fff, 0 32px 0 0 #fff, 32px 32px 0 0 #fff, 32px -32px 0 0 #fff, 0 0 32px 0 rgba(0, 0, 0, 0.15); */
        }

        #intro .middle:before {
            /* left: -24px; */
        }

        #intro .middle:after {
            /* right: -24px; */
        }

        #intro .button {
            min-width: 12em;
        }

        #intro footer {
            margin: 0;
        }

        /* Actions */
        ul.actions {
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            padding: 0; /* 기본 패딩 제거 */
            list-style: none; /* 기본 리스트 스타일 제거 */
        }

        ul.actions li {
            margin: 0 1em; /* 좌우 간격 조정 */
            display: block; /* 블록 디스플레이 */
        }

        ul.actions li .button {
            width: auto; /* 버튼의 너비를 자동으로 설정 */
        }

        ul.actions li:first-child {
            margin-left: 0; /* 첫 번째 항목의 왼쪽 마진 제거 */
        }
    </style>
</head>
<body>

<div class="header">
    <div class="login-container" style="margin-left: auto; background-color: rgba(255, 255, 255, 0); /* 완전히 투명 */transition: background-color 0.3s;">
        <ul class="login-status">
            <% if (session.getAttribute("loginEmail") != null) { %>
            <li><span>(<%= session.getAttribute("loginEmail") %>) 님</span></li>

            <!-- 관리자인 경우 회원 목록 관리 링크 추가 -->
            <c:if test="${sessionScope.isAdmin == '1'}">
                <li><a href="/list">  회원 목록 관리  </a></li>
            </c:if>

            <li><a href="/cart">  찜목록  </a></li>
            <li><a href="/logout" style="color: black;">  Logout  </a></li>
            <% } else { %>
            <li><a href="/logins" style="color: black;">  Get Started  </a></li>
            <% } %>
        </ul>
    </div>
</div>

<style>
    /* 검은색 링크 스타일 */
    .login-status a {
        color: black; /* 링크 색상을 검은색으로 설정 */
        text-decoration: none; /* 기본 밑줄 제거 */
    }

    .login-status a:hover {
        text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
    }
</style>

<br><br>
<!-- 검색창 --><!--
<div class="search-box" style="padding: 10px; text-align: center; justify-content: center">
    <br><br><br>
    <input class="search" type="text" placeholder="검색어를 입력하세요..." style="width: 90%; padding: 10px; font-size: 16px;">
</div>-->
<!--<style>
    @media screen and (max-width: 768px) {
        .nevbar {
            flex-direction: column;
        }
        .nevmenu {
            display: none;
            flax-direction: column;
            align-content: center;
            width: 100%;
        }
        .navbar-togglebtn {
            display: block;
        }
    }
    .navbar-togglebtn{
        position: absolute;
        right: 30px;
        font-size: 25px;
        display: none;
    }
</style>-->  <!--반응형 웹 디자인 적용하려던 흔적-->      <!--버튼 뭉개지는게 container 위에 덮어져서 그럴 가능성 있음-->
<div class="container-fluid">
    <h1 class="mx-auto display-1 text-center" style="font-weight: bold">FestMeet </h1> <!-- 제목 크기 키우기 -->
</div>
<br>
<nav class="navbar navbar-expand-lg bg-white"> <!-- 배경색을 흰색으로 변경 -->
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarNav"> <!-- 메뉴 항목 -->
            <div class="navbar-nav mx-auto"> <!-- 중앙 배치 -->
                <a class="nav-link active btn btn-danger btn-lg mx-4" aria-current="page" href="#" style="padding: 15px 27px; color: white;">Home</a>
                <a class="nav-link btn btn-lg mx-4" href="#modal0" data-bs-toggle="modal" data-bs-target="#modal0" style="padding: 15px 50px;">About us</a>

                <!--    <a class="nav-link btn btn-lg mx-4" href="/smallGroup" style="padding: 15px 50px;">online community</a>
                    <a class="nav-link btn btn-lg mx-4" href="/website" style="padding: 15px 50px;">website</a>-->
                <a class="nav-link btn btn-lg mx-4" href="/sell" style="padding: 15px 50px;" aria-disabled="true">행사 등록하기</a>
                <a class="nav-link btn btn-lg mx-4" href="/searchProductConfirm" style="padding: 15px 50px;" aria-disabled="true">행사 검색하기</a>
                <!--<a class="nav-link btn btn-lg mx-4" href="/index" style="padding: 15px 50px;" aria-disabled="true">게시물</a>-->
            </div>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: auto; display: flex">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<!-- Bootstrap JS 포함 (jQuery 포함) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">



<style>
    /* 기본 버튼 스타일 */
    .nav-link.btn {
        transition: background-color 0.3s; /* 부드러운 전환 효과 */
    }

    /* 홈 버튼은 회색 배경 안되도록 설정 */
    .nav-link.active.btn-danger:hover {
        background-color: #dc3545; /* 원래 빨간색 유지 */
    }

    /* 마우스 오버 시 회색 배경 */
    .nav-link.btn:hover {
        background-color: #f0f0f0; /* 회색 비슷한 색상 */
    }
</style>


<!-- Banner -->
<!-- Banner -->
<section id="banner">
    <!-- Intro -->
    <section id="intro" class="container">
        <div class="row">
            <div class="col-4 col-12-medium">
                <section class="first">
                    <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-binoculars" viewBox="0 0 16 16">
                        <path d="M3 2.5A1.5 1.5 0 0 1 4.5 1h1A1.5 1.5 0 0 1 7 2.5V5h2V2.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5v2.382a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V14.5a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 14.5v-3a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5v3A1.5 1.5 0 0 1 5.5 16h-3A1.5 1.5 0 0 1 1 14.5V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882zM4.5 2a.5.5 0 0 0-.5.5V3h2v-.5a.5.5 0 0 0-.5-.5zM6 4H4v.882a1.5 1.5 0 0 1-.83 1.342l-.894.447A.5.5 0 0 0 2 7.118V13h4v-1.293l-.854-.853A.5.5 0 0 1 5 10.5v-1A1.5 1.5 0 0 1 6.5 8h3A1.5 1.5 0 0 1 11 9.5v1a.5.5 0 0 1-.146.354l-.854.853V13h4V7.118a.5.5 0 0 0-.276-.447l-.895-.447A1.5 1.5 0 0 1 12 4.882V4h-2v1.5a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5zm4-1h2v-.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5zm4 11h-4v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-8 0H2v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5z"/>
                    </svg><br><br><br>
                    <header>
                        <h2 style="color: black">다양한 행사</h2>
                    </header>
                    <p>많은 행사를 더 쉽게 찾아보세요</p>
                </section>
            </div>
            <div class="col-4 col-12-medium">
                <section class="middle">
                    <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0m0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0m0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0"/>
                    </svg><br><br><br>
                    <header>
                        <h2 style="color: black">쉬운 일정관리</h2>
                    </header>
                    <p>행사 일정을 쉽게 관리해보세요</p>
                </section>
            </div>
            <div class="col-4 col-12-medium">
                <section class="last">
                    <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-wallet2" viewBox="0 0 16 16">
                        <path d="M12.136.326A1.5 1.5 0 0 1 14 1.78V3h.5A1.5 1.5 0 0 1 16 4.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 13.5v-9a1.5 1.5 0 0 1 1.432-1.499zM5.562 3H13V1.78a.5.5 0 0 0-.621-.484zM1.5 4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5z"/>
                    </svg><br><br><br>
                    <header>
                        <h2 style="color: black">빠른 결제</h2>
                    </header>
                    <p>티켓 구매도 쉽게 해보세요</p>
                </section>
            </div>
        </div><div><p><br><br></p></div>
    </section>
<%--    <footer>--%>
<%--        <ul class="actions">--%>
<%--            <% if (session.getAttribute("loginEmail") == null) { %>--%>
<%--            <li><a href="/logins" class="btn btn-primary btn-lg">Get Started</a></li>--%>
<%--            <% } else { %>--%>
<%--            <li><a href="/logout" class="btn btn-primary btn-lg">Logout</a></li>--%>
<%--            <% } %>--%>
<%--            <li><a href="#modal0" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#modal0">Learn More</a></li>--%>
<%--        </ul>--%>
<%--    </footer>--%>
    <div class="modal fade" id="modal0" tabindex="-1" aria-labelledby="ModalLabel0" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <style>
                    .feature-icons {
                        list-style: none;
                        padding-left: 0;
                    }

                    .feature-icons li {
                        text-decoration: none;
                        display: flex;
                        align-items: center;
                        margin: 1em 0;
                        padding-left: 3em;
                    }

                    .feature-icons li .icon {
                        background: #4acaa8;
                        border-radius: 50%;
                        color: #ffffff;
                        height: 2.5em;
                        width: 2.5em;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-right: 0.5em;
                    }
                </style>
                <section id="two" class="container my-5">
                    <h1><strong>Thank you for visiting us.</strong></h1><br>
                    <p>저희는 기존에 평택시에서 하던 행사들에 관한 흩어져있던 정보를 모두 모아서 알려주고 있습니다.<br> 평택시에서 주최하는 행사나 캠프험프리스, 민간 기업 등에서 주최하는 행사를 알려드리고 있습니다.<br> 또한 저희는 개인이 주최하는 행사도 등록 후 홍보할 수 있습니다.</p>
                    <br>
                    <ul class="feature-icons row">
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-code"></i>
                            </div>
                            더 이상 어려운 과정은 없습니다.
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="bi bi-joystick"></i>
                            </div>
                            다양한 즐길거리를 제공해드립니다
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="bi bi-file-earmark-text-fill"></i>
                            </div>
                            각종 문서로 고통받지 않으셔도 됩니다
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-coffee"></i>
                            </div>
                            남은 시간으로 커피 한 잔의 여유를 즐겨보세요
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-bolt"></i>
                            </div>
                            빠르게 여러 행사를 즐겨보세요
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-users"></i>
                            </div>
                            많은 사람들과 함께 즐겨보세요
                        </li>
                    </ul>
                </section>
                <div style="text-align: center; font-size: 20px">
                    <strong>festval + Meet = FestMeet</strong><br>&nbsp;
                    <strong>Do not wast time, just enjoy!</strong>
                    <br><br><br><br><br><br><br>
                </div>
        </div>
    </div>
    </div>
</section>


<section id="favWrap" class="winter_fav_bg">
    <div class="wrap_inner">
        <div class="fav_img"></div>
    </div>
</section>
<!-- e: Pick Your Favorite(240919) -->
<section>



    <!-- product search 상품검색 창-->
    <br><br><br>
<!--    <div class="search inner-div">
        <form action="<c:url value='/searchProductConfirm' />" name="search_product_form" method="get">
            <input type="text" name="productName" placeholder="Search for products">
            <input type="button" value="search" onclick="searchProductForm();">
        </form>
    </div><br><br>

    <%--상품 검색 결과 form include--%>
    <c:if test="${not empty param.productName}">
        <div>
            <%--<jsp:include page="./search_product.jsp" />--%>
        </div><br><br>
    </c:if>

    <script type="text/javascript">

        function searchProductForm() {
            console.log('searchBookForm() CALLED!!');

            let form = document.search_product_form;

            if (form.productName.value == '') {
                alert('Enter the name of the book you are looking for.');
                form.productName.focus();

            } else {
                form.submit();

            }

        }

    </script>-->

<%--    <c:if test="${empty param.productName}">--%>
    <div class="container">
        <h2>List</h2>

        <!-- 카테고리 선택창 -->
        <div class="mb-3">
            <label for="categorySelect" class="form-label">카테고리 선택</label>
            <select class="form-select" id="categorySelect" onchange="filterProducts()">
                <option value="all">전체</option>
                <option value="3">일반행사</option>
                <option value="4">개인행사</option>
                <option value="15">시설 대관</option>
            </select>
        </div>

        <div class="row" id="productList">
            <c:forEach var="item" items="${productList}">
                <c:if test="${item.categoryId == 15}">
                    <div class="col-md-4 product-item" data-category="${item.categoryId}">
                        <div class="card">
                            <div class="card-body">
                                <!-- 대표 이미지 표시 -->
                                <c:choose>
                                    <c:when test="${not empty item.productImg3}">
                                        <div class="product-img-div">
                                            <img src="/product/image/${item.productId}" class="product-img" alt="대표 이미지" style="width: 100%; height: auto;" />
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p>이미지가 없습니다</p>
                                    </c:otherwise>
                                </c:choose>
                                <h5 class="card-title">${item.productName}</h5>
                                <p class="card-text">작성자: ${item.memberEmail}</p>
                                <p class="card-text">참가인원: ${item.productPrice}</p>
                                <p class="card-text">작성일: ${item.productDate}</p>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal${item.productId}">
                                    자세히 보기
                                </button>
                                <form action="addToCart" method="post" class="d-inline">
                                    <input type="hidden" name="productId" value="${item.productName}"/>
                                    <input type="hidden" name="quantity" value="1"/>
                                    <button type="submit" class="btn btn-success">찜목록에 담기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 정의 -->
                    <div class="modal fade" id="Modal${item.productId}" tabindex="-1" aria-labelledby="ModalLabel${item.productId}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel${item.productId}">${item.productName}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- 대표 이미지 표시 -->
                                    <c:choose>
                                        <c:when test="${not empty item.productImg3}">
                                            <div class="product-title">
                                                <div class="product-img-div">
                                                    <img src="/product/image/${item.productId}" class="product-img" alt="대표 이미지" />
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>이미지가 없습니다</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p>작성자: ${item.memberEmail}</p>
<%--                                    <p>참가인원:  <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₩" /></p>--%>
                                    <p>참가인원:  ${item.productPrice}</p>
                                    <p>작성일: <fmt:formatDate value="${item.productDate}" pattern="yyyy-MM-dd HH:mm" /></p>
                                    <div class="viewer" id="editor-${item.productId}">설명서: ${item.productDescription}</div>

                                </div>
                                <div class="modal-footer">
                                    <form action="<c:url value='/addToCart' />" method="post" class="d-inline">
                                        <input type="hidden" name="productId" value="${item.productName}"/>
                                        <input type="number" name="quantity" min="1" value="1" required/>
                                        <button type="submit" class="btn btn-success">찜목록에 담기</button>
                                    </form>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${item.categoryId == 4}">
                    <div class="col-md-4 product-item" data-category="${item.categoryId}">
                        <div class="card">
                            <div class="card-body">
                                <!-- 대표 이미지 표시 -->
                                <c:choose>
                                    <c:when test="${not empty item.productImg3}">
                                        <div class="product-img-div">
                                            <img src="/product/image/${item.productId}" class="product-img" alt="대표 이미지" style="width: 100%; height: auto;" />
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p>이미지가 없습니다</p>
                                    </c:otherwise>
                                </c:choose>
                                <h5 class="card-title">${item.productName}</h5>
                                <p class="card-text">작성자: ${item.memberEmail}</p>
                                <p class="card-text">참가인원: ${item.productPrice}</p>
                                <p class="card-text">작성일: ${item.productDate}</p>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal${item.productId}">
                                    자세히 보기
                                </button>
                                <form action="addToCart" method="post" class="d-inline">
                                    <input type="hidden" name="productId" value="${item.productName}"/>
                                    <input type="hidden" name="quantity" value="1"/>
                                    <button type="submit" class="btn btn-success">찜목록에 담기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 정의 -->
                    <div class="modal fade" id="Modal${item.productId}" tabindex="-1" aria-labelledby="ModalLabel${item.productId}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel${item.productId}">${item.productName}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- 대표 이미지 표시 -->
                                    <c:choose>
                                        <c:when test="${not empty item.productImg3}">
                                            <div class="product-title">
                                                <div class="product-img-div">
                                                    <img src="/product/image/${item.productId}" class="product-img" alt="대표 이미지" />
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>이미지가 없습니다</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p>작성자: ${item.memberEmail}</p>
<%--                                    <p>참가인원:  <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₩" /></p>--%>
                                    <p>참가인원:  ${item.productPrice}</p>
                                    <p>작성일: <fmt:formatDate value="${item.productDate}" pattern="yyyy-MM-dd HH:mm" /></p>
                                    <div class="viewer" id="editor-${item.productId}">설명서: ${item.productDescription}</div>

                                </div>
                                <div class="modal-footer">
                                    <form action="<c:url value='/addToCart' />" method="post" class="d-inline">
                                        <input type="hidden" name="productId" value="${item.productName}"/>
                                        <input type="number" name="quantity" min="1" value="1" required/>
                                        <button type="submit" class="btn btn-success">찜목록에 담기</button>
                                    </form>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${item.categoryId == 3}">
                    <div class="col-md-4 product-item" data-category="${item.categoryId}">
                        <div class="card">
                            <div class="card-body">
                                <!-- 대표 이미지 표시 -->
                                <c:choose>
                                    <c:when test="${not empty item.productImg3}">
                                        <div class="product-img-div">
                                            <img src="/product/image/${item.productId}" class="product-img" alt="대표 이미지" style="width: 100%; height: auto;" />
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p>이미지가 없습니다</p>
                                    </c:otherwise>
                                </c:choose>
                                <h5 class="card-title">${item.productName}</h5>
                                <p class="card-text">작성자: ${item.memberEmail}</p>
                                <p class="card-text">참가인원: ${item.productPrice}</p>
                                <p class="card-text">작성일: ${item.productDate}</p>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal${item.productId}">
                                    자세히 보기
                                </button>
                                <form action="addToCart" method="post" class="d-inline">
                                    <input type="hidden" name="productId" value="${item.productName}"/>
                                    <input type="hidden" name="quantity" value="1"/>
                                    <button type="submit" class="btn btn-success">찜목록에 담기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 정의 -->
                    <div class="modal fade" id="Modal${item.productId}" tabindex="-1" aria-labelledby="ModalLabel${item.productId}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalLabel${item.productId}">${item.productName}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- 대표 이미지 표시 -->
                                    <c:choose>
                                        <c:when test="${not empty item.productImg3}">
                                            <div class="product-title">
                                                <div class="product-img-div">
                                                    <img src="/product/image/${item.productId}" class="product-img" alt="대표 이미지" />
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>이미지가 없습니다</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p>작성자: ${item.memberEmail}</p>
<%--                                    <p>참가인원:  <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₩" /></p>--%>
                                    <p>참가인원:  ${item.productPrice}</p>
                                    <p>작성일: <fmt:formatDate value="${item.productDate}" pattern="yyyy-MM-dd HH:mm" /></p>
                                    <div class="viewer" id="editor-${item.productId}">설명서: ${item.productDescription}</div><%--markdown 형식의 설명문--%>

                                </div>
                                <div class="modal-footer">
                                    <form action="<c:url value='/addToCart' />" method="post" class="d-inline">
                                        <input type="hidden" name="productId" value="${item.productName}"/>
                                        <input type="number" name="quantity" min="1" value="1" required/>
                                        <button type="submit" class="btn btn-success">찜목록에 담기</button>
                                    </form>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <%--toast ui editor 상품 내용을 마크다운 형식으로 화면에 viewer로 나타내는 동작 구문--%>
    <script>
        $(document).ready(function () {
            // 각 item에 대해 TOAST UI Viewer를 생성
            <c:forEach var="item" items="${productList}">
            const viewer${item.productId} = new toastui.Editor.factory({
                el: document.querySelector("#editor-${item.productId}"),
                viewer: true,
                initialValue: `${item.productDescription}`
            });
            </c:forEach>
        });
    </script>
    <script>
        function filterProducts() {
            const selectedCategory = document.getElementById("categorySelect").value;
            const productItems = document.querySelectorAll(".product-item");

            productItems.forEach(item => {
                const itemCategory = item.getAttribute("data-category");
                if (selectedCategory === "all" || selectedCategory === itemCategory) {
                    item.style.display = "block"; // 보여주기
                } else {
                    item.style.display = "none"; // 숨기기
                }
            });
        }
    </script>



</section>

<!-- 푸터 영역 -->
<!--footer는 페이지 하단 부분을 의미한다. -->
<footer style="text-align: center; padding: 20px; background-color: #f1f1f1; font-size: 14px;">
    <br><br>
    <a href="/ECRole" style="margin-right: 20px; color: black; text-decoration: none">이용 약관</a>  <!--글자색은 검정, 그 뒤는 밑줄 제거-->
    <a href="/humanInfo" style="margin-right: 20px; color: black; text-decoration: none">개인정보 처리방침</a>
    <a href="/qna" style="color: black; text-decoration: none">고객 센터</a>
    <br><br>
    <h3>team3 / Team Project</h3>
    <br>
</footer>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

