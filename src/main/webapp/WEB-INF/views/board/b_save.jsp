<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 28.
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 작성</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">게시글 작성</h2>
  <form action="/b_save" method="post">
    <div class="form-group">
      <label for="boardWriter">작성자</label>
      <input type="text" class="form-control" id="boardWriter" name="boardWriter" placeholder="작성자를 입력하세요" required>
    </div>
    <div class="form-group">
      <label for="boardPass">비밀번호</label>
      <input type="password" class="form-control" id="boardPass" name="boardPass" placeholder="비밀번호를 입력하세요" required>
    </div>
    <div class="form-group">
      <label for="boardTitle">제목</label>
      <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요" required>
    </div>
    <div class="form-group">
      <label for="boardContents">내용</label>
      <textarea class="form-control" id="boardContents" name="boardContents" rows="5" placeholder="내용을 입력하세요" required></textarea>
    </div>
    <button type="submit" class="btn btn-primary btn-block">작성</button>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

