<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 25.
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>장바구니</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h1>장바구니</h1>
  <table class="table">
    <thead>
    <tr>
      <th>상품명</th>
      <th>수량</th>
      <th>작업</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${not empty cart}">
        <c:forEach var="entry" items="${cart.entrySet()}">
          <tr>
            <td>${entry.key}</td>
            <td>${entry.value}</td>
            <td>
              <form action="<c:url value='/removeFromCart' />" method="post">
                <input type="hidden" name="productId" value="${entry.key}"/>
                <button type="submit" class="btn btn-danger">삭제</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td colspan="3">장바구니가 비어 있습니다.</td>
        </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
  <div class="d-flex justify-content-between">
    <a href="/" class="btn btn-primary">쇼핑 계속하기</a>
    <a href="#" class="btn btn-success">결제하기</a>
  </div>
</div>
</body>
</html>
