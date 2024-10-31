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

    <%--toast ui 적용--%>
    <!-- TOAST UI Editor CDN(JS) -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!-- TOAST UI Editor CDN(CSS) -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</head>
<body>
<h3>Product Register</h3>
<div class="bs-example">
    <form class="form-horizontal" action="<c:url value='/registerProductConfirm' />" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName" class="control-label col-xs-2">상품명:</label>
            <div class="col-xs-10">
                <input type="text" class="form-control area" id="productName" name="productName" required />
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
            <label for="productPrice" class="control-label col-xs-2">가격:</label>
            <div class="col-xs-10">
                <input type="number" step="100" class="form-control area" id="productPrice" name="productPrice" />
            </div>
        </div><br>

        <!-- 상세 설명 입력 (TOAST UI Editor) -->
        <div class="form-group">
            <label for="productDescription" class="control-label col-xs-2">상세설명</label>
            <div class="col-xs-10">
            <div id="editor"></div>
            <!-- 에디터 내용을 담을 숨겨진 텍스트 영역 -->
            <textarea  style="display:none;" class="form-control area" rows="20" id="productDescription" name="productDescription" required></textarea>
            </div>
        </div><br>

        <div class="form-group">
            <label for="productImg3" class="control-label col-xs-2">Thumbnail Picture :
                <img id="preview" src="<c:url value='/images/camera.png' />" class="cover" alt="이미지 업로드" style="width: 50px; height: 50px; cursor: pointer;" />
            </label>
            <div class="col-xs-10">
                <input type="file" class="form-control area form-control-user" id="productImg3" name="productImg3" style="display: none;" onchange="previewImage(event);">
            </div>
        </div><br>

        <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
                <button type="submit" class="button alt" onclick="registerBookForm();">등록</button>&nbsp;&nbsp;
                <button type="reset" class="button alt">다시 작성</button> &nbsp;&nbsp;
                <a href="/"><button type="button" class="button alt">나가기</button></a>
            </div>
        </div>
    </form>
</div>

<script>
    function previewImage(event) {
        const input = event.target;
        const preview = document.getElementById('preview');

        // 파일 선택 시만 미리보기 설정
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result; // 미리보기 이미지 설정
                preview.style.width = '50px';
                preview.style.height = '50px';
            };
            reader.readAsDataURL(input.files[0]);

        }
    }

    // 미리보기 이미지 클릭 시 파일 선택창 열기
    document.getElementById('preview').addEventListener('click', function(event) {
        document.getElementById('productImg3').click();
        event.preventDefault(); // 클릭 후 추가 이벤트 발생 방지
    });
</script>

<!-- TOAST UI Editor 초기화 및 폼 제출 -->
<script>
    // TOAST UI Editor 초기화
    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        previewHighlight: true,
        height: '500px',
        initialValue: '',
        placeholder: '상세 설명을 작성해주세요.',
    });

    // 폼 제출 함수
    function registerBookForm() {
        console.log('registerBookForm() CALLED!!');
        // 에디터 내용을 숨겨진 텍스트 영역에 넣기
        const description = editor.getMarkdown();
        document.getElementById("productDescription").value = description;

        let form = document.register_book_form;

        if (form.productName.value == '') {
            alert('INPUT BOOK NAME.');
            form.productName.focus();

        } else if (form.categoryId.value == '') {
            alert('INPUT BOOK AUTHOR.');
            form.categoryId.focus();

        } else if (form.productPrice.value == '') {
            alert('INPUT BOOK PUBLISHER.');
            form.productPrice.focus();

        } else if (form.productDescription.value == '') {
            alert('INPUT BOOK PUBLISH YEAR.');
            form.productDescription.focus();

        } else if (form.productImg1.value == '') {
            alert('INPUT BOOK ISBN.');
            form.productImg1.focus();

        } else if (form.productImg2.value == '') {
            alert('INPUT BOOK CALL NUMBER.');
            form.productImg2.focus();

        } else if (form.productImg3.value == '') {
            alert('INPUT BOOK CALL NUMBER.');
            form.productImg3.focus();

        } else {
            form.submit();

        }

    }
</script>
</section>
</body>
</html>