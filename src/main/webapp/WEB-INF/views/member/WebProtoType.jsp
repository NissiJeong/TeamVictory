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
    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
    	
    	<!--pure speech bubble로 검색-->
	<!-- https://codepen.io/mchernin34/pen/ojXvLq -->
	<!--http://nicolasgallagher.com/pure-css-speech-bubbles/demo/-->
	<div class="container" style="border-style: dashed;">
	
	<!-- 세팅 부분 init -->
	<input type="hidden" id="userId" value="${login.id}">  <!-- 유저아이디  -->
	<input type="hidden" id="room" value="${room}"> <!-- 현재 유저가 접속한 방이름 -->
	
	<!-- 방 이름 / 방 만들기 / 방 나가기  --> 
	<table style="width: 900px; background-image:url('image/chatBackGround.jpg');">
	
	<tr>
		<td align="center" style="width: 600px; color: white">
			<!-- 방이름 출력 -->
			<h2>방이름 :
			<c:if test="${room =='all'}"><b> 전체 채팅방 </b></c:if> <c:if test="${room !='all'}"><b> ${room} </b></c:if>
			</h2> 
		</td> 
		
		<td align="center" style="width: 300px">
			<!-- 방만들기 / 방나가기 버튼 -->
				
				<input type="button" class="ui button " value="방 만들기" id="createRoom">
				&nbsp;&nbsp;     
				<input type="button" class="ui button " value="전체 채팅방으로 이동" id="backBtn">
		</td> 
	</tr>
	</table>
	<!-- 채팅방 구현하기위한 테이블 -->
	<table align="center" style="height: 600px; width: 900px; margin: 0; padding: 0;" class="ui blue table"> 
	<!-- 왼쪽 채팅창 출력 -->
	<col width="200px"> <!-- 귓속말 영역 -->
	<col width="400px"> <!-- 메세지 입력 영역 -->
	<!-- 오른쪽 리스트 출력영역 -->
	<col width="300px"> <!-- 보내기 영역 -->
	
	<tr height="600px;">
	    <!-- 채팅내용 출력 --> 
		<td style="width: 550px" colspan="2"> 
		
			<div style="width: 100%; height: 550px; overflow-y:scroll; overflow-x:inherit;" class="ui message" id="output">
			</div>  
		</td > 
		<!-- 채팅방 목록 -->  
		<td style="width: 300px">
	   	<!-- 채팅방 -->
	   	<form action="MoveChatRoom.do" method="post" id="moveChatForm">
	   	<input type="hidden" name="roomName" value="">
	   	
	   	<div class="ui message blue" style="width: 300px; height: 100px; overflow-y:scroll; overflow-x:inherit;" id="room">
			<!-- 전체 채팅방 -->
			<div class="ui celled list" id="getRoomList">
				<div class="item">
					<div class="content">
					<b title="전체채팅방입니다">전체 채팅방</b>  
					</div>
				</div> 
			</div>
		</div> 				   			
		</form> 	 
			<input type="text" class="ui input blue"  style="width: 200px; height: 32px" placeholder="방 제목" id="searchRoomText">   
			&nbsp;&nbsp;&nbsp;
			<input type="button" value="검색" class="ui primary button" style="width: 80px; height: 30px" id="searchRoomBtn">		
		  
	   	<!-- 방만들기 form이용 --> 
	    
		<form action="createChatRoom.do" method="post" id="createForm">
	   		<!-- hidden 정보  -->
	   		<input type="hidden" id="chkRoomName" value=""> <!-- 방 제목 중복 확인 여부 -->
	   		
	   	<!-- 방 만들기 버튼 클릭 시, 보여짐 -->
	   	<div style="width:300px; height: 500px; display: none;" class="ui message" id="showCreateRoom"> 
			
			<!-- 방만들기 테이블 -->
	    	<table style="width: 100%;height: 100%">
	      	<col width="80px">
	      	<!-- 방제목 -->
	      	<tr style="padding: 1px; margin: 1px">  
	         	<th>방제목</th>
	         	<td> 
	         		<input type="text" name="name" placeholder="방이름" size="8" class="ui message"
	         		style="font-weight: bold; width: 100%; height: 15px"> 
	         	</td>
	      	</tr>
	      	
	      	<!-- 비밀번호 -->
	      	<tr>
	         	<th>비밀번호</th>
	         	<td>
	         		<input type="text" name="pwd" placeholder="방 비밀번호" size="8" class="ui message"
	         		style=" font-weight: bold; width: 100%; height: 15px" title="작성하지않을시 공개방으로 생성됩니다">
	         	</td>
	      	</tr>
	      	
	      	<!-- 참여 인원 -->
	      	<tr>
	         	<th>참여인원</th>
	         	<td>
	         		<a href="#none"><img src="image/paging/arrow_back.gif" onclick="count_back()" width="13px" title="1명 감소"></a>
	         		
	           		<input type="text" name="totalcount" value="4" size="2" readonly="readonly" 
	           		id="count" class="ui message" style="height: 15px; font-weight: bold;">
	           		 
	           		<a href="#none"><img src="image/paging/arrow_next.gif" onclick="count_next()" width="13px" title="1명 증가"></a>
	           
	         	</td>
	      	</tr>
	      	<!-- 내용 입력 -->
	      	<tr>
	         	<th>내용</th>
	         	<td>
	         		<input type="text" name="content" placeholder="내용" class="ui message"
	         		style="font-weight: bold; width: 100%; height: 15px"> 
	         	</td>	
	      	</tr>
	      	<!-- 버튼 처리 -->
	      	<tr>
	         	<td colspan="2">
	            	<input type="button" id="submitBtn" value="방만들기" class="ui primary button">         
	            	<input type="button" id="backBtn" value="돌아가기" class="ui button">
	         	</td>
	      	</tr>
	      	</table>
	    	  
	   	</div>
	   	</form>
	   
	   	<!-- 채팅 참여자 출력 -->
	   	<div style="width: 100%; height: 400px; overflow-y:scroll;" class="ui message" id="listPeople">
	   	</div>
		</td>
	</tr>
	<!-- 입력 창 -->
	<tr height="100px;">
		<!-- 귓속말할 대상의 아이디 입력 -->
	   	<td>
	   		<input type="text" id="wisper"   value="" style="width: 100%; height: 100%; font-weight: bold;" 
	   		class="ui message" name="who" placeholder="귓속말">
	   	</td>
	   	
	   	<!-- 보낼 메세지 입력 -->
	   	<td>
	   		<input type="text" id="textID" size="50"  value="" style="width: 100%; height: 100%; font-weight: bold;" 
	   		class="ui message blue" name="chatInput" placeholder="내용 입력">
	   	</td>
	   	
	   	<!-- 보내기 버튼 -->
	   	<td>
	   		<input type="button" value="보내기"  
	   		id="buttonMessage" style="width:100%; height: 100%" class="ui primary button" >
	   	</td>
	</tr>
	</table>
		</div>
	    	
	    </div>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    
    <script type="text/javascript">
