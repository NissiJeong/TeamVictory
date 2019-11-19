<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> 
    <link href="https://fonts.googleapis.com/css?family=Tomorrow&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua&display=swap" rel="stylesheet">
	<sec:authentication property="principal.username" var="id"/>
	<sec:authentication property="principal.authorities" var="auth"/>
<script>
var wsocket;
var roomtitle = $("#roomTitle").val();
var auth;
var users='';
var matchingPlace = '';
$(function(){///
	var auth = $("#auth").val();
	console.log(auth) 
	if(auth == 'ADMIN'){
		wsocket = new WebSocket("ws://localhost:8080<c:url value='/match.do'/>");
		//console.log('ADMIN으로 접속')
	}
	else{
    	wsocket = new WebSocket("ws://192.168.0.5:8080<c:url value='/match.do'/>");
    	console.log(auth,'로 접속')
	}
    wsocket.onopen = function(){
		 console.log('소켓열림')
		 wsocket.send("msg:"+auth+":msg")
    }
    wsocket.onclose=function(){};
    wsocket.onmessage = function(msgg){///////서버에서 받은메세지
    	 var chat = msgg.data
		 console.log('서버에서 데이터를 받을때마다 : ',msgg.data)
		 if(chat.substring(0,4) === 'user'){//방클릭시 유저목록 서버에서 받을 때
			 //console.log('유저목록(user)으로 분기 했을 때',chat,chat)
			 chat = JSON.parse('"user"',msgg.data)
			 	var user2 = msgg.data.substring(4);
		 		console.log('user없는거 : ',user2)
		 		var user3 = JSON.parse(user2)
		 		
		 		users = '';
		 		$.each(user3, function(index, element){//내가속한 방 뿌려주기
		 			users += element['id']+', '
 					title = element['title']
		 			area = element['position']
		 			
		 		})
		 		console.log('user : '+users+' title : '+title+' position : '+area);
		 		
		 		$('#users').empty()
		 		$('#users').append("<div class='post-item'>"
	            					+"<div class='thumb'>"
	             					+"</div>"
	            					+"<div class='content' style='background-color: beige; opacity: 0.5;'>"
	           						+"<ul class='post-meta'>"
	              					+"<li style='font-size: 1.5em'><a href='#'><i class='fa fa-calendar'></i>"+users+"</a></li>"
	               					+"</ul>"
	              					+"<h5 class='post-title'><a href='#0'>"+title+"</a></h5>"
	              					+"<p>"+area+"</p>"
	              					+"</div>"
	            					+"</div>")
	            
			 return;
		 }
    	 if(chat.substring(0,5) === "start"){///내가 속한 방 제외하고 뿌려주기
			 //console.log('From afterConnectionEstablished to Clients')
			 $("#matchList").text('')
    		 chat = JSON.parse('"start"',msgg.data)
    		 var chat2 = msgg.data.substring(5);
    		 //console.log('start없는거 : ',chat2);
    		 var chat3 = JSON.parse(chat2); //JSON 배열 앞 문자열 지운거 다시 파싱하기.
    		 	 $.each(chat3, function(index, element){
     				titles = element['title']
     				area = element['position']
   			 $("#matchList").append("<section class='box'>"
   			 						+"<div style='text-align: center; margin-top: 25px' class='title'>"
   					 				+"<span style='font-weight: bold;'>"+titles+"</span>"
   					 				+"<input type='text' class='form-control' placeholder='Matching place' id='matchingPlace'/>"
   					 				+"<select class='schedule' style='margin-top:15px' id='time'>"
   					 			  	+"<option>30분뒤</option>"
   					 			  	+"<option>한시간 뒤</option>"
   					 		  		+"<option>한시간 반 뒤</option>"
   					 		  		+"<option>두시간 뒤</option>"
   					 		  		+"<option>세시간 뒤</option>"
   					 		  		+"</select>"
   					 				+"<p>"+area+"</p>"
   					 				+"<button class='btn btn-danger' onclick='roomBtn(\""+titles+"\")'>Matching</button></div></section>");
   					 				
		 }) 	
		 }
    	 if(chat.substring(0,5) === "play@"){
    		 console.log(chat)
    		 var play = chat.split('@')[1];
    		 var location = chat.split('@')[2];
    		 var time = chat.split('@')[3];
    		 console.log(play)
    		 console.log(location)
    		 console.log(time)
    		 Swal.fire({
  				  title: play+"님이 "+' '+location+"에서 "+' '+time+"에 매칭을 신청하셧습니다!",
  				  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#30a0d6',
                  cancelButtonColor: '#fd5850',
                  cancelButtonText: "Cancel",
                  confirmButtonText: 'Confirm',
  				})
  				.then((result) => {		
  					if(result.value){
  						Swal.fire(location+"에서"+' '+time+'에 경기를 시작합니다.',' ',"success")
  						wsocket.send('msg$'+play)
  						/*  window.location.href = "<c:url value='/Team/Matching/BasketMatching.do'/>"; */
  					}
  					else{
  						Swal.fire("취소하셨습니다.","","error")
  						wsocket.send('msg^'+play)
  					}
  				});
    	 }
    	 if(chat.substring(0,4)==='yes-'){
    		 var agree = chat.substring(4)
    		 Swal.fire("상대방이 수락하였습니다.","","success")
    	 }
    	 if(chat.substring(0,3)==='no*'){
    		 Swal.fire("상대방이 거절하였습니다.","","error")
    	 }
		 	 }///onmessage
	   
		 	 
});///////

