<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>고객 상세 정보</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #f7a4a4, #f5d19c);
    }
    .container {
      margin-top: 50px;
      background: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>고객 상세 정보</h2>
  <table class="table table-bordered">
    <tbody>
    <tr>
      <th>아이디</th>
      <td>${member.id}</td>
    </tr>
    <tr>
      <th>이메일</th>
      <td>${member.memberEmail}</td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td>${member.memberPassword}</td>
    </tr>
    <tr>
      <th>이름</th>
      <td>${member.memberName}</td>
    </tr>
    <tr>
      <th>나이</th>
      <td>${member.memberAge}</td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td>${member.memberMobile}</td>
    </tr>
    </tbody>
  </table>
  <div class="text-center">
    <button class="btn btn-secondary" onclick="location.href='/list'">목록으로 돌아가기</button>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
