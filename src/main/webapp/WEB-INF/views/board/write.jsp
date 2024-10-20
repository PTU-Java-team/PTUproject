<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>
<h1>게시글 작성</h1>
<form action="${pageContext.request.contextPath}/board/save" method="post">
    <label for="boardTitle">제목:</label>
    <input type="text" id="boardTitle" name="boardTitle" required>
    <br>
    <label for="boardContent">내용:</label>
    <textarea id="boardContent" name="boardContent" required></textarea>
    <br>
    <input type="submit" value="작성하기">
</form>
</body>
</html>
