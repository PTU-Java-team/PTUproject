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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="<c:url value='/resources/css/search_product.css' />" rel="stylesheet" type="text/css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-3d/dist/chartjs-plugin-3d.min.js"></script>

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
</head>
<body>

<div class="header">
    <div class="login-container" style="margin-left: auto">
        <ul class="login-status">
            <% if (session.getAttribute("loginEmail") != null) { %>
            <li><span>(<%= session.getAttribute("loginEmail") %>) 님</span></li>

            <!-- 관리자인 경우 회원 목록 관리 링크 추가 -->
            <c:if test="${sessionScope.isAdmin == '1'}">
                <li><a href="/list">회원 목록 관리</a></li>
            </c:if>

            <li><a href="/cart">장바구니 목록</a></li>
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
    <h1 class="mx-auto display-1 text-center" style="font-weight: bold">Lo-Neon</h1> <!-- 제목 크기 키우기 -->
</div>
<br>
<nav class="navbar navbar-expand-lg bg-white"> <!-- 배경색을 흰색으로 변경 -->
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarNav"> <!-- 메뉴 항목 -->
            <div class="navbar-nav mx-auto"> <!-- 중앙 배치 -->
                <a class="nav-link active btn btn-danger btn-lg mx-4" aria-current="page" href="#" style="padding: 15px 27px; color: white;">Home</a>
                <a class="nav-link btn btn-lg mx-4" href="/smallGroup" style="padding: 15px 50px;">online community</a>
                <a class="nav-link btn btn-lg mx-4" href="/website" style="padding: 15px 50px;">website</a>
                <a class="nav-link btn btn-lg mx-4" href="/sell" style="padding: 15px 50px;" aria-disabled="true">product sell</a>
                <a class="nav-link btn btn-lg mx-4" href="/index" style="padding: 15px 50px;" aria-disabled="true">게시물</a>
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




<!-- product search 상품검색 창-->
<br><br><br>
<div class="search inner-div">
    <form action="<c:url value='/searchProductConfirm' />" name="search_product_form" method="get">
        <input type="text" name="productName" placeholder="Search for products">
        <input type="button" value="search" onclick="searchProductForm();">
    </form>
</div><br><br>

<%--상품 검색 결과 form include--%>
<div>
    <jsp:include page="./search_product.jsp" />
</div><br><br>


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

</script>




<!-- Banner -->
<section id="banner">
    <header>
        <h2>The new generation of commerce</h2>
        <p>Now you can trade anytime, comfortably and securely.</p>
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
                    <h2>User Experience (UX)</h2>
                </header>
                <p>A seamless, intuitive interface enhances customer satisfaction and encourages repeat visits.</p>
            </section>
        </div>
        <div class="col-4 col-12-medium">
            <section class="middle">    <!--16-->
                <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-hdd-rack-fill" viewBox="0 0 16 16">
                    <path d="M2 2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h1v2H2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2h-1V7h1a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zm.5 3a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m2 0a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m-2 7a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1m2 0a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1M12 7v2H4V7z"/>
                </svg><br><br><br>
                <header>
                    <h2>Trustworthiness</h2>
                </header>
                <p> It's all about safeguarding customer data and ensuring secure transactions.</p>
            </section>
        </div>
        <div class="col-4 col-12-medium">
            <section class="last">
                <svg xmlns="http://www.w3.org/2000/svg" width="45%" height="45%" fill="currentColor" class="bi bi-globe2" viewBox="0 0 16 16">
                    <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855q-.215.403-.395.872c.705.157 1.472.257 2.282.287zM4.249 3.539q.214-.577.481-1.078a7 7 0 0 1 .597-.933A7 7 0 0 0 3.051 3.05q.544.277 1.198.49zM3.509 7.5c.036-1.07.188-2.087.436-3.008a9 9 0 0 1-1.565-.667A6.96 6.96 0 0 0 1.018 7.5zm1.4-2.741a12.3 12.3 0 0 0-.4 2.741H7.5V5.091c-.91-.03-1.783-.145-2.591-.332M8.5 5.09V7.5h2.99a12.3 12.3 0 0 0-.399-2.741c-.808.187-1.681.301-2.591.332zM4.51 8.5c.035.987.176 1.914.399 2.741A13.6 13.6 0 0 1 7.5 10.91V8.5zm3.99 0v2.409c.91.03 1.783.145 2.591.332.223-.827.364-1.754.4-2.741zm-3.282 3.696q.18.469.395.872c.552 1.035 1.218 1.65 1.887 1.855V11.91c-.81.03-1.577.13-2.282.287zm.11 2.276a7 7 0 0 1-.598-.933 9 9 0 0 1-.481-1.079 8.4 8.4 0 0 0-1.198.49 7 7 0 0 0 2.276 1.522zm-1.383-2.964A13.4 13.4 0 0 1 3.508 8.5h-2.49a6.96 6.96 0 0 0 1.362 3.675c.47-.258.995-.482 1.565-.667m6.728 2.964a7 7 0 0 0 2.275-1.521 8.4 8.4 0 0 0-1.197-.49 9 9 0 0 1-.481 1.078 7 7 0 0 1-.597.933M8.5 11.909v3.014c.67-.204 1.335-.82 1.887-1.855q.216-.403.395-.872A12.6 12.6 0 0 0 8.5 11.91zm3.555-.401c.57.185 1.095.409 1.565.667A6.96 6.96 0 0 0 14.982 8.5h-2.49a13.4 13.4 0 0 1-.437 3.008M14.982 7.5a6.96 6.96 0 0 0-1.362-3.675c-.47.258-.995.482-1.565.667.248.92.4 1.938.437 3.008zM11.27 2.461q.266.502.482 1.078a8.4 8.4 0 0 0 1.196-.49 7 7 0 0 0-2.275-1.52c.218.283.418.597.597.932m-.488 1.343a8 8 0 0 0-.395-.872C9.835 1.897 9.17 1.282 8.5 1.077V4.09c.81-.03 1.577-.13 2.282-.287z"/>
                </svg><br><br><br>
                <header>
                    <h2>Sustainability</h2>
                </header>
                <p>Adopting sustainable business practices <br>and eco-friendly policies plays a crucial role in <br>long-term success.</p>
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
                    <p>We started with the aim of drastically bridging the gap between consumers and sellers. <br>Our service saves you time and guarantees financial transactions for your purchases, thereby preventing fraud.</p>
                    <br>
                    <ul class="feature-icons row">
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-code"></i>
                            </div>
                            Prewritten and verified code
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-cubes"></i>
                            </div>
                            Stack your skil box easily
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-book"></i>
                            </div>
                            Provide a guide and stuff
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-coffee"></i>
                            </div>
                            Transaction completed while you enjoy coffee.
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-bolt"></i>
                            </div>
                            Quickly and without fraud.
                        </li>
                        <li class="col-6">
                            <div class="icon">
                                <i class="fas fa-users"></i>
                            </div>
                            Effortless meeting.
                        </li>
                    </ul>
                </section>
                <style>
                    .chart-container {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh; /* 필요에 따라 조정 */
                    }

                    #line-chart {
                        width: 900px !important; /* 너비 조정 */
                        height: 580px !important; /* 높이 조정 */
                    }
                </style>
                <section id="twos" class="container my-5 chart-container">
                    <canvas id="line-chart" width="600" height="500"></canvas>

                    <script>
                        $(document).ready(function() {
                            var data = {
                                labels: ["First quarter", "Second quarter", "Third quarter", "Fourth quarter"],
                                datasets: [{
                                    label: " (Sales: won)",
                                    borderColor: "#3e95cd",
                                    data: [1200, 1900, 3000, 2500],
                                    fill: false, // 채우지 않음
                                    borderWidth: 2, // 선 두께
                                    tension: 0.1 // 곡선 정도 (0이면 직선)
                                }]
                            };

                            var options = {
                                responsive: true,
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            };

                            var ctx = document.getElementById("line-chart").getContext("2d");
                            var myLineChart = new Chart(ctx, {
                                type: 'line',
                                data: data,
                                options: options
                            });
                        });
                    </script>
                </section>
                <div style="text-align: center; font-size: 18px">
                    <strong>We are continuously growing and recording high sales.</strong>
                    <br><br><br><br><br><br><br><br>
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
<div class="container">
    <h2>Board List</h2>

    <div class="row">
        <c:forEach var="board" items="${boardList}">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${board.boardTitle}</h5>
                        <p class="card-text">작성자: ${board.boardWriter}</p>
                        <p class="card-text">조회수: ${board.boardHits}</p>
                        <p class="card-text">작성일: ${board.boardCreatedTime}</p>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal${board.id}">
                            자세히 보기
                        </button>
                        <!-- 장바구니에 담기 버튼 추가 -->
                        <form action="addToCart" method="post" class="d-inline">
                            <input type="hidden" name="productId" value="${board.id}"/>
                            <input type="hidden" name="quantity" value="1"/> <!-- 기본 수량 1로 설정 -->
                            <button type="submit" class="btn btn-success">장바구니에 담기</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 모달 정의 -->
            <div class="modal fade" id="Modal${board.id}" tabindex="-1" aria-labelledby="ModalLabel${board.id}" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalLabel${board.id}">${board.boardTitle}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>${board.boardContents}</p>
                            <p>작성자: ${board.boardWriter}</p>
                            <p>조회수: ${board.boardHits}</p>
                            <p>작성일: ${board.boardCreatedTime}</p>
                        </div>
                        <div class="modal-footer">
                            <form action="<c:url value='/addToCart' />" method="post" class="d-inline">
                                <input type="hidden" name="productId" value="${board.id}"/>
                                <input type="number" name="quantity" min="1" value="1" required/>
                                <button type="submit" class="btn btn-success">장바구니에 담기</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>



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

