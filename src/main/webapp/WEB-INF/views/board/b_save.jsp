<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Save</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }
    form {
      background-color: white;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      max-width: 500px;
      margin: auto;
    }
    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
    input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<h1>Write a Post</h1>
<br>
<form action="/b_list" method="get">
  <input type="text" name="boardWriter" placeholder="작성자" required>
  <input type="text" name="boardPass" placeholder="비밀번호" required>
  <input type="text" name="boardTitle" placeholder="제목" required>
  <textarea name="boardContents" cols="30" rows="10" placeholder="내용을 입력하세요" required></textarea>
  <input type="submit" value="작성">
</form>
</body>
</html>
