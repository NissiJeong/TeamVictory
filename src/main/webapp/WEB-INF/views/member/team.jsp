<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
dd{
	
	padding-bottom: 5px; 
}
</style>

<section class="team-topmenu-section">
	<div class="team-topmenu-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="team-topmenu-content text-center">
						<ol class="team-topmenu">
							<li class="team-topmenu-item logo"><img alt="로고"
								src="<c:url value='/assets/images/teamlogo/logo.jpg'/>"><a
								href="/"></a></li>
							<li class="team-topmenu-item active"><a href="/">팀소개</a></li>
							<li class="team-topmenu-item active"><a href="/">선수단</a></li>
							<li class="team-topmenu-item active"><a href="/">일정/결과</a></li>
							<li class="team-topmenu-item active"><a href="/">기록통계</a></li>
							<li class="team-topmenu-item active"><a href="/">팀기네스</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

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
			<div class="col-lg-8">
				<!-- about-section start -->
				<section class="about-section section-padding">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-6 col-md-6">
								<div class="about-thumb">
									<img src="<c:url value='/assets/images/about-img.png'/>" alt="about-image">
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
										<dd><strong>15</strong>명</dd>
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
										<dt>참여 리그 </dt>
										<dd>사회안 야구3기</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- about-section end -->
				<!-- blog-details-wrapper end -->

				<!-- 
				<div class="comment-form-wrap">
					<h3 class="title">Leave a reply</h3>
					<form class="cmn-form comment-form">
						<div class="row">
							<div class="col-md-6">
								<div class="frm-group">
									<input type="text" name="name" id="name" placeholder="Name*">
								</div>
							</div>
							<div class="col-md-6">
								<div class="frm-group">
									<input type="url" name="url" id="url" placeholder="Website*">
								</div>
							</div>
							<div class="col-md-12">
								<div class="frm-group">
									<input type="email" name="email" id="email"
										placeholder="Email Address*">
								</div>
							</div>
							<div class="col-md-12">
								<div class="frm-group">
									<textarea name="message" id="message"
										placeholder="Write Message"></textarea>
								</div>
							</div>
							<div class="col-md-12">
								<div class="frm-group">
									<button type="submit" class="submit-btn">Comment</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				-->
			</div>
			<div class="col-lg-4">
				<div class="sidebar">
					<div class="widget widget-categories">
						<h4 class="widget-title">팀이름 넣는곳</h4>
						<ul>
							<li><a href="#0">선수단</a></li>
							<li><a href="#0">일정/결과</a></li>
							<li><a href="#0">경기기록통계</a></li>
							<li><a href="#0">팀기네스</a></li>
						</ul>
					</div>
					<!-- widget end -->
					<div class="widget widget-most-view-post">
						<h4 class="widget-title">TOP3 플레이어</h4>
						<ul class="small-post-list">
							<li>
								<div class="small-post-item">
									<div class="small-post-thumb">
										<img src="<c:url value='/assets/images/blog/s1.jpg'/>"
											alt="image" />
									</div>
									<div class="small-post-content">
										<h6>
											<a href="#0">Turn Your Bet Into A High Performing...</a>
										</h6>
										<ul class="post-meta">
											<li><a href="#"><i class="fa fa-calendar"></i>04,
													March, 2019</a></li>
										</ul>
									</div>
								</div>
							</li>
							<!-- small-post-item end -->
							<li>
								<div class="small-post-item">
									<div class="small-post-thumb">
										<img
											src="<c:url value='/assets/images/blog/s2.jpg" alt="image'/>" />
									</div>
									<div class="small-post-content">
										<h6>
											<a href="#0">Turn Your Bet Into A High Performing...</a>
										</h6>
										<ul class="post-meta">
											<li><a href="#"><i class="fa fa-calendar"></i>04,
													March, 2019</a></li>
										</ul>
									</div>
								</div>
							</li>
							<!-- small-post-item end -->
							<li>
								<div class="small-post-item">
									<div class="small-post-thumb">
										<img
											src="<c:url value='/assets/images/blog/s3.jpg" alt="image'/>" />
									</div>
									<div class="small-post-content">
										<h6>
											<a href="#0">Turn Your Bet Into A High Performing...</a>
										</h6>
										<ul class="post-meta">
											<li><a href="#"><i class="fa fa-calendar"></i>04,
													March, 2019</a></li>
										</ul>
									</div>
								</div>
							</li>
							<!-- small-post-item end -->
						</ul>
					</div>
					<!-- widget end -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- blog-details-section end -->



