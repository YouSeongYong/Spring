<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
        rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <title>Document</title>
    <style>
        body {
            background-image: url('asset/img/bg.jpg');
            padding-left: 200px;
            padding-right: 200px;
            font-family: 'Do Hyeon', sans-serif;
        }
        .card-body {
            background-color: whitesmoke;
        }
        p {
            padding-top: 5px;
            padding-left: 20px;
            font-size: 30px;
        }
        img, #map-wrap, .list-group>li{
            padding-left: 20px;
            padding-top: 5px;
        }
        p>button{
            border: 0px;
        }
        span+button{
            margin-left: 10px;
        }
        table{
        	margin : auto;
        	background-color : whitesmoke;
        	margin-top : 50px;
        	width : 80%;
        	font-size: 3em;
        }
        tr{
        	text-align : center;
        }
    </style>
</head>
<body>
    <table>
    	<tr>
    		<th>번호</th>
    		<th>제목</th>
    		<th>작성자</th>
    	</tr>
    	<c:forEach var="board" items="${boardList}" varStatus="status">
    	
			<tr>
				<td>${status.count}</td>
				<td><a href="/boot/board/view/${board.boardnum}">${board.title}</a></td>
				<td>${board.boardwriter }</td>
			</tr>
			</c:forEach>
    </table>
</body>
</html>