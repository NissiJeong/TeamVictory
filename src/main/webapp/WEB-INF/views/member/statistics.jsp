<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal.username" var="id" />
<sec:authentication property="principal.authorities" var="auth" />
<input type="hidden" value="${id}" id="auth" />
<!-- 1.4.2 -->
<script src='http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<script	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://cdn.jsdelivr.net/npm/chart.js@2.8.0'></script>
<script src="<c:url value='/assets/js/utils.js' />"></script>
<script src="<c:url value='/assets/js/daumpost.js' />"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />





<style>
.play-table tbody tr td {
	padding: 10px 0;
	font-size: 14px;
}

.child1 {
	position: absolute;
	left: 20%;
}

.child2 {
	position: absolute;
	right: 20%;
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

<!-- 메인파트 -->
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
									<c:forEach var="PROFILE" items="${profile }">
										<span class="image"> <img
											src="<c:url value='/Upload/${PROFILE.PROFILE}'/>" alt="대표사진"
											style="min-height: 190px; height: 300px;" for="imgInput"
											id="please">
										</span>
										<h1 class="my-4">${PROFILE.NAME}</h1>
									</c:forEach>
									<div class="list-group">

										<a href="#" class="list-group-item" id="hitterDetailbtn"
											data-toggle="modal" data-target="#recordModal">타자 기록</a> <a
											href="#" class="list-group-item" id="pitcherDetailbtn"
											data-toggle="modal" data-target="#pitcherModal">투수 기록</a> <a
											href="#" class="list-group-item" id="infoBtn"
											data-toggle="modal" data-target="#infoModal">회원 정보</a> <a
											href="#" class="list-group-item" id="playerBtn"
											data-toggle="modal" data-target="#playerModal">선수 정보</a> <a
											href="#" class="list-group-item" id="bettingBtn"
											data-toggle="modal" data-target="#bettingModal">승부예측 이력</a>

										<%-- 돼지불백 봉인
										<form id="submit" method="post" action="<c:url value='/Team/Matching/InsertHitterByPARSING'/>">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
											<button type="submit" class="submit-btn" style="margin-top: 100px">돼지불백</button>
										</form>
										--%>
									</div>
								</div>
								<div class="col-lg-1"></div>
							</div>
							<!-- div col-lg-5 -->
							<div class="col-lg-6" style="border: 1px solid gold">
								<div style="margin-top: -100px; text-align: center">
									<!-- 데이터 출력!!! -->
									<c:forEach var="hitters" items="${records}">
										<div class="play-table-part listToChange scrollLocation">
											<input type="hidden" class="scrolling"
												data-recordno="${hitters.RECORDNO}" />
											<div class="play-table">
												<div>
													<div class="summary">
														<div>
															<dl class="info">
																<dt>
																	<h1>${hitters.GAMEDATE}__ ${hitters.TIME}</h1>
																</dt>
																<dd>
																	<h1>${hitters.STADIUM}파크</h1>
																</dd>
															</dl>
														</div>
														<div class="parent1" style="margin-top: 50px">
															<div class="child1">
																<dl>
																	<dt>
																		<a href="/club/?club_idx=14322"> <img
																			src="<c:url value='/Upload/${hitters.HOMELOGO}'/>"
																			style="float: left; width: 125px; height: 125px">
																		</a>
																	</dt>
																	<dd>
																		<c:choose>
																			<c:when
																				test="${hitters.HOMESCORE > hitters.AWAYSCORE}">
																				<span class="result"><h4>승</h4></span>
																			</c:when>
																			<c:when
																				test="${hitters.HOMESCORE < hitters.AWAYSCORE}">
																				<span class="result"><h4>패</h4></span>
																			</c:when>
																			<c:otherwise>
																				<span class="result"><h4>무</h4></span>
																			</c:otherwise>
																		</c:choose>
																		<span class="name">${hitters.TEAMNAME}</span>
																	</dd>
																	<dd>
																		<span class="score"><h5>${hitters.HOMESCORE}</h5></span>
																	</dd>
																</dl>
															</div>
															<div class="child2">
																<dl>
																	<dt>
																		<a href="/club/?club_idx=19031"> <img
																			src="<c:url value='/Upload/${hitters.AWAYLOGO}'/>"
																			style="float: left; width: 125px; height: 125px">
																		</a>
																	</dt>
																	<dd>
																		<c:choose>
																			<c:when
																				test="${hitters.HOMESCORE > hitters.AWAYSCORE}">
																				<span class="result"><h4>패</h4></span>
																			</c:when>
																			<c:when
																				test="${hitters.HOMESCORE < hitters.AWAYSCORE}">
																				<span class="result"><h4>승</h4></span>
																			</c:when>
																			<c:otherwise>
																				<span class="result"><h4>무</h4></span>
																			</c:otherwise>
																		</c:choose>
																		<span class="name">${hitters.AWAYTEAM}</span>
																	</dd>
																	<!--mm-->
																	<dd>
																		<span class="score"><h5>${hitters.AWAYSCORE}</h5></span>
																	</dd>
																</dl>
															</div>
														</div>
														<br />
														<div style="margin-top: 200px">
															<p>
																<strong>${hitters.HORDER}번 타자</strong>

																<!-- c:choose - 포지션 출력 -->
																<c:choose>
																	<c:when test="${hitters.POS == 1}">
																		<span>(투수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 2}">
																		<span>(포수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 3}">
																		<span>(1루수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 4}">
																		<span>(2루수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 5}">
																		<span>(3루수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 6}">
																		<span>(유격수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 7}">
																		<span>(좌익수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 8}">
																		<span>(중견수)</span>
																	</c:when>
																	<c:when test="${hitters.POS == 9}">
																		<span>(우익수)</span>
																	</c:when>
																	<c:otherwise>
																		<span>(지명타자)</span>
																	</c:otherwise>
																</c:choose>
																<strong>${hitters.NAME }</strong>(${hitters.BACKNUMBER })
															</p>
														</div>
													</div>
												</div>
												<c:if test="${hitters.PA ne null }">
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
																<td>${hitters.SUMAB}</td>
																<td>${hitters.SUMH}</td>
																<td>${hitters.SUMRBI }</td>
																<td>${hitters.SUMHR}</td>
																<td>${hitters.SUMSB }</td>
																<td>${hitters.SUMAVG }<br /></td>
															</tr>
														</tbody>
													</table>
												</c:if>

												<c:if test="${hitters.TBF ne null }">
													<table>
														<thead>
															<tr>
																<th>투수기록</th>
																<th>이닝</th>
																<th>자책</th>
																<th>피안타</th>
																<th>삼진</th>
																<th>볼넷</th>
																<th>평균자책</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td>${hitters.CI}.${hitters.CO }</td>
																<td>${hitters.PER}</td>
																<td>${hitters.PH}</td>
																<td>${hitters.PSO}</td>
																<td>${hitters.PBB}</td>
																<td>계산필요</td>
															</tr>
														</tbody>
													</table>
													<table>
														<thead>
															<tr>
																<th>통산기록</th>
																<th>출장</th>
																<th>이닝</th>
																<th>평균자책</th>
																<th>승</th>
																<th>패</th>
																<th>삼진</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td>따로계산</td>
																<td>계산필요</td>
																<td>계산필요</td>
																<td>${hitters.SUMW}</td>
																<td>${hitters.SUML }</td>
																<td>${hitters.SUMPSO }<br /></td>
															</tr>
														</tbody>
													</table>
												</c:if>

											</div>
										</div>
										<!-- 로딩시 selectList로 불러오는 forEach 내부 문 -->
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- blog-details-section end -->
			</div>
		</div>
	</div>
</div>


<!-- 선수 정보 수정 모달 -->
<div class="modal fade" id="playerModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header text-center"
				style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">선수 정보 입력</h5>
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="row">
					<div class="col">
						<form class="cmn-form contact-form"
							action="<c:url value='/Team/Matching/playerChange.do'/>"
							method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="row">
								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">출신 고교</label> <input type="text"
											id="infoSchool" name="infoSchool" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">키</label> <input type="text" id="infoHeight"
											name="infoHeight" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">몸무게</label> <input type="text"
											id="infoWeight" name="infoWeight" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">뭐 넣지</label> <input type="button"
											placeholder="뭐 넣지" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">메인 팀 선택</label> <select
											class="form-control" id="teamLoc">
											<option selected>메인 팀 선택</option>
											<c:forEach var="teamName" items="${TEAMNAMES }">
												<option value="${teamName.TEAMNAMEFORMODAL}"><c:out
														value="${teamName.TEAMNAMEFORMODAL}" /></option>
											</c:forEach>
										</select>

									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group"></div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<p>
											<strong>Checkbox</strong>
										</p>

										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox1"
												class="custom-control-input"> <label
												class="custom-control-label" for="jb-checkbox1">체크할거</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="jb-checkbox2"
												class="custom-control-input"> <label
												class="custom-control-label" for="jb-checkbox2">있나</label>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<p>
											<strong>투타 구분</strong>
										</p>
										<div class="custom-control custom-radio">
											<input type="radio" name="jb-radio" id="jb-radio-1"
												class="custom-control-input"> <label
												class="custom-control-label" for="jb-radio-1">우투우타</label>
										</div>
										<div class="custom-control custom-radio">
											<input type="radio" name="jb-radio" id="jb-radio-2"
												class="custom-control-input"> <label
												class="custom-control-label" for="jb-radio-2">우투좌타</label>
										</div>
										<div class="custom-control custom-radio">
											<input type="radio" name="jb-radio" id="jb-radio-3"
												class="custom-control-input"> <label
												class="custom-control-label" for="jb-radio-3">좌투좌타</label>
										</div>
										<div class="custom-control custom-radio">
											<input type="radio" name="jb-radio" id="jb-radio-4"
												class="custom-control-input"> <label
												class="custom-control-label" for="jb-radio-4">좌투우타</label>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="frm-group text-center">
										<button type="submit" class="submit-btn" id="playerInfoBtn">수정</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--  Body -->
		</div>
	</div>
</div>

<!-- 개인정보 수정 모달 -->
<div class="modal fade" id="infoModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header text-center"
				style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">정보 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="row">
					<div class="col">
						<form class="cmn-form contact-form"
							action="<c:url value='/Team/Matching/profileChange.do?${_csrf.parameterName}=${_csrf.token}'/>"
							id="form" runat="server" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="row">
								<div class="col-md-6">
									<div class="frm-group">
										<input type='file' id="imgInput" name="upload"
											style="display: none" />
										<c:forEach var="PROFILE" items="${profile }">
											<span class="image"> <img id="image_section"
												src="<c:url value='/Upload/${PROFILE.PROFILE}'/>"
												style="width: 190px; height: 190px" />
											</span>
										</c:forEach>
										<label for="imgInput" class="btn btn-info">사진 선택</label>
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">ID</label> <input type="text"
											id="manager_id" name="manager_id" disabled value="${id }">
										<label for="sel3">이름</label> <input type="text" id="infoName"
											name="infoName">
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">비밀번호</label> <input type="text"
											id="infoPass" disabled value="●●●●●●●●●">
									</div>
								</div>
								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">비밀번호 확인</label> <input type="text"
											id="infoPass2" disabled value="●●●●●●●●●">
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">생년 월일</label> <input type="text"
											id="infoBirth" name="infoBirth" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">연락처</label> <input type="text"
											id="infoCall" name="infoCall" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3" onClick="sample4_execDaumPostcode()">주소</label>
										<input type="text" onClick="sample4_execDaumPostcode()"
											placeholder="주소" value="주소 입력" name="sample4_roadAddress"
											id="sample4_roadAddress" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">상세주소 입력</label> <input type="text"
											id="infoDetailAddress" name="infoDetailAddress" />
									</div>
								</div>

								<div class="col-md-6">
									<div class="frm-group">
										<label for="sel3">등번호</label> <input type="text"
											id="infoBackNumber" name="infoBackNumber" />
									</div>
								</div>


								<div class="col-md-12">
									<div class="frm-group text-center">
										<button type="submit" class="submit-btn" id="register">수정</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 타자차트 모달 -->
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
					<select id="selectTeam" name='selectTeam'>
						<option value='#' selected>팀 전체</option>
						<c:forEach var="teamName" items="${TEAMNAMES }">
							<option value="${teamName.TEAMNAMEFORMODAL}"><c:out
									value="${teamName.TEAMNAMEFORMODAL}" /></option>
						</c:forEach>
					</select>
					<div class="wrapper">
						<canvas id="chart-0"></canvas>
					</div>
					<div>
						<div class="play-table-part">
							<div class="play-table">
								<table style="text-align: center">
									<thead>
										<tr>
											<th>경기</th>
											<th>타석</th>
											<th>타수</th>
											<th>타점</th>
											<th>안타</th>
											<th>볼넷</th>
											<th>홈런</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="hd1" class="detailData"></td>
											<td id="hd2" class="detailData"></td>
											<td id="hd3" class="detailData"></td>
											<td id="hd4" class="detailData"></td>
											<td id="hd5" class="detailData"></td>
											<td id="hd6" class="detailData"></td>
											<td id="hd7" class="detailData"></td>

										</tr>
									</tbody>
								</table>
								<table style="text-align: center">
									<thead>
										<tr>
											<th>2루타</th>
											<th>3루타</th>
											<th>루타</th>
											<th>도루</th>
											<th>도실</th>
											<th>사구</th>
											<th>병살</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="hd8" class="detailData"></td>
											<td id="hd9" class="detailData"></td>
											<td id="hd10" class="detailData"></td>
											<td id="hd11" class="detailData"></td>
											<td id="hd12" class="detailData"></td>
											<td id="hd13" class="detailData"></td>
											<td id="hd14" class="detailData"></td>
										</tr>
									</tbody>
								</table>
								<table style="text-align: center">
									<thead>
										<tr>
											<th>K%</th>
											<th>BB/K%</th>
											<th>타율</th>
											<th>출루율</th>
											<th>장타율</th>
											<th>OPS</th>
											<th>wOBA</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="hd15" class="detailData"></td>
											<td id="hd16" class="detailData"></td>
											<td id="hd17" class="detailData"></td>
											<td id="hd18" class="detailData"></td>
											<td id="hd19" class="detailData"></td>
											<td id="hd20" class="detailData"></td>
											<td id="hd21" class="detailData"><br /></td>
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

<!-- 투수차트 모달 -->
<div class="modal fade" id="pitcherModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header text-center"
				style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">투수 정보</h5>
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div>
					<select id="pSelectTeam" name='pSelectTeam'>
						<option value='#' selected>팀 전체</option>
						<c:forEach var="teamName" items="${PTEAMNAMES }">
							<option value="${teamName.TEAMNAMEFORMODAL}"><c:out
									value="${teamName.TEAMNAMEFORMODAL}" /></option>
						</c:forEach>
					</select>
					<div class="wrapper">
						<canvas id="chart-1"></canvas>
					</div>
					<div>
						<div class="play-table-part">
							<div class="play-table">
								<table style="text-align: center">
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
											<td id="pd1" class="pitcherData"></td>
											<td id="pd2" class="pitcherData"></td>
											<td id="pd3" class="pitcherData"></td>
											<td id="pd4" class="pitcherData"></td>
											<td id="pd5" class="pitcherData"></td>
											<td id="pd6" class="pitcherData"></td>
											<td id="pd7" class="pitcherData"></td>
										</tr>
									</tbody>
								</table>
								<table style="text-align: center">
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
											<td id="pd8" class="pitcherData"></td>
											<td id="pd9" class="pitcherData"></td>
											<td id="pd10" class="pitcherData"></td>
											<td id="pd11" class="pitcherData"></td>
											<td id="pd12" class="pitcherData"></td>
											<td id="pd13" class="pitcherData"></td>
											<td id="pd14" class="pitcherData"></td>
										</tr>
									</tbody>
								</table>
								<table style="text-align: center">
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
											<td id="pd15" class="pitcherData"></td>
											<td id="pd16" class="pitcherData"></td>
											<td id="pd17" class="pitcherData"></td>
											<td id="pd18" class="pitcherData"></td>
											<td id="pd19" class="pitcherData"></td>
											<td id="pd20" class="pitcherData"></td>
											<td id="pd21" class="pitcherData"><br /></td>
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



<!-- 베팅 이력 모달 -->
<div class="modal fade" id="bettingModal">
	<div class="modal-dialog  modal-lg" role="document">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header text-center"
				style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">승부예측 이력</h5>
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>
			</div>

			<div class="modal-body">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>경기</th>
							<th>나의 PICK</th>
							<th>참여 인원</th>
							<th>예상 배당</th>
						</tr>
					</thead>
					<tbody id="dataTableTarget">
					</tbody>
				</table>

				<table class="table table-bordered" id="dataTable2" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>경기</th>
							<th>경기결과</th>
							<th>적중여부</th>
							<th>마일리지</th>
						</tr>
					</thead>
					<tbody id="dataTableTarget2">
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<!-- 사진 쓱싹변경 -->
<script>
	$(function() {

		// 사진 변경부분	
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInput").change(function() {
			readURL(this);
		});
	});
