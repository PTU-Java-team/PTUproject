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
</head>
<body>
  <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
  <button onclick="update()">내 정보 수정하기</button>
  <button onclick="logout()">로그아웃</button>
</body>
  <script>
    const update = () => {
      location.href = '/update';
    }
    const logout = () => {
      location.href = '/logout';
    }
  </script>
</html>
