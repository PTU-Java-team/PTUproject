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
                <c:forEach var="item" items="${productDetail}">
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.categoryName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.memberEmail}</td>
                        <td><fmt:formatDate value="${item.productDate}" pattern="yyyy-MM-dd- HH:mm:ss" /></td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>


        </div>

    </div>

</section>


