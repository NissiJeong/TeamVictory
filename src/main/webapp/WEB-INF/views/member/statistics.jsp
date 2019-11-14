<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<input type="hidden" value= "${id}" id="auth"/>

<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script	src='https://cdn.jsdelivr.net/npm/chart.js@2.8.0'></script>
<script src="<c:url value='/assets/js/utils.js' />"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.play-table tbody tr td {
	padding: 10px 0;
	font-size: 14px;
}	

.child1{
    position: absolute;
    left : 20%;
}
.child2{
    position: absolute;
    right : 20%;
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
							<div class="col-lg-5" style="border: 1px solid magenta; text-align: center">
								<div></div>
								<div>
									
									
									
								       
							        <c:forEach var="PROFILE" items="${profile }" >
										<span class="image">
											<img src="<c:url value='/Upload/${PROFILE.PROFILE}'/>" alt="대표사진"
												style="min-height: 190px; height: 300px;" for="imgInput" id="please">
										</span>
											<h1 class="my-4">${PROFILE.MNAME}</h1>
									</c:forEach>
									<div class="list-group">
									    <button type="button" class="btn btn-warning" id="hitterDetailbtn" data-toggle="modal" data-target="#recordModal" style="height: 40px;" >
											타자 기록
										</button>
										
										<a href="#" class="list-group-item" id="pitcherDetailbtn" data-toggle="modal" data-target="#recordModal">투수 기록</a>
										<a href="#" class="list-group-item" data-toggle="modal" data-target="#infoModal">회원 정보</a>
										<a href="#" class="list-group-item" data-toggle="modal" data-target="#playerModal">선수 정보</a>
										
										<form id="submit" method="post" action="<c:url value='/Team/Matching/InsertHitterByPARSING'/>">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
											<button type="submit" class="submit-btn" style="margin-top: 100px">돼지불백</button>
										</form>
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
											<input type="hidden" class="scrolling" data-recordno="${hitters.RECORDNO}"/>
											<div class="play-table">
												<div>
													<div class="summary">
														<div>
															<dl class="info">
															<dt><h1>01.07(토) 09:00</h1></dt>
															<dd><h1>에이스볼파크</h1></dd>
															</dl>
														</div>
														<div class="parent1" style="margin-top:50px">
															<div class="child1">
																<dl>
																	<dt>
																		<a href="/club/?club_idx=14322">
																		<img src="//file.clubone.kr/symbol/club/symbol14322.jpg" 
																			style="float: left; width:125px; height:125px">
																		</a>
																	</dt>
																	<dd>
																		<span class="result"><h4>패</h4></span> 
																		<span class="name">누리TLC</span> 
																	</dd>
																	<dd>
																		<span class="score"><h5>5</h5></span>
																	</dd>
																</dl>
															</div>
														
															<div class="child2">
																<dl>
																	<dt>
																		<a href="/club/?club_idx=19031">
																		<img src="//file.clubone.kr/symbol/club/symbol19031.jpg"
																			style="float: left; width:125px; height:125px">
																			</a>
																	</dt>
																	<dd>
																		<span class="result"><h4>승</h4></span> 
																		<span class="name">포켓몬스터야구단</span>
																	</dd>
																	<!--mm-->
																	<dd>
																		<span class="score"><h5>14</h5></span>
																	</dd>
																</dl>
															</div>
															
														</div>
														<br/>
														<div style="margin-top : 200px">
															<p>
																<strong>1번 타자</strong> <span class="add_info">(유격수)</span>
																<strong>임지성</strong>(52)
															</p>
														</div>
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
															<td>${hitters.SUMAB}</td>
															<td>${hitters.SUMH}</td>
															<td>${hitters.SUMRBI }</td>
															<td>${hitters.SUMHR}</td>
															<td>${hitters.SUMSB }</td>
															<td>${hitters.SUMAVG }<br /></td>
														</tr>
													</tbody>
												</table>
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


<!-- 정보창 modal -->
<div class="modal fade" id="playerModal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header text-center" style="background-color: #000040;">
				<h5 class="modal-title w-100" style="color: white">선수 정보 입력</h5>
				<button type="button" class="close" data-dismiss="modal"
					style="color: white; font-weight: bold;">×</button>
			</div>

			<!--Body-->
			<div class="modal-body">
				
				정보 오지게 수정하기
				
				
				<div class="row">
				<div class="col">
					
					
					<form class="cmn-form contact-form" action="<c:url value='/Team/Matching/profileChange.do?${_csrf.parameterName}=${_csrf.token}'/>" id="form" runat="server" method="post" enctype="multipart/form-data">
         			   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			              <div class="row">
			              	
			               
			                

			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >출신 고교</label>
			                    <input type="text" disabled value="입력하도록"/>
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >키</label>
			                    <input type="text"disabled value="195cm"/>
			                  </div>
			                </div>
			                
			               	<div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >몸무게</label> 
			                    <input type="text"  placeholder="100kg" />
			                  </div>
			                </div>
			               	
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >뭐 넣지</label> 
			                    <input type="button"  placeholder="뭐 넣지" />
			                  </div>
			                </div>
			                
			                
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  	<label for="sel3" >메인 팀 선택</label>
			                   <select class="form-control" id="teamLoc">
			                   	<option value="">적절한</option>
						        <option value="guro">출력을</option>
						        <option value="gumcheon">하도록</option>
						        <option value="mapo">하자</option>
						      </select>
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  </div>
			                </div>
			                
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <p><strong>Checkbox</strong></p>
					
								<div class="custom-control custom-checkbox">
									<input type="checkbox" id="jb-checkbox1" class="custom-control-input">
									<label class="custom-control-label" for="jb-checkbox1">체크할거</label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" id="jb-checkbox2" class="custom-control-input">
									<label class="custom-control-label" for="jb-checkbox2">있나</label>
								</div>
			                  </div>
			                </div>
			                
			                
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <p><strong>투타 구분</strong></p>
								<div class="custom-control custom-radio">
									<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
									<label class="custom-control-label" for="jb-radio-1">우투우타</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
									<label class="custom-control-label" for="jb-radio-2">우투좌타</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="jb-radio" id="jb-radio-3" class="custom-control-input">
									<label class="custom-control-label" for="jb-radio-3">좌투좌타</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="jb-radio" id="jb-radio-4" class="custom-control-input">
									<label class="custom-control-label" for="jb-radio-4">좌투우타</label>
								</div>
		                
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
			<!--  Body -->
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 선수 모달 -->
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
			                    <input type="text"  id="manager_id" placeholder="${id }" disabled value="${id }">
			                  <label for="sel3" >이름</label>
			                    <input type="text" disabled value="${id }">
			                  </div>
			                </div>

			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >비밀번호</label>
			                    <input type="text" disabled value="●●●●●●●●●">
			                  </div>
			                </div>
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >비밀번호 확인</label>
			                    <input type="text" disabled value="●●●●●●●●●">
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >생년 월일</label>
			                    <input type="text" disabled value="적절한 출력"/>
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >연락처</label>
			                    <input type="text"disabled value="적절한 출력"/>
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" onClick="sample4_execDaumPostcode()">주소</label> 
			                    <input type="button" onClick="sample4_execDaumPostcode()" placeholder="주소" value="주소 입력" name="sample4_roadAddress" id="sample4_roadAddress" />
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >상세주소 입력</label> 
			                    <input type="text" placeholder="상세주소 입력"/>
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  <label for="sel3" >뭐 넣지</label> 
			                    <input type="button"  placeholder="뭐 넣지" />
			                  </div>
			                </div>
			                
			                <div class="col-md-6">
			                  <div class="frm-group">
			                  	<label for="sel3" >뭐 넣지</label>
			                   <select class="form-control" id="teamLoc" name="teamLoc" onchange="isSelect()">
			                   	<option value="">지역</option>
						        <option value="guro">구로구</option>
						        <option value="gumcheon">금천구</option>
						        <option value="mapo">마포구</option>
						      </select>
			                  </div>
			                </div>
			                <div class="col-md-12">
			                  <div class="frm-group text-center">
			                    <button type="submit" class="submit-btn" id="register" >수정</button>
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



<!-- 열심히 일해야 할 모달 -->
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
				        
				        <c:forEach var="teamName" items="${TEAMNAMES }" >
    						<option value="${teamName.TEAMNAMEFORMODAL}"><c:out value="${teamName.TEAMNAMEFORMODAL}"/></option>
						</c:forEach>
				    
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
											<td id="hd15" class="detailData"></td>
											<td id="hd16" class="detailData"></td>
											<td id="hd17" class="detailData"></td>
											<td id="hd18" class="detailData"></td>
											<td id="hd19" class="detailData"></td>
											<td id="hd20" class="detailData"></td>
											<td id="hd21" class="detailData"><br/></td>
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

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        var detail = $("#sample4_detailAddress").val()
        if(detail == ""){
        }
        else{
        }
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("sample4_roadAddress").value = roadAddr;
            /* document.getElementById("sample4_jibunAddress").value = data.jibunAddress; */
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            /* if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            } */
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            /* if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            } */
        }
    }).open();
}