</script>


<!--프로필 정보 불러오기 // 프로필 변경  -->
<script>
	$(function() {
		$("#infoBtn").click(function() {

			$.ajax({
				url : "<c:url value='/Team/Matching/memberInfo.do'/>",
				type : "post",
				data : {
					USER_ID : $('#auth').val(),
					'_csrf' : '${_csrf.token}'
				},

				success : function(data) {
					if (data != "") {
						$(data).each(function() {
							$('#infoName').val(this.NAME);
							$('#infoBirth').val(this.BIRTH);
							$('#infoCall').val(this.PHONE);
							$('#sample4_roadAddress').val(this.LOCATION);
							$('#infoDetailAddress').val(this.LOCATION_2);
							$('#infoBackNumber').val(this.BACKNUMBER);
						});// each 
					}
				},
				error : function(e) {
					alert("회원정보 불러오기 실패");
				}
			});
		});

		$("#playerBtn").click(function() {

			$.ajax({
				url : "<c:url value='/Team/Matching/playerInfo.do'/>",
				type : "post",
				data : {
					USER_ID : $('#auth').val(),
					'_csrf' : '${_csrf.token}'
				},

				success : function(data) {
					if (data != "") {
						$(data).each(function() {
							$('#infoSchool').val(this.SCHOOL);
							$('#infoHeight').val(this.HEIGHT + " cm");
							$('#infoWeight').val(this.WEIGHT + " kg");
						});// each 
					}
				},
				error : function(e) {
					alert("플레이어정보 불러오기 실패");
				}
			});
		});

		$.ajax({
			url : "<c:url value='/Team/Matching/bettingInfo.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				'_csrf' : '${_csrf.token}'
			},

			success : function(data) {
				var str = "";
				if (data != "") {
					$(data).each(function() {
						str += '<tr>' + '<th>' + this.GAME + '</th>' + '<th>' + this.SELECTTEAM + '</th>' + '<th>' + this.COUNT + '</th>' + '<th>' + this.RATE + '</th>' + '</tr>';
					});// each 
					$("#dataTableTarget").append(str);
				}
			},
			error : function(e) {
				alert("플레이어정보 불러오기 실패");
			}
		});

		$.ajax({
			url : "<c:url value='/Team/Matching/bettingInfo2.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				'_csrf' : '${_csrf.token}'
			},

			success : function(data) {
				var str = "";
				if (data != "") {
					$(data).each(function() {
						str += '<tr>' + '<th>' + this.GAME + '</th>' + '<th>' + this.GAMERESULT + '</th>' + '<th>' + this.CORRECT + '</th>' + '<th>' + this.INCORDEC + '</th>' + '</tr>';
					});// each 
					$("#dataTableTarget2").append(str);
				}
			},
			error : function(e) {
				alert("플레이어정보 불러오기 실패");
			}
		});

		$("#bettingBtn").click(function() {

			jQuery(function($) {
				$("#dataTable").DataTable();
			});

			jQuery(function($) {
				$("#dataTable2").DataTable();
			})
		});

	});
