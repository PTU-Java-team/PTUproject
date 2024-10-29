<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: choi
  Date: 2024-10-26
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fixed Top Navigation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .top-fixed {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: #f8f9fa;
            padding: 10px 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .search-area {
            flex: 1; /* 공간을 차지하도록 설정 */
        }
        .nav-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<nav class="top-fixed">
    <div class="nav-container">
        <!-- 왼쪽에 검색창 공간을 비워둠 -->
        <div class="search-area">
<%--           검색창--%>
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <!-- 로그인 상태일 때 -->
                <button class="btn btn-secondary" onclick="update()">내 정보 수정하기</button>
            </c:when>
            <c:otherwise>
                <!-- 비로그인 상태일 때 -->
                <button class="btn btn-primary" onclick="login()">로그인</button>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<script>
    function update() {
        alert("내 정보 수정하기 페이지로 이동합니다.");
        location.href = '/update';
    }

    function login() {
        alert("로그인 페이지로 이동합니다.");
        location.href = '/logins';
    }
</script>
</body>
</html>

