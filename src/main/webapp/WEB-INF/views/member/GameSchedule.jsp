<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>

<script>
	function gameFinish(index){
		var gamedate = $('.'+index+':eq(0)').html();
		var time = $('.'+index+':eq(1)').html();
		var stadium = $('.'+index+':eq(2)').html();
		var hometeam = $('.'+index+':eq(3)').html();
		var awayteam = $('.'+index+':eq(4)').html();
		var homescore = $('.'+index+':eq(5)').val();
		var awayscore = $('.'+index+':eq(6)').val();
		console.log(hometeam+":"+awayteam+"/"+homescore+":"+awayscore+"/"+gamedate+"/"+time+"/"+stadium);
		
	 	$.ajax({
			url:"<c:url value='/Team/Matching/gameFinish.do'/>",
			type:'post',
			dataType:'text',
			data:{'gamedate':gamedate,'time':time,'stadium':stadium,'hometeam':hometeam,'awayteam':awayteam,'homescore':homescore,'awayscore':awayscore,'_csrf':'${_csrf.token}'},	
			success:function(data){
				if(data === 'No'){
					alert('사용자는 해당 팀의 팀장이 아닙니다');
				}
				else{
					$('.'+index+':eq(5)').prop("disabled",true);
				 	$('.'+index+':eq(6)').prop("disabled",true);
				 	swal({
	    				  title: "Complete",
	    				  text: "상대방 동의시 게임이 종료 됩니다 \r\n팀원들의 마일리지가 +200 되었습니다",
	    				  icon: "success",
	    				  button: "yes",
	   				});    	
				}
				
			}
		});
	}
</script>

 <!-- banner-section start -->  
  <section class="breadcum-section" style="margin-bottom: -70px">
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
              <h3 class="title">Game Schedule</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">game Schedule</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->
  
  <section class="play-section section-padding section-bg">
	<div class="container" style="border:1px solid red">

		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="section-header text-center">
					<h2 class="section-title">Game Schedule</h2>
					<p></p>
				</div>
			</div>
		</div>


		<div class="row">
			<!--  row  -->
			<div class="col-lg-12">
				<div class="online-play-tab-part">
					

					<div class="tab-content" id="myTabContent">
						<!--  전체 선택 -->
						<div class="tab-pane fade show active" id="all" role="tabpanel"aria-labelledby="all-tab">
							<div class="play-table-part">
								<div class="play-table">
									<table class="table table-bordered" id="all-table"style="table-layout: fixed">
										<thead id="th1">
											<tr>
												<th class="" style="width: 10%;">날짜</th>
												<th style="width: 5%;">시간</th>
												<th style="width: 10%;">경기장</th>
												<th class="team-name" style="width: 17%;">Home Team</th>
												<th class="team-name" style="width: 17%;">Away Team</th>
												<th style="width: 22%;">Home : Away</th>
												
												<th style="width: 8%;">#</th>												
											</tr>
										</thead>
										<tbody class="all-tbody">
										<c:if test="${empty list}" var="isEmpty">
										<!-- 테이블 데이터 시작  -->
										
										<tr>
    										<td colspan="7">종료할 게임 목록이 없습니다 </td>  				
   										</tr>
    									</c:if>
    									<c:if test="${! isEmpty}">
	    									
    										<c:forEach var="item" items="${list}" varStatus="loop" >
	    										<tr>
		    										<td class="${loop.count}">${item.GAMEDATE}</td>
		    										<td class="${loop.count}">${item.TIME }</td>
		    										<td class="${loop.count}">${item.STADIUM }</td>
		    										<td class="${loop.count}">${item.TEAMNAME }</td>
		    										<td class="${loop.count}">${item.AWAYTEAM }</td>
		    										<%-- <c:if test="${! empty item.teamLogo }" var="isLogo"></c:if> --%>
		    										<td><input class="${loop.count}" type="text" style="width: 20%; text-align:center;"/> :
		    										<input class="${loop.count}" type="text" style="width: 20%; text-align:center;"/></td>
		    										<td><button type="button" class="btn btn-warning" onclick="gameFinish(${loop.count})">Finish</button></td>		    										
	   											</tr>
    										</c:forEach>
    									</c:if>
    									

										</tbody>
									</table>
									
								</div> <!--  play-table end -->
								

							</div>
							<!--  전체선택 끝  -->
						</div>
					</div>
					<!-- online-play-tab-part end -->
				</div>
			</div>
			
		</div> 
		
		
	
		</div>
</section>
<!-- play-section end -->