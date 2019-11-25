<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<input type="hidden" value="${id}" id="auth"/>

<style>

.team-image{
	width: 100px;
	float:left;
}

#team-explain{
	width: 700px;
}

.teaminfoMessage{
	width: 465px;
}

.joinContent{
	width: 465px;
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
	margin-left: 40%;
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

#teaminfoMessage{
	width: 85%;
	border: none;
	box-shadow: 0px 0px 0px 0px;
	padding-top: 0px;
    padding-left: 5px;
    min-height: 90px;
}
#signup-name{
	width: 15%;
    box-shadow: 0px 0px 0px 0px;
    padding: 3px 3px 3px 10px;
    margin-left: 4px;
}

#joinContent{
	width: 85%;
    box-shadow: 0px 0px 1px 0px;
}

#SIGNTEAMNAME{
	width: 30%;
    box-shadow: 0px 0px 0px 0px;
    border: none;
    padding: 3px 3px 3px 10px;
    margin-left: 0px;
}

#keyword_a{
	width: 25%;
	padding: 3px 3px 3px 10px;
	margin-right: 8px;
}
</style>

<script>
$(function(){
	var clickBtn = $('.signup-button').click(function(){
		  var loc;
		  var teamMgr;
		// console.log('팀장 이름', $(this).prev().find('li').eq(0).text());
		 // console.log(clickBtn.index(this));
		 console.log('ㄴㅁㄹ',$(this).prev().find('li').eq(0).find('strong').text());
		
		 $('.modal-body').find('span.title:eq(0)').next().val($(this).prev().find('li').eq(0).find('strong').text());//팀명
		 $('.modal-body').find('span.title:eq(1)').next().text($(this).prev().find('li').eq(1).find('span').text());//팀장
		 $('.modal-body').find('span.title:eq(2)').next().text($(this).prev().find('li').eq(0).find('span').text());//지역
		 $('.modal-body').find('.teaminfoMessage').text($(this).prev().find('li').eq(3).find('span').text());//팀소개/sign;
		 $('.modal-body').find('.signup-name').val('');//모달창 열떄 텍스트초기화
		 $('.modal-body').find('.joinContent').val('');//모달창 열떄 텍스트초기화
	});
});////////


</script>
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
						<form class="cmn-form contact-form"
						action="<c:url value='/Team/Matching/searchTeam.do?${_csrf.parameterName}=${_csrf.token}'/>"
							id="form" runat="server" method="post" enctype="multipart/form-data">
							<!-- 팀등록현황 Search Form -->
							<div class="container">
								<input type="text" placeholder="팀명을 입력하세요" class="form-input" id="keyword_a" name="TEAM_NAME_SEARCH" title="팀검색" />
								<button class="btn-submit" type="submit">검색</button>
								<button class="btn-submit" type="submit" style="margin-left: -3px;">전체보기</button>
							</div>
						</form>
						<!-- //팀등록현황 Search Form start -->
						<section>
							<c:if test="${! empty list }" var="isList">
								<c:forEach var="item" items="${list}" varStatus="loop">
								
									<div class="search_team">
										<div class="search_contents">
											<div class="team-image">
												<c:if test="${! empty item.TEAMLOGO }" var="isLogo">
													<img src="/matching/Upload/${item.TEAMLOGO }" alt="image" style="width:80px; height:80px"/>
												</c:if>
												<c:if test="${not isLogo}">
						              				<img src="https://us.123rf.com/450wm/martialred/martialred1507/martialred150700789/42614399-%EC%9D%91%EC%9A%A9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8-%EB%B0%8F-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%97%90-%EB%8C%80%ED%95%9C-%EC%B9%B4%EB%A9%94%EB%9D%BC-%EC%B4%AC%EC%98%81-%EB%9D%BC%EC%9D%B8-%EC%95%84%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98.jpg?ver=6" alt="image" style="width:80px; height:80px"/>
						              			</c:if>
											</div>
											<ul id="team-explain">
												<li><strong>${item.TEAMNAME }</strong><em>|</em>지역(<span>${item.TEAMLOC}</span>)</li>
												<li>팀장 : <span>${item.NAME }</span>
												</li>
												<li>팀등록일 : ${item.REGIDATE }<em>|</em>팀등록선수 : ${item.TOTALMEMBER }
												</li>
												<li style="display: none;"><span>${item.TEAMINFO}</span></li>
											</ul>
											<button type="button" class="signup-button" data-toggle="modal" data-target="#joinModal">가입신청</button>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${not isList}">
								<div>
									<h4>검색내용이 없습니다.</h4>
								</div>
							</c:if>
							
						</section>
						<!-- //팀등록현황 Search Form end -->
					</div>
					<!-- //팀등록현황 -->
				</div>
			</div>
		</div>
	</div>
	<!-- //선수등록현황 -->
</section>
<!-- service-section end -->

<div class="modal fade" id="joinModal" onclose="">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center" style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">가입 신청</h5>
				<button type="button" class="close" data-dismiss="modal" style="color: white; font-weight: bold;">×</button>
			</div>

			<!--Body-->
			<div class="modal-body">
				<form class="cmn-form contact-form"
						action="<c:url value='/Team/Matching/TeamMemberInsert.do?${_csrf.parameterName}=${_csrf.token}'/>"
							id="form" runat="server" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
					<ul>
						<li><span class="title">팀명</span><input type="text" id="SIGNTEAMNAME" class="pl-2" name="SIGNTEAMNAME"></li>
						<li><span class="title">팀장</span><span  class="pl-2"></span></li>
						<li><span class="title">지역</span><span class="pl-2"></span></li>
						<li><span class="title" id="teaminfo">팀 소개말</span>
							<textarea style="resize: none; border: none;" readonly="readonly" class="teaminfoMessage" id="teaminfoMessage"></textarea>
						</li>
					</ul>
					<ul>
						<li><span class="title">신청자명</span>
						<c:forEach var="item" items="${myinfo}" varStatus="loop">
							<input type="text" placeholder="${item.NAME }" value="${item.NAME}" class="signup-name" name="SIGNUP-NAME" id="signup-name" readonly="readonly">
						</c:forEach>
						</li>
						
						<li class="msg"><span class="title" id="joinMessage">자기소개</span>
							<textarea style="resize: none;" class="joinContent" name="SIGNUP-SELF" id="joinContent"></textarea>
						</li>
					</ul>
					<div class="joinbtn">
						<Button type="submit" class="submit-btn">가입하기</Button>
					</div>
				</form>
			</div>
			<!--  Body -->
		</div>
	</div>
</div>