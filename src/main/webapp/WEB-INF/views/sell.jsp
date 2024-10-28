<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <style>
        body {
            background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .bs-example {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .bt {
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
            border-radius: 10px;
            border: none;
            color: black; /* 텍스트 색상을 검은색으로 설정 */
            transition: background-color 0.3s;
        }

        .bt:hover {
            background-color: #f3c5d0;
        }

        .cover {
            width: 20px;
            height: 20px;
            margin-left: 5px;
        }

        .area {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="bs-example">
    <form class="form-horizontal" action="/itemRegister" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName" class="control-label col-xs-2">상품명:</label>
            <div class="col-xs-10">
                <input type="text" class="form-control area" id="productName" name="productName" required>
            </div>
        </div>

        <div class="form-group">
            <label for="categoryId" class="control-label col-xs-2">카테고리:</label>
            <div class="col-xs-10">
                <select id="categoryId" class="form-control area" name="categoryId" required>
                    <option value="3">소모임</option>
                    <option value="4">웹사이트</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="productPrice" class="control-label col-xs-2">가격:</label>
            <div class="col-xs-10">
                <input type="number" step="100" class="form-control area" id="productPrice" name="productPrice" required>
            </div>
        </div>

        <div class="form-group">
            <label for="productDescription" class="control-label col-xs-2">상세설명:</label>
            <div class="col-xs-10">
                <textarea class="form-control area" rows="5" id="productDescription" name="productDescription" required></textarea>
            </div>
        </div>

        <div class="form-group">
            <label for="productImg1" class="control-label col-xs-2">Main Picture:</label>
            <div class="col-xs-10">
                <input type="file" class="form-control area" id="productImg1" name="productImg1" onchange="setThumbnail(event);" required>
                <img src="<c:url value='/images/camera.png' />" class="cover" alt="이미지 업로드" />
            </div>
        </div>

        <div class="form-group">
            <label for="productImg2" class="control-label col-xs-2">Detail Picture:</label>
            <div class="col-xs-10">
                <input type="file" class="form-control area" multiple="multiple" id="productImg2" name="productImg2" onchange="setDetailImage(event);">
                <img src="<c:url value='/images/camera.png' />" class="cover" alt="이미지 업로드" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="submit" class="btn btn-primary bt">등록</button>
                <button type="reset" class="btn btn-secondary bt">다시 작성</button>
                <a href="/"><button type="button" class="btn btn-danger bt">나가기</button></a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
