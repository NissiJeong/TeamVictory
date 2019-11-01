<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<script	src='https://cdn.jsdelivr.net/npm/chart.js@2.8.0'></script>
<script src="<c:url value='/assets/js/utils.js' />"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.play-table tbody tr td {
	padding: 10px 0;
	font-size: 14px;

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

<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<div class="statistics-table-result-part">

				<!-- blog-details-section start -->
				<section class="blog-details-section section-padding">
					<div class="container">
						<div class="row">

							<div class="col-lg-5"
								style="border: 1px solid magenta; text-align: center">

								<div></div>
								<div>
									<div class="hero_image" style="overflow-y: hidden;">
										<span class="image"><img
											src="//file.clubone.kr/player/member_default.jpg" alt="대표사진"
											style="min-height: 190px; height: auto;"></span> <span
											class="cover"></span>
									</div>
									<form id="submit" method="post"
										action="<c:url value='/Team/Matching/InsertHitterByPARSING'/>">

										<h1 class="my-4">돼지 불백</h1>
										<div class="list-group">
											
											<a href="#" class="list-group-item" data-toggle="modal" data-target="#recordModal">타자 기록</a>
											<a href="#" class="list-group-item" data-toggle="modal" data-target="#recordModal">투수 기록</a>
											<a href="#" class="list-group-item" data-toggle="modal" data-target="#infoModal">회원 정보</a>
											<a href="#" class="list-group-item" data-toggle="modal" data-target="#infoModal">선수 정보</a>
																												
											<button type="submit" class="submit-btn"
												style="margin-top: 100px">돼지불백</button>
										</div>
									</form>
								</div>
								<div class="col-lg-1"></div>
							</div>
							<!-- div col-lg-5 -->


							<div class="col-lg-6" style="border: 1px solid gold">

								<div style="margin-top: -100px; text-align: center">

									<!-- 데이터 출력!!! -->

									<c:forEach var="hitters" items="${records}">

										<div class="play-table-part listToChange">
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
																	<span class="result ">패 </span> <span class="name"
																		style="width: 80px; margin-left: 5px;">누리TLC</span> <span
																		class="add_info" style="height: 13px"></span>
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
																	<span class="result win">승 </span> <span class="name">포켓몬스터야구단</span>
																	<span class="add_info" style="height: 13px"></span>
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
															<th>통산기록</th>
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
															<td>${hitters.totalAVG }<br /></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</c:forEach>
								</div>
								<input type="hidden" class="scrollLocation" />
							</div>
						</div>
					</div>
				</section>
				<!-- blog-details-section end -->
			</div>
		</div>
	</div>
</div>


<!-- modal -->
<div class="modal fade" id="infoModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center" style="background-color: #000040;">

				<h5 class="modal-title w-100" style="color: white">정보 수정</h5>
				
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>

			</div>

			<!--Body-->
			<div class="modal-body">
				
				정보 오지게 수정하기
				
				
				<div class="row">
				<div class="col">
					<p><strong>Checkbox</strong></p>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" id="jb-checkbox" class="custom-control-input">
						<label class="custom-control-label" for="jb-checkbox">Checkbox</label>
					</div>
					
					<p><strong>이메일 수신</strong></p>
					<div class="custom-control custom-radio">
						<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">수신</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">수신 거부</label>
					</div>
					
					<p><strong>FCM 수신</strong></p>
					<div class="custom-control custom-radio">
						<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">수신</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">수신 거부</label>
					</div>
				</div>
			</div>
				
				
				
				
			</div>
			<!--  Body -->
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>







<div class="modal fade" id="recordModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center"
				style="background-color: #000040;">

				<h5 class="modal-title w-100" style="color: white">상세 정보</h5>
				
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>

			</div>

			<!--Body-->
			<div class="modal-body">
				
				<div>
					<select id="interval_time" name='interval_time'>
				        <option value='#'>팀 전체</option>
				        <option value='#'>A팀</option>
				        <option value='#'>B팀</option>
				        <option value='#'>C팀</option>
				        
				    </select>


					
					<div class="wrapper"><canvas id="chart-0"></canvas></div>
					
					<div>
						<div class="play-table-part">
							<div class="play-table">
								<table style="text-align:center">
									<thead>
										<tr>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>0</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>0.439</td>
		
										</tr>
									</tbody>
								</table>
								<table  style="text-align:center">
									<thead>
										<tr>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>0.439</td>
										</tr>
									</tbody>
								</table>
								<table  style="text-align:center">
									<thead>
										<tr>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
											<th>정보</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>100</td>
											<td>0.439<br /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
			<!--  Body -->
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


	<script>
		var DATA_COUNT = 7;
		var utils = Samples.utils;
		utils.srand(110);
		function getLineColor(ctx) {
			return utils.color(ctx.datasetIndex);
		}

		function alternatePointStyles(ctx) {
			var index = ctx.dataIndex;
			return index % 2 === 0 ? 'circle' : 'rect';
		}

		function makeHalfAsOpaque(ctx) {
			return utils.transparentize(getLineColor(ctx));
		}

		function make20PercentOpaque(ctx) {
			return utils.transparentize(getLineColor(ctx), 0.8);
		}

		function adjustRadiusBasedOnData(ctx) {
			var v = ctx.dataset.data[ctx.dataIndex];
			return v < 10 ? 5
				: v < 25 ? 7
				: v < 50 ? 9
				: v < 75 ? 11
				: 15;
		}

		function generateData() {
			return utils.numbers({
				count: DATA_COUNT,
				min: 0,
				max: 100
			});
		}

		var data = {
			labels: [['Eating', 'Dinner'], ['Drinking', 'Water'], 'Sleeping', ['Designing', 'Graphics'], 'Coding', 'Cycling', 'Running'],
			datasets: [{
				data: generateData()
			}]
		};

		var options = {
			legend: false,
			tooltips: true,
			elements: {
				line: {
					backgroundColor: make20PercentOpaque,
					borderColor: getLineColor,
				},
				point: {
					backgroundColor: getLineColor,
					hoverBackgroundColor: makeHalfAsOpaque,
					radius: adjustRadiusBasedOnData,
					pointStyle: alternatePointStyles,
					hoverRadius: 15,
				}
			}
		};

		var chart = new Chart('chart-0', {
			type: 'radar',
			data: data,
			options: options
		});


		// eslint-disable-next-line no-unused-vars
		function addDataset() {
			chart.data.datasets.push({
				data: generateData()
			});
			chart.update();
		}

		// eslint-disable-next-line no-unused-vars
		function randomize() {
			chart.data.datasets.forEach(function(dataset) {
				dataset.data = generateData();
			});
			chart.update();
		}

		// eslint-disable-next-line no-unused-vars
		function removeDataset() {
			chart.data.datasets.shift();
			chart.update();
		}
	</script>



















<script>
	/*var result = '${msg}';
	
	 if(result="success"){
		alert(result);
		console.log(result);
	} */

	var lastScrollTop = 0;

	// 1. 스크롤 이벤트 발생
	$(window)
			.scroll(
					function() { // ① 스크롤 이벤트 최초 발생

						var currentScrollTop = $(window).scrollTop();

						/*  
							=================	다운 스크롤인 상태	================
						 */
						if (currentScrollTop - lastScrollTop > 0) {
							// down-scroll : 현재 게시글 다음의 글을 불러온다.
							console.log("down-scroll");

							// 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
							if ($(window).scrollTop() >= ($(document).height() - $(window).height())) { //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면

								// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
								//		즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
								var lastrecordno = $(".scrolling:last").attr("data-recordno");

								// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다. 
								$
										.ajax({
											type : 'post', // 요청 method 방식 
											url : '<c:url value="/Team/Matching/downstatostics.do"/>',// 요청할 서버의 url
											headers : {
												"Content-Type" : "application/json",
												"X-HTTP-Method-Override" : "POST"
											},
											dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
											data : { // 서버로 보낼 데이터 명시 
												RECORDNO : lastrecordno
											},
											success : function(data) {// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.

												var str = "";

												// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
												if (data != "") {

													//6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
													console.log(data);
													/* $.each(data, function(key, value){
													console.log(key + value);
													}); */

													$(data)
															.each(
																	// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
																	function() {
																		console.log(this);

																		/*STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR */
																		str += '<div class="play-table-part listToChange" >'

																				+ '<input type="hidden" class="scrolling" data-recordno="'+ this.RECORDNO +'" />'
																				+ '<div class="play-table">'
																				+ '<div>'
																				+ '<div class="summary">'
																				+ '<dl class="info">'
																				+ '<dt>01.07(토) 09:00</dt>'
																				+ '<dd>에이스볼파크</dd>'
																				+ '</dl>'
																				+ '<div style="display:inline">'
																				+ '<dl>'
																				+ '<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>'
																				+ '<dd>'
																				+ '<span class="result ">패　</span>'
																				+ '<span class="name" style="width: 80px; margin-left: 5px;">누리TLC</span>'
																				+ '<span class="add_info" style="height:13px"></span>'
																				+ '</dd><!--mm-->'
																				+ '<dd><span class="score">5</span></dd>'
																				+ '</dl>'
																				+ '</div>'
																				+ '<div style="display:inline">'
																				+ '<dl>'
																				+ '<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol19031.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol19031.jpg" style=float:left"><span class="cover"></span></a></dt>'
																				+ '<dd>' + '<span class="result win">승　</span>' + '<span class="name">포켓몬스터야구단</span>' + '<span class="add_info" style="height:13px"></span>'
																				+ '</dd><!--mm-->' + '<dd><span class="score">14</span></dd>' + '</dl>' + '</div>' + '<p>' + '<strong>1번 타자</strong>' + '<span class="add_info">(유격수)</span>'
																				+ '<strong>임지성</strong>(52)' + '</p>' + '</div>' + '</div>' + '<table>' + '<thead>' + '<tr>' + '<th>타자기록</th>' + '<th>타수</th>' + '<th>안타</th>' + '<th>타점</th>'
																				+ '<th>홈런</th>' + '<th>도루</th>' + '<th>타율</th>' + '</tr>' + '</thead>' + '<tbody>' + '<tr>' + '<td></td>' + '<td>'
																				+ this.AB
																				+ '</td>'
																				+ '<td>'
																				+ this.H
																				+ '</td>'
																				+ '<td>'
																				+ this.RBI
																				+ '</td>'
																				+ '<td>'
																				+ this.HR
																				+ '</td>'
																				+ '<td>'
																				+ this.SB
																				+ '</td>'
																				+ '<td>'
																				+ this.H / this.AB
																				+ '</td>'
																				+ '</tr>'
																				+ '</tbody>'
																				+ '</table>'
																				+ '<table>'
																				+ '<thead>'
																				+ '<tr>'
																				+ '<th>통산기록</th>'
																				+ '<th>타수</th>'
																				+ '<th>안타</th>'
																				+ '<th>타점</th>'
																				+ '<th>홈런</th>'
																				+ '<th>도루</th>'
																				+ '<th>타율</th>'
																				+ '</tr>'
																				+ '</thead>'
																				+ '<tbody>'
																				+ '<tr>'
																				+ '<td></td>'
																				+ '<td>'
																				+ this.totalAB
																				+ '</td>'
																				+ '<td>'
																				+ this.totalH
																				+ '</td>'
																				+ '<td>'
																				+ this.totalRBI
																				+ '</td>'
																				+ '<td>'
																				+ this.totalHR
																				+ '</td>'
																				+ '<td>'
																				+ this.totalSB
																				+ '</td>'
																				+ '<td>'
																				+ this.totalH
																				/ totalAB + '</td>' + '</tr>' + '</tbody>' + '</table>' + '</div>' + '</div>';

																	});// each 
													// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
													//$(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.						
													$(".scrollLocation").after(str);

												}// if : data!=null
												else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
													alert("더 불러올 데이터가 없습니다.");
												}// else

											}// success
										});// ajax

								// 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
								var position = $(".listToChange:last").offset();// 위치 값

								// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
								$('html,body').stop().animate({
									scrollTop : position.top
								}, 600, 'easeInQuint');

							}//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간

							// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
							lastScrollTop = currentScrollTop;
						}// 다운스크롤인 상태

					});// scroll event
</script>





<!-- statistics-section end -->