</script>


<!-- 로딩시 불러올 부분 - 차트의 기본 옵션 설정 -->
<script>
	$(function() {
		/* 차트 부분 */
		var DATA_COUNT = 6;
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
			return v < 10 ? 5 : v < 25 ? 7 : v < 50 ? 9 : v < 75 ? 11 : 15;
		}

		var chartData = {
			labels : [ [ 'CONTACT', '타율' ], [ 'BATTING EYE', '선구안' ], [ 'SPEED', '속도' ], [ 'POWER', '파워' ], [ 'HOME RUN', '홈런' ], [ 'LUCK', '행운' ] ],
			datasets : [ {
				data : [ 0, 0, 0, 0, 0, 0 ]
			} ]
		};
		
		var chartData2 = {
				labels : [ [ '이닝 당', '상대한 타자' ], [ '뭐 어떻게', '하는거임??' ], 'Sleeping', [ 'Designing', 'Graphics' ], 'Coding', 'Cycling' ],

				datasets : [ {
					data : [ 0, 0, 0, 0, 0, 0 ]
				} ]
			};

		var options = {
			legend : false,
			tooltips : true,
			scale : {
				ticks : {
					beginAtZero : true,
					max : 10,
					min : 0,
					stepSize : 2
				}
			},
			elements : {
				line : {
					backgroundColor : make20PercentOpaque,
					borderColor : getLineColor,
				},
				point : {
					backgroundColor : getLineColor,
					hoverBackgroundColor : makeHalfAsOpaque,
					radius : adjustRadiusBasedOnData,
					pointStyle : alternatePointStyles,
					hoverRadius : 15,
				},

			}
		};
		
		var chart = new Chart('chart-0', {
			type : 'radar',
			data : chartData,
			options : options
		});
		
		var chart2 = new Chart('chart-1', {
			type : 'radar',
			data : chartData2,
			options : options
		});
		

	});
