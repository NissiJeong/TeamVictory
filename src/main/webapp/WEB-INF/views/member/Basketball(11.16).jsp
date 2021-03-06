<%@ page language="java" contentType="text/html; charset=UTF-8" session="false"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<script>
       
        var wsocket;
        var position = "Select your Position"
        var center = "Center"
        var forwar = "Forward"
        var Guard = "Guard"
        var selected;
        var target;
        var roomtitle = $("#roomTitle").val();
        var possible = "possible";
        var room;
        var auth;
        $(function(){///
        	var auth = $("#auth").val();
        	console.log(auth) 
        	if(auth == 'ADMIN'){
        		wsocket = new WebSocket("ws://192.168.200.177:8080<c:url value='/chat-ws.do'/>");
        		//console.log('ADMIN으로 접속')
        	}
        	else{
            	wsocket = new WebSocket("ws://192.168.200.177:8080<c:url value='/chat-ws.do'/>");
            	console.log(auth,'로 접속')
        	}
            wsocket.onopen = function(){
        		 console.log('소켓열림')
            }
            wsocket.onclose=function(){appendMessage("연결이 끊어졌어요.")};
            wsocket.onmessage = function(msgg){
            	//서버에서 받을때 분기해야돼
        		 console.log('서버에서 데이터를 받을때마다 : ',msgg.data)
        		 var chat = msgg.data;
        		 if(chat.substring(0,4) === 'msg:'){//채팅내용을 서버에서 받을 때.
        			 console.log('채팅(msg:)로 분기 했을 때',chat)
        			 var msg = chat.substring(4)
        			 $('.comment-area').append("<div class='from-them'>"+msg+"</div></br>").scrollTop('9999999');
        			 return;
        		 }
        		 if(chat.substring(0,4) === 'user'){//방클릭시 유저목록 서버에서 받을 때
        			 //console.log('유저목록(user)으로 분기 했을 때',chat,chat)
        			 chat = JSON.parse('"user"',msgg.data)
        			 	var user2 = msgg.data.substring(4);
        		 		//console.log('user없는거 : ',user2)
        		 		var user3 = JSON.parse(user2)
        		 		$('#connectionList').text('');
        		 		$.each(user3, function(index, element){
        		 			user = element['id']
         					$("#connectionList").append("<div class='discussion'>"
         							+"<i class = 'flaticon-user'>" 
         							+"</i>"
         							+"<div class='desc-contact'>"
         							+"<p class='name'>"+user+"</p>"
         							+"</div>"
         							+"<div class='timer'>접속시간</div>"
         							+"<button class='btn btn-info' style='margin-left: 30%' id='"+index+"' onclick='readyButton"+index+"()'>"
         							+"Ready</button>"
         							+"</div>")
        		 		})
        			 return;
        		 }
        		 if(chat.substring(0,4) === "list"){//방 생성시 방목록 서버에서 받을 때.
        			 //console.log('From handleTextMessage to clients : roomList')
        			 $("#chattingRoom").text('')
        			 chat = JSON.parse('"list"',msgg.data) //서버에서 넘어온 문자열(list)+json객체
        			 	var chat2 = msgg.data.substring(4); //list 잘라내기
        		 		//console.log('list없는거 : ',chat2) //여기까지 됨
        		 		var chat3 = JSON.parse(chat2)//다시 파싱
        			 		$.each(chat3, function(index, element){
        			 		titles=element['title']
        			 		regidate=element['regidate']
        			 		//console.log('list로 분기한곳에서 title, regidate 찍기',titles, regidate)
        			 		$("#chattingRoom").append("<li class='small1' id='chat'><a class='enter' onclick='roomBtn(\""+titles+"\")'><i class='flaticon-basketball' style='float:left'></i>"+titles+"<span>"+regidate+"</span></a></li>");		
        			 	})
        			 return;
        		 }
        		 if(chat.substring(0,5) === "start"){
        			 //console.log('From afterConnectionEstablished to Clients')
        			 $("#chattingRoom").text('')
            		 chat = JSON.parse('"start"',msgg.data)
            		 var chat2 = msgg.data.substring(5);
            		 //console.log('start없는거 : ',chat2);
            		 var chat3 = JSON.parse(chat2); //JSON 배열 앞 문자열 지운거 다시 파싱하기.
            		 	 $.each(chat3, function(index, element){
             				titles=element['title']
              				regidate=element['regidate']
             				
           			 $("#chattingRoom").append("<li class='small1' id='chat'><a class='enter' onclick='roomBtn(\""+titles+"\")'><i class='flaticon-basketball' style='float:left'></i>"+titles+"<span>"+regidate+"</span></a></li>");		
        		 }) 	
        		 }
        		 /*
        		 if(chat.substring(0,7)=== "priUser"){
        			 console.log('From handleTextMessage to clients : priUser')
        			 $('#connectionList').text('')
        			 chat = JSON.parse('"priUser"',msgg.data)
        			 var priUser = msgg.data.substring(7);
        			 console.log('priUser없는거 : ',priUser)
        			 var priauth = JSON.parse(priUser);
        			 	$.each(priauth, function(index, element){
        			 		priUser = element['id']
        			 		$("#connectionList").append("<div class='discussion'>"
         							+"<div class='photo'>" 
         							+"</div>"
         							+"<div class='desc-contact'>"
         							+"<p class='name'>"+priUser+"</p>"
         							+"</div>"
         							+"<div class='timer'>접속시간</div>"
         							+"<button class='btn btn-info' style='margin-left: 30%'>"
         							+"Ready</button>"
         							+"</div>")
        			 	})
        		 }
        		 */
        		 	 }
              
             
            
             /* Create room */
             $("#createRoom").click(function(){
                var position = selected 
                
                $.ajax({
                   url: "<c:url value='/Team/Matching/createRoom.do'/>",
                   data : $("#create").serialize(),
                   dataType : 'text',
                   type:'post',
                   success:function(data){
                	 console.log('방만들때',auth)
                	 //3:04 추가 방만들었을때 유저목록 초기화 안되서
                	$('#connectionList').text('');
               		 if(auth != null){
               			console.log('만든방 : ',data)
               			wsocket.send("title"+data+"="+auth);
               			swal(data+"생성에 성공하였습니다!", "", "success");
               		 }
                   }
   				})
                
            });///ajax

       		//방 만든 후 텍스트 초기화
           $("#makeRoom").click(function(){
              $("#create input[type=text]").val('');
             
           });
           
           user = $("#session").val()
          
           
           //전송버튼 클릭시]
           $('#sendBtn').click(function(){
              send_message();
           });
           
           //메시지 입력후 전송 버튼 클릭이 아닌 엔터키처리
           $('#message').on('keypress',function(e){
              
              var keyValue = e.keyCode ? e.keyCode:e.which;
              if(keyValue == 13){//엔터 입력
                 send_message();
              }
              e.stopPropagation();
           }); 
           
        });///
        
        //입장버튼
        var title2;
        function roomBtn(room){
        	auth = $('#auth').val()
        	$('.text').text('')
        	$("#connectionList").text('')
           console.log('선택한 방 : ',room);
        	console.log('누른 아이디 : ',auth);
           title2 = room;
           $.when($.ajax({
               url:"<c:url value='/Team/Matching/Ent.do'/>",
               dataType : 'text',
               data : {title:room, id:auth},
               type:'get',
               success:function(data){
            	   if(auth != null && data == possible){
                       	wsocket.send("title"+room+"="+auth)
                       	swal(title2+"에 접속하셨습니다!", "", "success");
            	   }  
                    else{
                    	wsocket.send("title"+room+"="+auth)//안되도 유저목록은 변경없어야되서 추가함(11/14)
                    	swal("입장이 불가능합니다", "", "warning");
                    };
               }
            }))
        };
       
