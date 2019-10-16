<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
dd {
	padding-bottom: 5px;
}

#top3{
	padding: 5px;
}

#player-list{
	padding-top: 0px;
}

#player-list-member{
	padding: 4px 20px 4px 40px;
}

.position{
	padding-left: 15px;
	padding-bottom: 15px;
}

/*라디오버튼 숨김*/
.widget-most-view-post input,
.position input{
	display: none;
}

.widget-most-view-post label{
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

.position label{
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

.widget-most-view-post label:hover,
.position label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid white;
}

#content1, #content2, #content3, #content4 {
	display: none;
	padding: 20px 0 0;
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

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
	#content3, #tab4:checked ~ #content4 {
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
							<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#teamprofile">팀소개</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#player">선수단</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#schedule">일정/결과</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#record">경기기록통계</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#guinness">팀기네스</a></li>
						</ul>
					</div>
					<!-- left menu end -->

					<!-- top3 start -->
					<div class="widget widget-most-view-post" id="top3">
						<h4 class="widget-title">TOP3 플레이어</h4>
						<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
					    <label for="tab1">최다득점</label>
					
					    <input id="tab2" type="radio" name="tabs">
					    <label for="tab2">최다삼진</label>
					
					    <input id="tab3" type="radio" name="tabs">
					    <label for="tab3">최다안타</label>
					
					    <input id="tab4" type="radio" name="tabs">
					    <label for="tab4">최다도루</label>

						<!-- score start -->
						<section class="content1" id="content1">
							<div class="small-post-item-div">
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
							</div>
						</section>
						<!-- score end -->

						<!-- out start -->
						<section class="content2" id="content2">
							<div class="small-post-item-div">
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
							</div>
						</section>
						<!-- out end -->

						<!-- hit start -->
						<section class="content3" id="content3">
							<div class="small-post-item-div">
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
							</div>
						</section>
						<!-- hit end -->

						<!-- run start -->
						<section class="content4" id="content4">
							<div class="small-post-item-div">
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
									<div class="about-thumb">
										<img src="<c:url value='/assets/images/teamlogo/logo.jpg'/>"
											alt="about-image">
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
						<section class="blog-details-section section-padding" id="player-list">
							<div class="container">
							<div class="position">
								<input id="position1" type="radio" name="positions" checked> 
								<label for="position1">전체</label> 
								
								<input id="position2" type="radio" name="positions"> 
								<label for="position2">투수</label>
								
								<input id="position3" type="radio" name="positions"> 
								<label for="position3">포수</label>
								
								<input id="position4" type="radio" name="positions">
								<label for="position4">내야수</label> 
								
								<input id="position5" type="radio" name="positions">
								<label for="position5">외야수</label>  
							</div>
								<div class="row mt-mb-15">
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
						<div>일정/결과</div>
					</div>
					<!-- schedule-list end -->

					<!-- record-list start -->
					<div class="tab-pane fade" id="record">
						<div>경기기록 통계</div>
					</div>
					<!-- record-list end -->

					<!-- guinness-list start -->
					<div class="tab-pane fade" id="guinness">
						<div>팀기네스</div>
					</div>
					<!-- guinness-list end -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- blog-details-section end -->