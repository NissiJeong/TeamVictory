
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>


<style>
dd {
	padding-bottom: 5px;
}

#schedule-border-menu th, #record-border-menu th{
	padding-top: 5px;
	padding-bottom: 5px;
}

#schedule-result-table-menu{
	padding: 5px 0;
}

#top3 {
	padding: 5px;
}

#record-border-top {
	padding-top: 20px;
}

#player-list, #schedule-list, #record-rank-list {
	padding-top: 0px;
}

#player-list-member {
	padding: 4px 20px 4px 40px;
}

#record-rank-table{
	width: 123%;
}

#guinness-table .all-tbody tr td{
	font-size: 15px;
}

#guinness-table .all-tbody tr td span{
	font-size: 20px;
}
#guinness-title {
	padding-bottom: 13px;
}

#guinness {
	padding-left: 15px;
}

.record-rank {
	width: 136%;
}

.right{
	position: absolute;
    right:30px;
    top: 15px;
}
.record-right {
	display: none;
	position: absolute;
	right: -30%;
    top: 3%;
}

.record-batter-right{
display: none;
	position: absolute;
    right: -24%;
    top: 3%;
}

.position, .schedule-result, .record-rank {
	padding-left: 15px;
	padding-bottom: 15px;
}

/*라디오버튼 숨김*/
.widget-most-view-post input, .position input,
.schedule-result input, .record-rank input{
	display: none;
}
/*라디오버튼 숨김 끝*/

/* 라벨 텍스트 및 설정 */
.widget-most-view-post label {
	display: inline-block;
	padding: 4px 4px;
	font-weight: 500;
	margin: 0 0 -1px;
	font-size: 12px;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
	text-align: center;
}

.position label {
	display: inline-block;
	padding: 8px 8px;
	font-weight: 500;
	margin: 0 0 -1px;
	font-size: 20px;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
	text-align: center;
}

.schedule-result label {
	display: inline-block;
	padding: 8px 8px;
	font-weight: 500;
	margin: 0 0 -1px;
	font-size: 20px;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
	text-align: center;
}

.record-rank label {
	display: inline-block;
	padding: 8px 8px;
	font-weight: 500;
	margin: 0 0 -1px;
	font-size: 20px;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
	text-align: center;
}
/* 라벨 텍스트 및 설정 끝*/

/*포인터모양 바꾸기*/
.widget-most-view-post label:hover, .position label:hover,
.schedule-result label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid white;
}

#top3-player-score, #top3-player-out, 
#top3-player-hit, #top3-player-run, 
#record-picther, #record-batter{
	display: none;
	padding: 10px 0 0;
	border-top: 1px solid #ddd;
}

#player-border-top, #schedule-border-top{
	padding: 10px 0 0;
	border-top: 1px solid #ddd;
}

.small-post-item-div {
	border-top: 1px solid #ddd;
}

.small-post-item {
	padding-top: 7px;
}

.small-post-content {
	padding-top: 20px;
}

#top3-player-score-tab:checked ~ #top3-player-score, #top3-player-out-tab:checked ~ #top3-player-out,
#top3-player-hit-tab:checked ~ #top3-player-hit, #top3-player-run-tab:checked ~ #top3-player-run {
	display: block;
}


#record-picther-tab:checked ~ #record-picther,
#record-picther-tab:checked ~ .record-right  {
	display: block;
}

#record-picther-tab:checked > .record-rank{
	width: 136%;
}

#record-batter-tab:checked ~ #record-batter,
#record-batter-tab:checked ~ .record-batter-right{
	display: block;	
}

#record-batter-tab:checked > .record-rank{
	width: 130%;
}

#team-name{
	padding-left: 14px;
}

.all-tbody td{
    padding-bottom: 3px;
    padding-top: 3px;
    padding-left: 11px;
    padding-right: 11px;
    
}

</style>

