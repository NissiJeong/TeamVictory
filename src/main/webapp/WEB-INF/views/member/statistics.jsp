<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


​<style>

.play-table tbody tr td {
	padding : 10px 0;
	font-size : 14px;

}



</style>



<!-- banner-section start -->
<section class="breadcum-section">
	<div class="breadcum-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcum-content text-center">
						<h3 class="title">Statistics</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">home</a></li>
							<li class="breadcrumb-item active">statistics</li>
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
			<div class="col-lg-10">
				<div class="statistics-table-result-part">
					<ul class="nav justify-content-around" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="football-tab" data-toggle="tab" href="#football" role="tab"
							aria-controls="football" aria-selected="false"> <i
								class="flaticon-football"></i> <span>쓰레드형 게시판</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" id="bascketball-tab"
							data-toggle="tab" href="#bascketball" role="tab"
							aria-controls="bascketball" aria-selected="true"> <i
								class="flaticon-basketball"></i> <span>데이터 입력 폼</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" id="baseball-tab"
							data-toggle="tab" href="#baseball" role="tab"
							aria-controls="baseball" aria-selected="false"> <i
								class="flaticon-softball"></i> <span>선수페이지</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" id="test-tab"
							data-toggle="tab" href="#test" role="tab" aria-controls="test"
							aria-selected="false"> <i class="flaticon-softball"></i>
							<span>마이페이지</span>
						</a></li>

					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="football"
							role="tabpanel" aria-labelledby="football-tab">
							<div class="accordion" id="accordionExample-1">
								<div class="card" id="test1" style="text-align: center">

									<!-- blog-details-section start -->
									<section class="blog-details-section section-padding">
										<div class="container">
											<div class="row">
												<div class="col-lg-2"></div>
												<div class="col-lg-8" style="border: 1px solid gold">
													<input type="hidden" class="scrollLocation" />
													<div class="tab-pane fade show active " id="all"
														role="tabpanel" aria-labelledby="all-tab">
														
														<!-- 데이터 출력!!! -->



														<c:forEach var="hitters" items="${records}">
															
															<div class="play-table-part listToChange"
																>
																<input type="hidden" class="scrolling"
																					data-recordno="${hitters.RECORDNO}" />
																<div class="play-table">
																	<div>
																		<div class="summary">

																			<dl class="info">
																				<dt>01.07(토) 09:00</dt>
																				<dd>에이스볼파크</dd>
																			</dl>
																			<div style="display: inline">
																				<dl>
																					<dt>
																						<a href="/club/?club_idx=14322" target="_blank"><img
																							data-original="//file.clubone.kr/symbol/club/symbol14322.jpg"
																							class="lazy_image"
																							src="//file.clubone.kr/symbol/club/symbol14322.jpg"
																							style="float: left"><span class="cover"></span></a>
																					</dt>
																					<dd>
																						<span class="result ">패　</span> <span class="name"
																							style="width: 80px; margin-left: 5px;">누리TLC</span>
																						<span class="add_info" style="height: 13px"></span>
																					</dd>
																					<!--mm-->
																					<dd>
																						<span class="score">5</span>
																					</dd>
																				</dl>
																			</div>
																			<div style="display: inline">
																				<dl>
																					<dt>
																						<a href="/club/?club_idx=19031" target="_blank"><img
																							data-original="//file.clubone.kr/symbol/club/symbol19031.jpg"
																							class="lazy_image"
																							src="//file.clubone.kr/symbol/club/symbol19031.jpg"
																							style="float: left""><span class="cover"></span></a>
																					</dt>
																					<dd>
																						<span class="result win">승　</span> <span
																							class="name">포켓몬스터야구단</span> <span
																							class="add_info" style="height: 13px"></span>
																					</dd>
																					<!--mm-->
																					<dd>
																						<span class="score">14</span>
																					</dd>
																				</dl>
																			</div>
																			<p>
																				<strong>1번 타자</strong> <span class="add_info">(유격수)</span>
																				<strong>임지성</strong>(52)
																			</p>
																		</div>
																	</div>
																	<table>
																		<thead>
																			<tr>
																				<th>타자기록</th>
																				<th>타수</th>
																				<th>안타</th>
																				<th>타점</th>
																				<th>홈런</th>
																				<th>도루</th>
																				<th>타율</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td></td>
																				<td>${hitters.AB}</td>
																				<td>${hitters.H}</td>
																				<td>${hitters.RBI}</td>
																				<td>${hitters.HR}</td>
																				<td>${hitters.SB}</td>
																				<td>${hitters.AVG}</td>

																			</tr>
																		</tbody>
																	</table>
																	<table>
																		<thead>
																			<tr>
																				<th>시즌기록</th>
																				<th>타수</th>
																				<th>안타</th>
																				<th>타점</th>
																				<th>홈런</th>
																				<th>도루</th>
																				<th>타율</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td></td>
																				<td>${hitters.totalAB}</td>
																				<td>${hitters.totalH}</td>
																				<td>${hitters.totalRBI }</td>
																				<td>${hitters.totalHR}</td>
																				<td>${hitters.totalSB }</td>
																				<td>${hitters.totalAVG }<br/></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</c:forEach>




														<%-- 	
     						 	
     							<div class="row">
							        <div class="col-xs-12">
							          <div class="box">
							            <div class="box-header">
							              <h3 class="box-title">LIST ALL PAGE</h3>
							
							              <div class="box-tools">
							                <div class="input-group input-group-sm" style="width: 150px;">
							                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
							
							                  <div class="input-group-btn">
							                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
							                  </div>
							                </div>
							              </div>
							            </div>
							            <!-- /.box-header -->
							            <div class="box-body table-responsive no-padding">
							              <table class="table table-hover">
							                <tbody>
							                <tr class="scrollLocation">
							                  <th>BNO</th>
							                  <th>TITLE</th>
							                  <th>WRITER</th>
							                  <th>REGDATE</th>
							                  <th>VIEWCNT</th>
							                </tr>
							               
							               
							               	<c:forEach items="${records}" var="hitters">
							        			<tr class="listToChange">
							        				<td class="scrolling" data-recordno="${hitters.RECORDNO}">
							        					${hitters.RECORDNO}
							        				</td>
							        				<td>${hitters.AB}</td>
							        				<td>${hitters.H}</td>
							        				<td>${hitters.HR}</td>
							            			<td>${hitters.SB}</td>
							        			</tr> 
											</c:forEach>
							              </tbody></table>
							            </div>
							            <!-- /.box-body -->
							          </div>
							          <!-- /.box -->
							        </div>
							      </div>
					--%>


													</div>
												</div>
											</div>
										</div>
									</section>
									<!-- blog-details-section end -->
								</div>
							</div>
						</div>



						<div class="tab-pane fade" id="bascketball" role="tabpanel"
							aria-labelledby="bascketball-tab">
							<div class="accordion" id="accordionExample-2">
								<div class="card">

									<!-- blog-details-section start -->
									<section class="blog-details-section section-padding">
										<div class="container">
											<div class="row">
												<div class="col-lg-2"></div>
												<div class="col-lg-8" style="border: 1px solid gold">

													<form class="cmn-form registration-form" id="submit"
														method="post"
														action="<c:url value='/Team/Matching/InsertHitter.do'/>">

														<div class="frm-group">
															<h1 style="color: white"></h1>

															<select class="game-select" name="baseball_key"
																id="baseball_key"
																style="width: 50%; display: inline; border-style: none; border-bottom: 1.5px solid orange;">
																<option>경기 선택</option>
																<option>2019-10-17 / 키움-SK / 고척 / 1830</option>
																<option>2019-10-16 / SK-키움 / 문학 / 2000</option>
															</select> <select class="position-select" name="baseball_pos"
																id="baseball_pos"
																style="width: 50%; display: inline; border-style: none; border-bottom: 1.5px solid orange;">
																<option>포지션</option>
																<option>투수</option>
																<option>포수</option>
																<option>1루수</option>
																<option>2루수</option>
																<option>3루수</option>
																<option>유격수</option>
																<option>좌익수</option>
																<option>중견수</option>
																<option>우익수</option>
																<option>지명타자</option>
															</select> <select class="baseball_start"
																style="width: 50%; display: inline; border-style: none; border-bottom: 1.5px solid orange;">
																<option>선발</option>
																<option>교체</option>
																<option>미출전</option>
															</select> <select class="baseball_horder" name="baseball_horder"
																style="width: 50%; display: inline; border-style: none; border-bottom: 1.5px solid orange;">
																<option>타순</option>
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>
																<option>5</option>
																<option>6</option>
																<option>7</option>
																<option>8</option>
																<option>9</option>
															</select>
														</div>

														<div class="frm-group">
															<input type="text" name="baseball_pa" id="baseball_pa"
																style="width: 50%;" placeholder="타석">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_ab" id="baseball_ab"
																style="width: 50%;" placeholder="타수">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_h" id="baseball_h"
																style="width: 50%;" placeholder="안타">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_b2" id="baseball_b2"
																style="width: 50%;" placeholder="2루타">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_b3" id="baseball_b3"
																style="width: 50%;" placeholder="3루타">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_hr" id="baseball_hr"
																style="width: 50%;" placeholder="홈런">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_rbi" id="baseball_rbi"
																style="width: 50%;" placeholder="타점">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_sb" id="baseball_sb"
																style="width: 50%;" placeholder="도루">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_cs" id="baseball_cs"
																style="width: 50%;" placeholder="도루실패">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_bb" id="baseball_bb"
																style="width: 50%;" placeholder="볼넷">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_hbp" id="baseball_hbp"
																style="width: 50%;" placeholder="몸에맞는볼">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_so" id="baseball_so"
																style="width: 50%;" placeholder="삼진">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_gdp" id="baseball_gdp"
																style="width: 50%;" placeholder="병살">
														</div>
														<div class="frm-group">
															<input type="text" name="baseball_e" id="baseball_e"
																style="width: 50%;" placeholder="실책">
														</div>

														<div class="frm-group">
															<button type="submit" class="submit-btn"
																style="margin-top: 100px">전송</button>
														</div>
													</form>


												</div>
											</div>
										</div>
									</section>
									<!-- blog-details-section end -->
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="baseball" role="tabpanel"
							aria-labelledby="baseball-tab">
							<div class="accordion" id="accordionExample-3">
								<div class="card">

									<div class="row">
										<div class="col-lg-2"></div>
										<div class="col-lg-8" style="border: 1px solid gold">

											<div class="content">

												<h1>적절한 div로 내 스탯 상세 출력</h1>

												<h3>정보 입력/보여주기</h3>
												<table>
													<tr style="background-color: white">
														<th style="width: 20%">출신고교</th>
														<td><input type="text" name="id" size="20" /></td>
													</tr>
													<tr style="background-color: white">
														<th>투타구분</th>
														<td><input type="radio" name="gender" value="man" />우투우타
															<input type="radio" name="gender" value="woman" />우투좌타 <input
															type="radio" name="gender" value="trans" />좌투좌타 <input
															type="radio" name="gender" value="trans" />좌투우타</td>
													</tr>
													<tr style="background-color: white">
														<th>선출구분</th>
														<td><input type="radio" name="gender" value="man" />비선출
															<input type="radio" name="gender" value="woman" />중출 <input
															type="radio" name="gender" value="trans" />고출 이상</td>
													</tr>
													<tr style="background-color: white">
														<th style="width: 20%">신장</th>
														<td><input type="text" name="id" size="20" />cm</td>
													</tr>
													<tr style="background-color: white">
														<th style="width: 20%">몸무게</th>
														<td><input type="text" name="id" size="20" />kg</td>
													</tr>

													<tr style="background-color: white">
														<td colspan="2" align="center"><input type="submit"
															value="확인" title="type=submit" /></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="test" role="tabpanel"
							aria-labelledby="test-tab">
							<div class="accordion" id="accordionExample-3">
								<div class="card">
									<div class="row">
										<div class="col-lg-2"></div>
										<div class="col-lg-8" style="border: 1px solid gold">

											<h1>사진수정을 위한 div</h1>
											<img src="http://file.clubone.kr/player/member_default.jpg" />


											<h1>휴대폰번호</h1>
											<h1>연고지</h1>
											<h1>기타 등등</h1>
										</div>
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


