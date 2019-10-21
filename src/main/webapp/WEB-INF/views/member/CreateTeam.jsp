<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
            document.getElementById('sample4_postcode').value = data.zonecode;
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
            if(data.autoRoadAddress) {
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
            }
        }
    }).open();
}
</script>

  
  <!-- contact-section start -->
  <section class="contact-section section-padding" style="margin-top: -50px">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-7">
          <div class="section-header text-center">
            <h2 class="section-title">Create Your Team!!</h2>
            <p>On insensible possession oh particular attachment at excellence in. The books arose but miles happy she.</p>
          </div>
        </div>
      </div>
      <!-- <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex">
            <div class="icon">
              <i class="fa fa-home"></i>
            </div>
            <div class="content">
              <h5 class="title">Address</h5>
              <p>2 Country Club Street<br> Vienna, VA 22180</p>
            </div>
          </div>
        </div>contact-item end
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex">
            <div class="icon">
              <i class="fa fa-headphones"></i>
            </div>
            <div class="content">
              <h5 class="title">Phone Number</h5>
              <p>+1-202-555-0108</p>
              <p>+1-202-555-0109</p>
            </div>
          </div>
        </div>contact-item end
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex">
            <div class="icon">
              <i class="fa fa-envelope"></i>
            </div>
            <div class="content">
              <h5 class="title">Email Address</h5>
              <p>random1@example.com</p>
              <p>random2@example.com</p>
            </div>
          </div>
        </div>contact-item end
      </div> -->
      <div class="row" style="margin-top: -50px">
        <div class="col-lg-8">
          <div class="contact-form-area">
            <form class="cmn-form contact-form">
              <div class="row">
                <div class="col-md-6">
                  <div class="frm-group">
                  	<label for="sel3">팀 명</label>
                    <input type="text" name="teamName" id="teamName" placeholder="Team Name*">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  	<label for="sel3" >종목</label>
                   <select class="form-control" id="sel3" name="category" >
			        <option value="futsal">풋살</option>
			        <option value="baseball">야구</option>
			        <option value="basketball">농구</option>
			      </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  <label for="sel3" >팀장 ID</label>
                    <input type="text" name="manager_id" id="manager_id" placeholder="Manager_ID*">
                  </div>
                </div>
                <div class="col-md-6" >
                  <div class="frm-group">
                  <label for="sel3" >RATING</label>
                    <input type="text" name="c_email" id="c_email" placeholder="1500" disabled="disabled">
                  </div>
                </div>
                <div class="col-md-12">
                <label for="sel3" >지역</label>
                <div class="frm-group mt-4">
                
                  <input type="text" id="sample4_postcode" placeholder="우편번호" name="addr" style="width: 25%;">
                  <button type="button" class="submit-btn" onclick="sample4_execDaumPostcode()" style="width: 15%; height: 53px; margin-left: 20px">주소</button>
                  <!-- <input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="주소찾기" style="width: 15%;margin-left: 9.5%;"> -->
                </div>
                <div class="frm-group mt-1">
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr_road" style="width: 50%">
                </div>
                <div class="frm-group mt-1">
                  <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr_detail" style="width: 50%">
                </div>
                </div>
                <div class="col-md-12">
                  <div class="frm-group">
                    <textarea name="c_message" id="c_message" placeholder="Write Message"></textarea>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="frm-group text-center">
                    <button type="submit" class="submit-btn">Comment</button>
                  </div>
                </div>
              </div>
               
            </form>
            <div class="contact-thumb">
              <img src="<c:url value='assets/images/contact.png'/>" alt="image"/>
            </div>
           
          </div>
        </div>
      </div>
    </div>
  </section>
 