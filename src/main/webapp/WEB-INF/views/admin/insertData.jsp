<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="ko">


<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>관리자</title>

<!-- Custom fonts for this template-->
<link href="<c:url value='/assets/bootstrap/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<%-- <link href="<c:url value='/assets/bootstrap/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet"> --%>

<!-- Custom styles for this template-->
<link href="<c:url value='/assets/bootstrap/css/sb-admin.css'/>" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>



<!-- TEST -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
  <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  <!-- main jquery library js file -->
  <script src="<c:url value='/assets/js/jquery-3.3.1.min.js'/>"></script>
  <!-- bootstrap js file -->
  <script src="<c:url value='/assets/js/bootstrap.min.js'/>"></script>


<script	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />




<style>  
body{
	padding-top:56px;
}

.child1{
   position: absolute;
   left : 20%;
}
.child2{
    position: absolute;
    right : 20%;
}  
div.modal-body {  
	width : 800px;
	height: 600px;
}

	
</style>

</head>
<body id="page-top">
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top fixed-top">
    <a class="navbar-brand mr-1" href="<c:url value='/Team/admin/AdminIndex.do'/>">TeamMatching</a>
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>
  </nav>
  <div id="wrapper" style="margin-top : -15px;"> 
	  <ul class="sidebar navbar-nav">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">
	          <i class="fas fa-fw fa-tachometer-alt"></i>
	          <span>데이터 입력 폼</span>
	        </a>
	      </li>
	      
	       
	    </ul>
	    <div class="card mb-3">
	          <div class="card-header" style="margin-top : 20px;">>
	            <i class="fas fa-table"></i>
	            Match Table
	            </div>
	          <div class="card-body">
	            <div class="table-responsive">
	              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                <thead>
	                  <tr>
	                    <th>경기 일시</th>
	                    <th>구장</th>
	                    <th>홈팀</th>
	                    <th>원정</th>
	                    <th>점수</th>
	                    <th>입력</th>
	                    <th>리뷰</th>
	                    <th>비고</th>
	                  </tr>
	                </thead>
	                <!-- 
	                <tfoot> 
	                  <tr>
	                    <th>정보1</th>
	                    <th>정보2</th>
	                    <th>정보3</th>
	                    <th>정보4</th>
	                    <th>정보5</th>
	                    <th>정보6</th>
	                    <th>정보7</th>
	                    <th>정보8</th>
	                  </tr>   
	                </tfoot>
	                 -->
	                <tbody>
	                  <c:forEach var="data" items="${records}">
		                  <tr>
		                    <td>${data.DATE} ${data.TIME2}</td>
		                    <td>${data.STADIUM}</td>
		                    <td>${data.TEAMNAME}</td>
		                    <td>${data.AWAYTEAM}</td>
		                    <c:choose>
		                   		<c:when test="${data.GAMESTATUS eq 'FINISH'}">
			                   		<td>${data.HOMESCORE} : ${data.AWAYSCORE }</td>
				                    <td><input type="button" value="완료" class="insertBtnEnd" /></td>
				                    <td>
				                    <input type="button"  value="리뷰" class="detailBtn"
				                    data1="${data.GAMEDATE}" data2="${data.TIME}" data3="${data.STADIUM}" data4="${data.TEAMNAME }" data5="${data.AWAYTEAM }"/>
 				                    </td> 
			                    </c:when>
		                   		<c:otherwise>
			                   		<td>${data.GAMESTATUS}</td>
				                    <td><input type="button" value="입력" class="insertBtn" 
					                    data1="${data.GAMEDATE}" data2="${data.TIME}" data3="${data.STADIUM}" data4="${data.TEAMNAME }" data5="${data.AWAYTEAM }"/></td>
					                <td></td>
			                    </c:otherwise>
		                    </c:choose>
		                    <td>......</td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	            </div>
	          </div>
	        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
	    </div>
	</div>    
</body>



