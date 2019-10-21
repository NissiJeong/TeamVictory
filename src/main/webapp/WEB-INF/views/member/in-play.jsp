<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>

$(function(){
	
	
	scoreStyle();
	
	$('#btnJoin').click(function() {

		if (confirm($('#bettingPoint').val() + " 배팅허쉴?")) {
			alert('배팅완료');
		}
	}); 
	
		
//$('#viewTarget').css('display','none');
 $('#viewTarget').hide();
		


		 
 		var toggle=false;
   		var  content =$('#viewTarget');
   		
   		console.log(content.html());
    
		  $('#aa').click(function(){
			 if(!toggle){
				
			  // $('#viewTarget').css('display','inline');
				 $('#viewTarget').show(300);
			 }
			 else{
				// $('#viewTarget').css('display','none');
				 $('#viewTarget').hide(300);
			 }
			 toggle=!toggle;
		 });  
		  
		  
		  
		  
		  
		  //상세보기 클릭시 3번째 열에 있는 값 읽어오기 
		$('.view').click(function(){
			//console.log($(this).parent().siblings(':eq(2)').text());
			console.log($(this).parent().siblings(':eq(2)').find('#hs').text());
		});  
		  
		  
		  
		  
		  
		  
		  
	});/////////  onload

	function scoreStyle(){ 
		
		
		//console.log(  $('.all-tbody > tr').length);
		//console.log($('.all-tbody tr:gt(0)').length)
		//console.log($('.all-tbody > tr:eq(0) td:eq(2)').text());
		//$('.all-tbody > tr:eq(0) td:eq(0)').css('background-color','red');
			
		/// =====   승리팀 글자색 , 글자크기 변경 
				$('.all-tbody tr').each(function(){
			
				 //홈스코어 
				 var homeScore = $(this).children(':eq(2)').find('#hs').text();
				 //어웨이 스코어
				 var awayScore = $(this).children(':eq(2)').find('#as').text();
				 //console.log($(this).children(':eq(2)').find('#hs').text());
			  
				 if(homeScore > awayScore) {
					 $(this).children(':eq(2)').find('#hs').css({
							//'font-weight' : 'bold',
							color : 'blue'
						});
				 }
				 else if(homeScore < awayScore) {
					 $(this).children(':eq(2)').find('#as').css({
							//'font-weight' : 'bold',
							color : 'red'
						});
				 }
				 
					
				 
			 });  
	}  
		
	


</script>
<style>
 

</style>

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
								class="flaticon-football"></i> <span>football</span>
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
								class="flaticon-softball"></i> <span>baseball</span>
						</a></li>
						<!--  
              <li class="nav-item">
                <a class="nav-link" id="more-tab" data-toggle="tab" href="#more" role="tab" aria-controls="more" aria-selected="false">
                  <i class="flaticon-menu"></i>
                  <span>more sports</span>
                </a>
              </li>
              -->
<<<<<<< HEAD
            </ul>
            
            <div class="tab-content" id="myTabContent">
            <!--  전체 선택 -->
              <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                <div class="play-table-part" >
                  <div class="play-table"  >
                    <table class="table table-bordered"  id="all-table"  style="table-layout: fixed">
                      <thead id="th1">
                        <tr >
                          <th class=""  style="width: 10%;">번호</th>
                          <th style="width: 13%;" >경기일시</th>
                          <th class="team-name " style="width: 20%;">팀 명</th>
                          <th style="width: 8%;">경기결과</th>
                          <th style="width: 10%;">비고</th>
                          <th class="choice-team" style="width: 12%;">배팅</th>
                          <th class="" style="width: 13%;">상세보기</th>
                        </tr>
                      </thead>
                      <!-- 테이블 데이터 시작  -->
                      <tbody class="all-tbody"> 
                      
                       <!--  1행 -->
                       
                        <tr>
                          <td>
                          <!-- <div class="team-name-part"> </div> -->  
                             1  
                          </td>
                           <!-- 경기 날짜  -->
                          <td> <span bat="1">2019-10-10</span></td>
                          <!--  팀 vs 팀  -->
                          <td>  기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp; : &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산</td>
                          <!-- 경기결과 --> 
                          <td>
                          <!--  <span class="badge badge-primary">승</span> -->
                          <span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #007bff; border-radius:7px; ">승</span> </td>
               			  </td>
               			   <!-- 비고 --> 
               			  <td>우천</td>
               			   <!-- 배팅--> 
                          <td class="bettingTd">  
                               <span id="bettingSpan" class="badge badge-warning" data-toggle="modal" data-target="#myModal">배팅</span>
                          </td>
                         
                          <!-- 상세보기 -->
                          <td> 상세보기</td>
                        </tr>  <!-- 1행끝 -->
                        
                        
                           <tr>
                           <!-- 번호 -->
                          <td>2</td>
                           <!-- 경기 날짜  -->
                          <td><span bat="1">2019-10-10</span></td>
                          <!--  팀 vs 팀  -->
                          <td> 
                          SK&nbsp;&nbsp;<span class="blue">2</span>&nbsp;&nbsp; : &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp;롯데
                          </td>
                          <!-- 경기결과 -->
                          <td>
                          <!-- <div style="background-color: #847d7e;-webkit-border-radius: 5px; color:white; border:1px red solid; flex: 0 0 calc(100% - 15px);">무</div> -->
                          <span style="width:75%; float:none;display:inline-block;color:#ffffff;line-height: 30px;background-color: #CD2E57; border-radius:7px; ">패</span>
                          </td>
                         
                        
                          <!-- 비고 --> 
                          <td> 기타</td>
                          <td>  <!-- 배팅--> 
                        <button type="button" class="btn btn-warning" style="height:33px;" data-toggle="modal" data-target="#myModal">
 							 배 팅 <span class="badge badge-secondary ml-2" >15</span>
						</button>
                          </td>
                          
                         
                          <!-- 상세보기 -->
                          <td><a href="<c:url value='/Team/Matching/BettingView.do'/>">상세보기</a></td>
                          </tr>  <!-- 2행끝 -->
                       
                        
                        
                           <tr>
                           <!-- 번호 -->
                          <td>3</td>
                           <!-- 경기 날짜  -->
                          <td><span bat="1">2019-10-10</span></td>
                          <!--  팀 vs 팀  -->
                          <td> 
                          넥센&nbsp;&nbsp;<span class="blue"></span>&nbsp;&nbsp; : &nbsp;&nbsp;<span class="red"></span>&nbsp;&nbsp;한화
                          </td>
                          <!-- 경기결과 -->
                          <td> 
                         <span style="height:100%; width:75%;display:inline-block;color:#ffffff;line-height: 30px;background-color: #9a9798; border-radius:7px; ">무</span> 
                          </td>
                          <!-- 비고 --> 
                          <td></td>
                          <td>  <!-- 배팅--> 
                        
 							 배팅
					
                          </td>
                         
                          <!-- 상세보기 -->
                          <td> 상세보기</td>
                          </tr>  <!-- 3행끝 -->
                        
                      
                        
                      </tbody>
                    </table>
                    
                  </div>  <!--  play-table end -->
                 
              </div>  <!--  전체선택 끝  -->
              
