<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 16.
  Time: 오후 11:04
  To change this template use File | Settings | File Templates.
--%>
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
    .card img {
      height: 250px;
      object-fit: cover;
    }
  </style>
</head>
<body>

  <div class="container mt-5">
    <div class="row">
      <div class="col-md-4">
          <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
          <button onclick="main()">메인 화면</button>
          <button onclick="update()">내 정보 수정하기</button>
          <button onclick="logout()">로그아웃</button>
        </div>
      </div>
    </div>
  </div>



  <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
  <button onclick="main()">메인 화면</button>
  <button onclick="update()">내 정보 수정하기</button>
  <button onclick="logout()">로그아웃</button>
</body>
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
</html>
