<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>good</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f7a4a4, #f5d19c);
        }
        .welcome-message {
            opacity: 0; /* 초기 상태 */
            transform: translateX(-100%); /* 왼쪽으로 이동 */
            animation: slideIn 1s forwards; /* 애니메이션 적용 */
            font-size: 36px; /* 크기 증가 */
            text-align: center; /* 중앙 정렬 */
            margin-bottom: 50px; /* 버튼과의 간격 조절 */
            margin-top: 150px; /* 위쪽 마진 추가하여 아래로 이동 */
        }
        @keyframes slideIn {
            to {
                opacity: 1; /* 보이게 */
                transform: translateX(0); /* 원래 위치로 이동 */
            }
        }
        .button-container {
            opacity: 0; /* 초기 상태 */
            transform: translateY(20px); /* 아래로 이동 */
            animation: slideUp 0.5s forwards; /* 애니메이션 적용 */
            animation-delay: 1s; /* 환영합니다 텍스트가 나온 후 지연 */
            text-align: center; /* 중앙 정렬 */
            margin-top: 30px; /* 버튼 상단 마진 추가 */
        }
        @keyframes slideUp {
            to {
                opacity: 1; /* 보이게 */
                transform: translateY(0); /* 원래 위치로 이동 */
            }
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <h2 class="welcome-message">${sessionScope.loginEmail} 님 환영합니다.</h2>
            <div class="button-container">
                <button class="btn btn-primary" onclick="main()">메인 화면</button>
                <button class="btn btn-secondary" onclick="update()">내 정보 수정하기</button>
                <button class="btn btn-danger" onclick="logout()">로그아웃</button>

                <!-- 관리자인 경우 고객 리스트 관리 버튼 추가 -->
                <c:if test="${sessionScope.isAdmin == 1}">
                    <button class="btn btn-info" onclick="manageCustomers()">고객 리스트 관리</button>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    const main = () => {
        location.href = '/';
    }
    const update = () => {
        location.href = '/update';
    }
    const logout = () => {
        location.href = '/logout';
    }
    const manageCustomers = () => {
        location.href = '/list'; // 고객 리스트 페이지로 이동
    }
</script>
</body>
</html>
