<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 25.
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
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
      <th>상품 ID</th>
      <th>수량</th>
    </tr>
    </thead>
    <tbody>
    <%
      Map<String, Integer> cart = (Map<String, Integer>) request.getAttribute("cart");
      if (cart != null && !cart.isEmpty()) {
        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
    %>
    <tr>
      <td><%= entry.getKey() %></td>
      <td><%= entry.getValue() %></td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="2">장바구니가 비어 있습니다.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <a href="/" class="btn btn-primary">쇼핑 계속하기</a>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
