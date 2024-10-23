<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 16.
  Time: 오전 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>sellregister</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .bs-example {
            margin-bottom: 20px;
            margin-left: 20px;
            margin-right: 40px;
            margin-top: 20px;
        }

        body {
            background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
        }

        .area {
            background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
        }

        .cover {
            width: 10%;
            height: 5%;
        }

        .bt {
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
            border-radius: 10px;
            border: none;
        }

    </style>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
<div class="bs-example">
    <form class="form-horizontal" action="/itemRegister" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name" class="control-label col-xs-2">상품명:</label>
            <div class="col-xs-10">
                <input type="text" class="form-control area" id="name" name="name" required>
            </div>
        </div><br>

        <div class="form-group">
            <label for="categoryId" class="control-label col-xs-2">카테고리:</label>
            <div class="col-xs-10">
                <select id="categoryId" class="form-control area" name="categoryId" required>
                    <option value="3">소모임</option>
                    <option value="4">웹사이트</option>
                </select>
            </div>
        </div><br>

        <div class="form-group">
            <label for="price" class="control-label col-xs-2">가격:</label>
            <div class="col-xs-10">
                <input type="number" class="form-control area" id="price" name="price">
            </div>
        </div><br>

        <div class="form-group">
            <label for="detail" class="control-label col-xs-2">상세설명:</label>
            <div class="col-xs-10">
                <textarea class="form-control area" rows="20" id="detail" name="detail" required></textarea>
            </div>
        </div><br>

        <div class="form-group">
            <label for="img1" class="control-label col-xs-2">Main Picture :
                <img src="<c:url value='/images/camera.png' />" class="cover" alt="이미지 업로드" />
            </label>
            <div class="col-xs-10">
                <input type="file" class="form-control area form-control-user" id="img1" name="img1" onchange="setThumbnail(event);" style="display: none;">
            </div>
        </div>

        <div class="form-group">
            <label for="img2" class="control-label col-xs-2">Detail Picture :
                <img src="<c:url value='/images/camera.png' />" class="cover" alt="이미지 업로드" />
            </label>
            <div class="col-xs-10">
                <input type="file" class="form-control area form-control-user" multiple="multiple" id="img2" name="img2" onchange="setDetailImage(event);" style="display: none;">
            </div>
        </div>



<%--        <div class="form-group">--%>
<%--            <label for="img3" class="control-label col-xs-2">이미지 3:--%>
<%--                <img src="<c:url value='/images/camera.png' />" class="cover" alt="이미지 업로드" />--%>
<%--            </label>--%>
<%--            <div class="col-xs-10">--%>
<%--                <input type="file" class="form-control area" id="img3" name="img3" style="display: none;">--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                 <button type="submit" class="btn btn-primary bt" onclick="location.href='/'">등록</button>&nbsp;&nbsp;
                 <button type="reset" class="btn btn-primary bt">다시 작성</button> &nbsp;&nbsp;
                 <a href="/"><button type="button" class="btn btn-primary bt">나가기</button></a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
