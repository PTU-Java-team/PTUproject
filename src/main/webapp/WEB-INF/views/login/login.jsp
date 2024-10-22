<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 16.
  Time: 오전 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>login</title>
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

    legend {
      font-size: 40px;
    }

    /* 아 이젠 정말 모르겠다...  */
    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 90%; /* 입력 필드 너비 */
      margin: 10px 0; /* 여백 */
      padding: 10px; /* 패딩 */
    }
    input[type="submit"],
    input[type="reset"] {
      width: 45%; /* 버튼 너비 */
      padding: 10px; /* 패딩 */
    }
    input[type="button"] {
      width: 100%; /* 버튼 너비를 100%로 설정 */
      padding: 15px; /* 패딩을 늘림 */
      margin: 5px 0; /* 버튼 사이 여백 */
      font-size: 16px; /* 폰트 크기 조정 */
      border-radius: 5px;
      background-color: white;
    }
  </style>
</head>
<body>
<form action="/login" name="user_info" method="post">
  <fieldset>
    <legend>로그인</legend>

    이메일: <br>
    <input type="text" name="member_Email"><br><br>

    비밀번호 : <br>
    <input type="password" name="member_Password"><br><br>


    <div align="center">
      <input type="submit" value="로그인">&nbsp;&nbsp;
      <input type="reset" value="다시작성">
      <input type="submit" value="회원가입" onclick="location.href='/save'">
    </div>
    <br><br><br><br><br>

  </fieldset>
</form>
<!--
<br>
<div align="center">
  <button onclick="location.href='/save'" class="signup-button" style="color: black; background-color: lightgray; border: none; padding: 10px 20px; cursor: pointer;">
    회원가입하러가기 ~~
  </button>
</div>-->

<br><br><br><br>&nbsp;&nbsp;

</body>
</html>