</script>



<!-- 타자 정보보기 클릭  -->
<script>
	//타자모달 버튼 클릭 
	var clickHitterBtn = $('#hitterDetailbtn').click(function() {

		$.ajax({
			url : "<c:url value='/Team/Matching/hitterDetailView.do'/>",
			data : {
				USER_ID : $('#auth').val(),
				'_csrf' : '${_csrf.token}'
			},
			type : 'post',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			success : function(data) {
				/*  $(".detailData").text(""); */
				if (data != "") {
					console.log(data);
					$(data).each(function() {
						$('#hd1').text(this.RECORDNO);
						$('#hd2').text(this.SUMPA);
						$('#hd3').text(this.SUMAB);
						$('#hd4').text(this.SUMRBI);
						$('#hd5').text(this.SUMH);
						$('#hd6').text(this.SUMBB);
						$('#hd7').text(this.SUMHR);
						$('#hd8').text(this.SUMB2);
						$('#hd9').text(this.SUMB3);
						$('#hd10').text(this.RUTA);
						$('#hd11').text(this.SUMSB);
						$('#hd12').text(this.SUMCS);
						$('#hd13').text(this.SUMHBP);
						$('#hd14').text(this.SUMGDP);
						$('#hd15').text(this.KPER);
						$('#hd16').text(this.BBKPER);
						$('#hd17').text(this.TA);
						$('#hd18').text(this.CHUL);
						$('#hd19').text(this.JANG);
						$('#hd20').text(this.OPS);
						$('#hd21').text(this.WOBA);

						chartData = {
							labels : [ [ 'CONTACT', '타율' ], [ 'BATTING EYE', '선구안' ], [ 'SPEED', '속도' ], [ 'POWER', '파워' ], [ 'HOME RUN', '홈런' ], [ 'LUCK', '행운' ] ],
							datasets : [ {
								data : [ ($('#hd2').text() * 10 / $('#hd1').text()), 0, 0, 0, 0, 0 ]
							} ]
						};
						chart.clear();
						chart = new Chart('chart-0', {
							type : 'radar',
							data : chartData,
							options : options
						});
					});// each 
				} else {
					alert("불러올 데이터가 없습니다.");
				}// else
			}
		}); // ajax 

	});////////  clickDetailBtn
