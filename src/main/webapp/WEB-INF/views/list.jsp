<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>고객 리스트</title>
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
  <h2>고객 리스트</h2>
  <table class="table table-bordered">
    <thead class="thead-light">
    <tr>
      <th>아이디</th>
      <th>이메일</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>나이</th>
      <th>전화번호</th>
      <th>조회</th>
      <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${memberList}" var="member">
      <tr>
        <td>${member.member_id}</td>
        <td><a href="/member?id=${member.member_id}">${member.member_Email}</a></td>
        <td>${member.member_Password}</td>
        <td>${member.member_Name}</td>
        <td>${member.member_Age}</td>
        <td>${member.member_Mobile}</td>
        <td><a href="/member?id=${member.member_id}" class="btn btn-info btn-sm">조회</a></td>
        <td><button class="btn btn-danger btn-sm" onclick="deleteMember('${member.member_id}')">삭제</button></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <div class="text-center mt-3">
    <button class="btn btn-secondary" onclick="goBack()">이전으로 돌아가기</button>
  </div>

</div>

<script>
  const deleteMember = (id) => {
    if (confirm("정말 삭제하시겠습니까?")) {
      location.href = "/member/delete?id=" + id;
    }
  }

  const goBack = () => {
    window.history.back(); // 이전 페이지로 돌아가기
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
