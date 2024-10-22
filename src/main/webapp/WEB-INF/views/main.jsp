<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 15.
  Time: 오후 6:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>main page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>


    <style>
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

        .card {
            margin-bottom: 20px; /* 카드 간의 간격 */
        }


        .rectangle {
            width: 30%; /* 직사각형 너비를 조정하여 3개씩 나열 */
            height: 45%; /* 직사각형 높이 */
            margin: 10px; /* 여백 */
            background-color: #4caf50; /* 직사각형 색상 */
            border-radius: 4px; /* 둥근 모서리 */
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
        .search-for-courses {
            color: rgba(18, 90, 90, 0.2);
            text-align: left;
            font-family: "Inter-Bold", sans-serif;
            font-size: 26px;
            font-weight: 700;
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

        #banner header {
            background-color: rgba(34, 30, 31, 0.98);
            display: inline-block;
            padding: 2.5em 5em;
            border-radius: 5px;
        }

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
        }

        #intro h2 {
            font-size: 1.75em;
        }

        #intro p {
            margin: 0;
        }

        #intro .middle {
            position: relative;
            z-index: 1;
        }

        #intro .middle:before {
            content: '';
            width: 32px;
            height: 100%;
            position: absolute;
            left: -24px;
            top: 0;
            display: block;
            z-index: -1;
            box-shadow: 32px 0 0 0 #fff, 0 -32px 0 0 #fff, 0 32px 0 0 #fff, 32px 32px 0 0 #fff, 32px -32px 0 0 #fff, 0 0 32px 0 rgba(0, 0, 0, 0.15);
        }

        #intro .middle:after {
            content: '';
            width: 32px;
            height: 100%;
            position: absolute;
            right: -24px;
            top: 0;
            display: block;
            z-index: -1;
            box-shadow: -32px 0 0 0 #fff, 0 -32px 0 0 #fff, 0 32px 0 0 #fff, -32px 32px 0 0 #fff, -32px -32px 0 0 #fff, 0 0 32px 0 rgba(0, 0, 0, 0.15);
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
    <!--hmm-->
<!--    <style type="text/css">
        #favWrap {background:url('/images/img_2.png') center center fixed no-repeat #45434c; background-size: auto 87%; padding:0; position:relative; background-position: bottom;}
        .fav_img {top: 90px; right: -210px; width: 953px; height: 651px; background-image: url('/images/img_4.png');}


        @media screen and (max-width:1400px) {
            .fav_img {top: 50%; transform:translateY(-50%); right: 60px; width: 720px; height: 475px;}
        }

        @media screen and (max-width:1100px) {
            .fav_img {top: 50%; transform:translateY(-50%); right: 160px; width: 570px; height: 380px;}
        }
/*
        @media screen and (max-width:960px) {
            #favWrap {background: url('https://image.istarbucks.co.kr/upload/common/img/main/2024/2024_october_pick_bg_mo.jpg') center -6px no-repeat; background-size: 100% auto; height: 233.75vw; padding: 0; position: relative; width: 100%;}
            .fav_img {position: static; top: auto; right: auto; width: 100vw; height: 30%; margin: 155px auto 0; transform: translateY(0);}
            .wrap_inner .fav_prod_txt02 {top: 73% !important; left:50%; width:82.5vw; height: 100%; background-image: url('https://image.istarbucks.co.kr/upload/common/img/main/2024/2024_october_pick_txt02_mo.png'); transform: translateX(-50%); margin-left:0}
        }
*/
    </style>  -->
</head>
<body>
<hr>

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
    <h1 class="mx-auto display-1 text-center" style="font-weight: bold">Lo-Neon</h1> <!-- 제목 크기 키우기 -->
</div>
<br>
<nav class="navbar navbar-expand-lg bg-white"> <!-- 배경색을 흰색으로 변경 -->
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarNav"> <!-- 메뉴 항목 -->
            <div class="navbar-nav mx-auto"> <!-- 중앙 배치 -->
                <a class="nav-link active btn btn-danger btn-lg mx-4" aria-current="page" href="#" style="padding: 15px 27px; color: white;">Home</a>
                <a class="nav-link btn btn-lg mx-4" href="/smallGroup" style="padding: 15px 50px;">소모임</a>
                <a class="nav-link btn btn-lg mx-4" href="/website" style="padding: 15px 50px;">웹사이트</a>
                <a class="nav-link btn btn-lg mx-4" href="/sell" style="padding: 15px 50px;" aria-disabled="true">판매</a>
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
<section id="banner">
    <header>
        <h2>뭐라고 적어야 할 지 모르겠다.</h2>
        <p>HTML5 UP이랑 부트스트랩으로 작성</p>
    </header>
</section>