</script>






<!-- 타자 selectItem 체인지 이벤트 -->
<script>
	$('#selectTeam').change(function() {
		$.ajax({
			url : "<c:url value='/Team/Matching/hitterDetailViewEachTeam.do'/>",
			data : {
				USER_ID : $('#auth').val(),
				USER_TEAMNAME : $(this).val(),
				'_csrf' : '${_csrf.token}'
			},
			type : 'post',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			success : function(data) {
				/* $(".detailData").text(""); */
				if (data != "") {
					console.log(data);
					$(data).each(function() {
						$('#hd1').text(this.SUMAB);
						$('#hd2').text(this.SUMH);
						$('#hd4').text(this.SUMHR);

						chartData = {
							labels : [ [ 'CONTACT', '타율' ], [ 'BATTING EYE', '선구안' ], [ 'SPEED', '속도' ], [ 'POWER', '파워' ], [ 'HOME RUN', '홈런' ], [ 'LUCK', '행운' ] ],
							datasets : [ {
								data : [ ($('#hd2').text() * 100 / $('#hd1').text()), 0, 0, 0, 0, 0 ]
							} ]
						};
						chart.clear();
						chart = new Chart('chart-0', {
							type : 'radar',
							data : chartData,
							options : options
						});
					});// each 
				} else {
					$.ajax({
						url : "<c:url value='/Team/Matching/hitterDetailView.do'/>",
						data : {
							USER_ID : $('#auth').val(),
							'_csrf' : '${_csrf.token}'
						},
						type : 'post',
						dataType : 'json',
						success : function(data) {
							/* $(".detailData").text(""); */
							if (data != "") {
								$(data).each(function() {
									$('#hd1').text(this.SUMAB);
									$('#hd2').text(this.SUMH);
									$('#hd4').text(this.SUMHR);
									chartData = {
										labels : [ [ 'CONTACT', '타율' ], [ 'BATTING EYE', '선구안' ], [ 'SPEED', '속도' ], [ 'POWER', '파워' ], [ 'HOME RUN', '홈런' ], [ 'LUCK', '행운' ] ],
										datasets : [ {
											data : [ ($('#hd2').text() * 100 / $('#hd1').text()), 0, 0, 0, 0, 0 ]
										} ]
									};
									chart.clear();
									chart = new Chart('chart-0', {
										type : 'radar',
										data : chartData,
										options : options
									});
								});// each 
							}
						}
					}); // ajax 
				}// else
			}
		}); // ajax 
	});////////  clickSelectItem
