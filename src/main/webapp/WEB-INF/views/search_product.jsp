<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-10-25
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <link href="<c:url value='/resources/css/search_product.css' />" rel="stylesheet" type="text/css">
</head>
<body>


<!-- product search 상품검색 창-->

<div class="search inner-div">
<form action="<c:url value='/searchProductConfirm' />" name="search_product_form" method="get">
<input type="text" name="productName" placeholder="Search for products">
<input type="button" value="search" onclick="searchProductForm();">
<button type="reset" class="btn btn-secondary" onclick="location.href='/searchProductConfirm'">reset</button>
<%--<a href="/" class="btn btn-danger" type="button">back</a>--%>
<button type="button"  class="btn btn-danger" onclick="location.href='/'">back</button>
</form>
</div><br><br>

<section>

  <div id="section_wrap">

    <div class="word">

      <h3>PRODUCT SEARCH RESULTS</h3>

    </div>

    <div class="book_list">

      <table>
        <thead>
        <tr>
          <th>상품명</th>
          <th>카테고리</th>
          <th>가격</th>
          <th>판매자</th>
          <th>등록일</th>
        </tr>
        </thead>

        <tbody>
        <%--상품 검색 정보 ItemController의 productDetail id를 item 변수에 저장해서 사용--%>
        <c:if test="${not empty param.productName}">
        <c:forEach var="item" items="${productDetail}">
          <tr>
            <td>${item.productName}</td>
            <td>${item.categoryName}</td>
            <td><fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₩" /></td>
            <td>${item.memberEmail}</td>
            <td><fmt:formatDate value="${item.productDate}" pattern="yyyy-MM-dd HH:mm" /></td>
          </tr>
        </c:forEach>
        </c:if>
        </tbody>

      </table>


    </div>

  </div>

</section>

<script type="text/javascript">

  function searchProductForm() {
    console.log('searchBookForm() CALLED!!');

    let form = document.search_product_form;

    if (form.productName.value == '') {
      alert('Enter the name of the book you are looking for.');
      form.productName.focus();

    } else {
      form.submit();

    }

  }

</script>
</body>
</html>