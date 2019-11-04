<%@ page language="java" contentType="text/html; charset=UTF-8" session="false"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<script>
        //웹소켓 객체 저장용
        var wsocket;
        //닉 네임 저장용
        var nickname;
        var user;
        var position = "Select your Position"
        var center = "Center"
        var forwar = "Forward"
        var Guard = "Guard"
        var selected;
        var target;
            
        $(function(){
           
            var openByAdmin = function (){
                 //서버로 연결한 사람의 정보(닉네임) 전송
                 //msg:kim가(이) 입장했어요
                 //console.log($('#chat'+cindex).html());
                 wsocket.send('Admin이 접속했습니다.');
                 //joinUser("채팅방에 입장하였습니다.");
              };
              
         if(user == 'admin'){
            wsocket = new WebSocket("ws://localhost:9090<c:url value='/chat-ws.do'/>");
            wsocket.onopen = openByAdmin;
         }
         
           /* Create room */
            $("#createRoom").click(function(){
               var position = selected 
               $.ajax({
                  url: "<c:url value='/Team/Matching/createRoom.do'/>",
                  data : $("#create").serialize(),position,
                  dataType : 'text',
                  type:'post',
                  success:function(data){
                     swal("Room Created!", "", "success");
                  }
             
           });///ajax
              
           });//////////////createRoom
           
           //방뿌려주기
         window.setInterval(function(){
            $.ajax({
              url:"<c:url value='/Team/Matching/listRoom.do'/>",
              dataType : 'json',
              success:function(data){successList(data,'list')}
           })
          },500);
           
            
           $("#makeRoom").click(function(){
              $("#create input[type=text]").val('');
             
              
           });
          
           user = $("#session").val()
          
           $('#enterBtn').one('click',function(){
              // 웹 소켓 객체로 서버에 연결하기
              console.log(user)
              console.log('되냐?')
              /* if(user != null){
              wsocket = new WebSocket("ws://localhost:9090<c:url value='/chat-ws.do'/>");
              wsocket.onopen = open;
              wsocket.onclose=function(){appendMessage("연결이 끊어졌어요.")};
              wsocket.addEventListener('message',message);
           } 
           else{
              
           }*/
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
        
        
        var title2;
        function roomBtn(room){
           
           console.log('선택한 방 : ',room);
           title2 = room;
           if(user != null){
              console.log('둘어와');
                wsocket = new WebSocket("ws://192.168.200.177:9090<c:url value='/chat-ws.do'/>");
                wsocket.onopen = open;
                wsocket.onclose=function(){appendMessage("연결이 끊어졌어요.")};
                wsocket.addEventListener('message',message);
             };
             
           
        };
       
        //함수 정의]
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
        //방제목 넘기기
        var successList = function(data,id){
           
           $(".small1").remove();
           $('.post-meta').remove();
           $.each(data, function(index, element){
              //console.log(index)
              cindex=index
              //console.log(element['no'])
              title3=element['title'];
              //console.log("successlist에서 누름",title3)
              regidate=element['regidate'];
              $("#chattingRoom").append("<li class='small1' id='chat"+index+"'><a onclick='roomBtn(\""+title3+"\")'><i class='flaticon-basketball' style='float:left'></i>"+title3+"<span>"+regidate+"</span></a></li>");
               
           })
        };
        
        //서버에 연결되었을때 호출되는 함수
      var open = function (){
           //서버로 연결한 사람의 정보(닉네임) 전송
           //msg:kim가(이) 입장했어요
           
           console.log($('#chat'+cindex).html());
           wsocket.send('방이름:'+title2+'client:'+user+'님이 입장하였습니다.');
           joinUser("채팅방에 입장하였습니다.");
        };
        
       
        //서버에서 메시지를 받을때마다 호출되는 함수
       var message= function(e){
          //서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
          var receiveData = e.data;
          if(receiveData.substring(0,4) =='msg:'){
             clientMsg(receiveData.substring(4));
          }
          else{
             joinUser(receiveData.substring(10))

          }
        };
        //
        var joinUser = function(msg){///유저접속하면용

           $("#join").append("<span id='join' style='text-align: center;'>"+msg+"</span><br/>")
           
        };
        
         var clientMsg = function(msg){

            $('#chatMessage1').append(msg+"<br/>");
            
         }
        //메시지를 DIV태그에 뿌려주기 위한 함수]
        var appendMessage=function(msg1){
           //메시지출력
           $('#chatMessage').append(msg1+"<br/>");
        };
        //서버로 메시지 전송하는 함수]
        function send_message(){
           
           //서버로 메시지 전송
           wsocket.send('msg:'+user+':'+$('#message').val());//msg:KIM:안녕
           //DIV(대화영역)에 메시지 출력
           appendMessage($('#message').val());
           //기존 메시지 클리어
           $('#message').val('');
           //포커스 주기
           $('#message').focus();
        }
    </script>
<style>



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
#join{
  font-family: 'Jua', sans-serif;
  margin-right: 0px !important;
  margin-left:auto; /* flexbox alignment rule */
  background-color: #1E90FF !important;
  opacity: 0.7;
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  width: 50%
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
         <div class="discussion">
             <a data-toggle="modal" data-target="#myModal">
             <div class="photo" style="background-image:url(https://image.noelshack.com/fichiers/2017/38/2/1505775062-1505606859-portrait-1961529-960-720.jpg);">
             <div class="online"></div>
             <input type="hidden" value="${id}" id="session" >
          </div>
          </a>
          <div class="desc-contact">
            <p class="name">회원 아이디</p>
            <p class="message">대화명? 텍스트?</p>
           </div>
            <div class="timer">접속시간</div>
            <button class="btn btn-info" style="margin-left: 30%">Ready</button>
             </div>
         <div class="discussion">
             <div class="photo" style="background-image:">
             
            <div class="online"></div>
          </div>
          <div class="desc-contact">
            <p class="name">회원 아이디</p>
            <p class="message">대화명? 텍스트?</p>
           </div>
            <div class="timer">접속시간</div>
            <button class="btn btn-info" style="margin-left: 30%">Ready</button>
            <!-- <i class="fas fa-fist-raised" style="font-size: 9px"></i> -->
                     
             </div>
         <div class="discussion">
             <div class="photo" style="background-image:">
             
            <div class="online"></div>
          </div>
          <div class="desc-contact">
            <p class="name">회원 아이디</p>
            <p class="message">대화명? 텍스트?</p>
           </div>
            <div class="timer">접속시간</div>
            <button class="btn btn-info" style="margin-left: 30%">Ready</button>
             </div>
            <div class="comment-area" style="overflow: auto; height: 720px; box-shadow: 0 0 10px 2px rgba(55, 107, 255, 0.1);" >
            <!-- Chatting Start -->
         <section class="chat" >
           
        <div class="messages-chat" >
                 <div style="text-align: center;" id=""></div>
                   <span id="join" style="text-align: center;"></span>
                   
          <div class="message">
                
            <div class="photo" style="background-image:">
              <div class="online"></div>
            </div>
            <p class="text" id="chatMessage1"></p>
                 <!-- <div id="chatMessage"></div> -->
          </div>
          <div class="message text-only">
            <div class="response" style="margin-left: auto;float: right;margin-right: 0px">
              <p class="text" id="chatMessage">
                 <!-- 서버로부터 받은 메세지 -->
              </p>
            </div>
          </div>
        </div>
        <!-- Chatting End -->
        
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
                     <div id="chattingRoom1" style="text-align: center;">
                     
                         <ul id="chattingRoom">
                     <!-- <li><a href="#0">Forward<span>(54)</span></a></li>
                     <li><a href="#0">Center<span>(22)</span></a></li>
                     <li><a href="#0">Shooter<span>(33)</span></a></li>
                     <li><a href="#0">All Rounder<span>(12)</span></a></li>
                     <li><a href="#0">ETC<span>(05)</span></a></li> -->
                  </ul>
                          </div>
                         
                           
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
           <span id="impossible">${x}</span>
        
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
        
