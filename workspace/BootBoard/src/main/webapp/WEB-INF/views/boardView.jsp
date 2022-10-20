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
    </style>
</head>
<body>
    <div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 50px">
		<p>${board.title} / ${board.boardwriter}
            <button class="like"><span class="material-symbols-outlined">heart_plus</span></button>
            <button class="dislike"><span class="material-symbols-outlined">heart_minus</span></button>
            <span id="likenum">${board.likenum}</span>
        </p>
	</div>
	<div class="card mb-2">
		<div class="card-body">
            <img alt="게시물사진" src="./asset/img/pg1.gif">
			<p>게시물내용</p>
            <div id="map-wrap">
                <div id="map" style="width:100%;height:350px;"></div>
            </div>
			<ul class="list-group list-group-flush">
                <li>댓글(<span class="com-cnt">${comNum}</span>)</li>
				<li class="list-group-item">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					<button type="button" class="btn btn-dark mt-3"onclick="addReply()">post reply</button>
				</li>
			</ul>
			<ul class="list-group list-group-flush" id="reply">
				
				<c:forEach items="${comList}" var="com">
				<li class="list-group-item"><span>${com.content}/${com.comwriter }</span><button class="deleteBtn">삭제</button></li>
				</c:forEach>
				
			</ul>
		</div>
	</div>
	
	<script>
	//현재 페이지가 로드 되었을 때 게시물의 좋아요 개수가 적혀져 있는 요소 불러오기
    let likeSp = document.querySelector(".dislike+span");
    document.getElementsByClassName("dislike")[0].style.display = "none";
    //좋아요버튼 눌렀을 때
    document.querySelector(".like").addEventListener("click",function(){
        //좋아요버튼 안보이게
        document.querySelector(".like").style.display = "none";
        //싫어요버튼 보이게
        document.querySelector(".dislike").style.display = "inline";
       
        
        const URL= "http://localhost:8089/boot/board/like/plus/${board.boardnum}";
		setLikeNum(URL);    
    })
    //싫어요기능
    document.querySelector(".dislike").addEventListener("click",function(){
        //싫어요버튼 안보이게
        document.querySelector(".dislike").style.display = "none";
        //좋아요버튼 보이게
        document.querySelector(".like").style.display = "inline";
        
        const URL= "http://localhost:8089/boot/board/like/minus/${board.boardnum}";
        
        setLikeNum(URL);
    })
    
    //비동기 통신 : async/await 문법 사용(ES8) 
        //async : 비동기 함수 정의 > 결과값 : promise 형태로 반환
        //promise : 비동기 작업 결과 단위 (비동기 처리 상태, 데이터)
        async function setLikeNum(url) {
            //await : async 같이 쓰임, promise(비동기 처리) 끝날때까지 기다려라!
            //fetch API : 외부 라이브러리 추가 없이 브라우저 내장
            //then() : 비동기 처리가 끝난 다음 처리할 일 정의
            //첫번째 then() : promise를 반환 (data -response data)
            //두번째 then() : promise 내부에 promiseResult (movie - 영화데이터)
            await fetch(url).then((data) => data.json()).then((res) => {
                console.log(res);
                
                likeSp.innerText=res;
            })
        }
        //댓글 작성
        function addReply(){
            let com=document.getElementsByTagName("textarea")[0];
                   
            const url= "http://localhost:8089/boot/com/add";
            setCom(url,com.value);
        }
        async function setCom(url,com){
        	console.log(com);
        	const data={
        		boardnum : ${board.boardnum},
        		content	: com,
        		comwriter : '작성자'
        	}
        	
        	const data1 = {
        			method : 'POST',
        			headers : {
        				'Content-Type' : 'application/json'
        			},
        			body : JSON.stringify(data)
        	}
        	
        	await fetch(url,data1).then((data) => data.json()).then((res) => {
                console.log(res);
                
               if(res.result=="success"){
            	   let comLi=document.createElement("li");//댓글 형식을 구성하는 li태그 생성<li></li>
                   
                   // li태그에 클래스 이름 넣기!
                   comLi.className="list-group-item";

                   let comSp=document.createElement("span");//li태그 내에 추가해야 하는 span태그
                   comSp.appendChild(document.createTextNode(com+"/작성자"));//span태그 안에 텍스트 추가, textarea이기 때문에 value로 값을 가져올 수 있음
                   comLi.appendChild(comSp);//li태그에 span태그 자식 요소로 추가하는 거

                   let comBtn=document.createElement("button");//li태그 내에 추가해야 하는 button태그 생성
                   comBtn.className="deleteBtn";
                   comBtn.appendChild(document.createTextNode("삭제"));//삭제 하는 버튼
                   comLi.appendChild(comBtn);//li태그에 button태그 자식 요소로 추가
                   
                   //append: 뒤에 추가, prepend: 앞에 추가
                   document.getElementById("reply").prepend(comLi);//댓글 추가할 곳 : getElementById("reply"), 추가할 내용: prepend(comLi)
                   
                   //댓글 창 비우기 -> 댓글 쓴 후 댓글 쓰는 창에 내용 비운다는 뜻
                   com="";

                       
               }
            })
        }
	</script>
</body>
</html>