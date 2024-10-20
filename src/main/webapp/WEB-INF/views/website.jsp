<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Website 카테고리</title>
</head>
<body>
<h1>Website 카테고리</h1>

<table>
    <thead>
    <tr>
        <th>제품 ID</th>
        <th>제품 이름</th>
        <th>상세 보기</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="category" items="${categories}">
        <tr>
            <td>${category.categoryId}</td>
            <td>${category.categoryName}</td>
            <td>
                <a href="${pageContext.request.contextPath}/category?id=${category.categoryId}">상세 보기</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
