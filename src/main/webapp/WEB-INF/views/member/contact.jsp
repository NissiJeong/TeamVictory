<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>

<script type="text/javascript">
	//이메일 입력방식 선택
	
	function select(){
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '1') { //직접입력일 경우 
				$("#str_email02").val(''); //값 초기화
				$("#str_email02").attr("disabled", false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력
				var mail = $("#str_email02").val();
				console.log(mail)
				$("#str_email02").attr("disabled", true); //비활성화
			}
		});
	}
	
	function goURI(input) {
		if(input == "SEND"){
			document.frm_write.action="/Team/Matching/contact.do";
		}
		document.frm_write.submit();
	}
	
</script>


<!-- faq-section start  -->
  <section class="faq-section section-padding section-bg">
      <div class="container" style="margin-top:-150px;margin-bottom: -100px">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <div class="section-header text-center">
              <h2 class="section-title">자주 묻는 질문</h2>
             
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <div class="accordion cmn-accordion" id="accordionExample" style="margin-top: -120px">
              <div class="card">
                <div class="card-header" id="headingOne">
                  <h2 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><i class="fa fa-question-circle"></i>팀 폐쇄 방법 안내</button>
                  </h2>
                </div>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                  <div class="card-body">
                    <p>안녕하세요. 매칭 입니다.</br>

					팀 홈페이지 폐쇄 방법에 대해 알려드립니다.</br>
					
					
					 <h4>- 팀 폐쇄 방법 -</h4>
					1) 팀 마스터 회원이 팀 홈페이지(PC)에 접속합니다.</br> 
					2) 팀 관리 메뉴에 접속합니다.</br> 
					3) 팀 양도/폐쇄 메뉴에 접속합니다.</br> 
					4) 팀 마스터 본인의 아이디 및 비밀번호를 입력 후</br>  "팀 폐쇄하기"  버튼을 클릭하면 
					팀 홈페이지가 폐쇄 됩니다. </br> 
					
					
					 <h5>- 팀 폐쇄 시 유의사항 -</h5> 
					1) 팀 폐쇄 권한은 팀마스터 회원에게만 있습니다.</br> 
					2) 팀 홈페이지 폐쇄 후 복구는 불가합니다.</br> 
					3) 팀 마스터 이외의 모든 회원이 탈퇴처리 되어야만</br> 폐쇄가 가능합니다.</br> 
					
					 
					감사합니다.</p>
                  </div>
                </div>
              </div><!-- card end -->
              <div class="card">
                <div class="card-header" id="headingTwo">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fa fa-question-circle"></i>팀 탈퇴 방법</button>
                  </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                  <div class="card-body">
                      <p>
						탈퇴할 팀으로 이동 →</br> 커뮤니티 탭 →</br> 팀원 메뉴클릭 →</br>회원탈퇴 클릭</p>
                  </div>
                </div>
              </div><!-- card end -->
              <div class="card">
                <div class="card-header" id="headingThree">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-question-circle"></i>팀 폐쇄방법 </button>
                  </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                  <div class="card-body">
                      <p>팀홈피(클럽) 홈페이지를 폐쇄방법은 다음과 같습니다. </br>
 
					① 클럽마스터가 팀홈피에 접속합니다.</br>
					② 팀홈피 → "팀관리" 버튼 클릭</br>
					③ 팀홈피 관리자 → 회원관리에서 가입되어</br> 있는 모든 팀원들을 탈퇴시킵니다.</br>
					④ 모든 팀원을 탈퇴시킨 후, "1:1문의"</br> 게시판을 통해 팀 폐쇄를 요청합니다.</p>
                  </div>
                </div>
              </div><!-- card end -->
              <div class="card">
                <div class="card-header" id="headingFour">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour"><i class="fa fa-question-circle"></i>농구 매칭 안내</button>
                  </h2>
                </div>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                  <div class="card-body">
                      <p><h5>매칭 안내</h5></br>
                     		 로그인 하시고 매칭을 눌러주세요</br>
                      
                      </p>
                  </div>
                </div>
              </div><!-- card end -->
            </div>
          </div>
          <div class="col-lg-6">
            <div class="accordion cmn-accordion" id="accordionExample2" style="margin-top: -120px">
              <div class="card">
                <div class="card-header" id="headingFive">
                  <h2 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive"><i class="fa fa-question-circle"></i>이름변경(개명) 신청안내 </button>
                  </h2>
                </div>
                <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample2">
                  <div class="card-body">
                    <p><h5>이름변경(개명신청) 신청방법</h5></br>
					</br>
					첨부서류 : 신분증사본 (주민등록번호 뒷자리,</br> 주소는 가리고 보내주세요)</br>
					
					제출처 : 이메일(random1@example.com)로</br> 첨부서류 발송
					           발송 시 사용중이신</br> 게임원 아이디도 같이보내주세요.</br>
					</br>
					감사합니다.</p> 
                  </div>
                </div>
              </div><!-- card end -->
              <div class="card">
                <div class="card-header" id="headingSix">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix"><i class="fa fa-question-circle"></i>팀마스터 선수사진 등록방법</button>
                  </h2>
                </div>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample2">
                  <div class="card-body">
                      <p><h6>안녕하세요. 매칭입니다.</h6></br>
						팀마스터의 선수단 사진등록 기능을 추가하였습니다.</br>
						 </br>
						팀마스터 로그인 < 팀홈피 < 선수단 < 사진올리기 버튼</br>
						
						에서 사진을 등록하시면 됩니다. </br>
						마스터의 사진등록이 필요한 팀에서는 이용하시면 됩니다.</br>
						 </p> 
                  </div>
                </div>
              </div><!-- card end -->
              <div class="card">
                <div class="card-header" id="headingSeven">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven"><i class="fa fa-question-circle"></i>팀마스터 변경요청 안내 (팀 양도 요청서)</button>
                  </h2>
                </div>
                <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordionExample2">
                  <div class="card-body">
                      <p>팀 양도요청서 입니다.
					 
					팀의 마스터가 연락이 되지 않고 </br>활동을 하지 않는 경우
					팀 양도 요청서를 </br>작성하신다음 이메일로 발송해 주세요</br>
					 </br>
					 
					E-mail : random2@example.com</p> 
                  </div>
                </div>
              </div><!-- card end -->
              <div class="card">
                <div class="card-header" id="headingEight">
                  <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight"><i class="fa fa-question-circle"></i>등업 관련</button>
                  </h2>
                </div>
                <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordionExample2">
                  <div class="card-body">
                      <p><h5>등업 관련 내용 </h5></br>
                      ..................</br>
                      ..................</br>
                      </p> 
                  </div>
                </div>
              </div><!-- card end -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- faq-section end  -->
 

  <!-- contact-section start -->
  <section class="contact-section section-padding">
    <div class="container">
      
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex" style="margin-top: -100px">
            <div class="icon">
              <i class="fa fa-home"></i>
            </div>
            <div class="content">
              <h5 class="title">Address</h5>
              <p>서울시 금천구 가산동 426-5 <br>  월드메르디앙 2차 410호</p>
            </div>
          </div>
        </div><!-- contact-item end -->
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex" style="margin-top: -100px">
            <div class="icon">
              <i class="fa fa-headphones"></i>
            </div>
            <div class="content">
              <h5 class="title">Phone Number</h5>
              <p>TEL : 02-2025-8523</p>
              <p> FAX : 02-2025-4113</p>
            </div>
          </div>
        </div><!-- contact-item end -->
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex" style="margin-top: -100px">
            <div class="icon">
              <i class="fa fa-envelope"></i>
            </div>
            <div class="content">
              <h5 class="title">Email Address</h5>
              <p>intotheakira@naver.com</p>
              <p>random2@example.com</p>
            </div>
          </div>
        </div><!-- contact-item end -->
      </div>
      <div id="container">
		<div id="contentArea">
		<div class="contentBody" >
			<h3 class="contentTit" >문의게시판</h3>

			<form name="frm_write" id="frm_write" method="POST"
			action="<c:url value='/Team/Matching/contact.bbs?${_csrf.parameterName}=${_csrf.token}'/>">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="mode" value="create">
			<input type="hidden" name="category" value="4">
			<input type="hidden" name="message" id="message" value="">
			<div class="formArea">
				<table class="form">
					<caption></caption>
					<colgroup><col width="160"><col width="*"></colgroup>				
					<tr>
						<th scope="row"><label for="title">제목</label></th>
						<td>
							<input type="text" class="txt" id="iq_title" name="title" value="" style="width:500px;" maxlength="150">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="name">이름</label></th>
						<td>
							<input type="text" class="txt" id="iq_name" name="member_nm" value="" style="width:137px;" maxlength="30">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="telephone">연락처</label></th>
						<td>
							<input type="text" class="txt" id="telephone" name="telephone" value="" style="width:137px;" maxlength="20">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="email">이메일</label></th>
						<td>
							<input type="text" name="str_email01" id="str_email01" style="width:100px">@ 
							<input type="text" name="str_email02" id="str_email02" style="width:100px;"> 
							<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail" onchange="select()"> 
								<option value="1">직접입력</option> 
								<option value="naver.com">naver.com</option> 
								<option value="hanmail.net">hanmail.net</option> 
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option> 
								<option value="yahoo.co.kr">yahoo.co.kr</option> 
								<option value="empas.com">empas.com</option> 
								<option value="dreamwiz.com">dreamwiz.com</option> 
								<option value="freechal.com">freechal.com</option> 
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option> 
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option> 
								<option value="paran.com">paran.com</option> 
							</select>
							<p class="infoTxt">※ 정확한 이메일 주소를 입력해 주시기 바랍니다.</p>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="content">내용</label></th>
						<td>
							<textarea id="iq_cont" class="txtArea4" name="contents" title="" style="width:500px; height:200px;"></textarea>
						</td>
					</tr>
				</table>
			</div>
				<input type="submit" value="보내기" class="btn btn-info"/>
			</form>			
					
					
			
			
		</div></div><!-- contentArea -->
	</div><!-- //container -->
  </section>
  <!-- contact-section end -->
  
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 

  

 
  