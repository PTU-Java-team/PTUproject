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

                <c:forEach var="item" items="${productDetail}">
                    <tr>
<%--                        <td>--%>
<%--                            <c:url value='/' var='detail_url'>--%>
<%--                                <c:param name='productId' value='${item.productId}'/>--%>
<%--                            </c:url>--%>
<%--                            <a href="${detail_url}">${item.productName}</a>--%>
<%--                        </td>--%>
                        <td>${item.productName}</td>
                        <td>${item.categoryId}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.memberEmail}</td>
                        <td><fmt:formatDate value="${item.productDate}" pattern="yyyy-MM-dd- HH:mm:ss" /></td>
                    </tr>
                </c:forEach>

                </tbody>
                <a href="/">돌아가기</a>

            </table>


        </div>

    </div>

</section>


<%--<div>--%>
<%--    <h2>검색 결과</h2>--%>
<%--    <c:if test="${not empty productDetail}">--%>
<%--        <ul>--%>
<%--            <c:forEach var="item" items="${productDetail}">--%>
<%--                <li>--%>
<%--                    <strong>이름:</strong> ${item.productId} <br/>--%>
<%--                    <strong>설명:</strong> ${item.description} <br/>--%>
<%--                    <strong>가격:</strong> ${item.price}--%>
<%--                </li>--%>
<%--            </c:forEach>--%>
<%--        </ul>--%>
<%--    </c:if>--%>
<%--    <c:if test="${empty searchResults}">--%>
<%--        <p>검색 결과가 없습니다.</p>--%>
<%--    </c:if>--%>
<%--</div>--%>

