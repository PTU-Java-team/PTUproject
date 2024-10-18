<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 16.
  Time: 오후 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login-tunnel</title>
    <style>
        body {
            display: grid;
            height: 100vh; /* 전체 화면 높이 */
            place-items: center; /* 중앙 정렬 */
            margin: 0; /* 기본 여백 제거 */
            background-color: #f0f0f0; /* 배경색 추가 */
        }
        fieldset {
            width: 500px; /* 박스 너비 조정 */
            height: 400px; /* 박스 높이 조정 */
            padding: 40px; /* 패딩 추가 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            border-radius: 10px; /* 모서리 둥글게 */
            background-color: white; /* 배경색 흰색 */
            flex-direction: column; /* 세로 방향 정렬 */
            justify-content: center; /* 세로 중앙 정렬 */
            align-items: center; /* 가로 중앙 정렬 */
        }
        .titl {
            text-align: center;
        }
    </style>
</head>
<body>
<fieldset>
  <h1 class="titl">회원가입 완료</h1>
    <br>
  <a href="/login" style="text-align: center; text-decoration: none">로그인 하러 가기</a>
</fieldset>
</body>
</html>
