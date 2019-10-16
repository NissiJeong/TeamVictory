<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
    
    /*===============================================================================================*/
    
    $(document).ready(function(){            
        var now = new Date();
        var nyear = now.getFullYear();
        var nmon = (now.getMonth()+1) > 9 ? ''+(now.getMonth()+1) : '0'+(now.getmonth()+1);            
       
        //년도 selectbox만들기               
        for(var sy = 1920 ; sy <= nyear ; sy++) {
            $('#fd_year').append('<option value="' + sy + '">' + sy + '년</option>'+'</br>');    
        }

        // 월별 selectbox 만들기            
        for(var i=1; i <= 12; i++) {
            var sm = i > 9 ? i : "0"+i ;            
            $('#fd_month').append('<option value="' + sm + '">' + sm + '월</option>');    
         }  
        
        // 일별 selectbox 만들기
        for(var i=1; i <=31; i++){
        	
        	$('#fd_day').append('<option value="' + i + '">' + i  + '일</option>');
        }
        
        //jQuery("#fd_year  > option[value="+nyear+"]").attr("selected", "true");    
        //jQuery("#fd_month  > option[value="+nmon+"]").attr("selected", "true");                 
    })

    
</script>

<style>


#f-name{
	background: ;
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#pass{
	background: url(https://static.nid.naver.com/images/ui/join/m_icon_pass.png) 0 0 no-repeat;
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#re-pass{
	background: url(https://static.nid.naver.com/images/ui/join/m_icon_check_disable.png) 0 0 no-repeat;
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#name{
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#phone{
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#gender{
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);

}

#sample4_postcode{

	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#sample4_roadAddress{

	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#sample4_detailAddress{

	border-style: none;
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
	
}


</style>
  <!-- banner-section start -->
  <section class="breadcum-section">
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
              <h3 class="title">Registration</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">Registration</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->

  <section class="registration-section section-padding">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="registration-block text-center" style="width: 100%; background: none;box-shadow:none;">         
              <h3 class="title">Create a new account</h3>
              <form class="cmn-form registration-form">
               <div class="frm-group">
                <!-- <i class="flaticon-trophy" style="font-size: 2.5em"></i> -->
                  	<input type="text" name="f-name" id="f-name" placeholder="User">
                </div> 
                <div class="frm-group">
                  <input type="email" name="name" id="name" placeholder="Your Email" style="width: 50%">
                </div>
                <div class="frm-group">
                  <input type="password" name="pass" id="pass" placeholder="Your Password" style="width: 50%">
                </div>
                <div class="frm-group">
                  <input type="password" name="re-pass" id="re-pass" placeholder="Enter Re-Password" style="width: 50%">
                </div>
                <div>
                <div class="frm-group">
                  <input type="password" name="re-pass" id="phone" placeholder="Your PhoneNumber" style="width: 50%">
                </div>
                <div class="frm-group">
                  <select class="custom-select" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid orange;">
				<option>성별</option>		
				<option>Man</option>		
				<option>Woman</option>		
					</select>
                </div>
                <div>
               		<select class="custom-select" style="width: 15%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" id="fd_year" >
              	<option >년도</option>	
               		</select>
					<select class="custom-select" style="width: 15%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" id="fd_month">
				<option>월</option>	
					</select>	
					<select class="custom-select" style="width: 15%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" id="fd_day">
				<option>일</option>		
					</select>
				</div>
				
				<div class="frm-group mt-4">
                  <input type="text" id="sample4_postcode" placeholder="우편번호" style="width: 25%;">
                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 15%;margin-left: 9.5%;">
                </div>
                <div class="frm-group mt-1">
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width: 50%">
                </div>
                <div class="frm-group mt-1">
                  <input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width: 50%">
                </div>
				<!-- <span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width: 50%">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="width: 50%">
				-->
				
				
				
				</div>
                <div class="frm-group">
                    <button type="submit" class="submit-btn" style="margin-top: 100px">Sign Up</button>
                </div>
              </form>
              </div>
              
      </div>
      </div>
    </div>
  </section>
  <!-- <input type="text" id="sample4_postcode" placeholder="우편번호" style="width: 50%;">
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" style="width: 50%">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="width: 50%">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width: 50%">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="width: 50%">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 50%"><br>
				 <button onclick="sample4_execDaumPostcode()" class="btn btn-info">우편번호 찾기</button> -->
