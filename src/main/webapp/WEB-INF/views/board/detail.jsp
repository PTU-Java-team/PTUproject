<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>${board.boardTitle}</title>
</head>
<body>
<h1>${board.boardTitle}</h1>
<p>작성일: ${board.boardRedate}</p>
<p>${board.boardContent}</p>
<%--boardDTO에서 값을 받아 수정, 삭제 가능--%>
<%--요청에 따라 업데이트와 삭제가 이뤄진다--%>
<a href="${pageContext.request.contextPath}/board/update?id=${board.boardId}">수정</a>
<a href="${pageContext.request.contextPath}/board/delete?id=${board.boardId}">삭제</a>
<a href="${pageContext.request.contextPath}/board/list">목록으로 돌아가기</a>
</body>
</html>