</script>


<!-- 투수 정보보기 클릭 -->
<script>
//투수 정보 클릭 
$('#pitcherDetailbtn').click(function() {
	$.ajax({
		url : "<c:url value='/Team/Matching/pitcherDetailView.do'/>",
		data : {
			USER_ID : $('#auth').val(),
			'_csrf' : '${_csrf.token}'
		},
		type : 'post',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		success : function(data) {
			/*  $(".detailData").text(""); */
			if (data != "") {
				console.log(data);
				$(data).each(function() {
					$('#pd1').text(this.SUMCI);
					$('#pd2').text(this.SUMTBF);
					$('#pd4').text(this.SUMPH);
					chartData2 = {
						labels : [ [ '이닝 당', '상대한 타자' ], [ '투수기록', '출력중' ], '팀전체보기', [ 'Designing', 'Graphics' ], 'Coding', 'Cycling' ],
						datasets : [ {
							data : [ ($('#pd2').text() * 100 / $('#pd1').text()), 0, 0, 0, 0, 0 ]
						} ]
					};
					chart2.clear();
					chart2 = new Chart('chart-1', {
						type : 'radar',
						data : chartData2,
						options : options
					});
				});// each 
			} else {
				alert("불러올 데이터가 없습니다.");
			}// else
		}
	}); // ajax 
});////////  clickDetailBtn
</script>



