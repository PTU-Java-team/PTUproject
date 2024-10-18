<%--
  Created by IntelliJ IDEA.
  User: choi
  Date: 2024-10-18
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main page</title>
    <style>
        .box {
            width: 80%;
            height: 110%; /* 박스 높이 설정 */
            margin: 100px auto;
            padding: 10px;
            border: 1px solid red;
            border-radius: 10px;
            box-shadow: 2px 2px 10px #999;
            overflow-y: auto; /* 세로 스크롤 가능 */
            display: flex; /* Flexbox 사용 */
            flex-wrap: wrap; /* 줄 바꿈 가능 */
            justify-content: center; /* 중앙 정렬 */
            align-items: flex-start; /* 위쪽 정렬 */
        }

        .rectangle {
            width: 30%; /* 직사각형 너비를 조정하여 3개씩 나열 */
            height: 45%; /* 직사각형 높이 */
            margin: 10px; /* 여백 */
            background-color: #4caf50; /* 직사각형 색상 */
            border-radius: 4px; /* 둥근 모서리 */
        }

        .search:focus {
            outline: none;
        }

        .search-box,
        .search-box * {
            box-sizing: border-box;
        }
        .search-box {
            background: rgba(255, 255, 255, 0.09);
            border-radius: 15px;
            border-style: solid;
            border-color: #339c9c;
            border-width: 2px;
            padding: 12px 56px 12px 40px;
            display: flex;
            flex-direction: row;
            gap: 12px;
            align-items: center;
            justify-content: flex-start;
            height: 65px;
            position: relative;
        }
        .search-for-courses {
            color: rgba(18, 90, 90, 0.2);
            text-align: left;
            font-family: "Inter-Bold", sans-serif;
            font-size: 26px;
            font-weight: 700;
            position: relative;
        }

    </style>
    <!--hmm-->
</head>
<body>
<table style="width: 100%; border-collapse: collapse;">
    <tr>
        <td style="padding: 18px;">
            <h1 style="display: inline; font-size: 60px; margin-left: 40px; color: #4caf50">이름</h1> <!-- 제목 부분 -->
            <span style="margin-left: 180px; font-size: 30px;" ><a href="/smallGroup" style=" color: black; text-decoration: none">소모임</a></span>
            <span style="margin-left: 30px; font-size: 30px;"><a href="/website" style=" color: black; text-decoration: none">웹사이트</a></span>
            <span style="margin-left: 30px; font-size: 30px;"><a href="/sell" style=" color: black; text-decoration: none">판매</a></span>
        </td>
        <td style="padding: 18px; text-align: right; ">
            <a href="/login" style="padding: 10px 20px; background-color: #4caf50; color: white; border-radius: 5px; text-decoration: none; ">로그인</a>
        </td>
    </tr>
</table>
<hr>

<br><br>
<!-- 검색창 -->
<div class="search-box" style="padding: 10px; text-align: center; justify-content: center">
    <br><br><br>
    <input class="search" type="text" placeholder="검색어를 입력하세요..." style="width: 90%; padding: 10px; font-size: 16px;">

</div>
