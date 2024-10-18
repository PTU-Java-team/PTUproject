<%--
  Created by IntelliJ IDEA.
  User: Anemo
  Date: 24. 10. 17.
  Time: 오후 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>list</title>
</head>
<body>
  <table>
    <tr>
      <th>id</th>
      <th>email</th>
      <th>password</th>
      <th>name</th>
      <th>age</th>
      <th>mobile</th>
      <th>조회</th>
      <th>삭제</th>
    </tr>

    <c:forEach items="${memberList}" var="member">  <!--memberList는 컨트롤러에서 실어온 데이터 즉 반복 대상이고 , member는 반복 변수임 -->

      <tr>
        <td>${member.id}</td>
        <td>

          <a href="/member?id=${member.id}">${member.memberEmail}</a>   <!-- . 뒤에 있는 것은 dto에 있는 필드 이름과 일치하면 된다.-->
          <!--이거 주소 체계가 구동했을 때 신기하다....-->
        </td>

        <td>${member.memberPassword}</td>
        <td>${member.memberName}</td>
        <td>${member.memberAge}</td>
        <td>${member.memberMobile}</td>

        <td>
          <a href="/member?id=${member.id}">조회</a>
        </td>

        <td>
        <button onclick="deleteMember('${member.id}')">삭제</button>
        </td>

      </tr>

    </c:forEach>

  </table>
</body>
<script>
  const deleteMember = (id) => {
    console.log(id);
    location.href = "/member/delete?id="+id;
  }
</script>
</html>
