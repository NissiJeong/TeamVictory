<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal.username" var="id" />
<sec:authentication property="principal.authorities" var="auth" />
<input type="hidden" value="${id}" id="auth" />

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="//code.jquery.com/ui/jquery-ui-git.js"></script>

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

thead tr th {
	 border: 1px solid #dee2e6;
}

tbody tr td {
	 border: 1px solid #dee2e6;
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
						<div class="row" class="banner">
							<div class="col-lg-4" id="flyingDiv"
								style="text-align: center;" > <!-- style="border: 1px solid magenta;  -->
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
									<div class="list-group" style="box-shadow: 0 5px 15px -2px rgba(0, 0, 64, 0.15);">

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
							
							<div class="col-lg-6" style="padding-top: 50px !important;">
								<div style="margin-top: -100px; text-align: center;">
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
																	<h1>${hitters.GAMEDATE}_ ${hitters.TIME}</h1>
																</dt>
																<dd>
																	<h1>${hitters.STADIUM}</h1>
																</dd>
															</dl>
														</div>
														<div class="parent1" style="margin-top: 50px">
															<div class="child1" style="box-shadow: 0 5px 15px -2px rgba(0, 0, 64, 0.15);"> 
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
															<div class="child2" style="box-shadow: 0 5px 15px -2px rgba(0, 0, 64, 0.15);">
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
																<c:if test="${hitters.PA ne 0 }">
																	<!-- c:choose - 타순 -->
																	<c:choose>
																		<c:when test="${hitters.HORDER == 1}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 2}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 3}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 4}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 5}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 6}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 7}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 8}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
																		<c:when test="${hitters.HORDER == 9}">
																			<strong>${hitters.HORDER}번 타자</strong>
																		</c:when>
														 				<c:otherwise>
																			<strong>교체 출전</strong>
																		</c:otherwise>
																	</c:choose>
																</c:if>
																<!-- c:choose - 포지션 출력 -->
																<c:choose>
																	<c:when test="${hitters.POS == 1 or hitters.TBF ne null}">
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
																	<c:when test="${hitters.POS == 0}">
																		<span>(지명타자)</span>
																	</c:when>
																	<c:otherwise>
																		<span>(대타/대주자)</span>
																	</c:otherwise>
																</c:choose>
																<strong>${hitters.NAME }</strong>(${hitters.BACKNUMBER })
															</p>
														</div>
													</div>
												</div>
												<c:if test="${hitters.PA ne 0 }">
													<table style="text-align: center;table-layout:fixed; word-break:break-all;">
														<thead>
															<tr>
																<th>　　</th>
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
													<table style="text-align: center;table-layout:fixed; word-break:break-all;">
														<thead>
															<tr>
																<th>통산</th>
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
													<table style="text-align: center;table-layout:fixed; word-break:break-all;">
														<thead>
															<tr>
																<th>　　</th>
																<th>이닝</th>
																<th>ERA</th>
																<th>자책점</th>
																<th>안타</th>
																<th>삼진</th>
																<th>볼넷</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td>${hitters.IP}</td>
																<td>${hitters.ERA}</td>
																<td>${hitters.PER}</td>
																<td>${hitters.PH}</td>
																<td>${hitters.PSO}</td>
																<td>${hitters.PBB}</td>
															</tr>
														</tbody>
													</table>
													<table style="text-align: center;table-layout:fixed; word-break:break-all;">
														<thead>
															<tr>
																<th>통산</th>
																<th>이닝</th>
																<th>ERA</th>
																<th>타자</th>
																<th>승</th>
																<th>패</th>
																<th>삼진</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td></td>
																<td>${hitters.SUMIP}</td>
																<td>${hitters.SUMERA}</td>
																<td>${hitters.SUMTBF}</td>
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
									<div class="frm-group">
										<label for="sel3">등번호</label> <input type="text"
											id="infoBackNumber" name="infoBackNumber" />
									</div>
								</div>
								
								<div class="col-md-12">
									<div class="frm-group">
										<p>
											<strong>투타 구분</strong>
										</p>
										<div class="custom-control custom-radio" style="display:inline;">
											<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
											<label class="custom-control-label" for="jb-radio-1">우투우타</label>
										</div>
										<div class="custom-control custom-radio" style="display:inline;">
											<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input"> 
											<label class="custom-control-label" for="jb-radio-2">우투좌타</label>
										</div>
										<div class="custom-control custom-radio" style="display:inline;">
											<input type="radio" name="jb-radio" id="jb-radio-3" class="custom-control-input"> 
											<label class="custom-control-label" for="jb-radio-3">좌투좌타</label>
										</div>
										<div class="custom-control custom-radio" style="display:inline;">
											<input type="radio" name="jb-radio" id="jb-radio-4" class="custom-control-input"> 
											<label class="custom-control-label" for="jb-radio-4">좌투우타</label>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="frm-group">
										<p>
											<strong>선출 구분</strong>
										</p>
										<div class="custom-control custom-radio" style="display:inline;">
											<input type="radio" name="jb" id="jb-1" class="custom-control-input">
											<label class="custom-control-label" for="jb-1">우투우타</label>
										</div>
										<div class="custom-control custom-radio" style="display:inline;">
											<input type="radio" name="jb" id="jb-2" class="custom-control-input"> 
											<label class="custom-control-label" for="jb-2">우투좌타</label>
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
			<div class="modal-header text-center" style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">정보 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="row">
				<div class="col">
					<form class="cmn-form contact-form" action="<c:url value='/Team/Matching/profileChange.do?${_csrf.parameterName}=${_csrf.token}'/>" id="form" runat="server" method="post" enctype="multipart/form-data">
         			   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			              <div class="row">
			              	<div class="col-md-6">
			                  <div class="frm-group">
								    <input type='file' id="imgInput" name="upload" style="display: none"/>					   	
							   		<c:forEach var="PROFILE" items="${profile }" >
										<span class="image">
											<img id="image_section" src="<c:url value='/Upload/${PROFILE.PROFILE}'/>" style="width:190px;height:190px" />
										</span>
									</c:forEach>
							   		<label for="imgInput" class="btn btn-info">사진 선택</label>
			                  </div>
			                </div>
			               
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >ID</label>
			                    <input type="text"  id="manager_id" name="manager_id" disabled value="${id }">
			                  <label for="sel3" >이름</label>
			                    <input type="text" id="infoName" name="infoName">
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
										<label for="sel3">상세주소</label> <input type="text"
											id="infoDetailAddress" name="infoDetailAddress" />
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
						<canvas id="chartHitter"></canvas>
					</div>
					<div>
						<div class="play-table-part">
							<div class="play-table">
								<table style="text-align: center;table-layout:fixed; word-break:break-all;">
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
								<table style="text-align: center;table-layout:fixed; word-break:break-all;">
									<thead>
										<tr>
											<th>2루타</th>
											<th>3루타</th>
											<th>루타</th>
											<th>도루</th>
											<th>삼진</th>
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
								<table style="text-align: center;table-layout:fixed; word-break:break-all;">
									<thead>
										<tr>
											<th>K%</th>
											<th>BB/K</th>
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
											<td id="hd21" class="detailData"></td>
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
						<canvas id="chartPitcher"></canvas>
					</div>
					<div>
						<div class="play-table-part">
							<div class="play-table">
								<table style="text-align: center;table-layout:fixed; word-break:break-all;">
									<thead>
										<tr>
											<th>출장</th>
											<th>ERA</th>
											<th>승</th>
											<th>패</th>
											<th>승률</th>
											<th>타자</th>
											<th>투구수</th>
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
								<table style="text-align: center;table-layout:fixed; word-break:break-all;">
									<thead>
										<tr>
											<th>이닝</th>
											<th>피안타</th>
											<th>피2타</th>
											<th>피3타</th>
											<th>피홈런</th>
											<th>볼넷</th>
											<th>사구</th>
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
								<table style="text-align: center;table-layout:fixed; word-break:break-all;">
									<thead>
										<tr>
											<th>실점</th>
											<th>자책점</th>
											<th>K/9</th>
											<th>BB/9</th>
											<th>K/BB</th>
											<th>WHIP</th>
											<th>FIP</th>
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
				<div>	
					<div style="display:inline; font-size:2em">나의 마일리지 : </div>
					<div id="myMileage" style="display:inline; font-size:2.6em; color:red;"></div>
				</div>
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



<!-- 로딩시 불러올 부분 - 사진 변경 -->
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
						$('#infoBackNumber').val(this.BACKNUMBER);
					});// each 
				}
			},
			error : function(e) {
				alert("플레이어정보 불러오기 실패");
			}
		});
	});
	
	$.ajax({
		url : "<c:url value='/Team/Matching/getMileage.do'/>",
		type : "post",
		data : {
			USER_ID : $('#auth').val(),
			'_csrf' : '${_csrf.token}'
		},
		success : function(data) {
			if (data != "") {
				$(data).each(function() {
					$('#myMileage').text(this.MILEAGE);
				});// each 
			}
		}, 
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
					str += '<tr>' + '<th>' + this.GAME + '</th>' 
						+ '<th>' + this.GAMERESULT + '</th>'
						+ '<th>' + this.CORRECT + '</th>'
						+ '<th>' + this.INCORDEC
						+ '</th>' + '</tr>';
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


<!-- 모달 처리부  -->
<script>
//타자모달 버튼 클릭 
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
	
	
	var options = {
		legend : false,
		tooltips : true,
		animation: {
            duration: 1000
        },
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
				backgroundColor: 'rgba(77, 201, 246,0.5)',
	            borderColor: 'rgba(77, 201, 246,0.5)',
				/*
				backgroundColor : make20PercentOpaque,
				borderColor : getLineColor,
				*/
			
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
	
	
	var chartDataBase = {
		labels : [ ['CONTACT', '컨택'], ['BATTING EYE', '선구안'], ['POWER', '장타'], ['HOMERUN', '홈런'], ['SPEED', '속도'], ['HITTING', '종합타격능력']],
		datasets : [ {
			data : [0, 0, 0, 0, 0, 0]
		} ] 
	};
	var chartDataBase2 = {
			labels : [ [ 'INNING', '이닝 소화력' ], [ 'CONTROL', '제구력' ], [ 'WHIP', '억제력' ], [ 'ERA', '방어율' ], [ 'HOMERUN', '피홈런' ], [ 'PITCHING', '종합 투구능력' ] ],
			datasets : [ {
				data : [0, 0, 0, 0, 0, 0]
			} ]
		};
	
	var hitterChart = new Chart('chartHitter', {
		type : 'radar', 
		data : chartDataBase,
		options : options
	});
	var pitcherChart = new Chart('chartPitcher', {
		type : 'radar',
		data : chartDataBase2,
		options : options
	});
	
	var isEmpty = function(value){ 
		if(value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
			return true;
		}
		else { 
			return false;
		} 
	};
	
	
	$('#hitterDetailbtn').click(function() {
		//차트 변경
		$.ajax({
			url : "<c:url value='/Team/Matching/getHitterChart.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				'_csrf' : '${_csrf.token}'
			},
			dataType : 'json',
			success : function(data) {
				if (data != "") {
					console.log(data);
					hitterChart.clear();
					$(data).each(function() {
						hitterChart.data.datasets[0].data = [this.TARATE, this.CHULRATE, this.JANGRATE, this.HOMERUNRATE, this.SPEEDRATE, this.HITTINGRATE];
						hitterChart.update();
						/*
						var chartDataHitter = {
								labels : [ ['CONTACT', '컨택'], ['BATTING EYE', '선구안'], ['POWER', '장타'], ['HOMERUN', '홈런'], ['SPEED', '속도'], ['HITTING', '종합타격능력']],
								datasets : [ {
									data : [this.TARATE, this.CHULRATE, this.JANGRATE, this.HOMERUNRATE, this.SPEEDRATE, this.HITTINGRATE]
								} ]
						};
							
						var hitterChart = new Chart('chartHitter', {
							type : 'radar',
							data : chartDataHitter,
							options : options
						});
						*/
					});// each 
				} 
			}
		}); // ajax 
		
		$.ajax({
			url : "<c:url value='/Team/Matching/hitterDetailView.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				'_csrf' : '${_csrf.token}'
			},
			dataType : 'json',
			success : function(data) {
				/*  $(".detailData").text(""); */
				if (!isEmpty(data)) {
					console.log(data);
					$(data).each(function() {
						$('#hd1').text(this.COUNT);
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
						$('#hd12').text(this.SUMSO);
						$('#hd13').text(this.SUMHBP);
						$('#hd14').text(this.SUMGDP);
						$('#hd15').text(this.KPER);
						$('#hd16').text(this.BBKPER);
						$('#hd17').text(this.TA);
						$('#hd18').text(this.CHUL);
						$('#hd19').text(this.JANG);
						$('#hd20').text(this.OPS);
						$('#hd21').text(this.WOBA);
						
					});// each 
				} else {
					alert("불러올 데이터가 없습니다.");
				}// else
			}
		}); // ajax 
		
	});////////  clickDetailBtn
	
	$('#selectTeam').change(function() {
		
		//차트 변경
		$.ajax({
			url : "<c:url value='/Team/Matching/getHitterChartTeam.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				TEAMNAME : $(this).val(),
				'_csrf' : '${_csrf.token}'
			},
			dataType : 'json',
			success : function(data) {
				if (data != "") {
					console.log(data);
					hitterChart.clear();
					$(data).each(function() {

						hitterChart.data.datasets[0].data = [this.TARATE, this.CHULRATE, this.JANGRATE, this.HOMERUNRATE, this.SPEEDRATE, this.HITTINGRATE];
						hitterChart.update();
						
						/*
						var chartDataHitter = {
								labels : [ ['CONTACT', '컨택'], ['BATTING EYE', '선구안'], ['POWER', '장타'], ['HOMERUN', '홈런'], ['SPEED', '속도'], ['HITTING', '종합타격능력']],
								datasets : [ {
									data : [this.TARATE, this.CHULRATE, this.JANGRATE, this.HOMERUNRATE, this.SPEEDRATE, this.HITTINGRATE]
								} ]
						};
						
						
						var hitterChart = new Chart('chartHitter', {
							type : 'radar',
							data : chartDataHitter,
							options : options
						});
						*/
						
					});// each 
				} 
			}
		}); // ajax
		
		
		$.ajax({
			url : "<c:url value='/Team/Matching/hitterDetailViewEachTeam.do'/>",
			data : {
				USER_ID : $('#auth').val(),
				TEAMNAME : $(this).val(),
				'_csrf' : '${_csrf.token}'
			},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				
				if (!isEmpty(data)) {
					
					$(data).each(function() {
						$('#hd1').text(this.COUNT);
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
						
					});// each 
				} else {
					
					//차트 변경
					$.ajax({
						url : "<c:url value='/Team/Matching/getHitterChart.do'/>",
						type : "post",
						data : {
							USER_ID : $('#auth').val(),
							'_csrf' : '${_csrf.token}'
						},
						dataType : 'json',
						success : function(data) {
							if (data != "") {
								console.log(data);
								hitterChart.clear();
								$(data).each(function() {
									
									hitterChart.data.datasets[0].data = [this.TARATE, this.CHULRATE, this.JANGRATE, this.HOMERUNRATE, this.SPEEDRATE, this.HITTINGRATE];
									hitterChart.update();
									/*
									var chartDataHitter = {
											labels : [ ['CONTACT', '컨택'], ['BATTING EYE', '선구안'], ['POWER', '장타'], ['HOMERUN', '홈런'], ['SPEED', '속도'], ['HITTING', '종합타격능력']],
											datasets : [ {
												data : [this.TARATE, this.CHULRATE, this.JANGRATE, this.HOMERUNRATE, this.SPEEDRATE, this.HITTINGRATE]
											} ]
									};
										
									var hitterChart = new Chart('chartHitter', {
										type : 'radar',
										data : chartDataHitter,
										options : options
									});
									*/
								});// each 
							} 
						}
					}); // ajax
					
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
							if (!isEmpty(data)) {
								$(data).each(function() {
									$('#hd1').text(this.COUNT);
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
									
								});// each 
							}
						}
					}); // ajax 
				}// else
			}
		}); // ajax 
	});////////  clickSelectItem
	
	
	$('#pitcherDetailbtn').click(function() {
		
		//차트 변경
		$.ajax({
			url : "<c:url value='/Team/Matching/getPitterChart.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				'_csrf' : '${_csrf.token}'
			},
			dataType : 'json',
			success : function(data) {
				if (data != "") {
					console.log(data);
					pitcherChart.clear();
					$(data).each(function() {
						pitcherChart.data.datasets[0].data = [this.INNINGRATE, this.KBBRATE,this.WHIPRATE, this.ERARATE, this.HOMERUNRATE, this.PITCHINGRATE];
						pitcherChart.update();
						/*
						var chartDataPitcher = {
								labels : [ [ 'INNING', '이닝 소화력' ], [ 'CONTROL', '제구력' ], [ 'WHIP', '억제력' ], [ 'ERA', '방어율' ], [ 'HOMERUN', '피홈런' ], [ 'PITCHING', '종합 투구능력' ] ],
								datasets : [ {
									data : [this.INNINGRATE, this.KBBRATE,this.WHIPRATE, this.ERARATE, this.HOMERUNRATE, this.PITCHINGRATE]
								} ]
						};
							
						pitcherChart = new Chart('chartPitcher', {
							type : 'radar',
							data : chartDataPitcher,
							options : options
						});
						*/
					});// each 
				} 
			}
		}); // ajax 
		
		
		$.ajax({
			url : "<c:url value='/Team/Matching/pitcherDetailView.do'/>",
			data : {
				USER_ID : $('#auth').val(),
				TEAMNAME : $(this).val(),
				'_csrf' : '${_csrf.token}'
			},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				/*  $(".detailData").text(""); */
				if (!isEmpty(data)) {
					console.log(data);
					$(data).each(function() {
						$('#pd1').text(this.COUNT);
						$('#pd2').text(this.ERA);
						$('#pd3').text(this.SUMW);
						$('#pd4').text(this.SUML);
						$('#pd5').text(this.WINRATE);
						$('#pd6').text(this.SUMTBF);
						$('#pd7').text(this.SUMPITCH);
						$('#pd8').text(this.IP);
						$('#pd9').text(this.SUMPH);
						$('#pd10').text(this.SUMPB2);
						$('#pd11').text(this.SUMPB3);
						$('#pd12').text(this.SUMPHR);
						$('#pd13').text(this.SUMPBB);
						$('#pd14').text(this.SUMPHBP);
						$('#pd15').text(this.SUMPR);
						$('#pd16').text(this.SUMPER);
						$('#pd17').text(this.K9);
						$('#pd18').text(this.BB9);
						$('#pd19').text(this.KBB);
						$('#pd20').text(this.WHIP);
						$('#pd21').text(this.FIP);
						
					});// each 
				} else {
					alert("불러올 데이터가 없습니다.");
				}// else
			}
		}); // ajax
	});////////  clickDetailBtn
	
	$('#pSelectTeam').change(function() {
		
		//차트 변경
		$.ajax({
			url : "<c:url value='/Team/Matching/getPitterChartTeam.do'/>",
			type : "post",
			data : {
				USER_ID : $('#auth').val(),
				TEAMNAME : $(this).val(),
				'_csrf' : '${_csrf.token}'
			},
			dataType : 'json',
			success : function(data) {
				if (data != "") {
					console.log(data);
					pitcherChart.clear();
					$(data).each(function() {
						//pitcherChart.data.datasets[0].data = [3,2,6,7,0,1];
						pitcherChart.data.datasets[0].data = [this.INNINGRATE, this.KBBRATE,this.WHIPRATE, this.ERARATE, this.HOMERUNRATE, this.PITCHINGRATE];
						pitcherChart.update();
						/*
						var chartDataPitcher = {
								labels : [ [ 'INNING', '이닝 소화력' ], [ 'CONTROL', '제구력' ], [ 'WHIP', '억제력' ], [ 'ERA', '방어율' ], [ 'HOMERUN', '피홈런' ], [ 'PITCHING', '종합 투구능력' ] ],
								datasets : [ {
									data : [this.INNINGRATE, this.KBBRATE,this.WHIPRATE, this.ERARATE, this.HOMERUNRATE, this.PITCHINGRATE]
								} ]
						};
							
						pitcherChart = new Chart('chartPitcher', {
							type : 'radar',
							data : chartDataPitcher,
							options : options
						});
						*/
					});// each 
				} 
			}
		}); // ajax 
		
		$.ajax({
			url : "<c:url value='/Team/Matching/pitcherDetailViewEachTeam.do'/>",
			data : {
				USER_ID : $('#auth').val(),
				TEAMNAME : $(this).val(),
				'_csrf' : '${_csrf.token}'
			},
			type : 'post',
			dataType : 'json',
			success : function(data) {
				/* $(".detailData").text(""); */
				if (!isEmpty(data)) {
					console.log(data);
					$(data).each(function() {
						$('#pd1').text(this.COUNT);
						$('#pd2').text(this.ERA);
						$('#pd3').text(this.SUMW);
						$('#pd4').text(this.SUML);
						$('#pd5').text(this.WINRATE);
						$('#pd6').text(this.SUMTBF);
						$('#pd7').text(this.SUMPITCH);
						$('#pd8').text(this.IP);
						$('#pd9').text(this.SUMPH);
						$('#pd10').text(this.SUMPB2);
						$('#pd11').text(this.SUMPB3);
						$('#pd12').text(this.SUMPHR);
						$('#pd13').text(this.SUMPBB);
						$('#pd14').text(this.SUMPHBP);
						$('#pd15').text(this.SUMPR);
						$('#pd16').text(this.SUMPER);
						$('#pd17').text(this.K9);
						$('#pd18').text(this.BB9);
						$('#pd19').text(this.KBB);
						$('#pd20').text(this.WHIP);
						$('#pd21').text(this.FIP);
						
						
					});// each 
				} else {
					
					//차트 변경
					$.ajax({
						url : "<c:url value='/Team/Matching/getPitterChart.do'/>",
						type : "post",
						data : {
							USER_ID : $('#auth').val(),
							'_csrf' : '${_csrf.token}'
						},
						dataType : 'json',
						success : function(data) {
							if (data != "") {
								console.log(data);
								pitcherChart.clear();
								$(data).each(function() {
									pitcherChart.data.datasets[0].data = [this.INNINGRATE, this.KBBRATE,this.WHIPRATE, this.ERARATE, this.HOMERUNRATE, this.PITCHINGRATE];
									pitcherChart.update();
									/*
									var chartDataPitcher = {
											labels : [ [ 'INNING', '이닝 소화력' ], [ 'CONTROL', '제구력' ], [ 'WHIP', '억제력' ], [ 'ERA', '방어율' ], [ 'HOMERUN', '피홈런' ], [ 'PITCHING', '종합 투구능력' ] ],
											datasets : [ {
												data : [this.INNINGRATE, this.KBBRATE,this.WHIPRATE, this.ERARATE, this.HOMERUNRATE, this.PITCHINGRATE]
											} ]
									};
										
									pitcherChart = new Chart('chartPitcher', {
										type : 'radar',
										data : chartDataPitcher,
										options : options
									});
									*/
								});// each 
							} 
						}
					}); // ajax 
					
					
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
							if (!isEmpty(data)) {
								$(data).each(function() {
									$('#pd1').text(this.COUNT);
									$('#pd2').text(this.ERA);
									$('#pd3').text(this.SUMW);
									$('#pd4').text(this.SUML);
									$('#pd5').text(this.WINRATE);
									$('#pd6').text(this.SUMTBF);
									$('#pd7').text(this.SUMPITCH);
									$('#pd8').text(this.IP);
									$('#pd9').text(this.SUMPH);
									$('#pd10').text(this.SUMPB2);
									$('#pd11').text(this.SUMPB3);
									$('#pd12').text(this.SUMPHR);
									$('#pd13').text(this.SUMPBB);
									$('#pd14').text(this.SUMPHBP);
									$('#pd15').text(this.SUMPR);
									$('#pd16').text(this.SUMPER);
									$('#pd17').text(this.K9);
									$('#pd18').text(this.BB9);
									$('#pd19').text(this.KBB);
									$('#pd20').text(this.WHIP);
									$('#pd21').text(this.FIP);
								});// each 
							}
						}
					}); // ajax 
				}// else
			}
		}); // ajax 
	});////////  clickSelectItem
	
});
	
