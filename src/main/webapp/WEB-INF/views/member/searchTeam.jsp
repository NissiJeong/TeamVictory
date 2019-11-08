<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.team-image{
	width: 100px;
	float:left;
}

#team-explain{
	width: 700px;
}

.teaminfoMessage{
	width: 500px;
}

.joinContent{
	width: 500px;
    height: 150px;
    padding: 10px;
}

.team_cate em, #team-explain em{
    color: #black;
    font-style: normal;
    margin: 0 6px;
}

.tel input{
	width: 60px;
	margin-right: 5px;
    text-align: center;
}

.joinbtn{
	margin-left: 44%;
    margin-top: 1.5%;
}

.modal-body ul li span.title{
    left: 0;
    top: 50%;
    margin-top: -16px;
    width: 110px;
    font-weight: bold;
    line-height: 32px;
    padding-left: 17px;
    padding-right: 10px;
}

.modal-body ul {
	border-bottom: 2px solid #d9d9d9;
	padding-bottom: 8px;
	padding-top: 8px;
	list-style: none;
}

.modal-body ul li {
	padding-bottom: 8px;
	padding-top: 8px;
}

#joinMessage {
	float:left;
	padding-top: 80px;
	margin-right: 4px;
}

#teaminfo{
	float:left;
	padding-top: 15px;
}

.search_team{
	padding-top: 20px;
	padding-bottom: 20px;
	border-top: 1px solid #ddd;
}

.select_fl_block{
	position: absolute;
    right: 16px;
    top: 1px;
}

.container{
	padding-left: 0px;
	padding-bottom: 20px;
}

.btn-submit{
	margin-right: 10px;
}
</style>

<!-- banner-section start -->
<section class="breadcum-section">
	<div class="breadcum-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcum-content text-center">
						<h3 class="title">Services</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">home</a></li>
							<li class="breadcrumb-item active">services</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- banner-section end -->

<!-- service-section start -->
<section class="service-section section-padding section-bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-7">
				<div class="section-header text-center">
					<h2 class="section-title">Search Team!</h2>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="search_result_r_list">
					<!-- 팀등록현황 -->
					<div id="con_tabs01">
						<!-- 팀등록현황 Search Form -->
						<div class="container">
							<legend class="sr-only">팀등록현황 검색</legend>
							<label for="keyword_a" class="sr-only">제목</label> 
							<input type="text" class="form-input" id="keyword_a" name="club_name" value="" title="팀검색" />
							<button class="btn-submit" type="submit">검색</button>
							
							<div class="select_fl_block">
								<select id="city" name="city">
									<option value="">전국</option>
									<option value="01">서울</option>
									<option value="02">인천</option>
									<option value="03">대전</option>
									<option value="04">광주</option>
									<option value="05">대구</option>
									<option value="06">부산</option>
									<option value="07">울산</option>
									<option value="08">경기</option>
									<option value="09">강원</option>
									<option value="10">충북</option>
									<option value="11">충남</option>
									<option value="12">전북</option>
									<option value="13">전남</option>
									<option value="14">경북</option>
									<option value="15">경남</option>
									<option value="16">제주</option>
									<option value="17">세종</option>
								</select>
							</div>
						</div>
						<!-- //팀등록현황 Search Form start -->
						<section>
							<c:forEach var="item" items="${list}" varStatus="loop">
								<div class="search_team">
									
										<div class="search_contents">
											<div class="team-image">
											<a href="#0" target="_blank">
												<img src="http://file.clubone.kr/symbol/club/20170303145415_022_thumb.jpg"style="width: 88px; height: 88px;" />
											</a>
											</div>
											<div class="team_cate">
												<strong>${item.TEAMNAME }</strong><em>|</em>지역(${item.TEAMLOC})
											</div>
											<ul id="team-explain">
												<li>팀장 : ${item.NAME }
												</li>
												<li>팀등록일 : ${item.REGIDATE }<em>|</em>팀등록선수 : ${item.TOTALMEMBER }
												</li>
											</ul>
											
											<button type="button" data-toggle="modal" data-target="#joinModal">가입신청</button>
										</div>
									
								</div>
							</c:forEach>
						</section>
						<!-- //팀등록현황 Search Form end -->
					</div>
					<!-- //팀등록현황 -->

					<!-- 팀 공개 포스팅 -->
					<div id="con_tabs02" style="display: none">
						<div
							style="text-align: center; padding: 50px 0; border-bottom: 1px solid #E7E7E7">
							<h3>준비중입니다.</h3>
						</div>
					</div>
					<!-- //팀 공개 포스팅 -->
				</div>
			</div>
		</div>
	</div>
	<!-- //선수등록현황 -->
</section>
<!-- service-section end -->

<div class="modal fade" id="joinModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center" style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">가입 신청</h5>
				<button type="button" class="close" data-dismiss="modal" style="color: white; font-weight: bold;">×</button>
			</div>

			<!--Body-->
			<div class="modal-body">
			
			<c:forEach var="item" items="${list}" varStatus="loop">
				<c:if test="${item.TEAMNAME == item.TEAMNAME}" var="result">
				<ul>
					<li><span class="title">팀장</span>${item.NAME }</li>
					<li><span class="title">연고지</span>${item.TEAMLOC}</li>
					<li><span class="title" id="teaminfo">팀 소개말</span>
						<textarea style="resize: none; border: none;" readonly="readonly" class="teaminfoMessage">${item.TEAMINFO }</textarea>
						</li>
						
				</ul>
				</c:if>
				</c:forEach>
				
			
				<ul>
					<li><span class="title">가입자명</span> 박준석</li>
					<li class="tel">
						<span class="title">연락처</span>
						<input type="text" class="phoneFirst" maxlength="3" />
						<input type="text" class="phoneMiddle" maxlength="4" /> 
						<input type="text" class="phoneLast" maxlength="4" />
						</li>
					<li class="msg"><span class="title" id="joinMessage">가입메세지</span>
						<textarea style="resize: none;" class="joinContent"></textarea>
					</li>
				</ul>
				<div class="joinbtn">
					<!-- <a href="#none" id="joinBtn"><img src="//img.gameone.kr/club/btn_join.png" alt="가입하기" /></a> -->
					<Button type="button" class="btn btn-info" onclick="<c:url ">가입하기</Button>
				</div>
			</div>
			<!--  Body -->
		</div>
	</div>
</div>