<!-- 투수 selectItem 체인지 이벤트 -->
<script>
//selectItem 클릭
$('#pSelectTeam').change(function() {
	$.ajax({
		url : "<c:url value='/Team/Matching/pitcherDetailViewEachTeam.do'/>",
		data : {
			USER_ID : $('#auth').val(),
			USER_TEAMNAME : $(this).val(),
			'_csrf' : '${_csrf.token}'
		},
		type : 'post',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		success : function(data) {
			/* $(".detailData").text(""); */
			if (data != "") {
				console.log(data);
				$(data).each(function() {
					$('#pd1').text(this.SUMCI);
					$('#pd2').text(this.SUMTBF);
					$('#pd4').text(this.SUMPH);
					chartData2 = {
						labels : [ [ '이닝 당', '상대한 타자' ], [ '투수기록', '출력중' ], '세부팀보기', [ 'Designing', 'Graphics' ], 'Coding', 'Cycling' ],
						datasets : [ {
							data : [ ($('#pd2').text() * 100 / $('#pd1').text()), 0, 0, 0, 0, 0 ]
						} ]
					};
					chart2.clear();
					chart = new Chart('chart-1', {
						type : 'radar',
						data : chartData2,
						options : options
					});
				});// each 
			} else {
				$.ajax({
					url : "<c:url value='/Team/Matching/pitcherDetailView.do'/>",
					data : {
						USER_ID : $('#auth').val(),
						'_csrf' : '${_csrf.token}'
					},
					type : 'post',
					dataType : 'json',
					success : function(data) {
						/* $(".detailData").text(""); */
						if (data != "") {
							$(data).each(function() {
								$('#pd1').text(this.SUMCI);
								$('#pd2').text(this.SUMTBF);
								$('#pd4').text(this.SUMPH);
								chartData2 = {
									labels : [ [ '이닝 당', '상대한 타자' ], [ '투수기록', '출력중' ], '팀전체보기', [ 'Designing', 'Graphics' ], 'Coding', 'Cycling' ],
									datasets : [ {
										data : [ ($('#pd2').text() * 100 / $('#pd1').text()), 0, 0, 0, 0, 0 ]
									} ]
								};
								chart2.clear();
								chart2 = new Chart('chart-1', {
									type : 'radar',
									data : chartData2,
									options : options
								});
							});// each 
						}
					}
				}); // ajax 
			}// else
		}
	}); // ajax 
});////////  clickSelectItem
</script>