/*===========================================================함수 정의===========================================================*/
       
       var positionCheck = function(data){
       
        var target = document.getElementById("position")
        var selected = (target.options[target.selectedIndex].text)
        
        };
       
        ////title 확인용
        var checkTitle = function(data){
        	
           var title = $("#title").val();
           var impossible = 'impossible'
           var possible = 'possible'
           $.ajax({
              url: "<c:url value='/Team/Matching/checkTitle.do'/>",
              type:'post',
              dataType:'text',
              data:{title:title,'_csrf':'${_csrf.token}'},
              success:function(data){
                 console.log(data)
                 if(data == impossible){
                    $("#title").css("background-color", "#FFCECE");
                    $("#impossible").text("이미 등록된 방입니다.").css({"font-weight":"bold"});
                 }
                 else if(title == ""){
                    $("#impossible").text("필수항목입니다.").css({"font-weight":"bold"})
                        $("#title").css("background-color", "#FFCECE");
                 }
                 else{
                    $("#title").css("background-color", "#FFFFFF");
                        $("#impossible").text("가능").css({"font-weight":"bold"});
                 }
              }
              
           })
           
        };/////checkTitle
        
        var cindex = -1;
       
        //메시지를 DIV태그에 뿌려주기 위한 함수]
        var appendMessage=function(msg1){
           //메시지출력
           $('.comment-area').append("<div class='from-me'>"+msg1+"</div></br>").scrollTop('9999999');
            
        };
        
        //서버로 메시지 전송하는 함수]
        function send_message(){
        
           //서버로 메시지 전송
           wsocket.send('msg:'+auth+':'+$('#message').val());//msg:KIM:안녕
           //DIV(대화영역)에 메시지 출력
           appendMessage($('#message').val());
           //기존 메시지 클리어
           $('#message').val('');
           //포커스 주기
           $('#message').focus();
        }
        
        var readyCount = 0;
        function readyButton0(){
        	
         	 readyCount++;
         		 if(readyCount > 1){
         			 readyCount = 0;
         			//console.log('1번 버튼',readyCount)
         			//이모티콘으로 바꾸기
         		 }
         		console.log('0번 버튼',readyCount)
         		$.ajax({
		    	   url: "<c:url value='/Team/Matching/ReadyButton.do'/>",
		           type:'get',
		           dataType:'text',
		           data:{readyCount:readyCount, id:auth},
		           success:function(data){	
		        	   console.log(data)
		           }
         		})
       }
        
        function readyButton1(){
        	
          	 readyCount++;
          		 if(readyCount > 1){
          			 readyCount = 0;
          			//console.log('1번 버튼',readyCount)
          		 }
          		 else{
          			 
          		 }
          		console.log('1번 버튼',readyCount)
          		$.ajax({
		    	   url: "<c:url value='/Team/Matching/ReadyButton.do'/>",
		           type:'get',
		           dataType:'text',
		           data:{readyCount:readyCount, id:auth},
		           success:function(data){	
		        	   console.log(data)
		           }
          		})
        }
        
        function readyButton2(){
        	
          	 readyCount++;
          		 if(readyCount > 1){
          			 readyCount = 0;
          			//console.log('1번 버튼',readyCount)
          			
          		 }
          		console.log('2번 버튼',readyCount)
          		$.ajax({
		    	   url: "<c:url value='/Team/Matching/ReadyButton.do'/>",
		           type:'get',
		           dataType:'text',
		           data:{readyCount:readyCount, id:auth},
		           success:function(data){	
		        	   console.log(data)
		           }
          		})
        }
        
    </script>