<<<<<<< HEAD
              
=======
             
>>>>>>> branch 'master' of https://github.com/NissiJeong/TeamVictory.git
              
              
     <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header text-center" style="background-color: #000040;">
       
          <h5 class="modal-title w-100" style="color:white">승부 예측</h5>
         
          <button type="button" class="close" data-dismiss="modal" style="color:white;font-weight: bold;">×</button>
       
        </div>
        
     <!--Body-->
      <div class="modal-body">
=======
					</ul>
>>>>>>> branch 'master' of https://github.com/NissiJeong/TeamVictory.git

					<div class="tab-content" id="myTabContent">
						<!--  전체 선택 -->
						<div class="tab-pane fade show active" id="all" role="tabpanel"aria-labelledby="all-tab">
							<div class="play-table-part">
								<div class="play-table">
									<table class="table table-bordered" id="all-table"style="table-layout: fixed">
										<thead id="th1">
											<tr>
												<th class="" style="width: 10%;">번호</th>
												<th style="width: 13%;">경기일시</th>
												<th class="team-name " style="width: 20%;">팀 명</th>
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
    										<c:forEach var="item" items="${list}" varStatus="loop" >
    										<tr>
	    										<td>${loop.count}</td>
	    										<td>${item.gameDate}</td>
	    										<td><span class="pr-2" id="ht">${item.homeTeam}</span><span class="pr-2" id="hs">${item.homeScore}</span>:<span class="px-2" id="as">${item.awayScore}</span><span id="at">${item.awayTeam}</span>
	    										<td>
	    							             <c:choose>
	    							             	<c:when test="${item.homeScore  > item.awayScore}">
	    							             		<span style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #007bff; border-radius: 7px;">홈승</span>
	    							             	</c:when>
	    							             	<c:when test="${item.homeScore  < item.awayScore}">
	    							             		<span style="width: 75%; float: none; display: inline-block; color: #ffffff; line-height: 30px; background-color: #CD2E57; border-radius: 7px;">패</span>
	    							             	</c:when>
	    							             	<c:when test="${item.homeScore  == item.awayScore}">
	    							             		<span style="height: 100%; width: 75%; display: inline-block; color: #ffffff; line-height: 30px; background-color: #9a9798; border-radius: 7px;">무</span>
	    							             	</c:when>
	    							            </c:choose>
	    										</td> 
	    										<td>기타</td>
	    										<td>
	    										<button type="button" class="btn btn-warning"
													style="height: 33px;" data-toggle="modal" data-target="#myModal">
														배 팅 <span class="badge badge-secondary ml-2">15</span>
														</button>
	    										 </td>
	    										<td><span class="view">상세보기</span></td>
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
												<td>상세보기</td>
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
												<td><span id="aa" style="cursor: pointer;">상세보기</span></td>
											</tr>
											<!-- 3행끝 -->
											
											
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
 															<div class="table-responsive col-md-6 ml-0">
 																<table class="table table-bordered">
 																	<thead>
																	    <tr class="text-center">
																	      <th style="background-color: #000040;color:white;" colspan="4">Home팀</th>
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
 															
 															</div>  <!-- table 감싸는 div -->
 														
 														
 														
 														
 														
 														<!-- AWAY 테이블 -->
 														
 															<div class="table-responsive col-md-6 ml-0">
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
 															
 															</div>  <!-- table 감싸는 div -->
 														
 														
 														
 														
 														
 														</div><!-- row -->
 													</td>
 													
											</tr>
	                                         



										</tbody>
									</table>

								</div> <!--  play-table end -->
								

							</div>
							<!--  전체선택 끝  -->
							
						
						
	<!--  ==================================================================  -->


	
						
<div class="row" id="viewTarget"> 					

<div class="table-responsive col-md-6 ml-0">
  <!--  A팀 테이블 -->
    <table class="table table-bordered" class="A_tableMatchTen" >
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