<!-- 스크롤다운 이벤트 -->
<script>
	var lastScrollTop = 0;

	// 1. 스크롤 이벤트 발생
	$(window).scroll(
		function() { // ① 스크롤 이벤트 최초 발생
			var currentScrollTop = $(window).scrollTop();
			if (currentScrollTop - lastScrollTop > 0) {
				console.log("down-scroll");
	
				if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
					var lastrecordno = $(".scrolling:last").attr("data-recordno");
	
					$.ajax({
						type : 'post', // 요청 method 방식 
						url : '<c:url value="/Team/Matching/downstatostics.do"/>',// 요청할 서버의 url
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'json',
						data : {
							RECORDNO : lastrecordno,
							'_csrf' : '${_csrf.token}'
						},
						success : function(data) {
							var str = "";
							if (data != "") {
								$(data).each(
										function() {
	
											str += '<div class="play-table-part listToChange scrollLocation" >' + '<input type="hidden" class="scrolling" data-recordno="'+ this.RECORDNO +'" />' + '<div class="play-table">' + '<div>'
													+ '<div class="summary">' + '<dl class="info">' + '<dt>'
													+ this.GAMEDATE
													+ '(토) '
													+ this.TIME
													+ '</dt>'
													+ '<dd>'
													+ this.STADIUM
													+ ' 파크</dd>'
													+ '</dl>'
													+ '<div style="display:inline">'
													+ '<dl>'
													+ '<dt><a href="/club/?club_idx=14322" target="_blank"><img src="/matching/Upload/'+this.HOMELOGO+'" style="float:left" ></a></dt>'
													+ '<dd>'
													+ '<span class="result ">패　</span>'
													+ '<span class="name" style="width: 80px; margin-left: 5px;">'
													+ this.TEAMNAME
													+ '</span>'
													+ '<span class="add_info" style="height:13px"></span>'
													+ '</dd><!--mm-->'
													+ '<dd><span class="score">'
													+ this.HOMESCORE
													+ '</span></dd>'
													+ '</dl>'
													+ '</div>'
													+ '<div style="display:inline">'
													+ '<dl>'
													+ '<dt><a href="/club/?club_idx=19031" target="_blank"><img src="/matching/Upload/'+this.AWAYLOGO+'" style=float:left"></a></dt>'
													+ '<dd>'
													+ '<span class="result win">승　</span>'
													+ '<span class="name">'
													+ this.AWAYTEAM
													+ '</span>'
													+ '<span class="add_info" style="height:13px"></span>'
													+ '</dd><!--mm-->'
													+ '<dd><span class="score">'
													+ this.AWAYSCORE
													+ '</span></dd>'
													+ '</dl>'
													+ '</div>'
													+ '<p>'
													+ '<strong>'
													+ this.HORDER
													+ '번 타자</strong>'
													+ '<span class="add_info">('
													+ this.POS
													+ ')</span>'
													+ '<strong>'
													+ this.NAME
													+ '</strong>('
													+ this.BACKNUMBER
													+ ')'
													+ '</p>'
													+ '</div>'
													+ '</div>'
													+ '<table>'
													+ '<thead>'
													+ '<tr>'
													+ '<th>타자기록</th>'
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
													+ this.AVG
													+ '</td>'
													+ '</tr>'
													+ '</tbody>'
													+ '</table>'
													+ '<table class="point">'
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
													+ this.SUMAB
													+ '</td>'
													+ '<td>'
													+ this.SUMH
													+ '</td>'
													+ '<td>'
													+ this.SUMRBI
													+ '</td>'
													+ '<td>'
													+ this.SUMHR
													+ '</td>'
													+ '<td>'
													+ this.SUMSB
													+ '</td>'
													+ '<td>'
													+ this.SUMAVG
													+ '</td>'
													+ '</tr>' + '</tbody>' + '</table>';
	
											if (this.TBF != -1) {
	
												str += '<table>' + '<thead>' + '<tr>' + '<th>투수기록</th>' + '<th>이닝</th>' + '<th>자책</th>' + '<th>피안타</th>' + '<th>삼진</th>' + '<th>볼넷</th>' + '<th>평균자책</th>' + '</tr>' + '</thead>'
														+ '<tbody>' + '<tr>' + '<td></td>' + '<td>'
														+ this.CI
														+ '</td>'
														+ '<td>'
														+ this.PER
														+ '</td>'
														+ '<td>'
														+ this.PH
														+ '</td>'
														+ '<td>'
														+ this.PSO
														+ '</td>'
														+ '<td>'
														+ this.PBB
														+ '</td>'
														+ '<td>계산필요</td>'
														+ '</tr>'
														+ '</tbody>'
														+ '</table>'
														+ '<table>'
														+ '<thead>'
														+ '<tr>'
														+ '<th>통산기록</th>'
														+ '<th>출장</th>'
														+ '<th>이닝</th>'
														+ '<th>평균자책</th>'
														+ '<th>승</th>'
														+ '<th>패</th>'
														+ '<th>삼진</th>'
														+ '</tr>'
														+ '</thead>'
														+ '<tbody>'
														+ '<tr>'
														+ '<td></td>'
														+ '<td>따로계산</td>'
														+ '<td>계산필요</td>'
														+ '<td>계산필요</td>'
														+ '<td>'
														+ this.SUMW
														+ '</td>'
														+ '<td>'
														+ this.SUML
														+ '</td>'
														+ '<td>'
														+ this.SUMPSO + '<br /></td>' + '</tr>' + '</tbody>' + '</table>';
											}
											str += '</div>' + '</div>';
										});// each 
								var position2 = $(".scrollLocation:last").offset();
								$(".scrollLocation:last").after(str);
							}// if : data!=null
							else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
								alert("더 불러올 데이터가 없습니다.");
							}// else
						}// success
					});// ajax
				}//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
				// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
				lastScrollTop = currentScrollTop;
			}// 다운스크롤인 상태
		});// scroll event
</script>
