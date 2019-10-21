<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

#record-container, #record-rank-table{
	width: 120%;
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
	width: 121.5%;
}

.right{
	position: absolute;
    right:30px;
    top: 15px;
}
.record-right {
	display: none;
	position: absolute;
	right: -325px;
    top: 15px;
}

.record-batter-right{
display: none;
	position: absolute;
    right: -180px;
    top: 15px;
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

#record-picther-tab:checked ~ record-batter-right,
#record-picther-tab:checked ~ #record-picther,
#record-picther-tab:checked ~ .record-right  {
	display: block;
}

#record-batter-tab:checked + .record-rank {
	width: 105%;
}

#record-batter-tab:checked ~ #record-batter,
#record-batter-tab:checked ~ .record-batter-right {
	display: block;	
}

</style>

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
		<div class="row">
			<div class="col-lg-3">
				<div class="sidebar">
					<!-- left-menu start -->
					<div class="widget widget-categories">
						<h4 class="widget-title">팀이름 넣는곳</h4>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#teamprofile">팀소개</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#player">선수단</a></li>
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
						<label for="top3-player-score-tab">최다득점</label> <input
							id="top3-player-out-tab" type="radio" name="tabs"> <label
							for="top3-player-out-tab">최다삼진</label> <input
							id="top3-player-hit-tab" type="radio" name="tabs"> <label
							for="top3-player-hit-tab">최다안타</label> <input
							id="top3-player-run-tab" type="radio" name="tabs"> <label
							for="top3-player-run-tab">최다도루</label>

						<!-- score start -->
						<section class="top3-player-score" id="top3-player-score">
							<div class="small-post-item">
								<div class="small-post-thumb">
									<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
										alt="image" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>득점</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s2.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>득점</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s3.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>득점</li>
									</ul>
								</div>
							</div>

						</section>
						<!-- score end -->

						<!-- out start -->
						<section class="top3-player-out" id="top3-player-out">

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
										alt="image" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>삼진</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s2.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>삼진</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s3.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>삼진</li>
									</ul>
								</div>
							</div>

						</section>
						<!-- out end -->

						<!-- hit start -->
						<section class="top3-player-hit" id="top3-player-hit">
							<div class="small-post-item">
								<div class="small-post-thumb">
									<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
										alt="image" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>안타</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s2.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>안타</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s3.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>안타</li>
									</ul>
								</div>
							</div>
						</section>
						<!-- hit end -->

						<!-- run start -->
						<section class="top3-player-run" id="top3-player-run">
							<div class="small-post-item">
								<div class="small-post-thumb">
									<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
										alt="image" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>도루</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s2.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>도루</li>
									</ul>
								</div>
							</div>

							<div class="small-post-item">
								<div class="small-post-thumb">
									<img
										src="<c:url value='/assets/images/blog/s3.jpg" alt="image'/>" />
								</div>
								<div class="small-post-content">
									<h6>
										<a href="#0">이름</a>
									</h6>
									<ul class="post-meta">
										<li>도루</li>
									</ul>
								</div>
							</div>
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
										<dl class="info">
											<dt>팀명</dt>
											<dd>서울 마포구리틀</dd>
											<dt>감독</dt>
											<dd>&nbsp;</dd>
											<dt>팀마스터</dt>
											<dd>최성호</dd>
											<dt>창단일</dt>
											<dd>2017.06.01</dd>
											<dt>연고지</dt>
											<dd>서울 &gt; 마포구</dd>
											<dt>선수단</dt>
											<dd>
												<strong>15</strong>명
											</dd>
											<dt>평균연령</dt>
											<dd>15.5세</dd>
											<dt>팀분류</dt>
											<dd>리틀야구</dd>
										</dl>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="team-join-league">
										<dl class="info">
											<dt>참여 리그</dt>
											<dd>사회안 야구3기</dd>
										</dl>
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
									<label for="position1">전체</label> <input id="position2"
										type="radio" name="positions"> <label for="position2">투수</label>

									<input id="position3" type="radio" name="positions"> <label
										for="position3">포수</label> <input id="position4" type="radio"
										name="positions"> <label for="position4">내야수</label> <input
										id="position5" type="radio" name="positions"> <label
										for="position5">외야수</label>
								</div>

								<div class="row mt-mb-15" id="player-border-top">
									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-lg-3">
										<div class="post-item">
											<div class="thumb">
												<img src="/matching/assets/images/blog/1.jpg" alt="image" />
											</div>
											<div class="content" id="player-list-member">
												<h4 class="post-title">선수이름</h4>
												<ul class="post-meta">
													<li style="font-size: 14px;">포지션</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
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
									<input id="schedule-result1" type="radio" name="schedules"
										checked> <label for="schedule-result1">전체</label> <input
										id="schedule-result2" type="radio" name="schedules"> <label
										for="schedule-result2">일정</label> <input id="schedule-result3"
										type="radio" name="schedules"> <label
										for="schedule-result3">결과</label>
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
													<th style="width: 270px">게임</th>
													<th style="width: 80px">결과</th>
													<th style="width: 100px">상세보기</th>
												</tr>
											</thead>
											<!-- 테이블 데이터 시작  -->
											<tbody class="all-tbody">
												<!--  1행 -->
												<tr>
													<!-- 경기 날짜  -->
													<td><span bat="1">2019-10-10</span></td>
													<td>경기구장</td>
													<!--  팀 vs 팀  -->
													<td>기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp;
														: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
													</td>
													<!-- 경기결과 -->
													<td><span class="badge badge-primary">승</span></td>
													<!-- 상세보기 -->
													<td>상세보기</td>
												</tr>
												<!-- 1행끝 -->

												<!--  1행 -->
												<tr>
													<!-- 경기 날짜  -->
													<td><span bat="1">2019-10-10</span></td>
													<td>경기구장</td>
													<!--  팀 vs 팀  -->
													<td>기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp;
														: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
													</td>
													<!-- 경기결과 -->
													<td><span class="badge badge-primary">승</span></td>
													<!-- 상세보기 -->
													<td>상세보기</td>
												</tr>
												<!-- 1행끝 -->

												<!--  1행 -->
												<tr>
													<!-- 경기 날짜  -->
													<td><span bat="1">2019-10-10</span></td>
													<td>경기구장</td>
													<!--  팀 vs 팀  -->
													<td>기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp;
														: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
													</td>
													<!-- 경기결과 -->
													<td><span class="badge badge-primary">승</span></td>
													<!-- 상세보기 -->
													<td>상세보기</td>
												</tr>
												<!-- 1행끝 -->
											</tbody>
										</table>
										<!--  play-table end -->
									</div>
									<!--  전체선택 끝  -->
								</div>
								<div class="row">
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
								</div>
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
															<th style="width: 5%">순위</th>
															<th style="width: auto">이름</th>
															<th style="width: 5%">방어율</th>
															<th style="width: auto">게임수</th>
															<th style="width: 5%">승</th>
															<th style="width: 5%">패</th>
															<th style="width: 5%">세이브</th>
															<th style="width: 5%">홀드</th>
															<th style="width: auto">승률</th>
															<th style="width: auto">타자</th>
															<th style="width: auto">타수</th>
															<th style="width: 5%">투구수</th>
															<th style="width: 5%">이닝</th>
															<th style="width: 5%">피안타</th>
															<th style="width: 5%">피홈런</th>
															<th style="width: auto">고의사구</th>
															<th style="width: 5%">사구</th>
															<th style="width: 5%">탈삼진</th>
															<th style="width: 5%">실점</th>
															<th style="width: 5%">자책점</th>
														</tr>
													</thead>
													<!-- 테이블 데이터 시작  -->
													<tbody class="all-tbody">
														<!--  1행 -->
														<tr>
															<!-- 순위  -->
															<td><span bat="1">1</span></td>
															<!-- 이름 -->
															<td>나투수</td>
															<!-- 방어율 -->
															<td>2.57</td>
															<!-- 게임수 -->
															<td>29</td>
															<!-- 승 -->
															<td>20</td>
															<!-- 패 -->
															<td>0</td>
															<!-- 세이브 -->
															<td>0</td>
															<!-- 홀드 -->
															<td>1</td>
															<!-- 승률 -->
															<td>1.000</td>
															<!-- 타자 -->
															<td>533</td>
															<!-- 타수 -->
															<td>491</td>
															<!-- 투구수 -->
															<td>127</td>
															<!-- 이닝 -->
															<td>117</td>
															<!-- 피안타 -->
															<td>138</td>
															<!-- 피홈런 -->
															<td>3</td>
															<!-- 고의사구 -->
															<td>0</td>
															<!-- 사구 -->
															<td>3</td>
															<!-- 탈삼진 -->
															<td>14</td>
															<!-- 실점 -->
															<td>81</td>
															<!-- 자책점 -->
															<td>43</td>
														</tr>
														<!-- 1행끝 -->
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
															<th style="width: 5%">순위</th>
															<th style="width: auto">이름</th>
															<th style="width: 5%">타율</th>
															<th style="width: auto">게임수</th>
															<th style="width: 5%">타석</th>
															<th style="width: 5%">타수</th>
															<th style="width: 5%">득점</th>
															<th style="width: 5%">안타</th>
															<th style="width: auto">1루타</th>
															<th style="width: auto">2루타</th>
															<th style="width: auto">3루타</th>
															<th style="width: 5%">홈런</th>
															<th style="width: 5%">도루</th>
															<th style="width: 5%">타점</th>
															<th style="width: 5%">볼넷</th>
															<th style="width: auto">고의사구</th>
															<th style="width: 5%">사구</th>
															<th style="width: 5%">삼진</th>
														</tr>
													</thead>
													<!-- 테이블 데이터 시작  -->
													<tbody class="all-tbody">
														<!--  1행 -->
														<tr>
															<!-- 순위  -->
															<td><span bat="1">1</span></td>
															<!-- 이름 -->
															<td>다치자</td>
															<!-- 타율 -->
															<td>0.458</td>
															<!-- 게임수 -->
															<td>59</td>
															<!-- 타석 -->
															<td>155</td>
															<!-- 타수 -->
															<td>131</td>
															<!-- 득점 -->
															<td>45</td>
															<!-- 총안타 -->
															<td>60</td>
															<!-- 1루타 -->
															<td>50</td>
															<!-- 2루타 -->
															<td>9</td>
															<!-- 3루타 -->
															<td>1</td>
															<!-- 홈런 -->
															<td>0</td>
															<!-- 도루 -->
															<td>23</td>
															<!-- 타점 -->
															<td>34</td>
															<!-- 볼넷 -->
															<td>16</td>
															<!-- 고의사구 -->
															<td>0</td>
															<!-- 사구 -->
															<td>8</td>
															<!-- 삼진 -->
															<td>14</td>
														</tr>
														<!-- 1행끝 -->
													</tbody>
												</table>
												<!--  play-table end -->
											</div>
											<!--  전체선택 끝  -->
										</div>
									</section>
								</div>
								<div class="row">
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
								</div>
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
											<td>2018-11-17 ~ 2019-02-16</td>
										</tr>
										<!-- 1행끝 -->
										
										<!-- 2행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 연패</span></td>
											<!-- 기네스 수치 -->
											<td>2연패</td>
											<!-- 기네스 날짜 -->
											<td>2019-06-16 ~ 2019-06-16</td>
										</tr>
										<!-- 2행끝 -->
										
										<!-- 3행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 득점게임</span></td>
											<!-- 기네스 수치 -->
											<td>40점</td>
											<!-- 기네스 날짜 -->
											<td>2017-03-18 ( VS NUBES AZULES)</td>
										</tr>
										<!-- 3행끝 -->
										
										<!-- 4행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 점수차게임</span></td>
											<!-- 기네스 수치 -->
											<td>38점</td>
											<!-- 기네스 날짜 -->
											<td>2017-03-18 ( VS NUBES AZULES)</td>
										</tr>
										<!-- 4행끝 -->
										
										<!-- 5행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 홈런게임</span></td>
											<!-- 기네스 수치 -->
											<td>7개</td>
											<!-- 기네스 날짜 -->
											<td>2018-06-06 ( VS UDT용병)</td>
										</tr>
										<!-- 5행끝 -->
										
										<!-- 6행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 안타게임</span></td>
											<!-- 기네스 수치 -->
											<td>32개</td>
											<!-- 기네스 날짜 -->
											<td>2017-03-18 ( VS NUBES AZULES)</td>
										</tr>
										<!-- 6행끝 -->
										
										<!-- 7행 -->
										<tr>
											<!-- 기네스 제목 -->
											<td><span>통산 최다 삼진</span></td>
											<!-- 기네스 수치 -->
											<td>14개</td>
											<!-- 기네스 날짜 -->
											<td>2018-05-26 ( VS UDT용병)</td>
										</tr>
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