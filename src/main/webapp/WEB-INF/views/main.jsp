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
<jsp:include page="main_top.jsp"></jsp:include>

<div class="box" style="display: flex; justify-content: center; gap: 20px;">

    <div class="card" style="width: 18rem;">
        <img src="<c:url value='/images/cap_image.png'/>" class="card-img-top" alt="상품 이미지">
        <div class="card-body">
            <h5 class="card-title">상품명</h5>
            <p class="card-text">한줄 설명</p>
            <a href="#" class="btn btn-primary">상세정보 열람</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="<c:url value='/images/cap_image.png'/>" class="card-img-top" alt="상품 이미지">
        <div class="card-body">
            <h5 class="card-title">상품명</h5>
            <p class="card-text">한줄 설명</p>
            <a href="#" class="btn btn-primary">상세정보 열람</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="<c:url value='/images/cap_image.png'/>" class="card-img-top" alt="상품 이미지">
        <div class="card-body">
            <h5 class="card-title">상품명</h5>
            <p class="card-text">한줄 설명</p>
            <a href="#" class="btn btn-primary">상세정보 열람</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="<c:url value='/images/cap_image.png'/>" class="card-img-top" alt="상품 이미지">
        <div class="card-body">
            <h5 class="card-title">상품명</h5>
            <p class="card-text">한줄 설명</p>
            <a href="#" class="btn btn-primary">상세정보 열람</a>
        </div>
    </div>

    <div class="card" style="width: 18rem;">
        <img src="<c:url value='/images/cap_image.png'/>" class="card-img-top" alt="상품 이미지">
        <div class="card-body">
            <h5 class="card-title">상품명</h5>
            <p class="card-text">한줄 설명</p>
            <a href="#" class="btn btn-primary">상세정보 열람</a>
        </div>
    </div>
</div>

<!-- 푸터 영역 -->
<!--footer는 페이지 하단 부분을 의미한다. -->
<jsp:include page="main_footer.jsp"></jsp:include>

</body>
</html>