<!-- Intro -->
<section id="intro" class="container">
    <div class="row">
        <div class="col-4 col-12-medium">
            <section class="first">
                <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-window-sidebar" viewBox="0 0 16 16">
                    <path d="M2.5 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1m2-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m1 .5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1"/>
                    <path d="M2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v2H1V3a1 1 0 0 1 1-1zM1 13V6h4v8H2a1 1 0 0 1-1-1m5 1V6h9v7a1 1 0 0 1-1 1z"/>
                </svg><br><br><br>
                <header>
                    <h2>뛰어난 퀄리티</h2>
                </header>
                <p>Nisl amet dolor sit ipsum veroeros sed blandit consequat veroeros et magna tempus.</p>
            </section>
        </div>
        <div class="col-4 col-12-medium">
            <section class="middle">    <!--16-->
                <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-hdd-rack-fill" viewBox="0 0 16 16">
                    <path d="M2 2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h1v2H2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2h-1V7h1a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zm.5 3a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m2 0a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m-2 7a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m2 0a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1M12 7v2H4V7z"/>
                </svg><br><br><br>
                <header>
                    <h2>뭘 작성해야 하지...</h2>
                </header>
                <p>Nisl amet dolor sit ipsum veroeros sed blandit consequat veroeros et magna tempus.</p>
            </section>
        </div>
        <div class="col-4 col-12-medium">
            <section class="last">
                <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-globe2" viewBox="0 0 16 16">
                    <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855q-.215.403-.395.872c.705.157 1.472.257 2.282.287zM4.249 3.539q.214-.577.481-1.078a7 7 0 0 1 .597-.933A7 7 0 0 0 3.051 3.05q.544.277 1.198.49zM3.509 7.5c.036-1.07.188-2.087.436-3.008a9 9 0 0 1-1.565-.667A6.96 6.96 0 0 0 1.018 7.5zm1.4-2.741a12.3 12.3 0 0 0-.4 2.741H7.5V5.091c-.91-.03-1.783-.145-2.591-.332M8.5 5.09V7.5h2.99a12.3 12.3 0 0 0-.399-2.741c-.808.187-1.681.301-2.591.332zM4.51 8.5c.035.987.176 1.914.399 2.741A13.6 13.6 0 0 1 7.5 10.91V8.5zm3.99 0v2.409c.91.03 1.783.145 2.591.332.223-.827.364-1.754.4-2.741zm-3.282 3.696q.18.469.395.872c.552 1.035 1.218 1.65 1.887 1.855V11.91c-.81.03-1.577.13-2.282.287zm.11 2.276a7 7 0 0 1-.598-.933 9 9 0 0 1-.481-1.079 8.4 8.4 0 0 0-1.198.49 7 7 0 0 0 2.276 1.522zm-1.383-2.964A13.4 13.4 0 0 1 3.508 8.5h-2.49a6.96 6.96 0 0 0 1.362 3.675c.47-.258.995-.482 1.565-.667m6.728 2.964a7 7 0 0 0 2.275-1.521 8.4 8.4 0 0 0-1.197-.49 9 9 0 0 1-.481 1.078 7 7 0 0 1-.597.933M8.5 11.909v3.014c.67-.204 1.335-.82 1.887-1.855q.216-.403.395-.872A12.6 12.6 0 0 0 8.5 11.91zm3.555-.401c.57.185 1.095.409 1.565.667A6.96 6.96 0 0 0 14.982 8.5h-2.49a13.4 13.4 0 0 1-.437 3.008M14.982 7.5a6.96 6.96 0 0 0-1.362-3.675c-.47.258-.995.482-1.565.667.248.92.4 1.938.437 3.008zM11.27 2.461q.266.502.482 1.078a8.4 8.4 0 0 0 1.196-.49 7 7 0 0 0-2.275-1.52c.218.283.418.597.597.932m-.488 1.343a8 8 0 0 0-.395-.872C9.835 1.897 9.17 1.282 8.5 1.077V4.09c.81-.03 1.577-.13 2.282-.287z"/>
                </svg><br><br><br>
                <header>
                    <h2>바로적용가능</h2>
                </header>
                <p>Nisl amet dolor sit ipsum veroeros sed blandit consequat veroeros et magna tempus.</p>
            </section>
        </div>
    </div><div><p><br><br></p></div>
    <footer>
        <ul class="actions">
            <% if (session.getAttribute("loginEmail") == null) { %>
            <li><a href="/logins" class="btn btn-primary btn-lg">Get Started</a></li>
            <% } else { %>
            <li><a href="/logout" class="btn btn-primary btn-lg">Logout</a></li>
            <% } %>
            <li><a href="#modal0" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#modal0">Learn More</a></li>
        </ul>
    </footer>
    <div class="modal fade" id="modal0" tabindex="-1" aria-labelledby="ModalLabel0" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel0">우리에 대해서</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="mt-3" style="border-radius: 15px; background-color: #e9ecef; padding: 20px;">
                    <h5><strong>운영방식</strong></h5>
                    <p>더이상 힘들게 웹 페이지를 찾아보지 마세요<br>카페부터 웹 사이트까지 다양한 디자인과 기능으로<br>쉽고 빠르게 구매하세요.<br></p>
                    <p>우리는 카페를 판매하고 싶어하는 운영자와 기존의 카페를 받아서 사용하고 싶어하는 구매자를 연결해줍니다.<br></p>
                    <p>더이상 사기는 없습니다.</p>
                    <img src="<c:url value='/images/rul.png' />" style="width: 570px; height: 330px"> <br>
                    <p>상호간의 구매 및 판매 의사가 결정되면 돈은 저희에게 지불하고 거래가 확인되면 판매하는 페이지나 카페를 저희가 제공합니다.<br>이후 돈은 저희가 판매자께 드리는 구조입니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">할게 있나?</button>
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


