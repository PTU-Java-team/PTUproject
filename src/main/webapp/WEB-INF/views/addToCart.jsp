<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 25.
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String productName = request.getParameter("productName"); // 상품 ID
  int quantity = Integer.parseInt(request.getParameter("quantity")); // 수량

  // 세션에 장바구니 정보 저장
  Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
  if (cart == null) {
    cart = new HashMap<>();
  }
  cart.put(productName, cart.getOrDefault(productName, 0) + quantity);
  session.setAttribute("cart", cart);

  // 장바구니 페이지로 리다이렉트
  response.sendRedirect("cart.jsp");
%>
