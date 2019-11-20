<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.username" var="id" />
<sec:authentication property="principal.authorities" var="auth" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- <script src="https://kit.fontawesome.com/1d75ae587d.js" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>


$(function(){
	
	// 역순으로 진행된다   선택자중에 맨위의 tr은 last()로 접근  맨아래는 first()로 접근
	//console.log( $('.all-tbody #test_tr').prevAll().first().html())	
		
	 //배팅카운트 롱폴링 
	callComet();
	


	//스프링 시큐리티 아이디 가져오기
	 console.log( $('#auth').val() )
	 //myBettingList( $.trim($('#auth').val()));
	 scoreStyle('main');
	 
	 var target =  $('.all-tbody tr:eq(0)');
	 target.data("test", { isManual: false } );  // 배팅완료 확인용 data저장 
	  console.log('데이타 세팅 : ',target.data("test").isManual);
	
	 
	 
	  var testnum = 99.9876543;
     var  number = 1/7*100;
	  testnum.toFixed(0); // 100 출력
	  testnum.toFixed(5); // 99.98765 출력
	 
	 /*
	    (function poll() {
    	    $.ajax({
    	        url: "<c:url value='/Team/Matching/longpoll.do'/>"  ,
    	        type: 'POST',
    	        dataType: 'json',
    	        beforeSend : function(xhr)
                {  // 데이터를 전송하기 전에 헤더에 csrf값을 설정한다
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
    	        success: function(data) {
    	        
    	            console.log(data);
    	            
    	        },
    	        timeout: 3000,
    	        complete: setTimeout(function() { poll(); }, 6000),
    	        error:function(data){
					console.log('에러 : '+data); // 에러코드 출력 
					console.log('에러 : '+data.responseText); //  에러내용 출력
					
				   }
    	    });
    	})();
	  */
	
	   //show 는 버튼이 누르고 즉시 , shwon은 모달이 보여진 후에 
	$('#myModal').on('show.bs.modal', function (e) {
		   modalinitialize();
		   var targetBtn = e.relatedTarget
		   var modal_ID = e.target.id;
		 
		   var clickBtn;
		   
		    if (targetBtn != null)
		    {
		       btnIndex =  $('.bettingBtn').index( targetBtn); //클릭한 배팅버튼 인덱스 
		       $('.modal-header').data("index",btnIndex);// 모달 닫을때도  index를 사용하기위해 세팅
		       clickBtn  = $('.bettingBtn').eq(btnIndex);
		      /*
		       console.log('이벤트를 발생시킨 target =>  ',e.target);
		       console.log('이벤트를 발생시킨의 target id=>',e.target.id)
		       console.log('현재 이벤트 발생되는 target=> ',e.currentTarget);
		       console.log('해당이벤트와 관련된 다른  Dom 요소 선택 =>',e.relatedTarget);
		       console.log('이벤트 대상이 가지고있는 값 =>' , e.data );
		       */
		       
		    }
		    var flag =  clickBtn.find('i').length !== 0 ? true : false;  // 배팅상태  확인 변수   i태그가 있는경우 =>  이미 배팅해서 체크된경우
		 	 var betObj={
					gamedate :  $.trim(clickBtn.parent().siblings(':eq(1)').find('.date').text()).replace(/\./g,'/') ,  // . dot 인식하도록
					stadium : $.trim(clickBtn.parent().prev().find('.stadium').data('value')), // data(key)로 읽어온다 data-value -> value가 key
			        time : $.trim(clickBtn.parent().siblings(':eq(1)').find('.time').text()).replace(':',''),
			        id : $.trim($('#auth').val()), 
			        home :  $.trim(clickBtn.parent().siblings(':eq(2)').find('.ht').text()) ,
			        away :   $.trim(clickBtn.parent().siblings(':eq(2)').find('.at').text())
			        
		 	 };
		  
			 
			  //모달창에 팀이름 설정
			  $('.modal-body :radio:eq(0)').next().text(betObj.home);
		  	  $('.modal-body :radio:eq(1)').next().text(betObj.away);
			 
		     console.log('flag '   , flag);
	
		     
		   
		 
		    

		    	
		
	
			$.ajax({
		  		 
					   url:  "<c:url value='/Team/Matching/BettingCheck.do'/>"  ,
					   data : { id : $('#auth').val(), gamedate : betObj.gamedate,
						   stadium : betObj.stadium , time :  betObj.time , '_csrf' : '${_csrf.token}',
							   state : flag, home : betObj.home , away: betObj.away  }  ,
					   type: 'post',
					   dataType: 'json',
					 //  contentType: ""  클라이언트 입장에서 내가 어떤 타입으로 보낸다는 의미
					   success : function(data){
						   if (data !== null  ) {
							   console.log('모달 show 서버로부터 받은 데이터',data);
							   
							    // 프로그래스바   표시 작업  / 함수
							    // 모달창이 떳을떄 선택한 경기의 배당및  퍼센트 세팅   Number(clickBtn.find('span').text())
						        progressState(data,data.totalCount);
						
							   
						       if (flag) { // 배팅을 한경우
									 alreadyBetting(data.already);
						       }
						       else {// 배팅 안한경우
						    	     // 회원 보유 마일리지 표시 
							    	   console.log('서버로부터 받은 마일리지 : '+data.POINT+' 마일리지 길이' ,data.POINT.length)
										
							    	   $('.nowPoint').before('<i class="fab fa-monero mr-2  pointFont"></i>');
									   $('.nowPoint').text(data.POINT);
										
									  if ( data.POINT.length  > 3) 
									   $('#bettingPoint').attr('maxlength',data.POINT.length +1);
									  else 
										$('#bettingPoint').attr('maxlength',data.POINT.length);
								
							  }
					     }//if
					},///success
						   error:function(data){
							console.log('에러 : '+data); // 에러코드 출력 
							console.log('에러 : '+data.responseText); //  에러내용 출력
							
						   }
					   
				   });  // ajax 
				 
						
		// 배팅 입력란에 숫자만 입력되도록
		$('#bettingPoint').on("keyup", function() {
		  $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		 
		});  
			
		 //배팅 모달창에서 참여버튼 클릭시
	  $('#btnJoin').click(function(){
		  //console.log( parseInt($('#bettingPoint').val().replace(',',''))  );
		 // 콤마제거함수 호출해서 반환값을 넘긴다.
	      console.log ( 'btnjoin 클릭이벤트'	,	 commaRemove($('#bettingPoint').val()) );
		  bettingJoin(betObj,target);
	  
	 });	
		 
		///프로그래스바 hover 
		
	
		
		 $(".progress").hover(function(){ //마우스 오버시
			  //$(this).find(".progress-bar:eq(0)").css('display','none');  // 퍼센트
			  //$(this).find(".progress-bar:eq(1)").css('display','').css({'color':'white','width':'100%'});  // 총마일리지 / 총원 
			
			  
			  $(this).find("div:eq(0)").css('display','none');  // 퍼센트
			  $(this).find("div:eq(1)").css('display','').css({'color':'white','line-height': 2});
			  
			},function(){ // 마우스 아웃 
				
				// $(this).find(".progress-bar:eq(0)").css('display','');
				// $(this).find(".progress-bar:eq(1)").css('display','none');
				 
				 $(this).find("div:eq(0)").css('display','');
				 $(this).find("div:eq(1)").css('display','none');
				 
		    });
		

 
});///////////////////////////////////////////////////////////







$('#myModal').on('hidden.bs.modal', function (e) {
			  var index = $('.modal-header').data("index");
			  /*
			  console.log('이벤트를 발생시킨 target =>  ',e.target);
		      console.log('이벤트를 발생시킨의 target id=>',e.target.id)
		      console.log('현재 이벤트 발생되는 target=> ',e.currentTarget);
		      console.log('해당이벤트와 관련된 다른  Dom 요소 선택 =>',e.relatedTarget);
		      console.log('이벤트 대상이 가지고있는 값 =>' , e.data ); 
		      console.log(target.data("test").isManual===false ? '배팅 안했음':'배팅 완료된상태');
			  console.log('data("index",btnIndex) : ',index );
		      */
		     var markerBtn  = $('.bettingBtn').eq(index);
			
			if ( target.data("test").isManual){ // true면 배팅
					  console.log(target.data("test").isManual+' 니까 배팅 완료');
						 
						$('.bettingBtn').eq(index).find('span').after('<i class="fas fa-check chk blinking"></i>');
						
						setTimeout(function(){  //반짝반짝 3초후에 삭제 
						$('.bettingBtn').eq(index).find('span').next().removeClass('blinking');
						},3500);
						
						var count = $('.bettingBtn').eq(index).find('span').text();
						//$('.bettingBtn').eq(index).find('span').text(Number(count)+1);
						
				 }
					
			  else {
						console.log('배팅 안한거다 : ', target.data("test").isManual);
					  }
				target.data("test").isManual=false;
				
				
		  });  //////////////////////////////////////////////////////	
 
  
 
		  
		  
		  
		 
		
		var  clickView = $('.view').click(function(){
	
			//console.log($(this).parent().siblings(':eq(2)').text());
			//console.log($(this).parent().siblings(':eq(2)').find('#hs').text());
			//console.log($(this).parent().siblings(':eq(2)').find('.ht').text());
			
			var home= $(this).parent().siblings(':eq(2)').find('.ht').text() ;  //클릭한 행의 홈팀명
			var away= $(this).parent().siblings(':eq(2)').find('.at').text() ;  // 클릭한 행의 어웨이팀명
			//선택된 <span>태그중에서  클릭한 <span>태그의 인덱스 
			var viewIndex =clickView.index(this);
			console.log('홈팀 : %s , 어웨이 : %s',home,away);
			 console.log ('클릭한 상세보기의 인덱스', 	clickView.index(this) ); 
			
		   if ($(this).text()=='상세보기'){
			   
			  
			       
			   
					$.ajax({
						url:"<c:url value='/Team/Matching/viewJsonArray.do'/>",
						data : { hometeam :  home, awayteam : away, '_csrf' : '${_csrf.token}'},
						type : 'post',
						 dataType: 'json',
						 // 서버로부터 받은 데이터와 클릭한 <span>태그의 인덱스를  함수의 매개변수로 넘긴다.
						success : function(data){
							if(data != null) {
							bettingView(data,viewIndex,home,away);
							}
						 	if ( $('.tenViewHome').is(':visible')  &&  $('.tenViewAway').is(':visible')  ) {
						 		
								var tenView = ['.tenViewHome','.tenViewAway'];
									scoreStyle(tenView);
									
									// 셀 높이 55로 맞추기
									$('.tenViewHome tr, .tenViewAway tr').each(function(){
										$(this).css('height','55px');
									});
								//선택한 상세보기의 바로밑에  <tr>태그
							  var base =  $('.view').eq(viewIndex).parent().parent();
								//전적표시 
								console.log( base.next().find('.tenViewHome tr:last').find('th').text().match("경기전적"));
							 if (base.next().find('.tenViewHome tr:last').find('th').text().match("경기전적") !=null  ){
								 base.next().find('.tenViewHome tr:last').find('th').css({color : 'black' , 'font-size': '18px'});
								} 
							 if (base.next().find('.tenViewAway tr:last').find('th').text().match("경기전적") !=null  ){
								 base.next().find('.tenViewAway tr:last').find('th').css({color : 'black' , 'font-size': '18px'});
								} 
								
							 $('span.colon').css({ 'font-weight':'bold'});
							 $('.awayViewTable , .homeViewTable').css('table-layout','fixed');
							// $('td.opponent').css({'overflow': 'hidden',  'text-overflow': 'ellipsis', 'white-space': 'nowrap'});
							 
							if ( //$('.tenViewHome').is(':visible') && 
									$('.tenViewHome').children('tr:eq(0)').children('td:eq(0)').text().length !== 0 ) {
								$('.tenViewHome , .tenViewAway').children('tr').not('tr:last').each(function(){
									  if ($(this).children('td:eq(0)').text() !=='.')
									  $(this).children('td:eq(1)').addClass('opponent');
								});
								
							}
							/*
							$( ".opponent" ).tooltip({
								
					 		      show: {
					 		        effect: "slideDown",
					 		        delay: 250,
					 		      
					 		      }
					 		    });
							*/
						
						
						
							$('.opponent').hover(function(){
								console.log(isOverflowed(this));
								if(isOverflowed(this)){
								  $(this).attr('title',$(this).text());
								}
							}); 
							
							
						 	}//// if
						
						 	// console.log('tenViewTR 길이', $(".all-tbody .tenViewTR").length);
						 	
						}, //success
						error:function(data){
							console.log('에러 : '+data); // 에러코드 출력 
							console.log('에러 : '+data.responseText); //  에러내용 출력
						}
					}); // ajax 
					
					
					
					$(this).text('접기')  // 문자열 변경
		   }  // if
		   else{
			 $(this).parent().parent().next().remove();
			   $(this).text('상세보기');
		   }
		});  
		  
	});/////////  onload
   
	//상세보기
	var  bettingView = function(data,viewIndex,home,away) {
		 //var json =JSON.stringify(data);
		  
	     var tenRecord ={
	    		 win : 0, draw : 0, lose : 0 
	     };
		  var homeContent;
		  var awayContent;
		 var top ="<tr><td colspan='7'><div class='row'><div class='col-md-12'><div class='d-flex bg-light justify-content-center pt-4 w-100' style='height:150px'>"
		 "<div class='p-2 border w-25'>"+home+"</div>"
		 +"<div class='p-2 border mx-5 align-self-center'>VS</div>"
		 +"<div class='p-2 border w-25'>B팀</div>"
		 +"</div></div></div></td></tr>";
		 
		 var topBar ="<tr class='tenViewTR'><td colspan='7'>"+
		 "<div class='col-md-12 text-center mt-3 bg-info' style='height: 50px;line-height: 50px;font-size:20px'>"
		 +"최근 10경기 전적</div>";
			 
 /*        homeContent="<div class='row mt-3'><div class='col-6'><table class='table'><thead>"+
       "<tr class='text-center'><th style='background-color: #000040;color:white;' colspan='4'>"+home+"</th></tr>"+
       "<tr class='text-center'><th class='w-25'>경기일시</th><th class='w-25'>상대팀</th><th class='w-25'>스코어</th><th class='w-25'>결과</th></tr></thead><tbody>"; */
     
/*          awayContent="<div class='col-6'><table class='table'><thead>"+
      "<tr class='text-center'><th style='background-color: #000040;color:white;' colspan='4'>"+away+"</th></tr>"+
      "<tr class='text-center'><th class='w-25'>경기일시</th><th class='w-25'>상대팀</th><th class='w-25'>스코어</th><th class='w-25'>결과</th></tr></thead><tbody>"; */
      console.log ( '서버로부터 받은 데이터 =>', data);
		$.each(data,function(key,value){
			if(key == 'home') {
				  homeContent="<div class='row mt-3'><div class='col-6'><table class='table homeViewTable'><thead>"+
			       "<tr class='text-center'><th style='background-color: #000040;color:white;' colspan='4'>"+home+"</th></tr>"+
			       "<tr class='text-center'><th class='w-25'>경기일시</th><th class='w-25'>상대팀</th><th class='w-25'>스코어</th><th class='w-25'>결과</th></tr></thead><tbody class='tenViewHome'>";
				var hRecord =  Object.keys(value).length;
				console.log ( '홈팀의 레코드 개수',hRecord);
				console.log ( 'value 개수 ',value.length);
				      	if(hRecord== 0 ){  // 새로등록한 팀의 첫매치인경우 기록이 없음
				    	   // 등록된 경기가 없음을 표시해준다.
					    	   for (var i=0; i<10; i++){
					    		 //  if (i == 0) homeContent += "<tr class='text-center'><td colspan='4'>경기전적이 존재하지 않습니다.</td></tr>";
					    		 
					    			   homeContent += "<tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>";
					    		 
					    	   }
					    	  //homeContent += "</tbody></table></div>";
					    	 
				     		}//if
				     	else{
					//  등록된경기가 한개이상인경우 
					 		$.each(value,function(i,element){ //  db에 등록된 경기만  넣어준다
								 //element가  홈팀에 관한 하나의  데이터 레코드
									//console.log(element['RESULT']=='lose')
									//console.log('인덱스 %s  |  배열 : %s',i,element.GAMEDATE); // 홈스코어 표시
									homeContent +="<tr class='text-center'>";
									homeContent +="<td>"+element.GAMEDATE+"</td><td>"+element.AWAYTEAM+"</td><td><span class='tenHS'>"+element.HOMESCORE+"</span><span class='colon mx-1'>:</span><span class='tenAS'>"+element.AWAYSCORE+"</span></td>";
								  if(element.HOMESCORE > element.AWAYSCORE ){
									  homeContent +="<td><span style='width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #007bff; border-radius:7px;'>승</span></td></tr>";
									   tenRecord.win = tenRecord.win+1;
								  }
								  else if( element.HOMESCORE < element.AWAYSCORE){
									  homeContent +="<td><span style='width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #cd2e57; border-radius:7px;'>패</span></td></tr>";
									  tenRecord.lose = tenRecord.lose+1;
								  }
								  else {
									  homeContent +="<td><span style='width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #9a9798; border-radius:7px;'>무</span></td></tr>";
									  tenRecord.draw = tenRecord.draw+1;
								  }
							 });   //////////////
							 
							
							  //  1경기 이상 10경기보다 이하인경우 
							 if (hRecord !=0 && 10 - hRecord >=1){
								// 여기서부터는 10 -  value.length 한 값만큼 for문을 돌려서<td>. </td> 점으로 표시한다.
								      for(var i=0; i<10-hRecord; i++){
								    	  homeContent +="<tr ><td>.</td><td>.</td><td>.</td><td>.</td></tr>";
								      }
							 }
							 /*
							   <tr class="text-center"> 
					            <th style="background-color: #c6c8ca" colspan="4">10전  3승  3무  4패</th>
					        </tr>
					        */
							
				      		} //else 
				      		 homeContent += "<tr class='text-center'><th style='background-color: #99b8da' colspan='4'>";
						      homeContent+= tenMatchtString(tenRecord,value);
							 homeContent+="</th></tr></tbody></table></div>";
				       
				      	console.log(JSON.stringify(tenRecord));
				      
				      	
			
					} //if 
					
					
			else {  // away팀
				var aRecord =  Object.keys(value).length;
			awayContent="<div class='col-6'><table class='table awayViewTable'><thead>"+
		      "<tr class='text-center'><th style='background-color: #000040;color:white;' colspan='4'>"+away+"</th></tr>"+
		      "<tr class='text-center'><th class='w-25'>경기일시</th>"
		     +"<th class='w-25'>상대팀</th><th class='w-25'>스코어</th><th class='w-25'>결과</th></tr></thead><tbody class='tenViewAway'>";
		      
				console.log ( '어웨이팀의 레코드 개수',aRecord);
			
					if(value.length ==0 ){   //경기전적이 없는 경우
						for (var i=0; i<10; i++){
				    		  // if (i == 0) awayContent += "<tr class='text-center'><td colspan='4'>경기전적이 존재하지 않습니다.</td></tr>";
				    		
				    			   awayContent += "<tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>";
				    		 
				    	   }// if
						//awayContent += "</tbody></table></div>";
						
					}//if
			     	else{   // 1경기 이상 있는경우
			     		$.each(value,function(i,element){ //  db에 등록된 경기만  넣어준다
			     	
						 //element가  홈팀에 관한 하나의  데이터 레코드
						//console.log(element['RESULT']=='lose')
						//console.log('인덱스 %s  |  배열 : %s',i,element.GAMEDATE); // 홈스코어 표시
						awayContent +="<tr class='text-center'>";
						awayContent +="<td>"+element.GAMEDATE+"</td><td>"+element['AWAYTEAM']+"</td><td><span class='tenHS'>"+element.HOMESCORE+"</span><span class='colon mx-1'>:</span><span class='tenAS'>"+element.AWAYSCORE+"</span></td>";
					  if(element.HOMESCORE > element.AWAYSCORE ){
						  awayContent +="<td><span style='width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #007bff; border-radius:7px;'>승</span></td></tr>";
						  tenRecord.win = tenRecord.win+1;
					  }
					  else if( element.HOMESCORE < element['AWAYSCORE']){
						  awayContent +="<td><span style='width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #cd2e57; border-radius:7px;'>패</span></td></tr>";
						  tenRecord.lose = tenRecord.lose+1;
					  }
					  else {
						  awayContent +="<td><span style='width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #9a9798; border-radius:7px;'>무</span></td></tr>";
						  tenRecord.draw = tenRecord.draw+1;
					  }
				 });   //////////////
				   
				  if(10- aRecord >0) {
					// 여기서부터는 10 -  value.length 한 값만큼 for문을 돌려서<td>. </td> 점으로 표시한다.
					      for(var i=0; i<10-aRecord; i++){
					    	  awayContent +="<tr ><td>.</td><td>.</td><td>.</td><td>.</td></tr>";
					      }
				  }// if
			
	      		} //else 
	      			
	      	  awayContent += "<tr class='text-center'><th style='background-color: #99b8da' colspan='4'>";
			  awayContent+= tenMatchtString(tenRecord,value);
			  awayContent+="</tbody></table></div>";
				
	      			tenRecord.win=0;
	      			tenRecord.draw=0;
	      			tenRecord.lose=0;
					
			}//else
		});//// 바깥 each (k,v)
		
		 console.log ( ' [ 함수안 ] 클릭한 상세보기 인덱스 '+viewIndex);
		 var content="<tr><td colspan='7'> 동적으로 추가한 행 </td></tr>";
		console.log( $('.view').eq(viewIndex).text()+viewIndex);  // 상세보기 + 인덱스
		console.log ($('.view').eq(viewIndex).parent().parent().get(0).tagName); //tr
 		/* 
		if($('.tenViewTR').length > 1){
 			$('.tenViewTR').not($('.view').eq(viewIndex).parent().parent().next('.tenViewTR')).remove();
 			
		 }
		*/	
		 //선택한 상세보기 행의 바로밑에 <tr>추가 
		$('.view').eq(viewIndex).parent().parent().after(topBar+homeContent+awayContent+"</div></td></tr>");
		
		 // 상세보기 클릭시 다른 상세보기 <tr> 사라지도록 하기 
		 var trIndex = $(".all-tbody .tenViewTR").index($('.view').eq(viewIndex).parent().parent().next('.tenViewTR'));
		 //console.log('trIndex==== ',trIndex);
	
		 if ($('.all-tbody .tenViewTR').length > 1 ){
			
			 $('.all-tbody .tenViewTR').not($('.all-tbody .tenViewTR').eq(trIndex)).prev().find('span.view').text('상세보기');
			 $('.all-tbody .tenViewTR').not($('.all-tbody .tenViewTR').eq(trIndex)).remove();
			}
		
	}; /// bettingView
	
	function scoreStyle(position){ 
		
		//console.log(  $('.all-tbody > tr').length);
		//console.log($('.all-tbody tr:gt(0)').length)
		//console.log($('.all-tbody > tr:eq(0) td:eq(2)').text());
		//$('.all-tbody > tr:eq(0) td:eq(0)').css('background-color','red');
			
		/// =====   승리팀 글자색 , 글자크기 변경 
		if (position == 'main'){
				$('.all-tbody tr').each(function(){
			
				 //홈스코어 
				 var homeScore = parseInt( $(this).children(':eq(2)').find('.hs').text());
				 //어웨이 스코어
				 var awayScore = parseInt($(this).children(':eq(2)').find('.as').text());
				 //console.log($(this).children(':eq(2)').find('#hs').text());
			  
				 if(homeScore > awayScore) {
					 $(this).children(':eq(2)').find('.hs').css({
							//'font-weight' : 'bold',
							color : 'blue'
						});
				 }
				 else if(homeScore < awayScore) {
					 $(this).children(':eq(2)').find('.as').css({
							//'font-weight' : 'bold',
							color : 'red'
						});
				 }
			 }); 
		} /// if
		
		else {
			console.log('매개변수가 main이 아닐떄 : ',position[0], position[1] );
			
			for(var i=0; i<position.length; i++){
				console.log(position[i]+' tr');
			$(position[i]+' tr').each(function(){
				
			  // .tenViewHome tr  또는 .tenViewAway tr	
				 //홈스코어 
				 var homeScore = Number($(this).children(':eq(2)').find('.tenHS').text());
				 //어웨이 스코어
				 var awayScore = Number($(this).children(':eq(2)').find('.tenAS').text());
				 if(homeScore > awayScore) {
					 $(this).children(':eq(2)').find('.tenHS').css({
						  
							color : 'blue'
						});
					 }
				 else if(homeScore < awayScore) {
					 $(this).children(':eq(2)').find('.tenAS').css({
							//'font-weight' : 'bold',
							
							color : 'red'
						});
					 }
				 });  //each
			}////for
			
		}///else 
	  
	}	///////  scoreStyle
	

	
	
 function tenMatchtString(obj,val){
		var content='';
			if (val.length != 0) {
					content+="<span class='pr-2'>"+val.length+"전</span>";
				}
			else {
				content +="경기전적이 존재하지않습니다.";
				return content;
			}
	 	if(obj.win > 0 )
	 		content +="<span  class='pr-2' style='color: blue'>"+obj.win+"승</span>";
		if(obj.draw >0)
			content +="<span class='pr-2' style='color:white'>"+obj.draw+"무</span>";
		if(obj.lose >0)
				content +="<span style='color: red'>"+obj.lose+"패</span>";
				
				
		  return content;
		
	};
	
	
	function bettingJoin(obj,target){
		 console.log('배팅조인 함수안에서 ' ,obj);
		 
		console.log ( '반환받은 배팅포인트의 자료형 %s   :  '	, typeof ( commaRemove($('#bettingPoint').val()) ) );
		var point = commaRemove( $('#bettingPoint').val() ) 
		console.log ('배팅조인 함수안에서 point :',point)
			
	if ($(':radio:checked').length === 0){  // 경기결과  체크 아무것도 안되었을때
		
		 Swal.fire({
			 // position: 'top-end',
			  type: 'warning',
			  title: '경기결과를 선택해주세요',
			   
			  showConfirmButton: true,
			  timer: 3000
			});	  ///////////////// 
		 
		 return;
		}///////// if 
	
		  			 
		 	  //  포인트 미입력 
	 else	if ( $('#bettingPoint').val().length === 0 ) {
						Swal.fire({
						  
						  html: '<span style="font-weight:bold;font-size:18px">배팅할 포인트를 입력해주세요</span>',
						  confirmButtonText: '확인',
						});
						
						
						return false;
				}//////////
				
				//  포인트 0 입력
		else if (  point === 0){
					Swal.fire({
						  
						  html: '<span style="font-weight:bold;font-size:16px" class="pt-2">배팅에 참여하시려면 최소 1포인트이상 배팅하셔야합니다.</span>',
						  confirmButtonText: '확인',
						});
					  $('#bettingPoint').val('');
					  $('#bettingPoint').focus();
				 return false;
		}/////////////////////
				
				
	else  {     // 경기결과 선택 O  , 배팅포인트 1이상 입력 O 
				
			
				//var  start =  $('.nowPoint').text().indexOf(':')+2;
			  // var nowPoint = Number($('.nowPoint').text().substring(start, $('.nowPoint').text().length));
			  	var nowPoint = Number($.trim($('.nowPoint').text()));
				// 마일리치 초과입력시
				//  if( Number($('#bettingPoint').val().replace(',','').replace(',','')) > Number($('.nowPoint').text().substring(start, $('.nowPoint').text().length))){
				if ( point  >  nowPoint ) {
					Swal.fire({
							 
							  html: '<span style="font-weight:bold;font-size:18px">보유 마일리지 초과입니다.</span>',
							  
							  confirmButtonText: '확인',
							});
					  $('#bettingPoint').val('');
					  $('#bettingPoint').focus();
					  return false;
				  }//// if
				
				  else  { // 보유마일리 초과하지 않았을떄.
						 	Swal.fire({
									  title:$('.modal-body :radio:checked').next().text()+'\n'+'[ '+addCommas(point)+' ]'+' 포인트',
									  html: '<sapn class="swalBetting">'+'배팅후에는 개인 변심으로 인한 취소가 불가능합니다.'+'</span>',
									  type: 'warning',
									  showCancelButton: true,
									  confirmButtonColor: '#30a0d6',
									  cancelButtonColor: '#fd5850',
									  cancelButtonText: "취소",
									  confirmButtonText: '확인',
								}).then((result) => { 
									//console.log('result의 값',result);
								// 확인을 누르면 result.value는 true  취소 누르면 result.dismiss = cancel
								  if (result.value) {
								  /////////////   
								        console.log("이거 나오면 배팅이다 ")
									  	obj.choice = $.trim($('.modal-body :radio:checked').next().text());
									  	obj.point = point //Number($.trim($('#bettingPoint').val()));
							
									   console.log(  JSON.stringify(obj));
									
								  /////////////////
									    Swal.fire(
									      '배팅 완료',
									    '[ '+addCommas(point)+' ]'+' 포인트를 배팅하셨습니다.',
									      'success'
									    )///
						   
									    $('#bettingPoint').val('');
  									        $.ajax({
  									        	url : "<c:url value='/Team/Matching/BetingPoint.do'/>",
  									         	 beforeSend : function(xhr){
									            	  //데이터 전송전에 헤더에 csrf값 설정
  									         		 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
									            },
  									        	data : /*{ gamedate : obj.date, stadium : obj.statium , 
  									        		time : obj.time , id : obj.id,selectteam: obj.choice , 
  									        		mileage : obj.point, '_csrf': '${_csrf.token}' }  */
  									        	JSON.stringify(obj)  ,
  									        	contentType : 'application/json',
  									        	type : 'post',
  									        	dataType : 'json',
  									        	success : function(data){
  									        		
  									        	
  									        		console.log('차감된 포인트 :' ,data);
  									        		
  									        	  if(data != null){
  									        		  
  									        	    
  									        	            // 보유마일리지 - 배팅마일리지 =  마일리지최신화
  									        		    	$('.nowPoint').text( $.trim(nowPoint)-point);
  									        		    
  									        		    	// 배팅후 프로그래스바 / 배당률 최신화.
  									        		    	
  									        		         progressState(data,data['totalCount']);
  									        		    	$(':text').attr('disabled',true);
  		  									        		$(':button:contains("참여")').attr('disabled',true);
  		  									        		
  		  									        		// 배팅 유무 판별 boolean 
  		  									        		target.data("test").isManual=true;
  									        		    	

  									        		   
  									        	  }
  									        
  									        	     // true 변경
  									        	
  									        		/*var div = $("#btnJoinParent");
  									        		jQuery.data( div, "test", {
  									        		  first: 16,
  									        		  last: "pizza!"
  									        		});
  									        	console.log( jQuery.data( div, "test" ).first );
  									        	console.log( jQuery.data( div, "test" ).last );  */
  									        	
  									          // console.log('ajax 안에서 data()',$('.nowPoint').data("val") );
  									        //	$('.nowPoint').data("val","true");
  									        	
  									        	}, //success
  									        	error:  function(data){
  									        		console.log('에러 : '+data);
  									        		console.log('에러 : '+data.responseText);
  									        	}
  									        });// ajax
  									   
									    
									 }///if
							});  ///  then
						
		 	     
					}///  insert / update 하는  ajax else 
		     
				}////else
	     
	} ///////////////////////////////////


	//3자리마다 콤마 
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	};//////////////////////////


	function commaRemove(point){
		//replace는 없는문자를 바꾸려고하면 원래문자열 그대로 유지 
		
		console.log ('매개변수 point : ', point);
		 var start=0;
	     var 	noComma;
			noComma = $.trim(point).replace(",",'');
			console.log('noComma', noComma);
			for(var i=0; i<noComma.length; i++){
				 if( noComma[i].charCodeAt(0) > 48){
				     start = i;
				     console.log ('콤마잘랐을떄 최종반환 noComma :' , noComma.substring(start));
				     return Number($.trim(noComma).substring(start));
				 }
			}
			
			return 0;
		
	};///////////////////////////////
	
	//상세보기시 팀이름 오버플로우 체크 
	function isOverflowed(element){
		
	    return element.scrollHeight > element.clientHeight || element.scrollWidth > element.clientWidth;
	}///////////////////////
	

		// html 온로드 이후 회원이 배팅한 목록에 체크표시 나오게
		function myBettingList(id){
			  var list=[];
				$('.all-tbody tr:lt(17)').each(function(index){	
					if ( Number($(this).children("td:eq(5)").find('span').text()) > 0)  {//배팅이 0보다 큰경우
						
						list.push({index : index, 
							       gamedate : $.trim($(this).children('td:eq(1)').find('span:eq(0)').text()),//경기일시
			 				       time : $.trim($(this).children('td:eq(1)').find('span:eq(2)').text().replace(':','')), // 시간
							       stadium : $.trim($(this).children('td:eq(4)').find('.stadium').data('value')), // 장소 data(key)로 읽어온다 data-value -> value가 key
							       bet : 'YES' }) 
					}
				});
				
				  console.log(list)
				  console.log( JSON.stringify(list));
				  $.ajax({
				   url:  "<c:url value='/Team/Matching/MyBettingList.do'/>"  ,
				   data : /*{ id : $('#auth').val(),data : list,'_csrf' : '${_csrf.token}'} */
					 JSON.stringify(list) ,
				   type: 'post',
				   contentType : "application/json; charset=utf-8",
				   beforeSend: function (request)
		            {
		                request.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                request.setRequestHeader("id" , $('#auth').val());
		            },
		           // traditional: true,
					   dataType: 'json',
					   success : function(data){
						  
					     
						  //filter 함수는 true를 리턴하면 해당아이템을 새로운 배열의 아이템으로 추가한다.
						  var myBettingArray =	  data.filter(function(item){
						 // console.log ( '  item.bet' , typeof(item.bet));
					     return item.bet === id;
					  });
						 console.log(myBettingArray);
						  $.each(myBettingArray, function(key, value) {
								console.log (value.index);
							$('.all-tbody tr:lt(17)').eq(value.index).children("td:eq(5)").find('span').after("<i class='fas fa-check chk'></i>");
							})
						
				   },///success
				   error:function(data){
						console.log('에러 : '+data); // 에러코드 출력 
						console.log('에러 : '+data.responseText); //  에러내용 출력
					}
		   
		  		 });  // ajax 
		  		 
	 		}///////////////////  myBettingList ()
	
	function  alreadyBetting(obj){
		//console.log( obj)
		var test = 'GAMEDATE';
		/*
		console.log(obj[test])
		$.each(obj,function(key){
		console.log(key);
		})
		*/
		
		 $('.modal-body :radio').each(function(){
			if ( $(this).next().text() === obj.SELECTTEAM)
				$(this).prop('checked','checked');
			else 
				$(this).attr('disabled',true);
		}); 
		
		$('.modal-body').find('p strong').text('[ '+obj.MILEAGE+' ]'+' 포인트 배팅하셨습니다.');
		$(':text , #btnJoin ').attr('disabled',true);
		$('.pointFont').remove();
	 }/////////////////////
	
    	function modalinitialize(flag){
    		
	    	//배팅포인트 입력란 초기화
	    	 $('.modal-body :radio').each(function(){
				$(this).prop('checked',false);
				$(this).attr('disabled',false);
	     	}); 
	    	  $('#bettingPoint').val('');
	    	  $('#bettingPoint , #btnJoin').attr('disabled',false);
			  $('.modal-body').find('p strong').text('Your Choice').end().find('i.pointFont').remove();
		      $('.nowPoint').text('');
		     // $('.modal-body').find('i').remove();
		     $('.modal-body .progress-bar').css('width','0%').text('');
		      
		     $('.custom-control-label').next('span').text('');
		      
		  
    	}///////////////////////
	 		
    
	 		
	function    progressState(dataObj,count){  // 프로그래스바 상태 ( 총 배팅포인트 / 총인원수 )
    	
	  console.log ('키 목록 : ', Object.keys(dataObj));
	  console.log( '밸류 목록 :', Object.values(dataObj) )
	   // console.log('내가 누른 경기의 총 배팅수 :', count);
	     
	
	 	  	var  state ={};
	 	   	var  over=[];
			var totalPoint = 0;
		    
    	 	$.each(dataObj,function(key,value){
    	 		  //console.log(key)
    	 	if( key ==="away" || key ==="draw" || key ==="home") {
    	 		 state[key+'Point'] =  dataObj[key]['TOTALMILEAGE'];
   	 			 totalPoint += dataObj[key]['TOTALMILEAGE'];
   	 			 
   	 			    
   	 			 over.push(Math.round(((dataObj[key]['MEMBERCOUNT'])/count*100)));
   	 			 
    	 		 $('.modal-body .'+key+'ProgressBar').css('width',((dataObj[key]['MEMBERCOUNT'])/count*100)+'%')
    	 		  .text(Math.round(((dataObj[key]['MEMBERCOUNT'])/count*100))+'%');
    	 		 // div로 할떄 
    	 		$('.modal-body .'+key+'ProgressBar_Info').find('strong:eq(0)').text(dataObj[key].TOTALMILEAGE).next().text(dataObj[key].MEMBERCOUNT);
    	 		  
    	 		 //  progress-bar로할떄
    	 		 //$('.modal-body .'+key+'ProgressBar_Info').html(dataObj[key].TOTALMILEAGE+' 포인트 / '+dataObj[key].MEMBERCOUNT+' 명');
    	 		 
	    	 	
    	 	}//if
    	 });//each
    	
    	  var sum = over.reduce((a, b) => a + b, 0);
    	  if (sum >100){
    		 	over.sort(function(a, b) { // 내림차순
    			    return b - a;
    			});
    		 	
    		   $('.modal-body .progress-bar').each(function(){
    			   
    		   
    			   parseInt($(this).text()) === over[0] ? $(this).text(parseInt($(this).text())-(sum-100)+'%') : false;
    		   });
    	   }
    	 	console.log (state);
    	    console.log (over)
    	 
    	 for(var key in state){
 			// ※※※  for~ in문에서 키에대한 값을 가져올때는 반드시 [key]로 접근한다.
 			var  dividend = Number(totalPoint / state[key]);
 		    $('.modal-body .modal_'+key.substr(0,4)+'Span').text(dividend.toFixed(2));
 		}
    	 
    	 	 
    }///////////////////////////////////////
    
    
    
    
	function callComet(){
		
		var pollArr=[];
		$('.all-tbody   tr:lt(17)').each(function(index){	
			
			pollArr.push({index :index , 
				       gamedate : $.trim($(this).children('td:eq(1)').find('span:eq(0)').text()),//경기일시
 				       time : $.trim($(this).children('td:eq(1)').find('span:eq(2)').text().replace(':','')), // 시간
				       stadium : $.trim($(this).children('td:eq(4)').find('.stadium').data('value')) // 장소 data(key)로 읽어온다 data-value -> value가 key
				       });
	
	  });
		  $.ajax({ 
			  
					type:"POST",
					beforeSend : function(xhr) {
						 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
				url:"<c:url value='/Team/Matching/longpoll.do'/>",
				dataType:"json",
				data: JSON.stringify(pollArr),
				 contentType : "application/json; charset=utf-8",
				success:callBack,
				error:function(data){
				    console.log('에러 : '+data); // 에러코드 출력 
					console.log('에러 : '+data.responseText); //  에러내용 출력
				},
				complete:function(xhr,status,error){
		 
				}
		
			});//// ajax
		 
	};/// callComet


		function callBack(data){
				 console.log(data);
		  
				 $.each(data, function(key, value) {
						
					$('.all-tbody tr:lt(17)').eq(key).children("td:eq(5)").find('.badge').text(value['count']);
					})
				
				
				setTimeout(function(){                                      
					
				}
					callComet();
					},10000);    //loop
		};
	
		
		/*

		(function poll(){ 
			
		
			var pollArr=[];
			$('.all-tbody   tr:lt(17)').each(function(index){	
				
				pollArr.push({index :index , 
		       gamedate : $.trim($(this).children('td:eq(1)').find('span:eq(0)').text()),//경기일시
			       time : $.trim($(this).children('td:eq(1)').find('span:eq(2)').text().replace(':','')), // 시간
		       stadium : $.trim($(this).children('td:eq(4)').find('.stadium').data('value')) // 장소 data(key)로 읽어온다 data-value -> value가 key
		       });
		
		  });
					
			
		
			$.ajax({
				type:"POST",
				beforeSend : function(xhr) {
					 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
		
				url:"<c:url value='/Team/Matching/longpoll.do'/>",
				
				dataType: "json", 
				data: JSON.stringify(pollArr),
				 contentType : "application/json; charset=utf-8",
				success: function(data){ 
					
				
					 $.each(data, function(key, value) {
							
					$('.all-tbody tr:lt(17)').eq(key).children("td:eq(5)").find('.badge').text(value['count']);
					});
				
					
				}, 
				timeout: 3000,
				complete: 
					
					setTimeout(function() { poll(); }, 6000)  });
			   })();
	
*/
	
   
    
    
</script>
<style>
.slash  td {
	background: url('//cdn.zetawiki.com/png/slash.png');
	background-size: 100% 100%;
}