</script>


<!-- 스크롤다운 이벤트 -->
<script>
var lastScrollTop = 0;
// 1. 스크롤 이벤트 발생
$(window).scroll(function() { // ① 스크롤 이벤트 최초 발생
	var currentScrollTop = $(window).scrollTop();
	if (currentScrollTop - lastScrollTop > 0) {
		console.log("down-scroll");

		if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
			var lastrecordno = $(".scrolling:last").attr("data-recordno");

			$.ajax({
				type : 'post', // 요청 method 방식 
				url : '<c:url value="/Team/Matching/downstatostics.do"/>',// 요청할 서버의 url
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
											+ '<div class="summary">' 
											+ '<div>'
											+ '<dl class="info">' + '<dt>'
											+  '<h1>'+this.GAMEDATE +'__ '+ this.TIME +'</h1>'
											+ '</dt>'
											+ '<dd><h1>'
											+ this.STADIUM
											+ '</h1></dd>'
											+ '</dl></div>'
											+ '<div class="parent1" style="margin-top: 50px"><div class="child1">'
											+ '<dl>'
											+ '<dt><a href="#"><img src="/matching/Upload/'+this.HOMELOGO+'" style="float: left; width: 125px; height: 125px" ></a></dt>'
											+ '<dd>';
											//+ '<span class="result ">패　</span>'
											
											if(this.HOMESCORE > this.AWAYSCORE) {
												str+= '<span class="result"><h4>승</h4></span>';
											}
											else if(this.HOMESCORE < this.AWAYSCORE) {
												str+= '<span class="result"><h4>패</h4></span>';
											}
											else {
												str+= '<span class="result"><h4>무</h4></span>';
											}
											
											
											str+= '<span class="name">'
											+ this.TEAMNAME
											+ '</span>'
											+ '</dd>'
											+ '<dd><span class="score"><h5>'
											+ this.HOMESCORE
											+ '</h5></span></dd>'
											+ '</dl>'
											+ '</div>'
											+ '<div class="child2">'
											+ '<dl>'
											+ '<dt><a href="#"><img src="/matching/Upload/'+this.AWAYLOGO+'" style="float: left; width: 125px; height: 125px"></a></dt>'
											+ '<dd>';
											
											if(this.HOMESCORE > this.AWAYSCORE) {
												str+= '<span class="result"><h4>패</h4></span>';
											}
											else if(this.HOMESCORE < this.AWAYSCORE) {
												str+= '<span class="result"><h4>승</h4></span>';
											}
											else {
												str+= '<span class="result"><h4>무</h4></span>';
											}
											
											str += '<span class="name">'
											+ this.AWAYTEAM
											+ '</span>'
											+ '</dd><!--mm-->'
											+ '<dd><span class="score"><h5>'
											+ this.AWAYSCORE
											+ '</h5></span></dd>'
											+ '</dl>'
											+ '</div>'
											+ '</div>'
											+ '<br/>'
											+ '<div style="margin-top: 200px">'
											+ '<p>';
											
											if(this.PA!=0) {
												if(this.HORDER==1) {
													str+= '<strong>1번 타자</strong>';
												}
												else if(this.HORDER==2) {
													str+= '<strong>2번 타자</strong>';
												}
												else if(this.HORDER==3) {
													str+= '<strong>3번 타자</strong>';												
												}
												else if(this.HORDER==4) {
													str+= '<strong>4번 타자</strong>';
												}
												else if(this.HORDER==5) {
													str+= '<strong>5번 타자</strong>';
												}
												else if(this.HORDER==6) {
													str+= '<strong>6번 타자</strong>';
												}
												else if(this.HORDER==7) {
													str+= '<strong>7번 타자</strong>';
												}
												else if(this.HORDER==8) {
													str+= '<strong>8번 타자</strong>';
												}
												else if(this.HORDER==9) {
													str+= '<strong>9번 타자</strong>';
												}
												else {
													str+= '<strong>교체 출전</strong>';
												}
											}
											
											if(this.POS==1 || this.TBF!=null) {
												str+= '<span>(투수)</span>';
											}
											else if(this.POS==2) {
												str+= '<span>(포수)</span>';
											}
											else if(this.POS==3) {
												str+= '<span>(1루수)</span>';
											}
											else if(this.POS==4) {
												str+= '<span>(2루수)</span>';
											}
											else if(this.POS==5) {
												str+= '<span>(3루수)</span>';
											}
											else if(this.POS==6) {
												str+= '<span>(유격수)</span>';
											}
											else if(this.POS==7) {
												str+= '<span>(좌익수)</span>';
											}
											else if(this.POS==8) {
												str+= '<span>(중견수)</span>';
											}
											else if(this.POS==9) {
												str+= '<span>(우익수)</span>';
											}
											else if(this.POS==0) {
												str+= '<span>(지명타자)</span>';
											}
											else {
												str+= '<span>(대타/대주자)</span>';
											}
											
											str+= '<strong>'
											+ this.NAME
											+ '</strong>('
											+ this.BACKNUMBER
											+ ')'
											+ '</p>'
											+ '</div>'
											+ '</div>'
											+ '</div>';
											
											if(this.PA != 0) {
												str+= '<table style="text-align: center;table-layout:fixed; word-break:break-all;">'
												+ '<thead>'
												+ '<tr>'
												+ '<th>　　</th>'
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
												+ '<table style="text-align: center;table-layout:fixed; word-break:break-all;">'
												+ '<thead>'
												+ '<tr>'
												+ '<th>통산</th>'
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
											
											}
									if (this.TBF != -1) {
										str += '<table style="text-align: center;table-layout:fixed; word-break:break-all;">' + '<thead>' + '<tr>' + '<th>　　</th>' + '<th>이닝</th>' + '<th>ERA</th>' + '<th>자책점</th>' + '<th>피안타</th>' + '<th>삼진</th>' + '<th>볼넷</th>' + '</tr>' + '</thead>'
												+ '<tbody>' + '<tr>' + '<td></td>' + '<td>'
												+ this.IP
												+ '</td>'
												+ '<td>'
												+ this.ERA
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
												+ '<td>'+this.PBB+'</td>'
												+ '</tr>'
												+ '</tbody>'
												+ '</table>'
												+ '<table style="text-align: center;table-layout:fixed; word-break:break-all;">'
												+ '<thead>'
												+ '<tr>'
												+ '<th>통산</th>'
												+ '<th>이닝</th>'
												+ '<th>ERA</th>'
												+ '<th>타자</th>'
												+ '<th>승</th>'
												+ '<th>패</th>'
												+ '<th>삼진</th>'
												+ '</tr>'
												+ '</thead>'
												+ '<tbody>'
												+ '<tr>'
												+ '<td></td>'
												+ '<td>'+this.SUMIP+'</td>'
												+ '<td>'+this.SUMERA+'</td>'
												+ '<td>'+this.SUMTBF+'</td>'
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