<style>


.from-me {
  position: relative;
  padding: 10px 20px;
  color: white;
  background: #0B93F6;
  border-radius: 25px;
  float: right;
  clear: both;
  margin-bottom: 10px;
  margin-right: 15px;
}
.from-me:before {
  content: "";
  position: absolute;
  z-index: -1;
  bottom: -2px;
  right: -7px;
  height: 20px;
  border-right: 20px solid #0B93F6;
  border-bottom-left-radius: 16px 14px;
  -webkit-transform: translate(0, -2px);
}
.from-me:after {
  content: "";
  position: absolute;
  z-index: 1;
  bottom: -2px;
  right: -56px;
  width: 26px;
  height: 20px;
  background: white;
  border-bottom-left-radius: 10px;
  -webkit-transform: translate(-30px, -2px);
}

.from-them {
  position: relative;
  padding: 10px 20px;
  background: #E5E5EA;
  border-radius: 25px;
  color: black;
  float: left;
  clear: both;
  margin-bottom: 10px;
  margin-left: 15px;
}
.from-them:before {
  content: "";
  position: absolute;
  z-index: 2;
  bottom: -2px;
  left: -7px;
  height: 20px;
  border-left: 20px solid #E5E5EA;
  border-bottom-right-radius: 16px 14px;
  -webkit-transform: translate(0, -2px);
}
.from-them:after {
  content: "";
  position: absolute;
  z-index: 3;
  bottom: -2px;
  left: 4px;
  width: 26px;
  height: 20px;
  background: white;
  border-bottom-right-radius: 10px;
  -webkit-transform: translate(-30px, -2px);
}

