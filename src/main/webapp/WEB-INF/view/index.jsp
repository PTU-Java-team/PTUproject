<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>







</head>

<style>
    body{
        margin: 0;
    }
    section {
        background: url("https://assets.nflxext.com/ffe/siteui/vlv3/9737377e-a430-4d13-ad6c-874c54837c49/945eec79-6856-4d95-b4c6-83ff5292f33d/KR-ko-20220111-popsignuptwoweeks-perspective_alpha_website_large.jpg");
        height: 100vh;


        /*<img srcset="https://cdn.pixabay.com/photo/2017/10/31/19/05/web-design-2906159_960_720.jpg 1x, https://cdn.pixabay.com/photo/2017/10/31/19/05/web-design-2906159_1280.jpg 2x" src="https://cdn.pixabay.com/photo/2017/10/31/19/05/web-design-2906159_1280.jpg" alt="웹 디자인, 코딩, 웹 개발, 맥북, 나무 배경, 도서, 커피, 웹 배너">*/
    }
    section:before{
        content:'';
        background: linear-gradient(to right, black,transparent) ;

        left:0;
        height: 100%;
        width: 50%;
    }
    h2{
        font-size: 6em;
        color: white;
        position: absolute;
        top:200px;
        left:150px;
        font-family: sans-serif;
    }
    a{
        font-size:1em;
        color: white;
        font-family: sans-serif;

    }

</style>
<body>
<section>
<div class="container-fluid">
    <h1 class="mx-auto display-1 text-center" style="font-weight: bold">Lo-Neon</h1> <!-- 제목 크기 키우기 -->
</div>
<br>
<nav class="navbar navbar-expand-lg bg-white fixed-top"> <!-- 배경색을 흰색으로 변경 -->
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarNav"> <!-- 메뉴 항목 -->
            <div class="navbar-nav mx-auto"> <!-- 중앙 배치 -->
                <a class="nav-link active btn btn-danger btn-lg mx-4" aria-current="page" href="#" style="padding: 15px 27px; color: white;">Home</a>
                <a class="nav-link btn btn-lg mx-4" href="/smallGroup" style="padding: 15px 50px;">소모임</a>
                <a class="nav-link btn btn-lg mx-4" href="/website" style="padding: 15px 50px;">웹사이트</a>
                <a class="nav-link btn btn-lg mx-4" href="/sell" style="padding: 15px 50px;" aria-disabled="true">판매</a>
                <h2>게시판</h2>
                <a href="/board/save" style="padding: 15px 50px;" >글작성</a>
                <a href="/board/" style="padding: 15px 50px;">글목록</a>
                <a href ="/board/paging" style="padding: 15px 50px;">페이징</a>

            </div>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" style="margin-left: auto; display: flex">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>


</section>












</body>
</html>