</script>



<!-- 버튼버튼처리 -->
<script>



$(function(){ 
	
	
	// 사진 변경부분	
	function readURL(input) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $('#image_section').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
	}
	  
	$("#imgInput").change(function(){
	   readURL(this);
	});
	
	
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
		return v < 10 ? 5
			: v < 25 ? 7
			: v < 50 ? 9
			: v < 75 ? 11
			: 15;
	}

	
	var chartData = {
		labels: [['이걸루', 'chart테스트'], ['뭐 어떻게', '하는거임??'], 'Sleeping', ['Designing', 'Graphics'], 'Coding', 'Cycling'],
		
		datasets: [{
			
			data:[$('#hd2').text() , $('#hd2').text() , 10 , 10 ,0 , 0]
		}]
	};
	
	var options = {
		legend: false,
		tooltips: true,
		scale: {
		    ticks: {
		        beginAtZero: true,
		        max: 100,
		        min: 0,
		        stepSize: 20
		    }
		},
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
			},
			
		}
	};

	var chart = new Chart('chart-0', {
		type: 'radar',
		data: chartData,
		options: options
	});
	
	 // 배팅 버튼 클릭 
	  var clickHitterBtn = $('#hitterDetailbtn').click(function(){
		 
		  $.ajax({
			   url: "<c:url value='/Team/Matching/hitterDetailView.do'/>",
			   data : { USER_ID : $('#auth').val(), '_csrf' : '${_csrf.token}'},
			   type: 'post',
			   headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
			   },
			   dataType: 'json',
			   success : function(data){
				  /*  $(".detailData").text(""); */
				   if (data != "") {
					
					console.log(data);
					$(data).each(
						function() {
							
							$('#hd1').text(this.SUMAB);
							$('#hd2').text(this.SUMH);
							$('#hd4').text(this.SUMHR);
							
							
							
							
							chartData = {
							labels: [['CONTACT', '타율'], ['뭐 어떻게', '하는거임??'], 'Sleeping', ['Designing', 'Graphics'], 'Coding', 'Cycling'],
							datasets: [{
								
								data:[($('#hd2').text()*100 / $('#hd1').text()) ,0 ,0 ,0 ,0 , 0]
									
								}]
							};
							
							var chart = new Chart('chart-0', {
								type: 'radar',
								data: chartData,
								options: options
							});
							
							
						});// each 
					}
					else { 
						alert("불러올 데이터가 없습니다.");
					}// else
			   }
		   });  // ajax 
	});////////  clickDetailBtn
	
	
	//selectItem 클릭
	var clickSelectItem = $('#selectTeam').change(function(){
		  
		  $.ajax({
			   url: "<c:url value='/Team/Matching/hitterDetailViewEachTeam.do'/>",
			   data : { USER_ID : $('#auth').val(), USER_TEAMNAME : $(this).val() ,'_csrf' : '${_csrf.token}'}, 
			   type: 'post',
			   headers : {         
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
			   },
			   dataType: 'json',
			   success : function(data){
				   /* $(".detailData").text(""); */
				   if (data != "") {
					 
					console.log(data);
					$(data).each(
						function() {
							$('#hd1').text(this.SUMAB);
							$('#hd2').text(this.SUMH);
							$('#hd4').text(this.SUMHR);
							
							
							chartData = {
							labels: [['CONTACT', '타율'], ['뭐 어떻게', '하는거임??'], 'Sleeping', ['Designing', 'Graphics'], 'Coding', 'Cycling'],
							datasets: [{
								data:[($('#hd2').text()*100 / $('#hd1').text()) ,0 ,0 ,0 ,0 , 0]
								}]
							};
							
							var chart = new Chart('chart-0', {
								type: 'radar',
								data: chartData,
								options: options
							});
							
						});// each 
					}
					else { 
						
						$.ajax({
							   url: "<c:url value='/Team/Matching/hitterDetailView.do'/>",
							   data : { USER_ID : $('#auth').val(), '_csrf' : '${_csrf.token}'},
							   type: 'post',
							   dataType: 'json',
							   success : function(data){
								   /* $(".detailData").text(""); */
								   if (data != "") {
									$(data).each(
										function() {
											$('#hd1').text(this.SUMAB);
											$('#hd2').text(this.SUMH);
											$('#hd4').text(this.SUMHR);
											
											
											chartData = {
											labels: [['CONTACT', '타율'], ['뭐 어떻게', '하는거임??'], 'Sleeping', ['Designing', 'Graphics'], 'Coding', 'Cycling'],
											datasets: [{
												data:[($('#hd2').text()*100 / $('#hd1').text()) ,0 ,0 ,0 ,0 , 0]
												}]
											};
											
											var chart = new Chart('chart-0', {
												type: 'radar',
												data: chartData,
												options: options
											});
										});// each 
									}
							   }
						   });  // ajax 
					}// else
			   }
		   });  // ajax 
		   
	});////////  clickSelectItem
	
	$("#btnSubmit").click(function (event) {
		 
        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();
 		alert('제발 됐으면 좋겟다 ㅎㅎ');
        // Get form
        var form = $('#fileUploadForm')[0];
        
        //{USER_ID : $('#auth').val(), PROFILE : file ,'_csrf' : '${_csrf.token}'}
        
        // Create an FormData object 
        var data = new FormData(form);
        
       
        var file = data.get("files");
        console.log(file);
 		console.log(data.get('_csrf'));
        
        $.ajax({
        	url: "<c:url value='/Team/Matching/profileChange.do'/>",
        	type: "post",
        	data  : data,
        	
        	beforeSend : function(xhr) {
        		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        		xhr.setRequestHeader ( "charset" , "UTF-8" );
        	},
        	
        	
        	
        	/* enctype : 'multipart/form-data', */
        	
        	processData: false, 
            contentType: false,
            
          
            success: function (data) {
                alert("complete");
            },
            error: function (e) {
                alert("fail");
            }  
             
        });
 
    });
	
	
	
	
})