<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">경기 상세보기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> 
      </div>
      <div class="modal-body">
		<div class="parent1" style="margin-top:20px; text-align: center" >
			<div class="child1">
				<dl>
					<dt>
						<a href="#">
						<img class="homeLogo" style="float: left; width:125px; height:125px" 
						<%-- src="<c:url value='/Upload/girin3.png'/>" --%> >
						</a>
					</dt>
					<dd>
					    <span ><h4 class="homeResult"></h4></span>
						<span class="homeTeam"></span> 
					</dd>
					<dd>
						<span ><h5 class="homeScore"></h5></span>
					</dd>
				</dl>
			</div> 
			<div class="child2">
				<dl> 
					<dt>
						<a href="#">
						<img class="awayLogo" style="float: left; width:125px; height:125px" 
						<%-- src="<c:url value='/Upload/girin3.png'/>" --%> >
						</a>
					</dt>
					<dd>
					    <span><h4 class="awayResult"></h4></span>
						<span class="awayTeam"></span> 
					</dd>
					<dd>
						<span ><h5 class="awayScore"></h5></span>
					</dd>
				</dl>
			</div>
		</div> 
		<div style="width:100%; margin-top:230px;" id="addPoint">
				<canvas id="canvas" height="150" width="500"></canvas>
		</div>
		<div><div style='display:inline'><b class="wSTR1"></b></div><div class="wSTR2" style='display:inline'></div></div>
		<div><div style='display:inline'><b class="b2STR1"></b></div><div class="b2STR2" style='display:inline'></div></div>
		<div><div style='display:inline'><b class="b3STR1"></b></div><div class="b3STR2" style='display:inline'></div></div>
		<div><div style='display:inline'><b class="hrSTR1"></b></div><div class="hrSTR2" style='display:inline'></div></div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<script>

