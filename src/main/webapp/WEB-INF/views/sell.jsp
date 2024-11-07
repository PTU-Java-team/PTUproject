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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Festival Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

    <%--toast ui 적용--%>
    <!-- TOAST UI Editor CDN(JS) -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!-- TOAST UI Editor CDN(CSS) -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

    <style>
        body {
            background: url('<c:url value="/images/back.svg" />') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 15px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }
        .form-label {
            font-weight: bold;
        }
        .form-control,
        select,
        textarea {
            border: none;
            border-bottom: 2px solid #333;
            background: transparent;
            border-radius: 0;
            box-shadow: none;
        }
        .form-control:focus,
        select:focus,
        textarea:focus {
            box-shadow: none;
            border-bottom: 2px solid #007bff;
        }
        .thumbnail-upload {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .thumbnail-upload img {
            cursor: pointer;
            width: 200px;
            height: 100px;
            margin-right: 10px;
        }
        @media screen and (max-width: 768px) {
            .form-container {
                padding: 15px;
                max-width: 90%;
            }
        }
    </style>
</head>
<body><br>

<div class="form-container">
    <h3 style="text-align: center;">Festival Form</h3><br>

    <form class="form-horizontal" action="<c:url value='/registerProductConfirm' />" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName" class="form-label">행사명</label>
            <input type="text" class="form-control" id="productName" name="productName" required />
        </div><br>

        <div class="form-group">
            <label for="categoryId" class="form-label">카테고리</label>
            <select id="categoryId" class="form-control" name="categoryId" required>
                <option disabled hidden selected>
                    카테고리를 선택하세요.
                </option>
                <option value="3">일반 행사</option>
                <option value="4">개인 행사</option>
                <option value="15">시설 대관</option>
            </select>
        </div><br>

        <div class="form-group">
            <label for="productPrice" class="form-label">참가 인원</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" />
        </div><br>

        <!-- 상세 설명 입력 (TOAST UI Editor) -->
        <div class="form-group">
            <label for="productDescription" class="form-label">상세 설명</label>
            <div id="editor"></div>
            <!-- 에디터 내용을 담을 숨겨진 텍스트 영역 -->
            <textarea style="display:none;" class="form-control" rows="20" id="productDescription" name="productDescription" required></textarea>
        </div><br>

        <div class="form-group thumbnail-upload">
            <label for="productImg3" class="form-label"></label>
            <img id="preview" src="<c:url value='/images/camera.png' />" alt="이미지 업로드" />
            <input type="file" class="form-control" id="productImg3" name="productImg3" style="display: none;" onchange="previewImage(event);">
        </div><br>

        <div class="form-group" style="text-align: center;">
            <button type="submit" class="btn btn-primary" onclick="registerBookForm();">등록</button>&nbsp;&nbsp;
            <button type="reset" class="btn btn-secondary">다시 작성</button>&nbsp;&nbsp;
            <a href="/" class="btn btn-danger">나가기</a>
        </div>
    </form>
</div>

<script>
    function previewImage(event) {
        const input = event.target;
        const preview = document.getElementById('preview');

        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.width = '100px';
                preview.style.height = '100px';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    document.getElementById('preview').addEventListener('click', function(event) {
        document.getElementById('productImg3').click();
        event.preventDefault();
    });
</script>

<!-- TOAST UI Editor 초기화 및 폼 제출 -->
<script>
    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        previewHighlight: true,
        height: '300px',
        initialValue: '',
        placeholder: '상세 설명을 작성해주세요.',
    });

    function registerBookForm() {
        console.log('registerBookForm() CALLED!!');
        const description = editor.getMarkdown();
        document.getElementById("productDescription").value = description;

        let form = document.register_book_form;

        if (form.productName.value == '') {
            alert('행사명을 입력하세요.');
            form.productName.focus();
        } else if (form.categoryId.value == '') {
            alert('카테고리를 선택하세요.');
            form.categoryId.focus();
        } else if (form.productPrice.value == '') {
            alert('참가 인원을 입력하세요.');
            form.productPrice.focus();
        } else if (form.productDescription.value == '') {
            alert('상세 설명을 입력하세요.');
            form.productDescription.focus();
        } else {
            form.submit();
        }
    }
</script>
</body>
</html>
