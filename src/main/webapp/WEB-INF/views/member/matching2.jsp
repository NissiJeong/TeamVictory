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
<script>
var websocket;
var user;
var teamname;
var wsUri = "ws://192.168.0.63:8080<c:url value='/push.do'/>";
var time;
var date;
var stadium;
var receiveData;
$( function() {
	websocket = new WebSocket(wsUri);
	websocket.onopen = ()=>{websocket.send('id:'+user);};
	websocket.addEventListener("message",function(e){
		console.log('=========================1231231231');
		receiveData=e.data;
		console.log("123123123",receiveData);
		//notifyme(receiveData);
		Swal.fire({
		  position: 'top-end',
		  title: receiveData,
		  showConfirmButton: true
		}).then((result) => {			
			window.open('<c:url value="/Team/Matching/Team.do"/>');
		});
	});
	user = $('#user').val();
	
	
	console.log('user:',user);
    $( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
    

    
    $(".upModal").click(function(){
    	teamname = $('label:eq('+$(this).attr("title")+')').attr("title");
    	$('#datepicker').val("");
		$('#sel2').val("ti");
		$('#sel3').val("stadium");
    	$.ajax({
    		url:"<c:url value='/Team/Matching/modal.do'/>",
    		type:'post',
    		dataType:'json',
    		data:{teamName:$('label:eq('+$(this).attr("title")+')').attr("title"),'_csrf':'${_csrf.token}'},	
    		success:function(data){
    			console.log(data);
    			if(data['teamLogo'] != null){
    				$("#teamLogo").prop("src","/matching/Upload/"+data['teamLogo']);
    			}
    			else{
    				$("#teamLogo").prop("src","https://us.123rf.com/450wm/martialred/martialred1507/martialred150700789/42614399-%EC%9D%91%EC%9A%A9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8-%EB%B0%8F-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%97%90-%EB%8C%80%ED%95%9C-%EC%B9%B4%EB%A9%94%EB%9D%BC-%EC%B4%AC%EC%98%81-%EB%9D%BC%EC%9D%B8-%EC%95%84%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98.jpg?ver=6");
    			}
    			$("#teamName").html(data['teamName']);
    			$("#teamRating").html(data['teamRating']);
    			$('#awayteam').prop('value',data['teamName']);
    			for(var i=0;i<5;i++){
    				if(data['gameDate'+(4-i)]==undefined){
    					$('#date'+i).html('.');
    				}
    				else{
    					$('#date'+i).html(data['gameDate'+(4-i)]);
    				}    				
    			}
    			for(var i=0;i<5;i++){
    				if(data['gameResult'+(4-i)]==undefined){
    					$('#result'+i).html('전적 없음');
    				}
    				else{
    					$('#result'+i).html(data['gameResult'+(4-i)]+'</br>'+data['score4']);
    				}		
    			}
    		}
    	}); 
    });    
    
    

  
    $("#match").click(function(){
    	date = $('#datepicker').val();
    	time = $('#sel2').val();
    	stadium =$('#sel3').val();
    	//console.log(websocket)
    	websocket.send('awayteam:'+teamname+',date:'+date+',time:'+time+",stadium:"+stadium);
    	$.ajax({
    		url:"<c:url value='/Team/Matching/matching.do'/>",
    		type:'post',
    		dataType:'text',
    		data:$('#frm').serialize(),	
    		success:function(data){
    			$('#datepicker').val("");
    			$('#sel2').val("ti");
    			$('#sel3').val("stadium");
    			console.log(data);
    			swal({
    				  title: "Complete",
    				  text: data,
    				  icon: "success",
    				  button: "yes",
   				});    			
    		}
    	});
    });    
   
 });



 function checkDateTime(time){
	if(time.length == 2){
		console.log("222222");
		var path = "<c:url value='/Team/Matching/CheckDateTime.do'/>";
	}
	else{
		console.log("333333");
		var path = "<c:url value='/Team/Matching/CheckDateTimeStadium.do'/>";
	}
	var gameTime = $('#sel2').val();
	var gameDate = $('#datepicker').val();
	var stadium = $('#sel3').val();
	console.log(gameTime+":"+gameDate+":"+stadium);
	$.ajax({
		url:path,
		type:'post',
		dataType:'text',
		data:{'gameTime':gameTime,'gameDate':gameDate,'stadium':stadium,'_csrf':'${_csrf.token}'},	
		success:function(data){
			console.log(data);
			if(data == "no"){
				$("#timeError").html("해당 팀은 동일한 날짜와 시간에 매칭이 예약되어 있습니다");
				$("#match").prop("disabled",true);
				$("#sel3").prop("disabled",true);
			}
			else if(data =="yes"){
				$("#timeError").html("");
				
				$("#sel3").prop("disabled",false);
			}
			else if(data=="stadiumNo"){
				$("#stadiumError").html("해당 경기장은 동일한 날짜와 시간에 매칭이 예약되어 있습니다");
				$("#match").prop("disabled",true);
			}
			else if(data=="stadiumYes"){
				console.log("왜???")
				$("#stadiumError").html("");
				$("#match").prop("disabled",false);
			}
			
		}
	});
	//$('#datepicker').val("");
	//$('#sel2').val("time");
 }
 window.addEventListener('load', function () {
	  Notification.requestPermission(function (status) {
	    // This allows to use Notification.permission with Chrome/Safari
	    if (Notification.permission !== status) {
	      Notification.permission = status;
	    }
	  });
	});

function notifyme(message){

		console.log('들어왔따')
		//If the user agreed to get notified
		if (Notification && Notification.permission === "granted") {
			
			var n = new Notification(message);
			
			n.onclick = (event) => {
				//event.preventDefault();
				n.close();
				window.open('<c:url value="/Team/Matching/Team.do"/>');
			}
		}
		
		//If the user haven't tell if he want to be notified or not
		//Note: because of Chrome, we are not sure the permission property
		//is set, therefore it's unsafe to check for the "default" value.
		else if (Notification && Notification.permission !== "denied") {
		 Notification.requestPermission(function (status) {
		   if (Notification.permission !== status) {
		     Notification.permission = status;
		   }
		
		   // If the user said okay
		   if (status === "granted") {
		     var n = new Notification(message);
		    
		   }
		
		   // Otherwise, we can fallback to a regular modal alert
		   else {
		     alert(message);
		   }
		 });
		}
		
		//If the user refuse to get notified
		else {
		 // We can fallback to a regular modal alert
		 alert(message);
		}
		
};
</script>

   <!-- banner-section start -->  
  <section class="breadcum-section" style="margin-bottom: -70px">
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
            <ul class="nav justify-content-around" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="teamMatch-tab" data-toggle="tab" href="#teamMatch" role="tab" aria-controls="all" aria-selected="true">
                  <i class="flaticon-match"></i>
                  <span>Team Matching</span>
            	  <p>May indulgence</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="soloMatch-tab" data-toggle="tab" href="#soloMatch" role="tab" aria-controls="football" aria-selected="false">
                  <i class="flaticon-soccer"></i>
                  <span>Training Mode</span>
                  <p>May indulgence</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="cricket-tab" data-toggle="tab" href="#search" role="tab" aria-controls="cricket" aria-selected="false">
                  <i class="flaticon-transparency"></i>
                  <span>Team Search</span>
                  <p>May indulgence</p>
                   <input type="text" class="form" placeholder="Team Name" style="width:60%; height:30px"/>
	            <input type="button"  class="btn btn-info" value="search" style="margin-left: 5px"/>
                </a>
              </li>
            </ul>
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
					    <div class="container">
					      <div class="row mt-mb-15">
					        
					        <c:forEach var="item" items="${list}" varStatus="loop">
						        <div class="col-lg-4 col-sm-6"><!-- post-item start -->
						          <div class="post-item">
						            <div class="thumb">
						            <c:if test="${! empty item.teamLogo }" var="isLogo">
						              <img src="/matching/Upload/${item.teamLogo }" alt="image" style="width:329px; height:231px"/>
					              	</c:if>
					              	<c:if test="${not isLogo}">
					              		<img src="https://us.123rf.com/450wm/martialred/martialred1507/martialred150700789/42614399-%EC%9D%91%EC%9A%A9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8-%EB%B0%8F-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%97%90-%EB%8C%80%ED%95%9C-%EC%B9%B4%EB%A9%94%EB%9D%BC-%EC%B4%AC%EC%98%81-%EB%9D%BC%EC%9D%B8-%EC%95%84%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98.jpg?ver=6" alt="image" style="width:329px; height:231px"/>
					              	</c:if>
						            </div>
						            <div class="content">
						              <ul class="post-meta">
						                <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
						              </ul>
						              <h3 class="post-title"><a href="#0"><label class="teamName" title="${item.teamName }" >${item.teamName }</label></a></h3>
						             	 지역 <span style="font-size: 1.3em; color: navy; font-weight: bold"> ${item.teamLoc }</span>
						              <p>Rating <span style="font-size: 1.3em; color: navy; font-weight: bold">${item.teamRating }</span> </p>
						              <button  type="button" class="btn btn-primary upModal"  data-toggle="modal" data-target="#myModal" title="${loop.index }">
									    Matching Start!
									  </button>
						            </div>
						          </div>
						        </div><!-- post-item end -->
					        </c:forEach>
					      </div>
					      
					    </div>
	 				 </section>
                   </div>
                 </div><!-- card end -->
                  
                
              </div>
			<div class="tab-pane fade" id="soloMatch" role="tabpanel" aria-labelledby="all-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" data-target="#one-collapseOne" aria-expanded="true" aria-controls="one-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <div class="card-body">
                        <div class="statistics-result-table d-flex">
                          <div class="statistics-team-area">
                            <h3 class="title">Selter Team</h3>
                            <div class="team-list-area">
                              <button type="button">All team<i class="fa fa-angle-down"></i></button>
                              <ul class="team-list">
                                <li>
                                  <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                  <span class="team-name">Brazil</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                  <span class="team-name">Uruguay</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                  <span class="team-name">USA</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                  <span class="team-name">Koria</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                  <span class="team-name">argentina</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                  <span class="team-name">swizerland</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                  <span class="team-name">england</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                  <span class="team-name">germany</span>
                                </li>
                              </ul>
                            </div>
                          </div><!-- statistics-team-area end -->
                          <div class="statistics-result-area">
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                    <span class="team-name">Brazil</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                    <span class="team-name">Uruguay</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                    <span class="team-name">USA</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                    <span class="team-name">koria</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                    <span class="team-name">argentina</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                    <span class="team-name">swizerland</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                    <span class="team-name">england</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                    <span class="team-name">germany</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                          </div><!-- statistics-result-area end -->
                        </div><!-- statistics-result-table end -->
                      </div>
                    </div>
                  </div><!-- card end -->
                  
                </div>
              </div>
              <div class="tab-pane fade" id="search" role="tabpanel" aria-labelledby="all-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link"  aria-expanded="true" aria-controls="one-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <div class="card-body">
                        <div class="statistics-result-table d-flex">
                          <div class="statistics-team-area">
                            <h3 class="title">Selter Team</h3>
                            <div class="team-list-area">
                              <button type="button">All team<i class="fa fa-angle-down"></i></button>
                              <ul class="team-list">
                                <li>
                                  <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                  <span class="team-name">Brazil</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                  <span class="team-name">Uruguay</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                  <span class="team-name">USA</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                  <span class="team-name">Koria</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                  <span class="team-name">argentina</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                  <span class="team-name">swizerland</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                  <span class="team-name">england</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                  <span class="team-name">germany</span>
                                </li>
                              </ul>
                            </div>
                          </div><!-- statistics-team-area end -->
                          <div class="statistics-result-area">
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                    <span class="team-name">Brazil</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                    <span class="team-name">Uruguay</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                    <span class="team-name">USA</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                    <span class="team-name">koria</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                    <span class="team-name">argentina</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                    <span class="team-name">swizerland</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                    <span class="team-name">england</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                    <span class="team-name">germany</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                          </div><!-- statistics-result-area end -->
                        </div><!-- statistics-result-table end -->
                      </div>
                    </div>
                  </div><!-- card end -->
                  
                </div>
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
  

