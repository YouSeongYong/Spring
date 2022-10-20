<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th></th>
			<th>아이디</th>
			<th>닉네임</th>
			<th></th>
		</tr>
		<c:forEach var="member" items="${memberList}" varStatus="status">
			<tr>
			<td>${status.count}</td>
			<td>${member.id}</td>
			<td>${member.nick}</td>
			<td><a href="/myapp/member/delete?id=${member.id}">삭제</a></td>
		</tr>
		</c:forEach>
		<!-- 쿼리스트링을 사용해서 삭제햇음 -->
	</table>
</body>
</html>