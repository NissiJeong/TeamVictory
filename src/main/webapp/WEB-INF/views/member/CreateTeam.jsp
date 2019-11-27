<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var flag = false;
$(function(){
	
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
})

function isSelect(){
	var cate = $("#category").val();
	var loc = $('#teamLoc').val();
	console.log(cate+":"+loc);
	if(cate.length == 0 ){		
		$('#cateError').html('종목을 선택해야 합니다');
		$("#cateError").css("color","red");
		$("#register").css("background-color","gray");
		$("#register").prop("disabed","true");
	}
	else if(cate.length !=0){
		$('#cateError').html('');		
	}
	if(loc.length == 0){
		$('#locError').html('지역을 선택해야 합니다');
		$('#locError').css("color","red");
		$("#register").css("background-color","gray");
		$("#register").prop("disabed","true");
	}
	else if(loc.length != 0){
		$('#locError').html('');
	}
}

function checkTeam(teamName){
	if(teamName.length<5){
		$("#TeamNameError").html("팀 이름은 5자 이상 15자 이내로 입력해야 합니다");
		$("#TeamNameError").css("color","red");
	}
	else if(teamName.length>15){
		$("#TeamNameError").html("팀 이름은 5자 이상 15자 이내로 입력해야 합니다");
		$("#TeamNameError").css("color","red");
	}
	else{
		//console.log(teamName);
		$.ajax({
			url:"<c:url value='/Team/Matching/checkTeam.do'/>",
			type:'post',
			dataType:'text',
			data:{teamName:teamName,'_csrf':'${_csrf.token}'},	
			success:function(data){
				//console.log(data);
				if(data == "no"){
					$("#TeamNameError").html("이미 존재하는 팀 이름입니다");	
					//$("#register").prop("disabed","true");
					$("#TeamNameError").css("color","red");
					flag = false;
				}
				else{					
					$("#TeamNameError").html("사용 가능합니다");
					$("#TeamNameError").css("color","green");
					flag  = true;
				}
				isBlank()
			}
		});
	}
}
function isBlank(){
	var cate = $("#category").val();
	var loc = $('#teamLoc').val();
	var text = $('#teamInto').val();
	var teamName = $('#teamName').val();
	
	if(text.length == 0 ){
		$('#infoError').html('팀 소개를 입력하세요');
		$('#infoError').css("color","red");
		$("#register").css("background-color","gray");
		$("#register").prop("disabed","true");
	}
	else if(text.length != 0 && loc.length != 0 && cate.length != 0 && teamName.length !=0 && flag == true){
		$('#infoError').html('');
		$("#register").css("background-color","#ff3952");
		$("#register").prop("disabled",false);
	}
}
/* function loading(){}
	$('#image_section').hide();
	$('#loading').click(function(){
		$('#image_section').toggle();
	});
} */
</script>

  
  <!-- contact-section start -->
  <section class="contact-section section-padding" style="margin-top: -50px">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-7">
          <div class="section-header text-center">
            <h2 class="section-title">Create Your Team!!</h2>
            <p><!-- On insensible possession oh particular attachment at excellence in. The books arose but miles happy she. -->
            	활동할 팀을 만들어 보세요!
            </p>
          </div>
        </div>
      </div>
     <div class="container">
      <div class="row" style="margin-top: -50px">
        <div class="offset-md-1 col-lg-10">
       	<c:if test="${dupliManager == 1 }" var="isDupli">
       	<script>
      
       		alert('사용자는 이미 팀장을 맡고 있습니다');
        	window.location = '<c:url value="/Team/Member/Index.do"/>';
	       
       	</script>
       	</c:if>
       	<c:if test="${not isDupli}">
	 	
          <div class="contact-form-area" style="background-color: #3981b5; margin-top: 35px;">
          	
            <form class="cmn-form contact-form" action="<c:url value='/Team/matching/teamJoin.do?${_csrf.parameterName}=${_csrf.token}'/>" id="form" runat="server" method="post" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              <div class="row">
              	<div class="col-md-6">
                  <div class="frm-group">
                  		<img id="image_section" src="<c:url value='/assets/images/kickball-1.gif'/>" style="width:100px;height:100px;" />
                  		<label id="loading" for="imgInput" class="btn btn-primary" style="margin-top: 60px; margin-bottom: 0px; background-color: #d36f19; border: none;" onclick="loading()">팀 로고 선택</label>
					    <input type='file' id="imgInput" name="upload" style="display: none"/>					   	
				   		<span style="color:red; font-size: 0.8em">${maxError }</span>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  	
                  	<label for="sel3">팀 명</label>
                    <input style="border-radius: 10px;" type="text" name="teamName" id="teamName" placeholder="Team Name*" oninput="checkTeam(this.value)">
                    <span id="TeamNameError" style="color:red; font-size: 0.8em"></span>
                  </div>
                </div>
                
                <div class="col-md-6">
                  <div class="frm-group">
                  
                  	<label for="sel3" >종 목</label>
                   <select style="border-radius: 5px; padding-left: 20px; height: 53px;" class="form-control" id="category" name="category" onchange="isSelect()">
                   	<option value="">종 목</option>
			        <option value="futsal">풋 살</option>
			        <option value="baseball">야 구</option>
			        <option value="basketball">농 구</option>
			      </select>
			      <span id="cateError" style="color:red; font-size: 0.8em"></span>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  <label for="sel3" >팀 장 ID</label>
                    <input style="background-color: #c1ffd1; border-radius: 10px;" type="text" name="manager_id" id="manager_id" placeholder="${id }" disabled value="${id }">
                  </div>
                </div>
                <div class="col-md-6" >
                  <div class="frm-group">
                  <label for="sel3" >RATING</label>
                    <input style="background-color: #c1ffd1; border-radius: 10px;" type="text" name="teamRating" id="teamRating" placeholder="1500" disabled value="1500">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  	<label for="sel3" >팀 활동 지역</label>
                   <select style="border-radius: 5px; padding-left: 20px; height: 53px;" class="form-control" id="teamLoc" name="teamLoc" onchange="isSelect()">
                   	<option value="">지역</option>
			        <option value="guro">구로구</option>
			        <option value="gumcheon">금천구</option>
			        <option value="mapo">마포구</option>
			      </select>
			      <span id="locError" style="color:red; font-size: 0.8em"></span>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="frm-group">
                  <label for="sel3" >간단한 팀 소개</label>
                    <textarea style="border-radius: 10px;" name="teamInfo" id="teamInto" placeholder="Write Message" onkeyup="isBlank()"></textarea>
                     <span id="infoError" style="color:red; font-size: 0.8em"></span>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="frm-group text-center">
                    <button type="submit" class="submit-btn" id="register" disabled="true" style="background-color:gray; border-radius: 10px;">등 록</button>
                  </div>
                </div>
              </div>
            </form>
            <div class="contact-thumb">
	            
            </div>
           
          </div>
        
          </c:if>
          
        </div><!-- row -->
       </div><!-- container -->
       
      </div>
    </div>
  </section>
 