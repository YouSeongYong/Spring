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
            <img alt="???????????????" src="./asset/img/pg1.gif">
			<p>???????????????</p>
            <div id="map-wrap">
                <div id="map" style="width:100%;height:350px;"></div>
            </div>
			<ul class="list-group list-group-flush">
                <li>??????(<span class="com-cnt">${comNum}</span>)</li>
				<li class="list-group-item">
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					<button type="button" class="btn btn-dark mt-3"onclick="addReply()">post reply</button>
				</li>
			</ul>
			<ul class="list-group list-group-flush" id="reply">
				
				<c:forEach items="${comList}" var="com">
				<li class="list-group-item"><span>${com.content}/${com.comwriter }</span><button class="deleteBtn">??????</button></li>
				</c:forEach>
				
			</ul>
		</div>
	</div>
	
	<script>
	//?????? ???????????? ?????? ????????? ??? ???????????? ????????? ????????? ????????? ?????? ?????? ????????????
    let likeSp = document.querySelector(".dislike+span");
    document.getElementsByClassName("dislike")[0].style.display = "none";
    //??????????????? ????????? ???
    document.querySelector(".like").addEventListener("click",function(){
        //??????????????? ????????????
        document.querySelector(".like").style.display = "none";
        //??????????????? ?????????
        document.querySelector(".dislike").style.display = "inline";
       
        
        const URL= "http://localhost:8089/boot/board/like/plus/${board.boardnum}";
		setLikeNum(URL);    
    })
    //???????????????
    document.querySelector(".dislike").addEventListener("click",function(){
        //??????????????? ????????????
        document.querySelector(".dislike").style.display = "none";
        //??????????????? ?????????
        document.querySelector(".like").style.display = "inline";
        
        const URL= "http://localhost:8089/boot/board/like/minus/${board.boardnum}";
        
        setLikeNum(URL);
    })
    
    //????????? ?????? : async/await ?????? ??????(ES8) 
        //async : ????????? ?????? ?????? > ????????? : promise ????????? ??????
        //promise : ????????? ?????? ?????? ?????? (????????? ?????? ??????, ?????????)
        async function setLikeNum(url) {
            //await : async ?????? ??????, promise(????????? ??????) ??????????????? ????????????!
            //fetch API : ?????? ??????????????? ?????? ?????? ???????????? ??????
            //then() : ????????? ????????? ?????? ?????? ????????? ??? ??????
            //????????? then() : promise??? ?????? (data -response data)
            //????????? then() : promise ????????? promiseResult (movie - ???????????????)
            await fetch(url).then((data) => data.json()).then((res) => {
                console.log(res);
                
                likeSp.innerText=res;
            })
        }
        //?????? ??????
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
        		comwriter : '?????????'
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
            	   let comLi=document.createElement("li");//?????? ????????? ???????????? li?????? ??????<li></li>
                   
                   // li????????? ????????? ?????? ??????!
                   comLi.className="list-group-item";

                   let comSp=document.createElement("span");//li?????? ?????? ???????????? ?????? span??????
                   comSp.appendChild(document.createTextNode(com+"/?????????"));//span?????? ?????? ????????? ??????, textarea?????? ????????? value??? ?????? ????????? ??? ??????
                   comLi.appendChild(comSp);//li????????? span?????? ?????? ????????? ???????????? ???

                   let comBtn=document.createElement("button");//li?????? ?????? ???????????? ?????? button?????? ??????
                   comBtn.className="deleteBtn";
                   comBtn.appendChild(document.createTextNode("??????"));//?????? ?????? ??????
                   comLi.appendChild(comBtn);//li????????? button?????? ?????? ????????? ??????
                   
                   //append: ?????? ??????, prepend: ?????? ??????
                   document.getElementById("reply").prepend(comLi);//?????? ????????? ??? : getElementById("reply"), ????????? ??????: prepend(comLi)
                   
                   //?????? ??? ????????? -> ?????? ??? ??? ?????? ?????? ?????? ?????? ???????????? ???
                   com="";

                       
               }
            })
        }
	</script>
</body>
</html>