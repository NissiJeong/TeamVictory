<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
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
		wsocket = new WebSocket("ws://localhost:8080<c:url value='/match.do'/>");
		//console.log('ADMIN으로 접속')
	}
	else{
    	wsocket = new WebSocket("ws://172.30.1.14:8080<c:url value='/match.do'/>");
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
		 		$('#userList').text('');
		 		$.each(user3, function(index, element){
		 			user = element['id']
 					$("#userList").append("<li><a href=''>"+user+"<span>(54)</span></a></li>")
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
			 		area = element['position']
			 		//console.log('list로 분기한곳에서 title, regidate 찍기',titles, regidate)
			 		$("#chattingRoom").append("<li class='small1' id='chat'><a class='enter' onclick='roomBtn(\""+titles+"\")'><i class='flaticon-basketball' style='float:left'></i>"+titles+"<span>"+area+"</span></a></li>");		
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
     				titles = element['title']
      				regidate = element['regidate']
     				area = element['position']
   			 $("#chattingRoom").append("<li class='small1' id='chat'><a class='enter' onclick='roomBtn(\""+titles+"\")'><i class='flaticon-basketball' style='float:left'></i>"+titles+"<span>"+area+"</span></a></li>");		
		 }) 	
		 }
		 if(chat.substring(0,5) === "ready"){
			 var ready = chat.substring(6)
			 $('#div1').empty()
			 $('#div2').empty()
			 $(".comment-area").append("<div style='text-align: center;' id='div1'><span id='myChat'>"+ready+"</span></div>")
			 /*뿌려줄곳*/
		 }
		 if(chat.substring(0,6) === "cancel"){
			 var cancel = chat.substring(7)
			 $('#div2').empty()
			 $('#div1').empty()
			  $(".comment-area").append("<div style='text-align: center;' id='div2'><span id='myChat'>"+cancel+"</span></div>")
			 /*뿌려줄곳*/
		 }
		 if(chat.substring(0,9) === 'complete:'){
			 console.log(chat.substring(9))
			 
			 swal({
				  title: "모든 플레이어가 준비를 완료했습니다!",
				  text: "시작하시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "매칭시작!",
				  cancelButtonText: "아니요",
				  closeOnConfirm: false,
				  closeOnCancel: false,
				  showLoaderOnConfirm: true
				})
				.then((result) => {			
					setTimeout(function(){
					if(result){
						swal("매칭이 완료되었습니다!","","success")
						wsocket.send('msg!'+auth+'!d')
						/*매칭신청하는곳으로 이동*/
						/* window.open("<c:url value='/Team/Matching/BasketMatching.do'/>");  */
						window.location.href = "<c:url value='/Team/Matching/BasketMatching.do'/>";
					}
					else{
						swal("취소하셨습니다.","","error")
					}}, 2000)
					
				});
		 }
		 if(chat.substring(0,6) === 'notice'){
			 swal({
				  title: "매칭이 잡혔습니다!",
				  text: "페이지 이동을 하시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "매칭시작!",
				  cancelButtonText: "아니요",
				  closeOnConfirm: false,
				  closeOnCancel: false,
				  showLoaderOnConfirm: true
				})
				.then((result) => {			
					setTimeout(function(){
					if(result){
						swal("매칭이 완료되었습니다!","","success")
						/* window.open()  */
						 window.location.href = "<c:url value='/Team/Matching/BasketMatching.do'/>";
						/*매칭신청하는곳으로 이동*/
						
					}
					else{
						swal("취소하셨습니다.","","error")
					}}, 1500)
					
				});
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
        var area = selected 
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
</script>

   <!-- banner-section start -->  
  <section class="breadcum-section" style="margin-bottom: -70px">
   <input type="hidden" value="${title }" id="roomTitle">
   <input type="hidden" value="${id }" id="auth"/>
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
              <h3 class="title">Matching</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">matching</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->

  <!-- statistics-section start -->
  <section class="statistics-section section-padding padding-top-95">
    <div class="container">
      <div class="row justify-content-center">
            <div class="col-lg-6">
             <div class="section-header text-center">
               <h2 class="section-title fadeIn"  style="color:black">Start Matching!</h2>
               <p>On insensible possession oh particular attachment at excellence in. The books arose but miles happy she.</p>
             </div>
           </div>
        <div class="col-lg-12">
          <div class="statistics-table-result-part">
            
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="teamMatch" role="tabpanel" aria-labelledby="all-tab">
                
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button"  data-target="#one-collapseOne" aria-expanded="true" aria-controls="one-collapseOne">Team Matching</button>
                      </h2>
                    </div>
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <section class="blog-section section-padding" style="margin-top: -80px">
                  <div style="float: left;">
                  <div class="col-lg-4 col-sm-6">
			          <div class="feature-item text-center">
			            <div class="icon"><div class="rotate-icon"><i class="flaticon-presentation"></i></div></div>
			            <h3 class="title">Baseball</h3>
			            <p>May indulgence difficulty ham can put especially. Bringing remember for supplied her why was confined.</p>
			          </div>
        		</div>
        		</div>
        		
                 </section>
                   </div>
                 </div><!-- card end -->
                  
                
              </div>
         
            </div>
          </div><!-- online-play-tab-part end -->
        </div>
      </div>
    </div>
  </section>
  <!-- statistics-section end -->
  
  
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Start Matching With Rival Team</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-10">
                <!-- Portfolio Modal - Title -->
                
                 <img id="teamLogo" src="/matching/Upload/${item.teamLogo }" alt="image" style="width:329px; height:231px"/>
                 
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0" style="display: inline" id="teamName"></h2>
                <h5 id="teamRating"></h5>
                <p>최근 5경기 경기 결과</p>      
                  <table class="table table-striped" style="margin-top: 10px">
                <thead>
                  <tr>
                    <th id="date0"></th>
                    <th id="date1"></th>
                    <th id="date2"></th>
                    <th id="date3"></th>
                    <th id="date4"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td id="result0"></td>
                    <td id="result1"></td>
                    <td id="result2"></td>
                    <td id="result3"></td>
                    <td id="result4"></td>
                  </tr>
                  
                  
                </tbody>
              </table>
              </div>
               <div class="col-lg-12">
                <hr style="border:solid 1px">
                </div>
                <div class="col-lg-8">
                <!-- Icon Divider -->
                <h3 class="portfolio-modal-title text-secondary text-uppercase mb-0" >Matching정보 입력</h3>
                  <form id="frm">
                  <input type="hidden" id="user" value="${id }"/>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  <input name="awayteam" id="awayteam" type="hidden" value='sdfg'/>
             <div class="form-group" style="margin-bottom:-10px ">
               <label for="sel1">Date</label>
               <p><input name='date' type="text" id="datepicker" style="width:100%" ></p>
               <br>            
             </div>
             <div class="form-group" style="margin-bottom:-10px ">
               <label for="sel2" >Time</label>
               <select class="form-control" id="sel2" name="time" onchange="checkDateTime(this.value)" >
                 <option selected="selected" value="ti">시간</option>
                 <option value="00">00</option>
                 <option value="01">01</option>
                 <option value="02">02</option>
                 <option value="03">03</option>
                 <option value="04">04</option>
                 <option value="05">05</option>
                 <option value="06">06</option>
                 <option value="07">07</option>
                 <option value="08">08</option>
                 <option value="09">09</option>
                 <option value="10">10</option>
                 <option value="11">11</option>
                 <option value="12">12</option>
                 <option value="13">13</option>
                 <option value="14">14</option>
                 <option value="15">15</option>
                 <option value="16">16</option>
                 <option value="17">17</option>
                 <option value="18">18</option>
                 <option value="19">19</option>
                 <option value="20">20</option>
                 <option value="21">21</option>
                 <option value="22">22</option>
                 <option value="23">23</option>
               </select>
               <span id="timeError" style="color:red; font-size: 0.8em"></span>
               <br>            
             </div>
              <div class="form-group" style="margin-bottom:10px ">
               <label for="sel3" >Stadium</label>
               <select class="form-control" id="sel3" name="stadium" onchange="checkDateTime(this.value)" disabled="true"  >
                 <option value="stadium">경기장</option>
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
               </select>
               <span id="stadiumError" style="color:red; font-size: 0.8em"></span>
               <br>            
             </div>
             <button id="match" type="submit" class="btn btn-primary" href="#" data-dismiss="modal" style="width:100%;line-height: 40px" disabled="true">                  
                     매칭 신청
                </button>
           </form>
         </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