<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script>

	/*var result = '${msg}';
	
	 if(result="success"){
		alert(result);
		console.log(result);
	} */
	
	
	
	var lastScrollTop = 0;
	
	// 1. 스크롤 이벤트 발생
	$(window).scroll(function(){ // ① 스크롤 이벤트 최초 발생
		
		var currentScrollTop = $(window).scrollTop();
		
		/*  
			=================	다운 스크롤인 상태	================
		*/
		if( currentScrollTop - lastScrollTop > 0 ){
			// down-scroll : 현재 게시글 다음의 글을 불러온다.
			console.log("down-scroll");
			
			// 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
			if ($(window).scrollTop() >= ($(document).height() - $(window).height())){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
	            
				// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
				//		즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
				var lastrecordno = $(".scrolling:last").attr("data-recordno");
				
				// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다. 
				$.ajax({
					type : 'post',	// 요청 method 방식 
					url : '<c:url value="/Team/Matching/downstatostics.do"/>',// 요청할 서버의 url
					headers : { 
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
					data : { // 서버로 보낼 데이터 명시 
						RECORDNO : lastrecordno
					},
					success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
						
						var str = "";
						
						// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
						if(data != ""){
							
							//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
							console.log(data);
							/* $.each(data, function(key, value){
							console.log(key + value);
							}); */
							
							$(data).each(
							// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
							function(){
								console.log(this);		
							
								/*STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR */
								str	+='<div class="play-table-part listToChange" >'
									
									+'<input type="hidden" class="scrolling" data-recordno="'+ this.RECORDNO +'" />'
									+'<div class="play-table">'
									+'<div>'
									+'<div class="summary">'
									+'<dl class="info">'	
									+'<dt>01.07(토) 09:00</dt>'	
									+'<dd>에이스볼파크</dd>'
									+'</dl>'	
									+'<div style="display:inline">'
									+'<dl>'
									+'<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>'	
									+'<dd>'
									+'<span class="result ">패　</span>'
									+'<span class="name" style="width: 80px; margin-left: 5px;">누리TLC</span>'	
									+'<span class="add_info" style="height:13px"></span>'	
									+'</dd><!--mm-->'
									+'<dd><span class="score">5</span></dd>'	
									+'</dl>'
									+'</div>'
									+'<div style="display:inline">'	
									+'<dl>'
									+'<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol19031.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol19031.jpg" style=float:left"><span class="cover"></span></a></dt>'
									+'<dd>'	
									+'<span class="result win">승　</span>'	
									+'<span class="name">포켓몬스터야구단</span>'
									+'<span class="add_info" style="height:13px"></span>'	
									+'</dd><!--mm-->'
									+'<dd><span class="score">14</span></dd>'
									+'</dl>'	
									+'</div>'
									+'<p>'	
									+'<strong>1번 타자</strong>'	
									+'<span class="add_info">(유격수)</span>'
									+'<strong>임지성</strong>(52)'	
									+'</p>'
									+'</div>'
									+'</div>'	
									+'<table>'
									+'<thead>'	
									+'<tr>'	
									+'<th>타자기록</th>'
									+'<th>타수</th>'	
									+'<th>안타</th>'
									+'<th>타점</th>'
									+'<th>홈런</th>'	
									+'<th>도루</th>'
									+'<th>타율</th>'	
									+'</tr>'
									+'</thead>'	
									+'<tbody>'
									+'<tr>'
									+'<td></td>'	
									+'<td>'+ this.AB +'</td>'
									+'<td>'+ this.H + '</td>'	
									+'<td>'+ this.RBI +'</td>'	
									+'<td>'+ this.HR +'</td>'
									+'<td>'+ this.SB +'</td>'	
									+'<td>'+ this.AVG +'</td>'
									+'</tr>'
									+'</tbody>'	
									+'</table>'
									+'<table>'	
									+'<thead>'	
									+'<tr>'
									+'<th>시즌기록</th>'	
									+'<th>타수</th>'
									+'<th>안타</th>'
									+'<th>타점</th>'	
									+'<th>홈런</th>'
									+'<th>도루</th>'	
									+'<th>타율</th>'	
									+'</tr>'
									+'</thead>'	
									+'<tbody>'
									+'<tr>'
									+'<td></td>'	
									+'<td>'+ this.totalAB +'</td>'
									+'<td>'+ this.totalH +'</td>'
									+'<td>'+ this.totalRBI +'</td>'	
									+'<td>'+ this.totalHR +'</td>'
									+'<td>'+ this.totalSB +'</td>'
									+'<td>'+ this.totalAVG +'</td>'	
									+'</tr>'
									+'</tbody>'
									+'</table>'	
									+'</div>'
									+'</div>';
							
							});// each 
							// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
							$(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.						
							$(".scrollLocation").after(str);
						 		
						}// if : data!=null
						else{ // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
							alert("더 불러올 데이터가 없습니다.");
						}// else
		
					}// success
				});// ajax
				
				// 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
				var position = $(".listToChange:first").offset();// 위치 값
				
				// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
				$('html,body').stop().animate({scrollTop : position.top }, 600, 'easeInQuint');
	
	        }//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
			
			// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
			lastScrollTop = currentScrollTop;
		}// 다운스크롤인 상태
		
		/*  
			=================	업 스크롤인 상태	================
		*/
		else{
			// up- scroll : 현재 게시글 이전의 글을 불러온다.
			console.log("up-scroll");			

			// 2. 현재 스크롤의 top 좌표가  <= 0 되는 순간
			if ($(window).scrollTop() <= 0 ){ // 
	            
				// 3. class가 scrolling인 것의 요소 중 첫 번째 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
				//		즉, 현재 뿌려진 게시글의 첫 번째 bno값을 읽어오는 것이다.( 이 전의 게시글들을 가져오기 위해 필요한 데이터이다.)
				var firstrecordno = $(".scrolling:first").attr("data-recordno");
				
				// 4. ajax를 이용하여 현재 뿌려진 게시글의 첫 번째 bno를 서버로 보내어 그 이전의 20개의 게시물 데이터를 받아온다. 
				$.ajax({
					type : 'post',	// 요청 method 방식 
					url : '<c:url value="/Team/Matching/upstatostics.do"/>',// 요청할 서버의 url
					headers : { 
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
					data : { // 서버로 보낼 데이터 명시 
						RECORDNO : firstrecordno
					},
					success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
						
						var str = "";
						
						// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
						// 이때 서버에서 값이 없으면 null을 던질줄 알았는데 ""를 던진다. 따라서 (data != null) 이라는 체크를 해주면 안되고, (data != "") 만 해주어야한다.
						// 이건아마 컨트롤러의 리턴타입이 @ResponseBody로 json형태로 던져지는데 이때 아마 아무것도 없는게 ""로 명시되어 날아오는것 같다.
						if(data != ""){
							
							//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
							$(data).each(
								// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
								function(){
										
									str	+='<div class="play-table-part listToChange">'
										
										+'<input type="hidden" class="scrolling" data-recordno="'+ this.RECORDNO +'" />'
										+'<div class="play-table">'
										+'<div>'
										+'<div class="summary">'
										+'<dl class="info">'	
										+'<dt>01.07(토) 09:00</dt>'	
										+'<dd>에이스볼파크</dd>'
										+'</dl>'	
										+'<div style="display:inline">'
										+'<dl>'
										+'<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>'	
										+'<dd>'
										+'<span class="result ">패　</span>'
										+'<span class="name" style="width: 80px; margin-left: 5px;">누리TLC</span>'	
										+'<span class="add_info" style="height:13px"></span>'	
										+'</dd><!--mm-->'
										+'<dd><span class="score">5</span></dd>'	
										+'</dl>'
										+'</div>'
										+'<div style="display:inline">'	
										+'<dl>'
										+'<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol19031.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol19031.jpg" style=float:left"><span class="cover"></span></a></dt>'
										+'<dd>'	
										+'<span class="result win">승　</span>'	
										+'<span class="name">포켓몬스터야구단</span>'
										+'<span class="add_info" style="height:13px"></span>'	
										+'</dd><!--mm-->'
										+'<dd><span class="score">14</span></dd>'
										+'</dl>'	
										+'</div>'
										+'<p>'	
										+'<strong>1번 타자</strong>'	
										+'<span class="add_info">(유격수)</span>'
										+'<strong>임지성</strong>(52)'	
										+'</p>'
										+'</div>'
										+'</div>'	
										+'<table>'
										+'<thead>'	
										+'<tr>'	
										+'<th>타자기록</th>'
										+'<th>타수</th>'	
										+'<th>안타</th>'
										+'<th>타점</th>'
										+'<th>홈런</th>'	
										+'<th>도루</th>'
										+'<th>타율</th>'	
										+'</tr>'
										+'</thead>'	
										+'<tbody>'
										+'<tr>'
										+'<td></td>'	
										+'<td>'+ this.AB +'</td>'
										+'<td>'+ this.H + '</td>'	
										+'<td>'+ this.RBI +'</td>'	
										+'<td>'+ this.HR +'</td>'
										+'<td>'+ this.SB +'</td>'	
										+'<td>'+ this.AVG +'</td>'
										+'</tr>'
										+'</tbody>'	
										+'</table>'
										+'<table>'	
										+'<thead>'	
										+'<tr>'
										+'<th>시즌기록</th>'	
										+'<th>타수</th>'
										+'<th>안타</th>'
										+'<th>타점</th>'	
										+'<th>홈런</th>'
										+'<th>도루</th>'	
										+'<th>타율</th>'	
										+'</tr>'
										+'</thead>'	
										+'<tbody>'
										+'<tr>'
										+'<td></td>'	
										+'<td>'+this.totalAB+'</td>'
										+'<td>'+this.totalH+'</td>'
										+'<td>'+this.totalRBI+'</td>'	
										+'<td>'+this.totalHR+'</td>'
										+'<td>'+this.totalSB+'</td>'
										+'<td>'+this.totalAVG+'</td>'	
										+'</tr>'
										+'</tbody>'
										+'</table>'	
										+'</div>'
										+'</div>';
									
							});// each
							// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
							$(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.						
							$(".scrollLocation").after(str);
						 		
						}//if : data != ""
						else{ // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..??
							
							alert("더 불러올 데이터가 없습니다.");
						}// else
	
					}// success
				});// ajax
				
				// 스크롤 다운이벤트 때  ajax통신이 발생하지 않을때 까지의 좌표까지 스크롤을 내려가주기. 
				var position =($(document).height() - $(window).height()) -10;
				
				// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
				$('html,body').stop().animate({scrollTop : position}, 600, 'easeInQuint');
				
	        }//if : 현재 스크롤의 top 좌표가  <= 0 되는 순간
		
			// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
			lastScrollTop = currentScrollTop;
		}// else : 업 스크롤인 상태
		
});// scroll event

</script>





<!-- statistics-section end -->