/*========================================================함수정의==========================================================*/
		function roomBtn(room){
			auth = $('#auth').val()
			var time = selected 
            var target = document.getElementById("time");
            var selected = (target.options[target.selectedIndex].text)
            Swal.fire("상대방에게 매칭을 신청하였습니다!","","success")
			matchingPlace = $('#matchingPlace').val()
			$('.text').text('')
			$("#connectionList").text('')
			
		   console.log('선택한 방 : ',room);
           console.log('경기장소 : ',matchingPlace)
		   console.log('누른 아이디 : ',auth);
           console.log('선택한 시간 : ',selected)
		   wsocket.send("!"+room+"!"+auth+"!"+matchingPlace+"!"+selected)
		  $('#matchingPlace').val('')
		   title2 = room;
		   
		};

		
</script>
<style>

.form-control{
	display: block;
    width: 100%;
    height: calc(2.25rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: none;
    border-bottom: 2px solid #00BFFF;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
 
}
.schedule{

	display: block;
    width: 100%;
    height: calc(2.25rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: none;
    border-bottom: 2px solid #00BFFF;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

body {
	font-family: 'Roboto', sans-serif;
	background-color: #F0F2F5;
}

section.container {
	width: 592px;
	height: auto;
	margin: 0 auto;
}

section.container header {
	margin: 25px 0;
	padding-bottom: 25px;
	border-bottom: 1px dotted #AAB2BD;
}

section.container header h1 {
	font-weight: 200;
	font-size: 3em;
	color: navy;
	text-align: center;
}

section.box {
	width: 128px;
	background-color: #FFFFFF;
	box-shadow: 0 2px 6px #CCC;
	border-radius: 5px;
	display: block;
	float: left;
	margin: 10px;
}

section.box h1 {
	font-weight: 400;
	font-size: 14px;
	color: #494A4A;
	display: block;
	font-family: 'Jua', sans-serif;
	padding: 5px 0px 0px 5px;
}

section.box p {
	font-weight: 300;
	font-size: 11px;
	color: #999999;
	display: block;
	
	padding: 5px 0px 5px 5px;
}

.box:hover{
 box-shadow: 0px 0px 150px #000000;
    z-index: 2;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1.5);
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1.5);   
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1.5);
    transition: all 200ms ease-in;
    transform: scale(1.5);
}

.title{
font-family: 'Tomorrow', sans-serif;
font-family: 'Do Hyeon', sans-serif;
}


#one-collapseOne{
	position: relative;
    background-image: url(<c:url value='/assets/images/basketball2.jpg'/>);
    background-position: center;
    background-size: cover;
    height: 600px;
    width: 100%
  /* //background-image: url(../assets/images) */
}

.breadcum-section{
  
	background-image: url(<c:url value='/assets/images/basketball6.jpg'/>);
	position: relative;
    background-position: center;
    background-size: cover;
}

</style>

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
	             	
             </div>
             <div>
             <div></div>
             </div>
           </div>
        <div class="col-lg-12">
          <div class="statistics-table-result-part">
            
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="teamMatch" role="tabpanel" aria-labelledby="all-tab">
                
                  <div class="card">
                   
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <section class="container">
			
		<header>
			<h1>MatchingList</h1>
		</header>
		<div style="text-align: center" id="users">
	        
	             	</div>
			<div style="margin-left: 60px" id="matchList">
		
</div>
	</section><!-- End .container -->
                      
                      <section class="blog-section section-padding" style="margin-top: -80px">
                  <!-- List -->
                  
        		
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
  
