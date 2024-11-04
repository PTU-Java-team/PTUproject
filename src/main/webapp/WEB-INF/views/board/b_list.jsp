<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Board List</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Date</th>
        <th>Hits</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="/b_detail/?id=${board.id}">${board.boardTitle}</a>
            </td>
            <td>${board.boardWriter}</td>
            <td>${board.boardCreatedTime}</td>
            <td>${board.boardHits}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
