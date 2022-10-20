<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/assets/css/main.css'/>" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								<td></td>
								<td>Email</td>
								<td>HP</td>
								<td>Addr</td>
								<td></td>						
							</tr>
							<c:forEach var="member" items="${memberList}" varStatus="status">
							<tr>
							<td>${status.count}</td>
							<td>${member.email }</td>
							<td>${member.tel }</td>
							<td>${member.address }</td>
							<td><a href="/message/member/deleteMember/${member.email }">삭제</a></td>
							<!-- url 데이터를 포함하여 요청하는 방법 -->
							<!-- 1.queryString : ? key=value&key-value -->
							<!-- 2.url파라미터포함 : /{파라미터} > rest api 사용하는 방식  -->
							</tr>
							</c:forEach>
						</table>
					</nav>			
			</div>
		<!-- Scripts -->
			<script src="<c:url value='/resources/assets/js/jquery.min.js'/>"></script>
			<script src="<c:url value='/resources/assets/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='/resources/assets/js/jquery.scrollex.min.js'/>"></script>
			<script src="<c:url value='/resources/assets/js/skel.min.js'/>"></script>
			<script src="<c:url value='/resources/assets/js/util.js'/>"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value='/resources/assets/js/main.js'/>"></script>
	</body>
</html>

