<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
</head>
<body>
<h1>게시글 수정</h1>
<form action="${pageContext.request.contextPath}/board/update" method="post">
    <input type="hidden" name="boardId" value="${board.boardId}">
    <label for="boardTitle">제목:</label>
    <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" required>
    <br>
    <label for="boardContent">내용:</label>
    <textarea id="boardContent" name="boardContent" required>${board.boardContent}</textarea>
    <br>
    <input type="submit" value="수정하기">
</form>
<a href="${pageContext.request.contextPath}/board/detail?id=${board.boardId}">상세보기로 돌아가기</a>
</body>
</html>
