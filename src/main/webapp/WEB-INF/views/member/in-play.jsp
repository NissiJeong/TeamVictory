<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>

$(function(){
	const es6 ='es6';
	console.log(es6);
	console.log("64" > 27);
	console.log( Number("64") > 54);
	
	scoreStyle('main');
	
	$('#btnJoin').click(function() {

		if (confirm($('#bettingPoint').val() + " 배팅허쉴?????")) {
			alert('배팅완료!!!!');
		}
	}); 
	
	

	
		
$('#viewTarget').css('display','none');

 //$('#viewTarget').hide();
		


		 
 		var toggle=false;
   		//var  content =$('#viewTarget');
   		
   		//console.log(content.html());
    
		  $('.aa').click(function(){
			 if(!toggle){
				
			   //$('#viewTarget').css('display','block').css('border','1px solid red');
				 $('#viewTarget').show(300);
			 }
			 else{
				// $('#viewTarget').css('display','none');
				 $('#viewTarget').hide(300);
			 }
			 toggle=!toggle;
		 });  
		  
		  
		  
		  
		  
		  //상세보기 클릭시 3번째 열에 있는 값 읽어오기 
		
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
			   
<<<<<<< HEAD
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
								//선택한 상세보기의  tr 
							  var base =  $('.view').eq(viewIndex).parent().parent();
								console.log( base.next().find('.tenViewHome tr:last').find('th').text().match("경기전적"));
							 if (base.next().find('.tenViewHome tr:last').find('th').text().match("경기전적") !=null  ){
								 base.next().find('.tenViewHome tr:last').find('th').css({color : 'black' , 'font-size': '18px'});
								} 
							 if (base.next().find('.tenViewAway tr:last').find('th').text().match("경기전적") !=null  ){
								 base.next().find('.tenViewAway tr:last').find('th').css({color : 'black' , 'font-size': '18px'});
								} 
								
						 	}//// if
						
						}, //success
						error:function(data){
							console.log('에러 : '+data); // 에러코드 출력 
							console.log('에러 : '+data.responseText); //  에러내용 출력
						}
					}); // ajax 
					
					
					
					$(this).text('접기')  // 문자열 변경
=======
			$.ajax({
				url:"<c:url value='/Team/Matching/viewJsonArray.do'/>",
				data : { hometeam :  home, awayteam : away,'_csrf':'${_csrf.token}'},
				type : 'post',
				 dataType: 'json',
				 // 서버로부터 받은 데이터와 클릭한 <span>태그의 인덱스를  함수의 매개변수로 넘긴다.
				success : function(data){bettingView(data,veiwIndex,home,away);},
				error:function(data){
					console.log('에러 : '+data); // 에러코드 출력 
					console.log('에러 : '+data.responseText); //  에러내용 출력
				}
			}); // ajax 
			$(this).text('접기')  // 문자열 변경
>>>>>>> branch 'master' of https://github.com/NissiJeong/TeamVictory.git
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
									homeContent +="<td>"+element.GAMEDATE+"</td><td>"+element.AWAYTEAM+"</td><td><span class='tenHS'>"+element.HOMESCORE+"</span> : <span class='tenAS'>"+element.AWAYSCORE+"</span></td>";
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
						awayContent +="<td>"+element.GAMEDATE+"</td><td>"+element['AWAYTEAM']+"</td><td><span class='tenHS'>"+element.HOMESCORE+"</span> : <span class='tenAS'>"+element.AWAYSCORE+"</span></td>";
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
		
			
		 //선택한 상세보기 행의 바로밑에 <tr>추가 
		$('.view').eq(viewIndex).parent().parent().after(topBar+homeContent+awayContent+"</div></td></tr>");
	
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
							//'font-weight' : 'bold',
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
		
	}
</script>
<style>
 .slash  td{
	background: url('//cdn.zetawiki.com/png/slash.png');
	background-size: 100% 100%;
}

.table td, .table th {
  
    vertical-align: middle;
   }
   
  
</style>

<!-- banner-section start -->
<section class="breadcum-section" >
	<div class="breadcum-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcum-content text-center"  >

						<h3 class="title">In Play</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">home</a></li>
							<li class="breadcrumb-item active">in play</li>
						</ol>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- banner-section end -->