#title{
   background-size: 18px;
    background-position: 98%;
    
    width: 50%;
    box-shadow: 0 0 10px 2px rgba(0,0,0,0);
    border: none;
}
.discussion{
width: 100%;
height: 90px;
background-color: #FAFAFA;
border-bottom: solid 1px #E0E0E0;
display:flex;
align-items: center;

}

.name{
 margin: 0 0 0 20px;
 font-family:'Montserrat', sans-serif;
 font-size: 11pt; color:#515151;
 }
 
.message{
 margin: 6px 0 0 20px;
 font-family:'Montserrat', sans-serif;
 font-size: 9pt;
 color:#515151;
 }
 
.timer{
margin-left: 15%;
font-family:'Open Sans', sans-serif;
font-size: 11px;
padding: 3px 8px;color: #BBB;
background-color: #FFF;
border: 1px solid #E5E5E5;
border-radius: 15px;
 }
 
.chat {
  width: calc(65% - 85px);
}

.header-chat {
  background-color: #FFF;
  height: 90px;
  box-shadow: 0px 3px 2px rgba(0,0,0,0.100);
  display:flex;
  align-items: center;
}
.chat .header-chat .icon {
  margin-left: 30px;
  color:#515151;
  font-size: 14pt;
}

.chat .header-chat .name {
  margin: 0 0 0 20px;
  text-transform: uppercase;
  font-family:'Montserrat', sans-serif;
  font-size: 13pt;
  color:#515151;
}

.chat .header-chat .right {
  position: absolute;
  right: 40px;
}

.chat .messages-chat {
  padding: 25px 35px;
  width: 720px;
  height: 700px;
  
}

.chat .messages-chat .message {
  display:flex;
  align-items: center;
  margin-bottom: 8px;
}

.chat .messages-chat .message .photo {
    display: block;
    width: 45px;
    height: 45px;
    background: #E6E7ED;
    -moz-border-radius: 50px;
    -webkit-border-radius: 50px;
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
    
}

.chat .messages-chat .text {
  margin: 0 35px;
  background-color: #f6f6f6;
  padding: 15px;
  border-radius: 12px;
}
.footer-chat {
  width: calc(65% - 66px);
  height: 80px;
  display:flex;
  align-items: center;
  position:absolute;
  bottom: 0;
  background-color: transparent;
  /* border-top: 2px solid #EEE; */
  width: 100%
  
}

.chat .footer-chat .icon {
  margin-left: 30px;
  color:#C0C0C0;
  font-size: 14pt;
}

.chat .footer-chat .send {
  color:#fff;
  background-color: #4f6ebd;
  position: absolute;
  right: 50px;
  padding: 12px 12px 12px 12px;
  border-radius: 50px;
  font-size: 14pt;
}

