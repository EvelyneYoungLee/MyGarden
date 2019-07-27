<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<title>Chat</title>
<style>
	#chatBorder{
		border : 0.5px solid #cacbcc;
		box-sizing : boder-box;
		width : 350px;
		height : 400px;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		background-color : #e8e4f0;
	}
	#chatContents{
		overflow-y : auto;
		height : 300px;
	}
	.msg{
		text-align : center;
		color : white;
		background-color : #7657b5;
		padding-top : 10px;
		padding-bottom : 10px;
	}
	#firstmsg{
		font-size : 15px;
	}
	#secondmsg{
		font-size : 12px;
	}
	#message{
		width : 248px;
		height : 95px;
		border-bottom-left-radius: 10px;
		line-height : 95px;
		border : 0.5px solid #cacbcc;
	}
	#send{
		width : 97px;
		height : 95px;
		background-color: #4ab336;
		color : white;
		border : 0px;
		border-radius : 5px;
	}
	.mine{
		margin-bottom : 0;
		text-align : right;
	}
</style>
<script>
// 	$(function(){
// 		$.ajax({
// 			url : "selectChat",
// 			type : "post",
// 			data : ${loginId}
// 		}).done(function(resp){
// 			for(tmp : resp){
// 				console.log(tmp);
// 			}
// 		})
// 	}) 
</script>
</head>
<body>
	<div id="chatBorder">
		<div id="firstmsg" class="msg">안녕하세요! 나의 정원 입니다.</div>
		<div id="secondmsg" class="msg">자유롭게 질문해 주시면 몇분 내에 답변해드립니다.<br>(상담 시간은 월-금 10:00 ~ 18:00)</div> 
		<div id="chatContents"></div>
	</div>
	<input type="text" id="message" placeholder="메세지 전송">
	<input type="button" id="send" value="Send">
	
	<script>
		var socket = new WebSocket("ws://192.168.0.14/chatcontrol"); // 이 코드를 통해서 웹소켓이 열림
		
		socket.onmessage = function(msg){ // 콜백함수
			var line = $("<div class='messages'></div>");
			line.append("<div class='answer'>" + msg.data + "</div>");
			$("#chatContents").append(line);
			$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
		} // 서버로부터 메세지가 도착한 경우
		
		$("#send").on("click",function(){
			var msg = $("#message").val();
			$("#chatContents").append("<p class='mine'>" + msg + "</p>");
			$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
			$("#message").val("");
			$("#message").focus();
			socket.send("${loginId} : " + msg);
		}) // 서버로 메세지를 보내는 경우
	
		$("#message").keyup(function(key){
			if(key.keyCode == 13){
				$("#send").click();
			}
		})
	</script>
</body>
</html>