$(function() {
	
	jQuery(function($) {
		$("#dataTable").DataTable({
			"order": [],
			"iDisplayLength": 20
		});
	});
	
	var chart = new Chart('canvas', {
		type: 'horizontalBar',
		data: {       
	        labels: ["안타", "홈런", "도루", "삼진", "볼넷"],
	        datasets: [{
	            label: this.TEAMNAME,
	            backgroundColor: 'rgba(22, 34, 127,0.75)',
	            data: [
	                -0,
	                -0,
	                -0,
	                -0, 
	                -0 
	           ]
	        }, {
	            label: this.AWAYTEAM,
	            backgroundColor: 'rgba(255, 65, 3,0.75)',
	            data: [
	                0,
	                0,
	                0,
	                0,
	                0
	            ],
	        }]
	    },
		options: 
			{
			responsive: true,
             scales: {
                 xAxes: [{
                     stacked: true,
                     scaleLabel: {
                         //display: true,
                     },
                     position : "left",
                     ticks: {
          		        max: -15,
          		        min: 15,
          		        stepSize: -3
          		    }
                 }], 
                 
                 yAxes: [{
                     stacked: true,
                     scaleLabel: {
                         //display: true,
                     },
                     position : "right",
                     ticks: {
          		        max: -15,
          		        min: 15,
          		        stepSize: 3
          		    }
                }]
             }
         }
	}); //chart
	
	$('.detailBtn').click(function(){
		
		$.ajax({
			url: "<c:url value='/Team/admin/showDetailLogo.do'/>",
			data : { GAMEDATE : $(this).attr('data1'),
	   		 TIME : $(this).attr('data2'),
	   		 STADIUM : $(this).attr('data3'),
	   		 TEAMNAME : $(this).attr('data4'),
	   		 AWAYTEAM : $(this).attr('data5'),
	   		'_csrf' : '${_csrf.token}'},
			type: 'post',
			
			beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			dataType: 'json',
			success : function(data){
			/*  $(".detailData").text(""); */
				if (data != "") {
					console.log(data);
					$(data).each(
						function() {
							$('.homeScore').text(this.HOMESCORE);
							$('.awayScore').text(this.AWAYSCORE);
							$('.awayLogo').attr('src', "/matching/Upload/"+this.AWAYLOGO);
							$('.homeLogo').attr('src', "/matching/Upload/"+this.HOMELOGO);
							$('.awayTeam').text(this.AWAYTEAM);
							$('.homeTeam').text(this.TEAMNAME);
						}
					);// each 
				}
				else { 
					alert("불러올 데이터가 없습니다.");
				}// else
			}
		});  // ajax 
		
		$.ajax({
			url: "<c:url value='/Team/admin/showChart.do'/>",
			data : { GAMEDATE : $(this).attr('data1'),
	   		 TIME : $(this).attr('data2'),
	   		 STADIUM : $(this).attr('data3'),
	   		 TEAMNAME : $(this).attr('data4'),
	   		 AWAYTEAM : $(this).attr('data5'),
	   		'_csrf' : '${_csrf.token}'},
			type: 'post',
			
			beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			dataType: 'json',
			success : function(data){
			/*  $(".detailData").text(""); */
				if (data != "") {
					console.log(data);
					chart.clear();
					$(data).each(
						function() {
							//label: this.TEAMNAME,
							chart.data.datasets[0].label = this.TEAMNAME;
							chart.data.datasets[1].label = this.AWAYTEAM;
							chart.data.datasets[0].data = [-this.HOMEH, -this.HOMEHR, -this.HOMESB, -this.HOMESO, -this.HOMEBB];
							chart.data.datasets[1].data = [this.AWAYH, this.AWAYHR, this.AWAYSB, this.AWAYSO, this.AWAYBB];
							chart.update();
						}
					);// each 
				}
				else { 
					alert("불러올 데이터가 없습니다.");
				}// else
			}
		});  // ajax
		
		$.ajax({
			url: "<c:url value='/Team/admin/getEachResult.do'/>",
			data : { GAMEDATE : $(this).attr('data1'),
	   		 TIME : $(this).attr('data2'),
	   		 STADIUM : $(this).attr('data3'),
	   		'_csrf' : '${_csrf.token}'},
			type: 'post',
			
			beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			dataType: 'json',
			success : function(data){
				if (data != "") {
					var str="";
					var isEmpty = function(value){ 
						if(value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
							return true;
						}
						else { 
							return false;
						} 
					};
					$('.wSTR1').html("");
					$('.b2STR1').html("");
					$('.b3STR1').html("");
					$('.hrSTR1').html("");
					$('.wSTR2').html("");
					$('.b2STR2').html("");
					$('.b3STR2').html("");
					$('.hrSTR2').html("");
					
					console.log(data);
					$(data).each(
						function() {
							if(!isEmpty(this.wSTR)) {
								$('.wSTR1').text("승리투수 : ");
								$('.wSTR2').text(this.wSTR);
							}
							if(!isEmpty(this.b2STR)) {
								$('.b2STR1').html("2루타 : ");
								$('.b2STR2').html(this.b2STR);
								
								/*
								$('.b2STR1').text("2루타 : ");
								$('.b2STR2').text("");
								$('.b2STR2').text(this.b2STR);
								*/
							}	
							if(!isEmpty(this.b3STR)) {
								
								$('.b3STR1').html("3루타 : ");
								$('.b3STR2').html(this.b3STR);
								
								/*
								$('.b3STR1').text("3루타 : ");
								$('.b3STR2').text("");
								$('.b3STR2').text(this.b3STR);
								*/
							}	
							if(!isEmpty(this.hrSTR)) {
								$('.hrSTR1').text("홈런 : ");
								$('.hrSTR2').text(this.hrSTR);
							}
						}
					);// each 
					
					$("#addPoint:last").after(str);
					
				}
				else { 
					alert("불러올 데이터가 없습니다.");
					$('.wSTR1').html("");
					$('.b2STR1').html("");
					$('.b3STR1').html("");
					$('.hrSTR1').html("");
					$('.wSTR2').html("");
					$('.b2STR2').html("");
					$('.b3STR2').html("");
					$('.hrSTR2').html("");
				}// else
			}
		});  // ajax
		$("#testModal").modal();
		
	});////////  clickDetailBtn
	
	
	
	
	
});


</script>








<script>

/* var gameDetail =  */
	


$(".insertBtn").click(function () {
    
    $.ajax({
    	url: "<c:url value='/Team/admin/insertParsingData.do'/>",
    	type: "post",
    	data : { GAMEDATE : $(this).attr('data1'),
    		 TIME : $(this).attr('data2'),
    		 STADIUM : $(this).attr('data3'),
    		 TEAMNAME : $(this).attr('data4'),
    		 AWAYTEAM : $(this).attr('data5'),
    		'_csrf' : '${_csrf.token}'},
   		
	    beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function (data) {
        	if (data != "") {
				$(data).each(
					function() {
						alert('입력성공');
					});// each 
			}
        },
        error: function (e) {
            alert("입력실패");
        }  
    });
});


</script>