.table td, .table th {
	vertical-align: middle;
}

.swalBetting {
	color: red;
}

.chk {
	color: #3fb721;
	font-size: 30px;
	position: relative;
	top: -41px;
	left: -35px;
}

.opponent {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}


/*  반짝반짝  */
.blinking{
	-webkit-animation:blink 0.8s ease-in-out infinite alternate;
    -moz-animation:blink 0.8s ease-in-out infinite alternate;
    animation:blink  0.8s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}


.pointFont {
	font-size: 30px;
	color: #217f84;
	position: relative;
	top: 4.5px;
}

.clickColor {
	background-color: red
}

[class^="flaticon-"]:before, [class*=" flaticon-"]:before, [class^="flaticon-"]:after,
	[class*=" flaticon-"]:after {
	font-size: 60px;
}

.show {
	display:;
}

.hide {
	display: none;
}
</style>

<%-- <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/> --%>

<!-- banner-section start -->
<section class="breadcum-section">
	<div class="breadcum-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcum-content text-center">

						<h3 class="title">In Play</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">home</a></li>
							<li class="breadcrumb-item active">in play</li>
						</ol>
						<input type="hidden" value="${id}" id="auth" />
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- banner-section end -->


<!-- play-section start -->
<section class="play-section section-padding section-bg">
	<div class="container" style="border: 1px solid red">

		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section-header text-center">
					<h2 class="section-title">Bet & Playing Now</h2>
					<p>On insensible possession oh particular attachment at
						excellence in. The books arose but miles happy she.</p>
				</div>
			</div>
		</div>


		<div class="row">
			<!--  row  -->
			<div class="col-lg-12">
				<div class="online-play-tab-part">
					<ul class="nav justify-content-around" id="myTab" role="tablist">

						<li class="nav-item"><a class="nav-link active" id="all-tab"
							data-toggle="tab" href="#all" role="tab" aria-controls="all"
							aria-selected="true"> <i class="flaticon-trophy"></i> <span>All
									sports</span>
						</a></li>


						<li class="nav-item"><a class="nav-link" id="football-tab"
							data-toggle="tab" href="#" role="tab" aria-controls="football"
							aria-selected="false"> <i
								class="flaticon-soccer-ball-variant"></i> <span>football</span>
						</a></li>
						<!--  
              <li class="nav-item">
                <a class="nav-link" id="cricket-tab" data-toggle="tab" href="#cricket" role="tab" aria-controls="cricket" aria-selected="false">
                  <i class="flaticon-cricket"></i>
                  <span>cricket</span>
                </a>
              </li>
           
              <li class="nav-item">
                <a class="nav-link" id="tennis-tab" data-toggle="tab" href="#tennis" role="tab" aria-controls="tennis" aria-selected="false">
                  <i class="flaticon-tennis-racket"></i>
                  <span>tennis</span>
                </a>
              </li>
              -->
						<!--  
						<li class="nav-item"><a class="nav-link" id="bascketball-tab"
							data-toggle="tab" href="#bascketball" role="tab"
							aria-controls="bascketball" aria-selected="false"> <i
								class="flaticon-basketball"></i> <span>bascketball</span>
						</a></li>