var sock = null;
var id = '${login.id}';
$(document).ready(function() {
   $("#textID").focus(); // 처음 접속시, 메세지 입력창에 focus 시킴
   
   
   //서버로 접속할때는 localhost로 설정해줘야됨 (관리자)
   // 본인의 서버로 접속할경우, admin으로 들어가야만 채팅이 가능하다.
  if(id=='admin'){
      ws = new WebSocket("ws://localhost:8080<c:url value='/Team/Matching/chat-ws'/>");
   }
   
   // 그 외 회원은 admin을 제외한 다른 아이디로 접속 시, 채팅참여가 가능하다.
   else{
      ws = new WebSocket("ws://localhost:8080<c:url value='/Team/Matching/chat-ws'/>");   
   } 
   
   
   //서버로 메세지 보낼때
   ws.onopen = function() {
	//처음 접속 시에만 채팅방에 추가함(현재 방정보도 같이 출력)	   
      	$("#output").append("<b>채팅방에 참여했습니다.</b> : "+$("#room").val()+"<br>");
      	
      	//보내기 버튼 눌렀을때
      	$("#buttonMessage").click(function() {
         	var msg = $('input[name=chatInput]').val().trim("!%/"); //메시지
         
         	var wisper = $("#wisper").val().trim("!%/"); //귓속말 대상자
         
         	var room = $("#room").val().trim("!%/"); //방이름(전체단톡방이면 all)
         
         	//전체에게 보낼때
         	if(wisper=="" && msg !=""){
         		//소켓으로 메세지 전달
            	ws.send(msg+"!%/"+""+"!%/"+room);
            	$("#output").append("<i class='user icon'></i>"+"<b style='color:blue'>[${login.id}]</b> : "+msg+"<br>");
            
            	$("#output").scrollTop(99999999); //글 입력 시 무조건 하단으로 보냄
            	$("#textID").val(""); //입력창 내용지우기
            	$("#textID").focus(); //입력창 포커스 획득
         	}
         	//귓속말
         	else if(wisper !="" && msg !=""){
         		//본인에게 보낼경우
            	if($("#userId").val()==wisper){
               	alert("본인에게는 보낼 수 없습니다.");
               	$("#wisper").focus();
            	}
         		//본인이 아닐 경우에만 메세지 전달
            	else{
            		ws.send(msg+"!%/"+wisper+"!%/"+room); //현재 메세지 + 귓속말대상 + 방정보	
            		
            		$("#output").append("<i class='user icon'></i>"
            	    	+"<b style='color:blue'>[${login.id}]</b> : "
       	            	+"[<b>"+wisper+"</b>]님에게귓속말 : "+msg+"<br>");
       	            	$("#output").scrollTop(99999999);
       	            	$("#textID").val("");
       	            	$("#textID").focus();
            	}
            
            
         	}
         
      	});
      	//엔터키 입력처리
      	$("#textID").keypress(function(event) {
         	if(event.which == "13"){
            	event.preventDefault();
            	
            	var msg = $('input[name=chatInput]').val().trim("!%/"); //메시지
                
             	var wisper = $("#wisper").val().trim("!%/"); //귓속말 대상자
             
             	var room = $("#room").val().trim("!%/"); //방이름(전체단톡방이면 all)
             
             	
             	//전체에게 보낼때
             	if(wisper=="" && msg !=""){
             		//소켓으로 메세지 전달
             		
                	ws.send(msg+"!%/"+""+"!%/"+room);
                	$("#output").append("<i class='user icon'></i>"+"<b style='color:blue'>[${login.id}]</b> : "+msg+"<br>");
                
                	$("#output").scrollTop(99999999); //글 입력 시 무조건 하단으로 보냄
                	$("#textID").val(""); //입력창 내용지우기
                	$("#textID").focus(); //입력창 포커스 획득
             	}
             	//귓속말
             	else if(wisper !="" && msg !=""){
             		//본인에게 보낼경우
                	if($("#userId").val()==wisper){
                   	alert("본인에게는 보낼 수 없습니다.");
                   	$("#wisper").focus();
                	}
             		//본인이 아닐 경우에만 메세지 전달
                	else{
                		ws.send(msg+"!%/"+wisper+"!%/"+room); //현재 메세지 + 귓속말대상 + 방정보	
                		
                		$("#output").append("<i class='user icon'></i>"
                	    	+"<b style='color:blue'>[${login.id}]</b> : "
           	            	+"[<b style='color:green'>"+wisper+"</b>]님에게귓속말 : "+msg+"<br>");
           	            	$("#output").scrollTop(99999999);
           	            	$("#textID").val("");
           	            	$("#textID").focus();
                	}
                
                
             	}
         	}
      	}); 
      	
      	//방 검색
      	$("#searchRoomBtn").click(function() {
			
      		//검색어
      		var text = $("#searchRoomText").val().trim("!%/&");
      		ws.send("!%/&"+text);
      		
      		$("#searchRoomText").val("");
      		
      		
		});
   	};
	//서버로 부터 받은 메세지 보내주기
   	ws.onmessage = function(message) {
		
    	//메세지 
      	var jsonData = JSON.parse(message.data);
    	
      	if(jsonData.message !=null){
        	$("#output").append(jsonData.message+"<br>");
        	$("#output").scrollTop(99999999);
      	}
      	
      	//접속자리스트
      	var jsonData2 = JSON.parse(message.data);
      	if(jsonData2.list !=null){
         	$("#listPeople").html(jsonData2.list);
      	}
      	
      	//방 정보
      	var jsonData3 = JSON.parse(message.data);
      	if(jsonData3.room !=null){
      		//alert(jsonData3.room);
			var roomSplit = jsonData3.room.split(',');
      		
			var str = "<div class='item'><div class='content'>"+
			"<b title='전체채팅방입니다' class= 'chatRoom' "+
			"onclick=\"moveRoom('all',0,10000,'null')\">"+
			"전체 채팅방</b> (총 "+roomSplit[0]+"명 참여)</div></div>";
			
			for( i=1; i<roomSplit.length; i++){
				var spl = roomSplit[i].split("/");
				
				if(spl[0] =='방이 존재하지 않습니다.'){
					str += "<div class='item'><div class='content'><b title='방이존재하지않습니다'>"+spl[0]+"</b></div></div>";
				}
				else{
					//방이름 : spl[0] , 남은인원수 : spl[1] , 전체인원수:spl[2], 방내용:spl[3]
					str += "<div class='item'><div class='content'><b title='"+spl[3]+"' class='chatRoom' "+
					"onclick=\"moveRoom('"+spl[0]+"','"+spl[1]+"','"+spl[2]+"','"+spl[4]+"')\"> "
					+spl[0]+"</b> ("+spl[1]+"/"+spl[2]+")</div></div>";
				}
				
			}
			
			$("#getRoomList").html(str);
			
			//moveRoom(room,remaincount,totalcount,pwd)
      	}
      
	};   
   
   	//닫힐때
   	ws.onclose = function(event) {};
});
</script>
<!-- 방이동 처리함수 -->
<script type="text/javascript">