.chat .footer-chat .name {
  margin: 0 0 0 20px;
  text-transform: uppercase;
  font-family:'Montserrat', sans-serif;
  font-size: 13pt;
  color:#515151;
}

.chat .footer-chat .right {
  position: absolute;
  right: 40px;
}
.write-message {
  border:none !important;
  width:60%;
  height: 50px;
  margin-left: 20px;
  padding: 10px;
}

.footer-chat *::-webkit-input-placeholder {
  color: #C0C0C0;
  font-size: 13pt;
}
.footer-chat input *:-moz-placeholder {
  color: #C0C0C0;
  font-size: 13pt;
}
.footer-chat input *::-moz-placeholder {
  color: #C0C0C0;
  font-size: 13pt;
  margin-left:5px;
}
.footer-chat input *:-ms-input-placeholder {
  color: #C0C0C0;
  font-size: 13pt;
}
.photo{
margin-left:20px;
display: block;
width: 45px;
height: 45px;
background: #E6E7ED;
-moz-border-radius: 50px;
-webkit-border-radius: 50px;
background-position: center;
background-size: cover;
background-repeat: no-repeat;
cursor: pointer;
}
.waiting-photo{
margin-left:7px;
display: block;
width: 65px;
height: 65px;
background: #E6E7ED;
-moz-border-radius: 50px;
-webkit-border-radius: 50px;
background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
.text-only {
  margin-left: 45px;
}
.response {
  float: right;
  margin-right: 0px !important;
  margin-left:auto; /* flexbox alignment rule */
}
.response .text {
  background-color: #e3effd !important;
}
#clientsMessage{
  float: left; 
  clear: both; 
  margin-top:10px;
  font-family: 'Hi Melody', cursive;
  margin-right: 0px !important;
  margin-left:auto; 
  background-color: #778899 !important;
  opacity: 0.7;
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  width: 50%;
  font-size: 1.5em;
  	
}
#myChat{
  float: right; 
  clear: both; 
  margin-top:10px;
  font-family: 'Hi Melody', cursive;
  margin-right: 0px !important;
  margin-left:auto;
  background-color: #1E90FF !important;
  opacity: 0.7;
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  width: 50%;
  font-size: 1.5em;
}


</style>

<!-- banner-section start -->

<section class="breadcum-section">
   <div class="breadcum-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcum-content text-center">
                  <h3 class="title">Blog details</h3>
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="index.html">home</a></li>
                     <li class="breadcrumb-item active">blog details</li>
                  </ol>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- banner-section end -->