</script>



<!-- 차트js 나중에 꼭 수정합시다 -->
 
 <!--  
 <script>
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
		return v < 10 ? 5
			: v < 25 ? 7
			: v < 50 ? 9
			: v < 75 ? 11
			: 15;
	}

	
	var chartData = {
		labels: [['이걸루', 'chart테스트'], ['뭐 어떻게', '하는거임??'], 'Sleeping', ['Designing', 'Graphics'], 'Coding', 'Cycling'],
		datasets: [{
			data:
				[$('#hd1').text(), $('#hd2').text() , 1300 , 1200 ,1100 , 1000]
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
		data: chartData,
		options: options
	});



</script>
 -->

 

<!-- 스크롤다운 이벤트 끝!@#!@# -->
<script>
	/*var result = '${msg}';
	
	 if(result="success"){
		alert(result);
		console.log(result);
	} */

	var lastScrollTop = 0;

	// 1. 스크롤 이벤트 발생
	$(window).scroll(
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
								$.ajax({
											type : 'post', // 요청 method 방식 
											url : '<c:url value="/Team/Matching/downstatostics.do"/>',// 요청할 서버의 url
											headers : {
												"Content-Type" : "application/json",
												"X-HTTP-Method-Override" : "POST"
											},
											dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
											data : { // 서버로 보낼 데이터 명시 
												RECORDNO : lastrecordno,'_csrf':'${_csrf.token}'
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

													$(data).each(// 7. 새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
																	function() {
																		console.log(this);

																		/*STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR STR */
																		str += '<div class="play-table-part listToChange scrollLocation" >'

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
																				+ this.AVG
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
																				+ '</td>' + '</tr>' + '</tbody>' + '</table>' + '</div>' + '</div>';
																	});// each 
													// 8. 이전까지 뿌려졌던 데이터를 비워주고, <th>헤더 바로 밑에 위에서 만든 str을  뿌려준다.
													//$(".listToChange").empty();// 셀렉터 태그 안의 모든 텍스트를 지운다.						
												var position2= $(".scrollLocation:last").offset();
													$(".scrollLocation:last").after(str);
												}// if : data!=null
												else { // 9. 만약 서버로 부터 받아온 데이터가 없으면 그냥 아무것도 하지말까..
													alert("더 불러올 데이터가 없습니다.");
												}// else
											}// success
										});// ajax
								
								/* // 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
								var position = $(".listToChange:last").offset() ;// 위치 값
									
								// 이동  위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐.
								$('html,body').stop().animate({scrollTop : position.top}, 600, 'easeInQuint'); */

							}//if : 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간

							// lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
							lastScrollTop = currentScrollTop;
						}// 다운스크롤인 상태

					});// scroll event
</script>





<!-- statistics-section end -->
