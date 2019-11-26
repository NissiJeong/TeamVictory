<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
body {
	background: #eee;
}

video {
	background: black;
	border: 1px solid gray;
}
element.style {
    margin-left: 150px;
    text-align: center;
}
.call-page {
	position: relative;
	display: block;
	margin: 0 auto;
	width: 500px;
	height: 500px;
}

#localVideo {
	text-align: center;
	width: 664px;
	height: 500px;
	position: absolute;
	top: 15px;
	right: 15px;
}

#remoteVideo {
	width: 0px;
	height: 0px;
}
p{
       text-align: center;
 }

</style>


<!-- league-result-section start -->

<section class="league-result-section section-padding section-bg">

<div id="loginPage" class="container text-center">
		<script src="<c:url value='/assets/js/client.js'/>"></script>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<label for="usernameInput" class="sr-only">이름</label> <input
					type="email" id="usernameInput" c lass="form-control formgroup"
					placeholder="이름" required="" autofocus="">
				<button id="loginBtn" class="btn btn-lg btn-primary btnblock">
					Live 방송보기</button>

			</div>
		</div>

	</div>

	<div id="callPage" class="call-page">
		<video id="localVideo" autoplay></video>
		<video id="remoteVideo" autoplay></video>



	</div>
	<div>
<script src="<c:url value='/assets/js/client.js'/>"></script>
</div>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section-header text-center">
					<h2 class="section-title">한소인배 초등 야구</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="league-result-area">
					<div class="league-result-area-inner">
						<div
							class="league-result-item d-flex align-items-center justify-content-between">
							<div class="date-block">
								<span class="date">04, Dec</br>AM 09
								</span>
							</div>
							<div
								class="team-block d-flex justify-content-center align-items-center">
								<div class="team team--left">
									<span class="name">희망대초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/희망대초.jpg'/>"
										alt="image" /></span>
								</div>
								<span class="vs-text">VS</span>
								<div class="team team--right">
									<span class="name">수진초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/수진초.jpg'/>" alt="image" /></span>
								</div>
							</div>
							<div class="result-block justify-content-center">
								<p>
									<span class="left-team-result">12</span> <span
										class="right-team-result">3</span>
								</p>
							</div>
							<div class="button-block justify-content-end">
								<p>
								<a href="#0" style="background-color:gray" class="cmn-btn btn-lg">경기 끝</a>
								</p>
							</div>
						</div>
						<!-- league-result-item end -->
						<div
							class="league-result-item d-flex align-items-center justify-content-between">
							<div class="date-block">
								<span class="date">04, Dec</br>AM 11
								</span>
							</div>
							<div
								class="team-block d-flex justify-content-center align-items-center">
								<div class="team team--left">
									<span class="name">관산초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/관산.jpg'/>" alt="image" /></span>
								</div>
								<span class="vs-text">VS</span>
								<div class="team team--right">
									<span class="name">백마초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/백마초.jpg'/>" alt="image" /></span>
								</div>
							</div>
							<div class="result-block justify-content-center">
								<p>
									<span class="left-team-result">0</span> <span
										class="right-team-result">0</span>
								</p>
							</div>
							<div class="button-block justify-content-end">
								<a href="#0" class="cmn-btn btn-lg">경기중</a>
							</div>
						</div>
						<!-- league-result-item end -->
						<div
							class="league-result-item d-flex align-items-center justify-content-between">
							<div class="date-block">
								<span class="date">04, Dec</br>PM 02
								</span>
							</div>
							<div
								class="team-block d-flex justify-content-center align-items-center">
								<div class="team team--left">
									<span class="name">삼일초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/삼일초.jpg'/>" alt="image" /></span>
								</div>
								<span class="vs-text">VS</span>
								<div class="team team--right">
									<span class="name">연현초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/연현초.jpg'/>" alt="image" /></span>
								</div>
							</div>
							<div class="result-block justify-content-center">
								<p>
									<span class="left-team-result">0</span> <span
										class="right-team-result">0</span>
								</p>
							</div>
							<div class="button-block justify-content-end">
								<a href="#0" style="background-color:burlywood" class="cmn-btn btn-lg">경기 예정</a>
							</div>
						</div>
						<!-- league-result-item end -->
						<div
							class="league-result-item d-flex align-items-center justify-content-between">
							<div class="date-block">
								<span class="date">04, Dec</br>PM 04
								</span>
							</div>
							<div
								class="team-block d-flex justify-content-center align-items-center">
								<div class="team team--left">
									<span class="name">부천북초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/부천북초.jpg'/>" alt="image" /></span>
								</div>
								<span class="vs-text">VS</span>
								<div class="team team--right">
									<span class="name">소래초</span> <span class="flag"><img
										src="<c:url value='/assets/images/flag/소래초.jpg'/>" alt="image" /></span>
								</div>
							</div>
							<div class="result-block justify-content-center">
								<p>
									<span class="left-team-result">0</span> <span
										class="right-team-result">0</span>
								</p>
							</div>
							<div class="button-block justify-content-end">
								<a href="#0" style="background-color:burlywood" class="cmn-btn btn-lg">경기 예정</a>
							</div>
						</div>
						<!-- league-result-item end -->
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- league-result-section end -->