<div class="box">
    <div class="row">
        <!-- 카드 1 -->
        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/Doors.png' />" class="card-img-top" alt="...">&nbsp;
            <div class="card-body">
                <h5 class="card-title">Doors</h5>
                <p class="card-text">여러 다른 색들이 문의 세계로 오신 것을 환영합니다.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal1">상세정보</a>
            </div>
        </div>
        <!-- 모달1 -->
        <div class="modal fade" id="Modal1" tabindex="-1" aria-labelledby="ModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel1">Doors 상세 정보</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-start">
                        <img src="<c:url value='/images/Doors.png' />" class="img-fluid" alt="..." style="border-radius: 10px; max-width: 700px; height: auto;">
                        <div class="ms-4" style="border-radius: 10px; background-color: #f8f9fa; padding: 20px; width: 300px; height: 400px;">
                            <h6><strong>정보 박스</strong></h6>
                            <p><br>제작자 : 김민서 <br><br>제작년도 : 2024 . 07 . 28<br><br>제작 난이도 : ❤️❤️🖤🖤🖤</p>
                        </div>
                    </div>
                    <div class="mt-3" style="border-radius: 15px; background-color: #e9ecef; padding: 20px;">
                        <h5><strong>설명문</strong></h5>
                        <p>Doors 는 여러가지 문 디자인이 펼쳐진 웹 페이지입니다.<br>문 이미지 위에 커서를 올리면 문 이미지가 커집니다.<br>HTML, CSS로만 이루어져있습니다.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">할게 있나?</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- 카드 2 -->
        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal2">Go somewhere</a>
            </div>
        </div>
        <!-- 모달2 -->
        <div class="modal fade" id="Modal2" tabindex="-1" aria-labelledby="ModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel2">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">2저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 카드 3 -->
        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal3">Go somewhere</a>
            </div>
        </div>
        <!-- 모달3 -->
        <div class="modal fade" id="Modal3" tabindex="-1" aria-labelledby="ModalLabel3" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel3">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">3저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 추가 카드들 1-->
        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal4">Go somewhere</a>
            </div>
        </div>
        <!-- 모달4 -->
        <div class="modal fade" id="Modal4" tabindex="-1" aria-labelledby="ModalLabel4" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel4">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">4저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal5">Go somewhere</a>
            </div>
        </div>
        <!-- 모달5 -->
        <div class="modal fade" id="Modal5" tabindex="-1" aria-labelledby="ModalLabel5" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel5">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">5저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal6">Go somewhere</a>
            </div>
        </div>
        <!-- 모달6 -->
        <div class="modal fade" id="Modal6" tabindex="-1" aria-labelledby="ModalLabel6" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel6">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">6저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 추가 카드들 2-->
        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal7">Go somewhere</a>
            </div>
        </div>
        <!-- 모달7 -->
        <div class="modal fade" id="Modal7" tabindex="-1" aria-labelledby="ModalLabel7" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel7">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">7저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal8">Go somewhere</a>
            </div>
        </div>
        <!-- 모달8 -->
        <div class="modal fade" id="Modal8" tabindex="-1" aria-labelledby="ModalLabel8" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel8">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">8저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <img src="<c:url value='/images/spring.jpg' />" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal9">Go somewhere</a>
            </div>
        </div>
        <!-- 모달9 -->
        <div class="modal fade" id="Modal9" tabindex="-1" aria-labelledby="ModalLabel9" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">모달 제목</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        모달 내용이 여기에 들어갑니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary">9저장 변경사항</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--<img src="<c:url value='/images/spring.jpg' />" alt="스프링" />-->

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