-->
						<li class="nav-item"><a class="nav-link" id="baseball-tab"
							data-toggle="tab" href="#" role="tab" aria-controls="baseball"
							aria-selected="false"> <i class="flaticon-bat"></i> <span>baseball</span>
						</a></li>
						<!--  
              <li class="nav-item">
                <a class="nav-link" id="more-tab" data-toggle="tab" href="#more" role="tab" aria-controls="more" aria-selected="false">
                  <i class="flaticon-menu"></i>
                  <span>more sports</span>
                </a>
              </li>
              -->
					</ul>

					<div class="tab-content" id="myTabContent">
						<!--  전체 선택 -->
						<div class="tab-pane fade show active" id="all" role="tabpanel"
							aria-labelledby="all-tab">
							<div class="play-table-part">
								<div class="play-table">
									<table class="table table-bordered" id="all-table"
										style="table-layout: fixed">
										<thead id="th1">
											<tr>
												<th class="" style="width: 5%;">번호</th>
												<th style="width: 13%;">경기일시</th>
												<th class="team-name" style="width: 20%;">홈 VS 어웨이</th>
												<th style="width: 8%;">경기결과</th>
												<th style="width: 10%;">비고</th>
												<th class="choice-team" style="width: 12%;">배팅</th>
												<th class="" style="width: 13%;">상세보기</th>
											</tr>
										</thead>
										<tbody class="all-tbody">
											<c:if test="${empty list}" var="isEmpty">
												<!-- 테이블 데이터 시작  -->

												<tr>
													<td colspan="7">등록된 경기 스케줄이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${! isEmpty}">
												<!-- 현재날짜  -->
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm"
													var="formatNow" />

												<c:forEach var="item" items="${list}" varStatus="loop">
													<!--  날짜  Date타입으로 파싱 및  패턴 지정  -->
													<fmt:parseDate value="${item.gameDate} ${item.time}"
														pattern="yyyy-MM-dd HH:mm" var="gameDate" />
													<fmt:formatDate value="${gameDate}"
														pattern="yyyy-MM-dd HH:mm" var="formatGameDate" />

													<!--  스코어  숫자로 파싱  -->
													<fmt:parseNumber value="${item.homeScore}" type="number"
														var="homeScore" />
													<fmt:parseNumber value="${item.awayScore}" type="number"
														var="awayScore" />

													<tr>

														<td>${loop.count}</td>


														<td><c:if test="${formatNow < formatGameDate }"
																var="isDeadLine">
																<span class="pr-1 date"> <fmt:formatDate
																		value="${item.gameDate}" pattern="yy.MM.dd" /></span>
																<span class="pr-1">${item.gameDay}</span>
																<span class="time">${item.time}</span>
															</c:if> <c:if test="${! isDeadLine}">
																<!--  경기일시가 현재날짜보다 이전인 경우  (날짜가 지났을때) -->
																<span class="pr-1 date" data-value="deadline"> <fmt:formatDate
																		value="${item.gameDate}" pattern="yy.MM.dd" /></span>
																<span class="pr-1">${item.gameDay}</span>
																<span class="time">${item.time}</span>
															</c:if></td>
														<td><span class="pr-2 ht">${item.teamname}</span><span
															class="pr-2 hs">${item.homeScore == -1 ? '':item.homeScore}</span>:<span
															class="px-2 as">${item.awayScore == -1 ? '':item.awayScore}</span><span
															class="at">${item.awayTeam}</span>
														<td>
															<!--  -1이면 아직 경기시작전  안나옴 . -1보다 크면 경기결과 나온후 --> <c:if
																test="${item.homeScore  >= 0 && item.awayScore >= 0  }"
																var="isScore">
																<c:choose>
																	<c:when test="${homeScore  > awayScore}">
																		<span
																			style="width: 75%; color: #ffffff; line-height: 30px; background-color: #007bff; border-radius: 7px;">홈승</span>
																	</c:when>
																	<c:when test="${homeScore < awayScore}">
																		<span
																			style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #CD2E57; border-radius: 7px;">홈패</span>
																	</c:when>
																	<c:when test="${homeScore  == awayScore}">
																		<span
																			style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #9a9798; border-radius: 7px;">무</span>
																	</c:when>
																</c:choose>
															</c:if> <c:if test="${! isScore}">
																<span
																	style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #f76c12e8; border-radius: 7px;">예정</span>
															</c:if>
														</td>

														<td><c:if test="${item.category=='축구'}">
																<i class="far fa-futbol fa-2x"></i>
															</c:if> <c:if test="${item.category=='야구'}">
																<i class="fas fa-baseball-ball fa-2x"></i>
															</c:if> <span class="stadium" data-value="${item.stadium}"></span>
														</td>
														<td>
															<button type="button" class="btn btn-warning bettingBtn"
																data-toggle="modal" data-target="#myModal"
																style="height: 33px; width: 90.53px">
																<!-- data-toggle="modal" data-target="#myModal" -->
																배 팅<span class="badge badge-secondary ml-2">${item.count}</span>

																<c:if test="${item.bettingConfirm}">
																	<i class="fas fa-check chk"></i>
																</c:if>

															</button>
														</td>
														<!-- <i class="fas fa-sign-out-alt fa-rotate-90"></i> -->
														<td><span class="view" style="cursor: pointer;">상세보기</span></td>
													</tr>
												</c:forEach>
											</c:if>








											<!--  1행 -->

											<tr class="test_tr">
												<td>
													<!-- <div class="team-name-part"> </div> --> 1
												</td>
												<!-- 경기 날짜  -->
												<td><span bat="1">2019-10-10</span></td>
												<!--  팀 vs 팀  -->
												<td>기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp;
													: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
												</td>
												<!-- 경기결과 -->
												<td>
													<!--  <span class="badge badge-primary">승</span> --> <span
													style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #007bff; border-radius: 7px;">승</span>
												</td>
												</td>
												<!-- 비고 -->
												<td>우천</td>
												<!-- 배팅-->
												<td class="bettingTd"><span id="bettingSpan"
													class="badge badge-warning" data-toggle="modal"
													data-target="#myModal">배팅</span></td>

												<!-- 상세보기 -->
												<td id="oneView">상세보기</td>
											</tr>
											<!-- 1행끝 -->


											<tr class="test_tr">
												<!-- 번호 -->
												<td>2</td>
												<!-- 경기 날짜  -->
												<td><span bat="1">2019-10-10</span></td>
												<!--  팀 vs 팀  -->
												<td>SK&nbsp;&nbsp;<span class="blue">2</span>&nbsp;&nbsp;
													: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp;롯데
												</td>
												<!-- 경기결과 -->
												<td>
													<!-- <div style="background-color: #847d7e;-webkit-border-radius: 5px; color:white; border:1px red solid; flex: 0 0 calc(100% - 15px);">무</div> -->
													<span
													style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #CD2E57; border-radius: 7px;">패</span>
												</td>


												<!-- 비고 -->
												<td>기타</td>
												<td>
													<!-- 배팅-->
													<button type="button" class="btn btn-warning"
														style="height: 33px;" data-toggle="modal"
														data-target="#myModal">
														배 팅 <span class="badge badge-secondary ml-2">15</span>
													</button>
												</td>


												<!-- 상세보기 -->
												<td><a
													href="<c:url value='/Team/Matching/BettingView.do'/>">상세보기</a></td>
											</tr>
											<!-- 2행끝 -->


											<!-- 3행 시작 -->

											<tr class="test_tr">
												<!-- 번호 -->
												<td>3</td>
												<!-- 경기 날짜  -->
												<td><span bat="1">2019-10-10</span></td>
												<!--  팀 vs 팀  -->
												<td>넥센&nbsp;&nbsp;<span class="blue"></span>&nbsp;&nbsp;
													: &nbsp;&nbsp;<span class="red"></span>&nbsp;&nbsp;한화
												</td>
												<!-- 경기결과 -->
												<td>
													<!-- <span style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #9a9798; border-radius: 7px;">무</span> -->
												</td>
												<!-- 비고 -->
												<td></td>
												<td>
													<!-- 배팅--> 배팅

												</td>

												<!-- 상세보기 -->
												<td><span class="aa" style="cursor: pointer;">상세보기</span></td>
											</tr>
											<!-- 3행끝 -->

											<!-- 상세보기 <tr> 안에 시작 -->
											<tr>

												<td colspan="7">

													<div class="row">
														<div class="col-md-12">

															<div
																class="d-flex bg-light justify-content-center pt-4 w-100"
																style="height: 150px">
																<div class="p-2 border w-25">A팀</div>
																<div class="p-2 border mx-5 align-self-center">VS</div>
																<div class="p-2 border w-25">B팀</div>
															</div>

														</div>
													</div> <!-- row -->


													<div class="col-md-12 text-center mt-3 bg-info"
														style="font-weight: bold; height: 50px; line-height: 50px;">
														최근 10경기 전적</div>

													<div class="row mt-2" style="border: 1px solid red">
														<div class="col-6">
															<table class="table table-bordered">
																<thead>
																	<tr class="text-center">
																		<th style="background-color: #000040; color: white;"
																			colspan="4">Home</th>
																	</tr>

																	<tr class="text-center">

																		<th class="w-25">경기일시</th>
																		<th class="w-25">상대팀</th>
																		<th class="w-25">스코어</th>
																		<th class="w-25">결과</th>
																	</tr>
																</thead>
																<tbody>
																	<!-- <tr class="text-center"> 
																	         <td><span>19.10.08</span><small style="">07:20</small></td>  
																	         <td>SK</td>
																	         <td>3 : 0 </td>
																	         <td ><span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #007bff; border-radius:7px; ">승</span></td>
																	       </tr> -->
																	<tr>
																		<td colspan="4">경기가 존재하지 않습니다.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>
																	<tr>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																		<td>.</td>
																	</tr>











																	<tr class="text-center">
																		<th style="background-color: #c6c8ca" colspan="4">10전
																			3승 3무 4패</th>
																	</tr>

																</tbody>

															</table>

														</div>
														<!-- table 감싸는 div -->





														<!-- AWAY 테이블 -->

														<div class="col-6 ml-0">
															<table class="table table-bordered">
																<thead>
																	<tr class="text-center">
																		<th style="background-color: #000040; color: white;"
																			colspan="4">AWAY</th>
																	</tr>

																	<tr class="text-center" style="display:">

																		<th class="w-25">경기일시</th>
																		<th class="w-25">상대팀</th>
																		<th class="w-25">스코어</th>
																		<th class="w-25">결과</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="text-center">
																		<td style="height: 15px; overflow: hidden;">2019-10-08</td>
																		<td>SK</td>
																		<td>3 : 0</td>
																		<td><span
																			style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #cd2e57; border-radius: 7px;">승</span></td>
																	</tr>
																	<tr class="text-center">
																		<th style="background-color: #c6c8ca" colspan="4">10전
																			3승 3무 4패</th>
																	</tr>
																</tbody>

															</table>

														</div>
														<!-- table 감싸는 div -->





													</div> <!-- row -->
												</td>

											</tr>
											<!--  상세보기 tr끝 -->




										</tbody>
									</table>

								</div>
								<!--  play-table end -->


							</div>
							<!--  전체선택 끝  -->



							<!--  ==================================================================  -->




							<div class="row" id="viewTarget">

								<div class="table-responsive col-md-6 ml-0">
									<!--  A팀 테이블 -->
									<table class="table  table-bordered " class="A_tableMatchTen">
										<thead>
											<tr class="text-center">
												<th style="background-color: #000040; color: white;"
													colspan="4">Home</th>
											</tr>

											<tr class="text-center">

												<th class="w-25">경기일시</th>
												<th class="w-25">상대팀</th>
												<th class="w-25">스코어</th>
												<th class="w-25">결과</th>
											</tr>
										</thead>

										<tbody>
											<tr class="text-center">
												<td>2019-10-08</td>
												<td>SK</td>
												<td>3 : 0</td>
												<td><span
													style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #6495ED; border-radius: 7px;">승</span></td>
											</tr>

											<tr class="text-center">
												<th style="background-color: #c6c8ca" colspan="4">10전
													3승 3무 4패</th>
											</tr>

										</tbody>

									</table>
								</div>


								<div class="table-responsive col-md-6">
									<!--  B팀 테이블 -->
									<table class="table table-bordered" id="B_tableMatchTen">
										<thead>
											<tr class="text-center">
												<th style="background-color: #000040; color: white;"
													colspan="4">Away</th>
											</tr>
											<tr class="text-center">
												<th class="w-25">경기일시</th>
												<th class="w-25">상대팀</th>
												<th class="w-25">스코어</th>
												<th class="w-25">결과</th>
											</tr>
										</thead>
										<tbody>
											<tr class="text-center">
												<td>2019-10-08</td>
												<td>기아</td>
												<td>3 : 0</td>
												<td><span
													style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #CD2E57; border-radius: 7px;">패</span></td>
											</tr>
											<tr class="text-center">
												<th style="background-color: #c6c8ca" colspan="4">10전
													6승 4패</th>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
							<!--  상세보기 row -->




							<!--  ================================================================== -->
















							<!-- The Modal -->
							<div class="modal fade" id="myModal">
								<div class="modal-dialog modal-dialog-centered modal-lg">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header text-center"
											style="background-color: #000040;">

											<h5 class="modal-title w-100" style="color: white">승부 예측</h5>

											<button type="button" class="close" data-dismiss="modal"
												style="color: white; font-weight: bold;">×</button>

										</div>

										<!--Body-->
										<div class="modal-body">

											<!-- Radio -->
											<p class="text-center mb-4">
												<strong>Your Choice</strong>
											</p>
											<div class="container">


												<div class="row">
													<div class="col-md mb-3">
														<div class="custom-control custom-radio"
															style="display: inline;">
															<input type="radio" id="customRadio1" name="customRadio"
																class="custom-control-input"> <label
																style="font-weight: bold;"
																class="custom-control-label homeLabel"
																for="customRadio1">HOME</label> <span
																class="modal_homeSpan ml-2"></span>
														</div>
														<div class="progress " id="homeProgressDiv "
															style="height: 25px; width: 70%; float: right;">

															<div
																class="progress-bar progress-bar-striped progress-bar-animated bg-danger homeProgressBar"
																style="font-weight: bold;"></div>

															<div
																class="text-center w-100  bg-info homeProgressBar_Info"
																style="display: none">
																<strong class="pr-1"></strong>포인트 / <strong class="px-1"></strong>명
															</div>

														</div>
													</div>
												</div>
												<!--  row -->


												<div class="row">
													<div class="col-md mb-3">
														<div class="custom-control custom-radio"
															style="display: inline">
															<input type="radio" id="customRadio2" name="customRadio"
																class="custom-control-input"> <label
																style="font-weight: bold;"
																class="custom-control-label awayLabel "
																for="customRadio2">AWAY</label> <span
																class="modal_awaySpan ml-2"></span>
														</div>
														<div class="progress"
															style="height: 25px; width: 70%; float: right;">
															<div
																class="progress-bar progress-bar-striped progress-bar-animated bg-danger awayProgressBar"
																style="font-weight: bold;"></div>

															<div
																class="text-center w-100 bg-info awayProgressBar_Info"
																style="display: none">
																<strong class="pr-1"></strong>포인트 / <strong class="px-1"></strong>명
															</div>
														</div>


													</div>
												</div>
												<!--  row -->


												<div class="row">
													<div class="col-md">
														<div class="custom-control custom-radio"
															style="display: inline;">
															<input type="radio" id="customRadio3" name="customRadio"
																class="custom-control-input"> <label
																style="font-weight: bold;"
																class="custom-control-label drawLabel "
																for="customRadio3">DRAW</label> <span
																class="modal_drawSpan ml-2"></span>
														</div>
														<div class="progress"
															style="height: 25px; width: 70%; float: right;">
															<div
																class="progress-bar progress-bar-striped progress-bar-animated bg-danger drawProgressBar"
																style="font-weight: bold;"></div>

															<div
																class="text-center  w-100 bg-info drawProgressBar_Info"
																style="display: none">
																<strong class="pr-1"></strong>포인트 / <strong class="px-1"></strong>명
															</div>
														</div>
													</div>
												</div>
												<!--  row -->

												<!-- Radio -->
												<!--Basic textarea-->
												<!-- 											 <div class="row">
          <textarea type="text" id="form79textarea" class="md-textarea form-control" rows="3"></textarea>
        </div> -->
												<div style="height: 50px"></div>

												<div class="row">
													<div class="col-md-3 col-sm-3">

														<span class="pt-4 ml-2 nowPoint"
															style="color: blue; font-weight: bold;" data-val="#"></span>
													</div>
													<div
														class="input-group input-group-sm mt-3 offset-md-5 offset-sm-7  col-md-4 col-sm-5">
														<input type="text" class="form-control text-right"
															style="border: 1px solid gray; height: 35px;"
															id="bettingPoint">
														<div class="input-group-append" id="btnJoinParent">
															<button class="btn btn-secondary " type="button"
																id="btnJoin">참여</button>
														</div>
													</div>
												</div>
												<!--  row -->

											</div>
											<!--  Container -->

										</div>

										<!--  Body -->
										<!-- Modal footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">닫기</button>
										</div>

									</div>
								</div>
							</div>


							<!--  축구 선택  -->

							<div class="tab-pane fade" id="football" role="tabpanel"
								aria-labelledby="football-tab">
								<div class="play-table-part">
									<div class="play-table">
										<table>
											<thead>
												<tr>
													<th class="team-name">name of the team</th>
													<th class="goal">goal</th>
													<th class="choice-team">bet your choose team</th>
													<th class="bet-num">total bet</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!--  축구 끝 -->



							<!-- 농구 선택  -->

							<div class="tab-pane fade" id="bascketball" role="tabpanel"
								aria-labelledby="bascketball-tab">
								<div class="play-table-part">
									<div class="play-table">
										<table>
											<thead>
												<tr>
													<th class="team-name">name of the team</th>
													<th class="goal">goal</th>
													<th class="choice-team">bet your choose team</th>
													<th class="bet-num">total bet</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-basketball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>



							<div class="tab-pane fade" id="baseball" role="tabpanel"
								aria-labelledby="baseball-tab">
								<div class="play-table-part">
									<div class="play-table">
										<table>
											<thead>
												<tr>
													<th class="team-name">name of the team</th>
													<th class="goal">goal</th>
													<th class="choice-team">bet your choose team</th>
													<th class="bet-num">total bet</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="flaticon-softball"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!--  야구 끝 -->

							<!--  농구 선택 -->
							<div class="tab-pane fade" id="more" role="tabpanel"
								aria-labelledby="more-tab">
								<div class="play-table-part">
									<div class="play-table">
										<table>
											<thead>
												<tr>
													<th class="team-name">name of the team</th>
													<th class="goal">goal</th>
													<th class="choice-team">bet your choose team</th>
													<th class="bet-num">total bet</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
												<tr>
													<td>
														<div class="team-name-part">
															<i class="fa fa-futbol-o"></i>
															<div class="content">
																<span class="name">Barcelona</span> <span class="name">Real
																	madrid</span>
															</div>
														</div>
													</td>
													<td>
														<div class="score">
															<span class="first-team-score">2</span> <span
																class="second-team-score">2</span>
														</div>
													</td>
													<td>
														<div class="choice-team-part">
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-down"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
															<div class="single-item">
																<span>Barcelona</span>
																<p>
																	2.5<i class="fa fa-angle-up"></i>
																</p>
															</div>
														</div>
													</td>
													<td><span class="bet-count-num">+19<i
															class="fa fa-angle-right"></i></span></td>
												</tr>
											</tbody>
											<!--  테이블바디-->
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- online-play-tab-part end -->
				</div>
			</div>

		</div>



	</div>
</section>
<!-- play-section end -->