<script>
function selectTeam(team) {
	var teamName = team;
	$.ajax({
		url : "<c:url value='/Team/Matching/teamSelect.do'/>",
		type : 'post',
		dataType : 'json',
		data : { 'id' : $('#auth').val(),//아이디
			'teamName' : teamName,//팀이름
			'_csrf':'${_csrf.token}'
		},
		success : function(data) {
			console.log(data);
			alert(data);
		}
	});
};
/* 
var clickSelectItem = $('#teamName').change(function(){
    $.ajax({
        url: "<c:url value='/Team/Matching/teamNameSelect.do'/>",
        data : { id : $('#auth').val(), teamname : $(this).val() ,'_csrf' : '${_csrf.token}'}, 
        type: 'post',
        headers : {         
           "Content-Type" : "application/json",
           "X-HTTP-Method-Override" : "POST"
        },
        dataType: 'json',
        success : function(data){
           
           if (data != "") {
	           console.log(data);
	           $(data).each(
	              function() {
	                 $('#hd1').text(this.SUMPA);
	                 $('#hd2').text(this.PA);
	              });// each 
           }
           
           else { 
              $.ajax({
                    url: "<c:url value='/Team/Matching/hitterDetailView.do'/>",
                    data : { id : $('#auth').val(), '_csrf' : '${_csrf.token}'},
                    type: 'post',
                    dataType: 'json',
                    success : function(data){
                       if (data != "") {
                       $(data).each(
                          function() {
                             $('#hd1').text(this.SUMPA);
                             $('#hd2').text(this.PA);
                          });// each 
                       }
                    }
                 });  // ajax 
           }// else
        }
     });  // ajax 
 */
</script>

