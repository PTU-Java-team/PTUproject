<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
</head>
<body>
<h1>게시글 목록</h1>
<a href="${pageContext.request.contextPath}/board/write">게시글 작성</a>
<table border="1">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        <th>상세보기</th>
    </tr>
    <c:forEach var="board" items="${boards}">
        <tr>
            <td>${board.boardId}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardRedate}</td>
            <td><a href="${pageContext.request.contextPath}/board/detail?id=${board.boardId}">상세보기</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