<!-- play-section start -->
<section class="play-section section-padding section-bg">
	<div class="container" style="border:1px solid red">

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
							data-toggle="tab" href="#football" role="tab"
							aria-controls="football" aria-selected="false"> <i
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
						<li class="nav-item"><a class="nav-link" id="bascketball-tab"
							data-toggle="tab" href="#bascketball" role="tab"
							aria-controls="bascketball" aria-selected="false"> <i
								class="flaticon-basketball"></i> <span>bascketball</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" id="baseball-tab"
							data-toggle="tab" href="#baseball" role="tab"
							aria-controls="baseball" aria-selected="false"> <i
								class="flaticon-bat"></i> <span>baseball</span>
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
						<div class="tab-pane fade show active" id="all" role="tabpanel"aria-labelledby="all-tab">
							<div class="play-table-part">
								<div class="play-table">
									<table class="table table-bordered" id="all-table"style="table-layout: fixed">
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
    										<td colspan="7">등록된 경기 스케줄이 없습니다. </td>  				
    										</tr>
    									</c:if>
    									<c:if test="${! isEmpty}">
    										<c:forEach var="item" items="${list}" varStatus="loop" >
	    										
		    										<fmt:parseNumber value="${item.homeScore}" type="number" var="homeScore"/>
			    							        <fmt:parseNumber value="${item.awayScore}" type="number" var="awayScore"/>
		    							        
    										<tr>
	    										<td>${loop.count}</td>
	    										

	    										<td><span class="pr-1">
	    										<fmt:formatDate value="${item.gameDate}" pattern="yy.MM.dd"/></span><span class="pr-1">${item.gameDay}</span><span>${item.time}</span>
	    										</td>
	    										 
	    										<td><span class="pr-2 ht" >${item.teamname}</span><span class="pr-2 hs" >${item.homeScore == -1 ? '':item.homeScore}</span>:<span class="px-2 as" >${item.awayScore == -1 ? '':item.awayScore}</span><span class="at">${item.awayTeam}</span>
	    										
	    										<td>
	    										<!--  -1이면 아직 경기시작전  안나옴 . -1보다 크면 경기결과 나온후 -->
	    										<c:if test="${item.homeScore  >= 0 && item.awayScore >= 0  }" var="isScore">
	    							            	 <c:choose>
		    							             	<c:when test="${homeScore  > awayScore}">
		    							             		<span style="width: 75%; color: #ffffff; line-height: 30px; background-color: #007bff; border-radius: 7px;">홈승</span>
		    							             	</c:when>
		    							             	<c:when test="${homeScore < awayScore}">
		    							             		<span style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #CD2E57; border-radius: 7px;">홈패</span>
		    							             	</c:when>
		    							             	<c:when test="${homeScore  == awayScore}">
		    							             		<span style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #9a9798; border-radius: 7px;">무</span>
		    							             	</c:when>
	    							            	</c:choose>
	    							            </c:if>
	    							            <c:if test="${! isScore}">
	    							            		<span style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #f76c12e8; border-radius: 7px;">예정</span>
	    							            </c:if>
	    										</td> 
	    										<td>기타</td>
	    										<td>
	    										<button type="button" class="btn btn-warning bettingBtn" data-toggle="modal" data-target="#myModal"
													style="height: 33px;" ><!-- data-toggle="modal" data-target="#myModal" -->
														배 팅 <span class="badge badge-secondary ml-2">15</span>
														</button>
	    										 </td>
	    										<td><span class="view" style="cursor:pointer;">상세보기</span></td>
    											</tr>
    										</c:forEach>
    									</c:if>
    									
    									
    									
    									
    									
    									
    									
    									
											<!--  1행 -->

											<tr>
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


											<tr>
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
												<td><a href="<c:url value='/Team/Matching/BettingView.do'/>">상세보기</a></td>
											</tr>
											<!-- 2행끝 -->


											<!-- 3행 시작 -->

												<tr >
												<!-- 번호 -->
												<td>3</td>
												<!-- 경기 날짜  -->
												<td><span bat="1">2019-10-10</span></td>
												<!--  팀 vs 팀  -->
												<td>넥센&nbsp;&nbsp;<span class="blue"></span>&nbsp;&nbsp;
													: &nbsp;&nbsp;<span class="red"></span>&nbsp;&nbsp;한화
												</td>
												<!-- 경기결과 -->
												<td><!-- <span style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #9a9798; border-radius: 7px;">무</span> -->
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
											
												<td  colspan="7">
												
												<div class="row" > 
												 		<div class="col-md-12">   
												 		
															<div class="d-flex bg-light justify-content-center pt-4 w-100"  style="height:150px">
														  		<div class="p-2 border w-25">A팀</div>
														  		<div class="p-2 border mx-5 align-self-center">VS</div>
														  		<div class="p-2 border w-25">B팀</div>
															</div>
												 		
												 		</div>  
												</div>    <!-- row --> 
												
											       
													<div class="col-md-12 text-center mt-3 bg-info" style="font-weight: bold;height: 50px;line-height: 50px;">
 													최근 10경기 전적 
 													</div>
 													
 														<div class="row mt-2" style="border:1px solid red">
 															<div class="col-6">
 																<table class="table table-bordered">
 																	<thead>
																	    <tr class="text-center">
																	      <th style="background-color: #000040;color:white;" colspan="4">Home</th>
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
																	      <tr ><td colspan="4">경기가 존재하지 않습니다.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	      <tr><td>.</td><td>.</td><td>.</td><td>.</td></tr>
																	  
																	      
																	       
																	       
																	       
																	       
																	       
																	       
																	       
																	       
																	       
																	        <tr class="text-center"> 
																	            <th style="background-color: #c6c8ca" colspan="4">10전  3승  3무  4패</th>
																	        </tr>
																	        
																	   </tbody>
 																
 																</table>
 															
 															</div>  <!-- table 감싸는 div -->
 														
 														
 														
 														
 														
 														<!-- AWAY 테이블 -->
 														
 															<div class="col-6 ml-0">
 																<table class="table table-bordered">
 																	<thead>
																	    <tr class="text-center">
																	      <th style="background-color: #000040;color:white;" colspan="4">AWAY</th>
																	    </tr>
																	         
																	   	<tr class="text-center" style="display: ">  
																	   	    
																	    	<th class="w-25">경기일시</th> 
																	    	<th class="w-25">상대팀</th>  
																	    	<th class="w-25">스코어</th>
																	    	<th class="w-25">결과</th>
																	   	</tr>
																	   </thead> 
																	   <tbody>
																		 <tr class="text-center"> 
																	         <td style="height: 15px;overflow: hidden;">2019-10-08</td>  
																	         <td>SK</td>
																	         <td>3 : 0 </td>
																	         <td ><span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #cd2e57; border-radius:7px; ">승</span></td>
																	       </tr>
																	        <tr class="text-center"> 
																	            <th style="background-color: #c6c8ca" colspan="4">10전  3승  3무  4패</th>
																	        </tr>
																	   </tbody>
 																
 																</table>
 															
 															</div>  <!-- table 감싸는 div -->
 														
 														
 														
 														
 														
 														</div><!-- row -->
 													</td>
 													
											</tr> <!--  상세보기 tr끝 -->
	                                         



										</tbody>
									</table>

								</div> <!--  play-table end -->
								

							</div>
							<!--  전체선택 끝  -->
							
						
						
	<!--  ==================================================================  -->


	
						
