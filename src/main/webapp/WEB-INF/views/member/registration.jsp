<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                $("#sample4_roadAddress").css("background-color","#FFFFFF")
				$("#sample4_postcode").css("background-color","#FFFFFF")
				var detail = $("#sample4_detailAddress").val()
				if(detail == ""){
					$("#btnRegist").css("background-color","#808080").prop("disabled",true)
				}
				else{
				$("#btnRegist").css("background-color","#FF3952").prop("disabled",false)
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
    
    /*===============================================================================================*/
    
    $(document).ready(function(){            
        var now = new Date();
        var nyear = now.getFullYear();
        var nmon = (now.getMonth()+1) > 9 ? ''+(now.getMonth()+1) : '0'+(now.getmonth()+1);            
       
        //년도 selectbox만들기               
        for(var sy = 1920 ; sy <= nyear ; sy++) {
            $('#year').append('<option value="' + sy + '">' + sy + '</option>'+'</br>');    
        }

        // 월별 selectbox 만들기            
        for(var i=1; i <= 12; i++) {
            var sm = i > 9 ? i : "0"+i ;            
            $('#month').append('<option value="' + sm + '">' + sm + '</option>');    
         }  
        
        // 일별 selectbox 만들기
        for(var i=1; i <=31; i++){
        	var dd = i > 9 ? i : "0"+i ; 
        	$('#day').append('<option value="' + dd + '">' + dd  + '</option>');
        }
        
        //jQuery("#fd_year  > option[value="+nyear+"]").attr("selected", "true");    
        //jQuery("#fd_month  > option[value="+nmon+"]").attr("selected", "true");                 
   
    })////onload
    function checkId(){
    	var id = $('#User_id').val();
    	var duplicate = "중벅";
		var posible = "가능";
		var pattern_num = /[0-9]/;	// 숫자 
    	var pattern_eng = /[a-zA-Z]/;	// 문자 
    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
    	$.ajax({
            url:"<c:url value='/Team/Matching/CheckId.do'/>",
            type:'post',
            dataType:'text',
            data:{id:id},   
            success:function(data){
               console.log(data);
               if(data == duplicate){
             	  $("#User_id").css("background-color", "#FFCECE");
             	  $("#iError").text("이미 등록된 아이디입니다").css({"font-weight":"bold"})
             	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
               }
               else if(id == ""){
             	  $("#iError").text("필수항목입니다.").css({"font-weight":"bold"})
             	  $("#User_id").css("background-color", "#FFCECE");
             	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
             	  
               }
               else if(pattern_kor.test(id)){
              	  $("#User_id").css("background-color", "#FFCECE");
              	  $("#iError").text("아이디에 한글은 포함하실 수 없습니다").css({"font-weight":"bold"})
              	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
                }
                else if(id.length < 5 || id.length > 15){
              	  console.log("5자이상")
              	  $("#User_id").css("background-color", "#FFCECE");
              	  $("#iError").text("아이디는 5자이상 혹은 15자 이하로 입력해주세요").css({"font-weight":"bold"})
              	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
                }
              else{
            	  $("#User_id").css("background-color", "#FFFFFF");
            	  $("#iError").text("사용가능한 아이디입니다").css({"font-weight":"bold"})
            	 /*  $("#btnRegist").css("background-color","#FF3952").prop("disabled",false) */
            	 regiComplete();
                }
              
            }
            
         });
    }////////////CheckId
    
function checkMail(){
    	
    	var id = $('#email').val();
    	var duplicate = "중복";
		var posible = "가능";
		
    	$.ajax({
            url:"<c:url value='/Team/Matching/CheckMail.do'/>",
            type:'post',
            dataType:'text',
            data:{email:id},   
            success:function(data){
               console.log(data);
               if(data == duplicate){
               	  $("#email").css("background-color", "#FFCECE");
               	  $("#eError").text("이미 등록된 메일입니다.").css({"font-weight":"bold"})
               	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
               	  
                 }
                 else if(id == ""){
               	  $("#eError").text("필수항목입니다.").css({"font-weight":"bold"})
               	  $("#email").css("background-color", "#FFCECE");
               	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
                 }
                 else if(id.indexOf("@") == -1){
               	  console.log("no")
               	  $("#email").css("background-color", "#FFFFFF");
               	  $("#eError").text("잘못된 메일형식입니다.").css({"font-weight":"bold"})
               	  $("#btnRegist").css("background-color","#808080").prop("disabled",true)
                 }
                 else{
               	  $("#email").css("background-color", "#FFFFFF");
               	  $("#eError").text("사용가능한 메일입니다.").css({"font-weight":"bold"})
               		regiComplete()
              	  
                }
                
                }
         });///////////////메일중복확인
         
    }//////////checkMail()
    
    function userName(){
    	var user_name = $("#User_name").val();
    	if(user_name == ""){
    		$("#User_name").css("background-color","#FFCECE")
    		$("#nError").text("필수항목입니다").css({"font-weight":"bold"});
    	}
    	else if(user_name != ""){
    		$("#User_name").css("background-color","#FFFFFF")
    		$("#nError").text("")
    		regiComplete()
    	}
    	
    }/////////userName()
    
    function pwdCheck(){
    	var pass = $("#pass").val();
    	var re_pass = $("#re_pass").val();
    	
    	if(pass != re_pass){
    		$("#re_pass").css("background-color","#FFCECE")
    		$("#rpError").text("비밀번호가 일치하지 않습니다").css({"font-weight":"bold"})
    	}
    	
    	else if(re_pass == ""){
    		$("#re_pass").css("background-color","#FFCECE")
    		$("#rpError").text("필수항목입니다.").css({"font-weight":"bold"})
    		regiComplete()
    	}
    	else{
    		$("#re_pass").css("background-color","#FFFFFF")
    		$("#rpError").text("")
    	}
    }/////pwdCheck()
    
    function confirmPwd(){
    	var pass = $("#pass").val();
    	if(pass.length < 8){
			$("#pass").css("background-color","#FFCECE")
			$("#pError").text("비밀번호는 최소 8글자이상 입력하세요").css({"font-weight":"bold"})
		} 
    	else if(pass.length >= 8){
    		$("#pass").css("background-color","#FFFFFF")
    		$("#pError").text("")
    		regiComplete()
    	}

    	
    }////////confirmPwd
    
    function phoneCheck(){
    	var phone = $("#phone").val();
    	console.log(phone)
    	if(phone.length == 0){
			$("#phone").css("background-color","#FFCECE")
			$("#phError").text("필수항목입니다.").css({"font-weight":"bold"})
		} 
    	else if(phone.length != 0){
    		$("#phone").css("background-color","#FFFFFF")
    		$("#phError").text("")
    		regiComplete()
    	}
    	
    }
    
    function genderCheck(){
    	var gender = "성별"
    	var man = "Man"
    	var woman = "Woman"
    	var target = document.getElementById("gender");
    	var selected = (target.options[target.selectedIndex].text)
    	console.log("체크내용 : ",gender)
    	console.log(selected)
    	if(selected == gender ){
    		$("#gender").css("background-color","#FFCECE")
    		$("#gError").text("성별을 체크하세요").css({"font-weight":"bold"});
    	}
    	else if(selected == man || selected == woman){
    		$("#gender").css("background-color","#FFFFFF")
    		$("#gError").text("");
    		/* $("#btnRegist").prop("type","submit") */
    		$("a").prop("href","#year")
    		regiComplete()
    	}
    	
    }//////////////
    
    function notSelected(){
    	var name = $("#User_name").val()
    	var id = $("#User_id").val()
    	var pass = $("#pass").val()
    	var re_pass = $("#re_pass").val()
    	var phone = $("phone").val()
    	var email = $("#email").val()
    	var addr = $("#addr").val()    	
    	var gender = "성별"
        var target = document.getElementById("gender");
        var selected = (target.options[target.selectedIndex].text)
        console.log("체크내용 : ",gender)
        console.log("selected",selected)
        console.log(name)
        if(selected == gender){
        	$("#gender").css("background-color","#FFCECE")
        	$("#gError").text("성별을 체크하세요").css({"font-weight":"bold"});
        }
        else if(name == " "){
    		$("#User_name").css("background-color","#FFCECE")
    		
        }
        confirmPwd();
        checkId();
        checkMail();
        userName();
        pwdCheck();
        confirmPwd()
        selectYear();
        selectMonth();
        selectDay();
        regiComplete()	
        phoneCheck()
        pwdCheck()
        addr_road_Check();
        addrCheck();
        addr_detail_Check();
        
    }/////////
    
    function selectYear(){
    	var year = "년도"
    	var target = document.getElementById("year");
    	var selected = (target.options[target.selectedIndex].text)
    	console.log(selected)
    	if(selected == year ){
    		$("#year").css("background-color","#FFCECE")
    		$("#mError").text("년도를 선택하세요").css({"font-weight":"bold"});
    	}
    	else if(selected != year){
    		$("#year").css("background-color","#FFFFFF")
    		$("#mError").text("");
    		/* $("#btnRegist").prop("type","submit") */
    		$("a").prop("href","#month")
    		regiComplete()	
    	}
    }////////////
    
    function selectMonth(){
    	var month = "월"
    	var target = document.getElementById("month");
    	var selected = (target.options[target.selectedIndex].text)
    	console.log(selected)
    	if(selected == month ){
    		$("#month").css("background-color","#FFCECE")
    		$("#mError").text("월을 선택하세요").css({"font-weight":"bold"});
    	}
    	else if(selected != month){
    		$("#month").css("background-color","#FFFFFF")
    		$("#mError").text("");
    		/* $("#btnRegist").prop("type","submit") */
    		$("a").prop("href","#day")
    		regiComplete()	
    	}
    }///////////
    
    function selectDay(){
    	var name = $("#User_name").val()
    	var day = "일"
    	var target = document.getElementById("day");
    	var selected = (target.options[target.selectedIndex].text)
    	console.log(selected)
    	console.log(name)
    	if(selected == day ){
    		$("#day").css("background-color","#FFCECE")
    		$("#mError").text("필수항목 입니다").css({"font-weight":"bold"});
    	}
    	else if(selected != day){
    		$("#day").css("background-color","#FFFFFF")
    		$("#mError").text("");
    		$("a").prop("href","")
    		regiComplete()	
    		/* $("#btnRegist").prop("type","submit") */
    		
    		/* regiComplete() */
    	}
    	
    }///////////
    
    function addr_road_Check(){
    	var addr_road = $("#sample4_roadAddress").val()
    	console.log("addr_road : ",addr_road)
    	if(addr_road == ""){
    		$("#sample4_roadAddress").css("background-color","#FFCECE")
    		$("#aError").text("필수항목입니다.").css({"font-weight":"bold"});
    		$("#btnRegist").css("background-color","#808080").prop("disabled",true)
    	}
    	else{
    		$("#sample4_roadAddress").css("background-color","#FFFFFF")
    		$("#aError").text("")
    		regiComplete()
    	}
    	
    }//////////
    
    function addrCheck(){
    	var addr = $("#sample4_postcode").val()
    	console.log("sample4_postcode : ", addr)
    	if(addr == ""){
    		$("#sample4_postcode").css("background-color","#FFCECE")
    		$("#btnRegist").css("background-color","#808080").prop("disabled",true)
    	}
    	else{
    		$("#sample4_postcode").css("background-color","#FFFFFF")
    		$("#aError").text("")
    		regiComplete()
    	}
    }//////
    
    function addr_detail_Check(){
    	var addr_detail = $("#sample4_detailAddress").val()
    	console.log("addr_detail : ",addr_detail)
    	if(addr_detail == ""){
    		$("#sample4_detailAddress").css("background-color","#FFCECE")
    		$("#btnRegist").css("background-color","#808080").prop("disabled",true)
    	}
    	else{
    		$("#sample4_detailAddress").css("background-color","#FFFFFF")
    		$("#aError").text("")
    		regiComplete()
    	}
    }///////
    
  
    
     
    function regiComplete(){
    	var gender = "성별"
        var man = "Man"
        var woman = "Woman"
        var target = document.getElementById("gender");
        var selected = (target.options[target.selectedIndex].text)
    	var year = "년도"
        var ytarget = document.getElementById("year");
        var yselected = (ytarget.options[ytarget.selectedIndex].text)
        var month = "월"
    	var mtarget = document.getElementById("month");
    	var mselected = (mtarget.options[mtarget.selectedIndex].text)
    	var day = "일"
    	var dtarget = document.getElementById("day");
    	var dselected = (dtarget.options[dtarget.selectedIndex].text)
    	console.log(yselected, mselected, dselected, addr_road)
    	
    	var name = $("#User_name").val()
    	var id = $("#User_id").val()
    	var pass = $("#pass").val()
    	var re_pass = $("#re_pass").val()
    	var phone = $("#phone").val()
    	var email = $("#email").val()
    	var addr = $("#addr").val()
    	var addr_road = $("#sample4_roadAddress").val()
    	var addr = $("#sample4_postcode").val()
    	var addr_detail = $("#sample4_detailAddress").val()
    	if(name == "" || id == "" || pass == "" || re_pass == "" || phone == "" || email == "" 
    			|| yselected == year || mselected == month || dselected == day || selected == gender
    			|| addr == "" || addr_road == "" || addr_detail == ""){
    			
    		$("#btnRegist").css("background-color", "#F808080").prop("disabled", true)
    		$("#btnRegist").prop("type","submit")
    		
    	}
    	else{
    		$("#btnRegist").css("background-color", "#FF3952").prop("disabled", false)
    		alert("가입하시겠습니까?")
    	}
    }
   
</script>


<style>
 
#User_name{
	background: url();
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#User_id{
	background: url();
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

#re_pass{
	background: url(https://static.nid.naver.com/images/ui/join/m_icon_check_disable.png) 0 0 no-repeat;
	background-size: 18px;
	background-position: 98%;
	border-bottom: 1.5px solid orange;
	width: 50%; 
	box-shadow: 0 0 10px 2px rgba(0,0,0,0);
}

#email{
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

span{

	margin-top: 10px;
	color: red;
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
              
              <form class="cmn-form registration-form" id="regi" method="post" action="<c:url value='/Team/Matching/Registration.do'/>">
              
              <div class="frm-group">
                  	<input type="text" name="User_name" id="User_name" placeholder="Name" value="${param.User_name }" oninput="userName()">
                  	<div>
                  	<span id="nError">${nameError }</span>
                  	</div>
                </div> 
               <div class="frm-group">
                  	<input type="text" name="User_id" id="User_id" placeholder="User" value="${param.User_id }" title="${param.User_id }" oninput="checkId()">
                  	<div>
                  	<span id="iError">${idError }</span>
                  	</div>
                </div> 
                <div class="frm-group">
                  <input type="text" name="email" id="email" placeholder="Your Email" style="width: 50%" value="${param.email }" oninput="checkMail()">
                  <div>
                  	<span id="eError">${emailError }</span>
                  	</div>
                </div>
                <div class="frm-group">
                  <input type="password" name="pass" id="pass" placeholder="Your Password" style="width: 50%" value="${param.pass }" oninput="confirmPwd()">
                  <div>
                  	<span id="pError">${passError }</span>
                  	</div>
                </div>
                <div class="frm-group">
                  <input type="password" name="re_pass" id="re_pass" placeholder="Enter Re-Password" style="width: 50%" value="${param.re_pass }" oninput="pwdCheck()">
                  <div>
                  	<span id="rpError">${re_passError }</span>
                  	</div>
                </div>
                <div>
                <div class="frm-group">
                  <input type="tel" name="phone" id="phone" placeholder="Your PhoneNumber" style="width: 50%" value="${param.phone }" oninput="phoneCheck()">
                  <div>
                  	<span id="phError">${phoneError }</span>
                  	</div>
                </div>
                <div class="frm-group">
                  <select class="custom-select" id="gender" name="gender" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" onchange="genderCheck()"> 
				<option value="gender">성별</option>		
				<option value="Man">Man</option>		
				<option value="Woman">Woman</option>		
					</select>
					<div>
                  	<span id="gError">${genderError }</span>
                  	</div>
                </div>
                <div class="frm-group">
               		<select class="custom-select" style="width: 15%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" name="year" id="year" onchange="selectYear()">
              	<option value="">년도</option>
               		</select>
               		
					<select class="custom-select" style="width: 15%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" name="month" id="month" onchange="selectMonth()">
				<option value="">월</option>	
					</select>	
					<select class="custom-select" style="width: 15%;display: inline; border-style: none; border-bottom: 1.5px solid orange;" name="day" id="day" onchange="selectDay()">
				<option value="">일</option>		
					</select>
					<div>
                  	<span id="mError">${monthError }</span>
                  	</div>
				</div>
				<div class="frm-group mt-4">
                  <input type="text" id="sample4_postcode" placeholder="우편번호" name="addr" style="width: 25%;" value="${addr }" oninput="addrCheck()">
                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 15%; margin-left: 9.5%;">
                </div>
                <div class="frm-group mt-1">
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr_road" style="width: 50%"  value="${addr_road }" oninput="addr_road_Check()">
                </div>
                <div class="frm-group mt-1">
                  <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr_detail" style="width: 50%" value="${addr_detail }" oninput="addr_detail_Check()">
                </div>
                <div>
                 	<span id="aError">${addrError }</span>
                  	</div>
				<!-- <span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" style="width: 50%">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" style="width: 50%">
				-->
				</div>
                <div class="frm-group text-center">
                    <!-- <input type="submit" class="submit-btn" style="margin-top: 60px; width: 15%" value="Sign Up" id="btnRegist"/> -->
                    <a href="#gender" id="move">
                    <input type="button" class="submit-btn" style="margin-top: 60px; background-color: gray;" value="Sign Up" id="btnRegist" onclick="notSelected()" />
                    </a>
                </div>
              </form>
            </div>
      </div>
      </div>
    </div>
  </section>

