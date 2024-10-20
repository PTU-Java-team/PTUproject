<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 완료</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f7a4a4, #f5d19c);
            height: 100vh; /* 전체 화면 높이 */
            display: grid;
            place-items: center; /* 중앙 정렬 */
            margin: 0; /* 기본 여백 제거 */
        }
        .welcome-message {
            opacity: 0; /* 초기 상태 */
            transform: translateY(-20px); /* 위로 이동 */
            animation: fadeIn 2s forwards; /* 애니메이션 적용 */
            font-size: 36px; /* 크기 증가 */
            font-weight: bold; /* 글자 굵게 */
            text-align: center; /* 중앙 정렬 */
            margin-bottom: 40px; /* 버튼과의 간격 조절 */
        }
        @keyframes fadeIn {
            to {
                opacity: 1; /* 보이게 */
                transform: translateY(0); /* 원래 위치로 이동 */
            }
        }
        .button-container {
            opacity: 0; /* 초기 상태 */
            transform: translateY(20px); /* 아래로 이동 */
            animation: slideUp 0.5s forwards; /* 애니메이션 적용 */
            animation-delay: 2.5s; /* 버튼의 애니메이션 지연 시간 조정 */
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

<div class="container text-center">
    <h2 class="welcome-message">회원가입이 완료되었습니다!</h2>
    <div class="button-container">
        <a href="/logins" class="btn btn-primary">로그인 하러 가기</a>
    </div>
</div>

<script>
    // 페이지가 로드되면 애니메이션 시작
    window.onload = () => {
        document.querySelector('.welcome-message').style.opacity = 1;
        document.querySelector('.button-container').style.opacity = 1;
    };
</script>

</body>
</html>