<div class="row" id="viewTarget"> 					

<div class="table-responsive col-md-6 ml-0">
  <!--  A팀 테이블 -->
    <table class="table  table-bordered " class="A_tableMatchTen" >
    <thead>
    <tr class="text-center">
      <th style="background-color: #000040;color:white;" colspan="4">Home</th>
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
          <td>3 : 0 </td>
          <td ><span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #6495ED; border-radius:7px; ">승</span></td>
          </tr>
           
          <tr class="text-center"> 
            <th style="background-color: #c6c8ca" colspan="4">10전  3승  3무  4패</th>
          </tr>
           
          </tbody>
          
    </table> 
</div>
	
		
<div class="table-responsive col-md-6">
<!--  B팀 테이블 -->
    <table class="table table-bordered" id="B_tableMatchTen">
    <thead > 
	    <tr class="text-center">  
	      <th  style="background-color: #000040;color:white;" colspan="4">Away</th>
	    </tr>
	   	<tr class="text-center" >
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
		          <td>3 : 0 </td> 
		          <td><span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #CD2E57; border-radius:7px; ">패</span></td>
	          </tr>
	          <tr class="text-center"> 
            <th style="background-color: #c6c8ca" colspan="4">10전  6승   4패</th>
          </tr>
          </tbody>
    </table>
</div>									   

		 </div>		<!--  상세보기 row -->						
				
							
							
							
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
																class="custom-control-label" for="customRadio1">HOME</label>
														</div>
														<div class="progress "
															style="height: 25px; width: 70%; float: right;">
															<div
																class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
																style="width: 40%; font-weight: bold;">40%</div>
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
																class="custom-control-label " for="customRadio2">AWAY</label>
														</div>
														<div class="progress"
															style="height: 25px; width: 70%; float: right;">
															<div
																class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
																style="width: 30%; font-weight: bold;">30%</div>
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
																class="custom-control-label " for="customRadio3">DRAW</label>
														</div>
														<div class="progress"
															style="height: 25px; width: 70%; float: right;">
															<div
																class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
																style="width: 20%; font-weight: bold;">20%</div>
														</div>
													</div>
												</div>
												<!--  row -->

												<!-- Radio -->
												<!--Basic textarea-->
												<!--  <div class="row">
          <textarea type="text" id="form79textarea" class="md-textarea form-control" rows="3"></textarea>
        </div> -->
												<div class="row">
													<div
														class="input-group input-group-sm mt-3 offset-md-8 offset-sm-7  col-md-4 col-sm-5">
														<input type="text" class="form-control text-right"
															style="border: 1px solid gray" id="bettingPoint">
														<div class="input-group-append">
															<button class="btn btn-secondary " type="submit"
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