<!-- blog-details-section start -->
<section class="blog-details-section section-padding">
   <div class="container">
      <div class="row">
         <div class="col-lg-8" style="border-color: black;">
         <!-- Member List start -->
         <div id="connectionList">
         <input type="hidden" value="${title }" id="roomTitle">
         <input type="hidden" value="${id }" id="auth"/>
         
           <!-- 유저목록 뿌려주는곳 -->
         </div>
        
            <div class="comment-area" style="overflow: auto; height: 720px; box-shadow: 0 0 10px 2px rgba(55, 107, 255, 0.1);" >
            <!-- Chatting Start -->
         <section class="chat" >
         <div class="chatArea" style="width: 100%"></div>
         
           
        <!-- Chatting End -->
        <!-- <div id="roomm"> -->
        
        <!-- </div> -->
        <!-- Insert Text Start -->
        <div class="footer-chat">
          <i class="icon fa fa-smile-o clickable" style="font-size:25pt;" aria-hidden="true"></i>
          <input id="message" type="text" class="write-message" placeholder="Type your message here"></input>
          <button id="sendBtn"><i class="icon send fa fa-paper-plane-o clickable" aria-hidden="true"></i></button>
        </div>
        <!-- Insert Text End -->
        
      </section>   
            </div>
         </div>
         <div class="col-lg-4">
            <div class="sidebar">
               <div class="widget widget-search">
                  <form class="widget-search-form">
                     <input type="search" name="search" id="widget-search"
                        placeholder="Searching Position">
                     <button class="widget-search-btn">
                        <i class="fa fa-search"></i>
                     </button>
                  </form>
               </div>
               <div style="text-align: center; margin-top: 15px">
                  <button data-toggle="modal" data-target="#myModal" class="btn btn-info" style="width: 50%" id="makeRoom">방만들기</button>
               </div>
               <!-- widget end -->
               <div class="widget widget-categories" style="margin-top: 15px">
                  <h4 class="widget-title" style="text-align: center;">Now Wanted Position</h4>
                  <ul>
                     <li><a href="#0">Forward<span>(54)</span></a></li>
                     <li><a href="#0">Center<span>(22)</span></a></li>
                     <li><a href="#0">Shooter<span>(33)</span></a></li>
                     <li><a href="#0">All Rounder<span>(12)</span></a></li>
                     <li><a href="#0">ETC<span>(05)</span></a></li>
                  </ul>
               </div>
               
               <!-- widget end -->
               <div class="widget widget-categories" style="overflow: auto;" id="ddo">
                  <h4 class="widget-title" style="text-align: center;">Waiting Room</h4>
                    <form action="<c:url value='/Team/Matching/Ent.do'/>">
                     <div id="chattingRoom1" style="text-align: center;">
                     
                         <ul id="chattingRoom">
                 
                  		 </ul>
                      </div>
                    </form>
                           
               </div>
                     
               </div>
               <!-- widget end -->
               <div class="widget widget-instagram" style="text-align: center; margin-top: 25px">
                  <h4 class="widget-title" style="text-align: center;">Share your Friends!</h4>
                  <ul class="instagram-list" style="margin-top: 25px">
                     <li><a href="#"><i class="fa fa-facebook-f"
                           style="flex: 0 0 0;"></i></a>
                     <li><a href="#"><i class="fa fa-google-plus"
                           style="flex: 0 0 0;"></i></a>
                     <li><a href="#"><i class="fa fa-twitter"
                           style="flex: 0 0 0;"></i></a>
                     <li><a href="#"><i class="fa fa-vimeo"style="flex: 0 0 0;"></i></a>
                           
                     <li><a href="#"><i class="fa fa-instagram"style="font-weight: bold;"></i></a>
                         
                     <li><a href="#"><i class="fa fa-youtube-play"style="font-weight: bold;"></i></a>
                           
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- blog-details-section end -->

<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" >
          <h4 class="modal-title">Create Room for Matching!</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <form action="<c:url value='/Team/Matching/createRoom.do'/>" id="create" name="create" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div style="text-align: center;margin-top: 25px" >
           <input type="text" placeholder="Title" name="title" id="title" oninput="checkTitle()" style="border-bottom: 1.5px solid navy;">
        </div>
           <div style="text-align: center;">
           <span id="impossible">${impossible}</span>
           </div>
        <div style="text-align: center;margin-top: 15px">
           <input type="text" placeholder="Area" name="area" id="area" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid navy;">
        </div>
           <span id="impossible">${x}</span>
        <div style="text-align: center;margin-top: 15px">
           <!-- <input type="text" placeholder="Postion" name="position" id="position" style="border-bottom: 1.5px solid navy"> -->
           <select class="custom-select" id="position" name="position" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid navy;" onchange="positionCheck()"> 
               <option value="position">Select your Position</option>      
               <option value="Center">Center</option>      
               <option value="Guard">Guard</option>      
               <option value="Forward">Forward</option>      
            </select>
        </div>
           <span id="impossible" >${x}</span>
        
         <div class="col-lg-12" style="text-align: center;">
            <hr style="border:solid 1px">
             </div>
             <div style="text-align: center;">
             <button type="button" class="submit-btn" href="#" data-dismiss="modal" style="width:50%;line-height: 40px" id="createRoom" name="createRoom" >                  
                      Create Room
             </button>
             </div>
                </form>
              </div>
            </div>
          </div>
        
