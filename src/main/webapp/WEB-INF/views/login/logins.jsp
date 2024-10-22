<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 19.
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko" ng-app="App">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 폼</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    /* CSS 스타일 */
    * {
      box-sizing: border-box;
    }

    body {
      background: #ededed;
      font-family: Arial, sans-serif;
    }

    a {
      color: #7f8c8d;
    }

    .page-container {
      min-height: 500px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .form-container {
      padding: 50px 40px;
      background: #fff;
      width: 400px;
      text-align: center;
      box-shadow: 0 2px 3px rgba(0, 0, 0, 0.2);
      margin: 0 auto;
      position: relative;
      top: 50px;
    }

    .form-container:after {
      content: "";
      display: block;
      position: absolute;
      top: 0;
      left: 0;
      width: 100px;
      height: 10px;
      background: #e74c3c;
      box-shadow: 100px 0 0 #e67e22, 200px 0 0 #f1c40f, 300px 0 0 #1abc9c;
    }

    .login-form {
      margin-bottom: 20px;
    }

    .login-form h3 {
      font-size: 32px;
      text-align: center;
      color: #666;
      margin: 0 0 30px;
    }

    .login-form > div {
      margin-bottom: 20px;
    }

    .login-form > div > input {
      border: 2px solid #dedede;
      padding: 20px;
      font-size: 20px;
      width: 100%;
      color: #666;
      border-radius: 3px;
      outline: none;
      transition: border-color 0.2s linear;
    }

    .login-form > div > input:focus {
      border-color: #A5A5A5;
    }

    button {
      background: #27ae60;
      border: 1px solid #1F8C4D;
      color: #fff;
      padding: 20px 70px;
      font-size: 24px;
      cursor: pointer;
      min-width: 300px;
      border-radius: 3px;
      transition: background 0.2s ease-in-out;
      box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
    }

    button:not([disabled]):hover {
      background: #2ecc71;
    }

    button[disabled] {
      background: #3c7d57;
      color: #ffffff3b;
      cursor: default;
    }

    .credits {
      text-align: center;
      color: #999;
      padding: 10px;
    }
  </style>
</head>
<body>
<form action="/logins" name="user_info" method="post">
  <div class="page-container" ng-controller="LoginController">
    <div class="form-container" ng-class="done">
      <div class="login-form">
        <h3>Enter the awesomeness!</h3>
        <div>
          <input type="text" placeholder="Email" name="member_Email">
        </div>
        <div>
          <input type="password" placeholder="Password" name="member_Password">
        </div>
        <div align="center">
          <input type="submit" value="로그인">&nbsp;&nbsp;
          <input type="reset" value="다시작성"><br>&nbsp;
          <input type="button" value="회원가입" onclick="location.href='/save'">
          <br>
        </div>
    </div>
  </div>
</form>
</body>
</html>