<!-- banner-section start -->
<section class="breadcum-section">
	
	<div class="breadcum-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcum-content text-center">
						<h3 class="title">팀사진 넣는곳</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">home</a></li>
							<li class="breadcrumb-item active">Promotions</li>
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
		<div class="row" id="team-name">
			<div class="form" style="margin-bottom:10px ">			      
			      <select class="form" id="teamName" name="stadium" onchange="selectTeam(this.value)">
			        <option value="">팀선택</option>
			        <c:forEach var="item" items="${teams}" varStatus="loop">
			        	<option value="${item }" checked>${item }</option>
			        </c:forEach>
			      </select>			    			   
	    	</div>
		</div>
		<div class="row">
			<div class="col-lg-3">
			<input type="hidden" value="${id}" id="auth"/>
				<div class="sidebar">
					<!-- left-menu start -->
					<div class="widget widget-categories">
					<c:forEach var="item" items="${list8}" varStatus="loop">
						<h4 class="widget-title">${item.teamname }</h4>
					</c:forEach>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#teamprofile">팀소개</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#player" id="playerlist">선수단</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#schedule">일정/결과</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#record">경기기록통계</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#guinness">팀기네스</a></li>
						</ul>
					</div>
					<!-- left menu end -->

					<!-- top3 start -->
					<div class="widget widget-most-view-post" id="top3">
						<h4 class="widget-title">TOP3 플레이어</h4>

						<input id="top3-player-score-tab" type="radio" name="tabs" checked>
						<label for="top3-player-score-tab">최다득점</label> 
						
						<input id="top3-player-out-tab" type="radio" name="tabs"> 
						<label for="top3-player-out-tab">최다삼진</label> 
						
						<input id="top3-player-hit-tab" type="radio" name="tabs"> 
						<label for="top3-player-hit-tab">최다홈런</label> 
						
						<input id="top3-player-run-tab" type="radio" name="tabs"> 
						<label for="top3-player-run-tab">최다도루</label>

						<!-- score start -->
						<section class="top3-player-score" id="top3-player-score">
						<c:forEach var="item" items="${list3}" varStatus="loop">
							<div class="small-post-item">
								<div class="small-post-thumb">
									<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
										alt="image" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">${item.name }</a>
									</h6>
									<ul class="post-meta">
										<li style="font-weight: bold;">${item.rbi}점</li>
									</ul>
								</div>
							</div>
						</c:forEach>
						</section>
						<!-- score end -->

						<!-- out start -->
						<section class="top3-player-out" id="top3-player-out">
							<c:forEach var="item" items="${list4}" varStatus="loop">
								<div class="small-post-item">
									<div class="small-post-thumb">
										<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
											alt="image" />
									</div>
									<div class="small-post-content">
										<h6>
											<a href="#0">${item.name }</a>
										</h6>
										<ul class="post-meta">
											<li style="font-weight: bold;">${item.so}개</li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</section>
						<!-- out end -->

						<!-- hit start -->
						<section class="top3-player-hit" id="top3-player-hit">
							<c:forEach var="item" items="${list5}" varStatus="loop">
								<div class="small-post-item">
									<div class="small-post-thumb">
										<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
											alt="image" />
									</div>
									<div class="small-post-content">
										<h6>
											<a href="#0">${item.name }</a>
										</h6>
										<ul class="post-meta">
											<li style="font-weight: bold;">${item.hr}개</li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</section>
						<!-- hit end -->

						<!-- run start -->
						<section class="top3-player-run" id="top3-player-run">
							<c:forEach var="item" items="${list6}" varStatus="loop">
								<div class="small-post-item">
									<div class="small-post-thumb">
										<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
											alt="image" />
									</div>
									<div class="small-post-content">
										<h6>
											<a href="#0">${item.name }</a>
										</h6>
										<ul class="post-meta">
											<li style="font-weight: bold;">${item.sb}개</li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</section>
						<!-- run end -->
					</div>
					<!-- top-3 end -->
					<!-- widget end -->
				</div>
			</div>

			<!-- team-main end -->
			<div class="col-lg-9">
				<div class="tab-content">
					<!-- team-profile end -->
					<div class="tab-pane fade show active" id="teamprofile">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-6 col-md-6">
									<div class="about-thumb" id="team-logo">
										<img src="<c:url value='/assets/images/teamlogo/logo.jpg'/>"
											alt="about-image" width="200px" height="200px">
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="team-history">
									<c:forEach var="item" items="${list8 }" varStatus="loop">
										<dl class="info">
											<dt>팀명</dt>
											<dd>${item.teamname }</dd>
											<dt>팀장</dt>
											<dd>${item.name }</dd>
											<dt>창단일</dt>
											<dd>${item.regidate }</dd>
											<dt>지역</dt>
											<dd>${item.teamloc }</dd>
											<dt>팀소개</dt>
											<dd>${item.teaminfo }</dd>
										</dl>
									</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- team-profile end -->
					<!-- team-main end -->

					<!-- player-list start -->
					<div class="tab-pane fade" id="player">
						<section class="blog-details-section section-padding"
							id="player-list">
							<div class="container">
								<div class="position">
									<input id="position1" type="radio" name="positions" checked>
									<label for="position1">전체</label>
									
									<!-- <input id="position2" type="radio" name="positions">
									<label for="position2" id="label-positin2">투수</label>

									<input id="position3" type="radio" name="positions">
									<label for="position3">타자</label>
									
									<input id="position4" type="radio" name="positions">
									<label for="position4">포수</label>
									
									<input id="position5" type="radio" name="positions">
									<label for="position5">내야수</label> 
									
									<input id="position6" type="radio" name="positions">
									<label for="position6">외야수</label> -->
								</div>

								<div class="row mt-mb-15" id="player-border-top"> 
								<c:forEach var="item" items="${list2}" varStatus="loop">
									<div class="col-lg-3">
										<div class="post-item"> 
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">${item.name}</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">${item.base_mainhand}</li>
												</ul>
											</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
						</section>
					</div>
					<!-- player-list end -->

					<!-- schedule-list start -->
					<div class="tab-pane fade" id="schedule">
						<section class="blog-details-section section-padding"
							id="schedule-list">
							<div class="container">
								<div class="schedule-result">
									<input id="schedule-result1" type="radio" name="schedules" checked>
									<label for="schedule-result1">전체</label>
								</div>
								<div class="right">
									<select id="schedule-season" name="schedule-season">
										<option value="2020">2020시즌</option>
										<option value="2019" selected>2019시즌</option>
										<option value="2018">2018시즌</option>
										<option value="2017">2017시즌</option>
										<option value="2016">2016시즌</option>
										<option value="2015">2015시즌</option>
										<option value="2014">2014시즌</option>
										<option value="2013">2013시즌</option>
										<option value="2012">2012시즌</option>
										<option value="2011">2011시즌</option>
										<option value="2010">2010시즌</option>
										<option value="2009">2009시즌</option>
										<option value="2008">2008시즌</option>
										<option value="2007">2007시즌</option>
										<option value="2006">2006시즌</option>
										<option value="2005">2005시즌</option>
										<option value="2004">2004시즌</option>
										<option value="2003">2003시즌</option>
									</select>
								</div>
								<div class="row mt-mb-15" id="schedule-border-top">
									<div class="play-table">
										<table class="table table-bordered" id="all-table">
											<thead id="th1">
												<tr id="record-border-menu">
													<th style="width: 150px">경기일시</th>
													<th style="width: 220px">경기구장</th>
													<th style="width: 350px">게임</th>
													<th style="width: 80px">결과</th>
												</tr>
											</thead>
											<!-- 테이블 데이터 시작  -->
											<tbody class="all-tbody">
												<c:forEach var="item" items="${list7}" varStatus="loop">
													<!--  1행 -->
													<tr>
														<!-- 경기 날짜  -->
														<td><span bat="1">${item.gamedate}</span></td>
														<td>${item.stadium}</td>
														<!--  팀 vs 팀  -->
														<td>${item.teamname }&nbsp;&nbsp;<span class="blue">${item.homescore }</span>&nbsp;&nbsp;
															: &nbsp;&nbsp;<span class="red">${item.awayscore }</span>&nbsp;&nbsp; ${item.awayteam }
														</td>
														<!-- 경기결과 -->
														<!-- <td><span class="badge badge-primary">승</span></td> -->
													</tr>
													<!-- 1행끝 -->
												</c:forEach>
											</tbody>
										</table>
										<!--  play-table end -->
									</div>
									<!--  전체선택 끝  -->
								</div>
								<!-- <div class="row">
									<div class="col-lg-12">
										<nav class="d-pagination" aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item"><a class="page-link" href="#"><i
														class="fa fa-angle-left"></i></a></li>
												<li class="page-item active"><a class="page-link"
													href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">4</a></li>
												<li class="page-item"><a class="page-link" href="#"><i
														class="fa fa-angle-right"></i></a></li>
											</ul>
										</nav>
									</div>
								</div> -->
							</div>
						</section>
					</div>
					<!-- schedule-list end -->

					<!-- record-list start -->
					<div class="tab-pane fade" id="record">
						<section class="blog-details-section section-padding"
							id="record-rank-list">
							<div class="container" id="record-container">
								<div class="record-rank">
									<input id="record-picther-tab" type="radio" name="records"
										checked> <label for="record-picther-tab">투수랭킹</label>

									<input id="record-batter-tab" type="radio" name="records">
									<label for="record-batter-tab">타자랭킹</label>

									<div class="record-right">
										<select id="record-season" name="record-season">
											<option value="2020">2020시즌</option>
											<option value="2019" selected>2019시즌</option>
											<option value="2018">2018시즌</option>
											<option value="2017">2017시즌</option>
											<option value="2016">2016시즌</option>
											<option value="2015">2015시즌</option>
											<option value="2014">2014시즌</option>
											<option value="2013">2013시즌</option>
											<option value="2012">2012시즌</option>
											<option value="2011">2011시즌</option>
											<option value="2010">2010시즌</option>
											<option value="2009">2009시즌</option>
											<option value="2008">2008시즌</option>
											<option value="2007">2007시즌</option>
											<option value="2006">2006시즌</option>
											<option value="2005">2005시즌</option>
											<option value="2004">2004시즌</option>
											<option value="2003">2003시즌</option>
										</select>
									</div>

									<div class="record-batter-right">
										<select id="record-season" name="record-season">
											<option value="2020">2020시즌</option>
											<option value="2019" selected>2019시즌</option>
											<option value="2018">2018시즌</option>
											<option value="2017">2017시즌</option>
											<option value="2016">2016시즌</option>
											<option value="2015">2015시즌</option>
											<option value="2014">2014시즌</option>
											<option value="2013">2013시즌</option>
											<option value="2012">2012시즌</option>
											<option value="2011">2011시즌</option>
											<option value="2010">2010시즌</option>
											<option value="2009">2009시즌</option>
											<option value="2008">2008시즌</option>
											<option value="2007">2007시즌</option>
											<option value="2006">2006시즌</option>
											<option value="2005">2005시즌</option>
											<option value="2004">2004시즌</option>
											<option value="2003">2003시즌</option>
										</select>
									</div>

									<!-- 투수 -->
									<section class="record-picther" id="record-picther">
										<div class="row mt-mb-15" id="record-border-top">
											<div class="play-table">
												<table class="table table-bordered" id="record-rank-table">
													<thead id="th1">
														<tr id="record-border-menu">
															<th style="width: 0.8%">순위</th>
															<th style="width: 4%">이름</th>
															<th style="width: 0.1%">승</th>
															<th style="width: 0.1%">패</th>
															<th style="width: 3.8%">블론세이브</th>
															<th style="width: 3.2%">교체이닝</th>
															<th style="width: 3.2%">교체타수</th>
															<th style="width: 2.2%">세이브</th>
															<th style="width: 0.8%">홀드</th>
															<th style="width: 3.8%">상대타자수</th>
															<th style="width: 0.8%">이닝</th>
															<th style="width: 2.2%">피안타</th>
															<th style="width: 2.2%">피홈런</th>
															<th style="width: 0.8%">볼넷</th>
															<th style="width: 0.8%">사구</th>
															<th style="width: 0.8%">삼진</th>
															<th style="width: 0.8%">실점</th>
															<th style="width: 2.2%">자책점</th>
														</tr>
													</thead>
													<!-- 테이블 데이터 시작  -->
													<tbody class="all-tbody">
													<c:forEach var="item" items="${pitcherrank}" varStatus="loop">
														<!--  1행 -->
														<tr>
															<!-- 순위  -->
															<td><span bat="1">${item.rank }</span></td>
															<!-- 이름 -->
															<td>${item.name }</td>
															<!--  -->
															<td>${item.w}</td>
															<!--  -->
															<td>${item.l }</td>
															<!--  -->
															<td>${item.blsv }</td>
															<!--  -->
															<td>${item.ci }</td>
															<!--  -->
															<td>${item.co }</td>
															<!--  -->
															<td>${item.sv }</td>
															<!--  -->
															<td>${item.hol }</td>
															<!--  -->
															<td>${item.tbf }</td>
															<!--  -->
															<td>${item.ip }</td>
															<!--  -->
															<td>${item.h }</td>
															<!--  -->
															<td>${item.hr }</td>
															<!--  -->
															<td>${item.bb }</td>
															<!--  -->
															<td>${item.hbp }</td>
															<!--  -->
															<td>${item.so }</td>
															<!--  -->
															<td>${item.r }</td>
															<!--  -->
															<td>${item.er }</td>
														</tr>
														<!-- 1행끝 -->
													</c:forEach>
													</tbody>
												</table>
												<!--  play-table end -->
											</div>
											<!--  전체선택 끝  -->
										</div>
									</section>

									<!-- 타자 -->
									<section class="record-batter" id="record-batter">
										<div class="row mt-mb-15" id="record-border-top">
											<div class="play-table">
												<table class="table table-bordered" id="record-rank-table">
													<thead id="th1">
														<tr id="record-border-menu">
															<th style="width: 0.8%">순위</th>
															<th style="width: 4%">이름</th>
															<th style="width: 0.8%">타석</th>
															<th style="width: 0.8%">타수</th>
															<th style="width: 0.8%">타수</th>
															<th style="width: 2.2%">2루타</th>
															<th style="width: 2.2%">3루타</th>
															<th style="width: 0.8%">홈런</th>
															<th style="width: 0.8%">득점</th>
															<th style="width: 0.8%">타점</th>
															<th style="width: 0.8%">도루</th>
															<th style="width: 3.2%">도루실패</th>
															<th style="width: 0.8%">볼넷</th>
															<th style="width: 0.8%">사구</th>
															<th style="width: 0.8%">삼진</th>
															<th style="width: 0.8%">병살</th>
															<th style="width: 0.8%">실책</th>
															<th style="width: 3.8%">수비포지션</th>
															<th style="width: 0.8%">타순</th>
														</tr>
													</thead>
													<!-- 테이블 데이터 시작  -->
													<tbody class="all-tbody">
													<c:forEach var="item" items="${hitterrank}" varStatus="loop">
														<!--  1행 -->
														<tr>
															<!-- 순위  -->
															<td><span bat="1">${item.rank }</span></td>
															<!-- 이름 -->
															<td>${item.name }</td>
															<!--  -->
															<td>${item.pa }</td>
															<!--  -->
															<td>${item.ab }</td>
															<!--  -->
															<td>${item.h }</td>
															<!-- 타수 -->
															<td>${item.b2 }</td>
															<!-- 득점 -->
															<td>${item.b3 }</td>
															<!-- 총안타 -->
															<td>${item.hr }</td>
															<!--  -->
															<td>${item.r }</td>
															<!--  -->
															<td>${item.rbi }</td>
															<!--  -->
															<td>${item.sb }</td>
															<!--  -->
															<td>${item.cs }</td>
															<!--  -->
															<td>${item.bb }</td>
															<!--  -->
															<td>${item.hbp }</td>
															<!--  -->
															<td>${item.so }</td>
															<!--  -->
															<td>${item.gdp }</td>
															<!--  -->
															<td>${item.e }</td>
															<!--  -->
															<td>${item.pos }</td>
															<!--  -->
															<td>${item.horder }</td>
														</tr>
														<!-- 1행끝 -->
													</c:forEach>
													</tbody>
												</table>
												<!--  play-table end -->
											</div>
											<!--  전체선택 끝  -->
										</div>
									</section>
								</div>
								<!-- <div class="row">
									<div class="col-lg-12">
										<nav class="d-pagination" aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item"><a class="page-link" href="#"><i
														class="fa fa-angle-left"></i></a></li>
												<li class="page-item active"><a class="page-link"
													href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">4</a></li>
												<li class="page-item"><a class="page-link" href="#"><i
														class="fa fa-angle-right"></i></a></li>
											</ul>
										</nav>
									</div>
								</div> -->
							</div>
						</section>
					</div>
					<!-- record-list end -->

					<!-- guinness-list start -->
					<div class="tab-pane fade" id="guinness">
						<div class="team-guinness">
							<div id="guinness-title">
								<h2 style="text-align: center;">Team Guinness</h2>
							</div>
							<div class="play-table">
								<table class="table table-bordered" id="guinness-table">
									<!-- 테이블 데이터 시작  -->
									<tbody class="all-tbody">
									
										<!--  1행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 연승</span></td>
											<!-- 기네스 수치 -->
											<td>38연승</td>
											<!-- 기네스 날짜 -->
											<td>어캐하냐 경기날짜(승)~경기날짜(패전)</td>
										</tr>
										<!-- 1행끝 -->
										
										<!-- 2행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 연패</span></td>
											<!-- 기네스 수치 -->
											<td>2연패</td>
											<!-- 기네스 날짜 -->
											<td>어캐하냐 경기날짜(패)~경기날짜(승전)</td>
										</tr>
										<!-- 2행끝 -->
										
										<!-- 3행 -->
										<c:forEach var="item" items="${teamguinnessscore}" varStatus="loop">
											<tr>
												<!-- 기네스 제목 -->
												<td><span>통산 최다 득점게임</span></td>
												<!-- 기네스 수치 -->
												<td>${item.sc }점</td>
												<!-- 기네스 날짜 -->
												<td>${item.gamedate }</td>
											</tr>
										</c:forEach>
										<!-- 3행끝 -->
										
										<!-- 5행 -->
										<c:forEach var="item" items="${teamguinnesshomerun}" varStatus="loop">
											<tr>
												<!-- 기네스 제목 -->
												<td><span>통산 최다 홈런게임</span></td>
												<!-- 기네스 수치 -->
												<td>${item.hr }개</td>
												<!-- 기네스 날짜 -->
												<td>${item.gamedate }</td>
											</tr>
										</c:forEach>
										<!-- 5행끝 -->
										
										<!-- 6행 -->
										<c:forEach var="item" items="${teamguinnesshit}" varStatus="loop">
											<tr>
												<!-- 기네스 제목 -->
												<td><span>통산 최다 안타게임</span></td>
												<!-- 기네스 수치 -->
												<td>${item.h }개</td>
												<!-- 기네스 날짜 -->
												<td>${item.gamedate }</td>
											</tr>
										</c:forEach>
										<!-- 6행끝 -->
										
										<!-- 7행 -->
										<c:forEach var="item" items="${teamguinnessstrikeout}" varStatus="loop">
											<tr>
												<!-- 기네스 제목 -->
												<td><span>통산 최다 삼진</span></td>
												<!-- 기네스 수치 -->
												<td>${item.so }개</td>
												<!-- 기네스 날짜 -->
												<td>${item.gamedate }</td>
											</tr>
										</c:forEach>
										<!-- 7행끝 -->
									
									</tbody>
								</table>
								<!--  play-table end -->
							</div>
						</div>
					</div> 
					<!-- guinness-list end -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- blog-details-section end -->