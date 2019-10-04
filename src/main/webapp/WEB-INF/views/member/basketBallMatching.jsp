<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>
	
    <!-- 부트스트랩 -->
    <!-- link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"-->
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
    	<div class="page-header">
    		<h1>웹소켓<small>웹소켓을 이용한 채팅입니다</small></h1>
    	</div>
    	<!--pure speech bubble로 검색-->
	<!-- https://codepen.io/mchernin34/pen/ojXvLq -->
	<!--http://nicolasgallagher.com/pure-css-speech-bubbles/demo/-->
	<div class="container">

		<fieldset>
			<legend>웹소켓 클라이언트</legend>
			<form>
				<div class="form-group">
					<label for="nickname" class="col-sm-1">닉네임</label>
					<div class="col-sm-4">
						<input class="form-control " type="text" id="nickname">
					</div>
				</div>
				<input class="btn btn-info" type="button" id="enterBtn" value="입장">
				<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장">


				<div class="form-group">
					<h4>대화내용</h4>
					<div id="chatArea">
						<div id="chatMessage"
							style="height: 300px; border: 1px gray solid; overflow: auto"></div>
						</div>
					</div>

				<div class="form-group">
					<label for="message" class="col-sm-1">메시지</label>
					<div class="col-sm-8">
						<input class="form-control" type="text" id="message" />
					</div>
				</div>
				<input class="btn btn-success" type="button" id="sendBtn" value="전송">
			</form>

		</fieldset>

	</div>
    	
    </div>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <!-- script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script-->
    
    <script>
  		//웹소켓 객체 저장용
  		var wsocket;
  		//닉 네임 저장용
  		var nickname;
  		
  		$(function(){
  			//입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
  			$('#enterBtn').one('click',function(){
  				// 웹 소켓 객체로 서버에 연결하기
  				
  				console.log("ws://localhost:9090<c:url value='/chat-ws.do'/>");
  				wsocket = new WebSocket("ws://localhost:8080<c:url value='/chat-ws.do'/>");
  				wsocket.onopen = open;
  				wsocket.onclose=function(){appendMessage('연결이 끊어졌어요')};
  				wsocket.addEventListener('message',message);
  				//사용자가 입력한 닉네임 저장
  				nickname= $('#nickname').val();
  				
  			});
  			
  			//퇴장버튼 클릭시]
  			$('#exitBtn').one('click',function(){
  				wsocket.send('msg:'+nickname+'가(이) 퇴장했어요');
  				wsocket.close();
  			});
  			//전송버튼 클릭시]
  			$('#sendBtn').click(function(){
  				send_message();
  			});
  			//메시지 입력후 전송 버튼 클릭이 아닌 엔터키처리
  			$('#message').on('keypress',function(e){
  				
  				console.log('e.keyCode:%s,e.which:%s',e.keyCode,e.which);
  				var keyValue = e.keyCode ? e.keyCode:e.which;
  				if(keyValue == 13){//엔터 입력
  					send_message();
  				}
  				e.stopPropagation();
  			});
  			
  		});
    	
  		//함수 정의]
  		//서버에 연결되었을때 호출되는 함수
  		var open = function(){
  			//서버로 연결한 사람의 정보(닉네임) 전송
  			//msg:kim가(이) 입장했어요
  			wsocket.send('msg:'+nickname+'가(이) 입장했어요');
  			appendMessage('연결되었습니다');
  		};
  		//서버에서 메시지를 받을때마다 호출되는 함수
    	var message= function(e){
    		//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
    		var receiveData = e.data;
    		if(receiveData.substring(0,4) =='msg:')
    			appendMessage(receiveData.substring(4));
  			
  		};
  		//메시지를 DIV태그에 뿌려주기 위한 함수]
  		var appendMessage=function(msg){
  			//메시지출력
  			$('#chatMessage').append(msg+"<br/>");
  		};
  		//서버로 메시지 전송하는 함수]
  		function send_message(){
  			//서버로 메시지 전송
  			wsocket.send('msg:'+nickname+':'+$('#message').val());//msg:KIM:안녕
  			//DIV(대화영역)에 메시지 출력
  			appendMessage($('#message').val());
  			//기존 메시지 클리어
  			$('#message').val('');
  			//포커스 주기
  			$('#message').focus();
  		}
    </script>
    
    
  </body>
</html>