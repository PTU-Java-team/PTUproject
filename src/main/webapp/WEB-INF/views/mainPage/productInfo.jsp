<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-10-23
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modal Product Info</title>
</head>
<body>
<%--modal header--%>
<div class="modal-header">
    <h5 class="modal-title" id="itemDetailModalLabel">상품 상세 정보</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<!--modal body-->
<div class="modal-body d-flex align-items-start">

  <%-- 상품 상세 정보 표시하기 --%>
  <%--ajax로 받은 정보를 표시함.--%>
  <div id="itemDetailContent">
      <img src="${product.img1}" class="img-fluid" alt="..." style="border-radius: 10px; max-width: 700px; height: auto;">
      <div class="ms-4" style="border-radius: 10px; background-color: #f8f9fa; padding: 20px; width: 300px; height: 400px;">
        <h6><strong>정보 박스</strong></h6>
        <p><br>판매자 : ${sellerEmail} <br><br>가격 : ${product.price}<br>제작년도 : 2024 . 07 . 28<br><br>제작 난이도 : ❤️❤️🖤🖤🖤</p>
      </div>
      <div></div>
    <div class="mt-3" style="border-radius: 15px; background-color: #e9ecef; padding: 20px;">
        <h5><strong>설명문</strong></h5>
        <p>${product.detail}</p>
    </div>
  </div>
</div>

<!--modal footer-->
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
    <button type="button" class="btn btn-primary">할게 있나?</button>
</div>
</body>
</html>
