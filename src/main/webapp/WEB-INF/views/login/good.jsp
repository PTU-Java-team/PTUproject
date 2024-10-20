<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            margin-bottom: 40px; /* 버튼과의 간격 조절 */
            margin-top: 50px; /* 위쪽 마진 추가하여 아래로 이동 */
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
        <div class="col-md-6 text-center"> <!-- 중앙 정렬을 위한 설정 -->
            <h2 class="welcome-message">${sessionScope.loginEmail} 님 환영합니다.</h2>
            <div class="button-container">
                <button class="btn btn-primary" onclick="main()">메인 화면</button>
                <button class="btn btn-secondary" onclick="update()">내 정보 수정하기</button>
                <button class="btn btn-danger" onclick="logout()">로그아웃</button>
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
</script>
</body>
</html>