function moveRoom(room,remaincount,totalcount,pwd) {
   
	var currentRoom = $("#room").val(); //현재자신이있는방
	if(room == currentRoom){
	   //들어가고자하는방 = 현재자신의방
	   alert("현재 선택하신 방에 있습니다.");
	}
	//방 이동 처리
	else{
		if(remaincount<totalcount){
		   if(pwd !='null'){
		      var chkPwd = prompt("비밀번호를 입력하세요.");
		      if(chkPwd ==pwd){
		         $("[name='roomName']").val(room);               
		         $("#moveChatForm").attr("target","_self").submit();   
		      }
		      else{
		         alert("비밀번호가 틀렸습니다.");
		      }
		   }
		   else{
		      //비밀번호가 없다면 바로 이동하도록한다.
		      $("[name='roomName']").val(room);               
		      $("#moveChatForm").attr("target","_self").submit();   
		   }
		      
		}
		else{
		   alert("인원 수가 가득찼습니다.");
		}
	   
	}
};
</script>
<script>
//방만들기
$("#createRoom").click(function() {
   $("#listPeople").slideToggle(300);
   $("#showCreateRoom").slideToggle(300);
   
});

//방나가기
$("#backBtn").click(function() {
	location.href = "chat.do";
});
</script>


<!-- 방제목 중복확인 -->
<script type="text/javascript">
$("[name='name']").blur(function() {
var name = $("[name='name']").val();
   if(name !=""){
      $.ajax({
         type:"post",
         url:"./checkRoom.do",
         async:true,
         data:"name="+name,
         success:function(msg){
            if(msg=="1"){
               $("#chkRoomName").val(name);
            }
            else if(msg=="0"){
               alert("이미 존재하는 방이름 입니다.");
               $("[name='name']").val("");
               $("[name='name']").focus();
               
            }
         }
      });

   }
});
</script>
<!-- 인원수 증가, 감소 버튼 클릭시, 실행되는 스크립트 -->
<script type="text/javascript">
function count_back() { 
    var count = $("#count").val();
    count = (Number(count)-1);
    if(count>=2){
       $("#count").val(count);
    }
};
function count_next() {
    var count = $("#count").val();
    count = (Number(count)+1);
    if($("#count").val()<30){
       $("#count").val(count);
    }
};
</script>
<!-- 버튼처리 -->
<script type="text/javascript">
$("#submitBtn").click(function() {
   if($("[name='name']").val().length<1){
      alert("방제목을 입력하세요");
      $("[name='name']").focus();
   }
   else if($("[name='name']").val()=="all"){
      alert("해당 방제목은 사용할 수 없습니다.");
   }
   else if($("#chkRoomName").val() ==""){
      alert("이미 방이 존재합니다.");
      $("[name='name']").focus();
   }
   else if($("[name='content']").val().length<1){
      alert("방을 설명하기위한 내용을 입력하세요");
      $("[name='content']").focus();
   }
   else{
      //form처리
      $("#createForm").attr("target","_self").submit();
   }
});

$("#backBtn").click(function() {
   $("form").each(function() {
      this.reset();
   });
   $("#listPeople").slideToggle(300);
   $("#showCreateRoom").slideToggle(300);
});
</script>

<!-- 접속자 명단에서 아이디 클릭 시 귓속말에 바로 세팅 -->
<script type="text/javascript">
function insertWisper(id) {
	if($("#userId").val() == id){
		alert("본인에게는 귓속말을 할 수 없습니다.");
	}
	else{
		$("#wisper").val(id);	
	}
	
	
}

</script>
<script type="text/javascript">
$("#wisper").click(function() {
	$("#wisper").val("");
});
</script>
    
    
  </body>
</html>