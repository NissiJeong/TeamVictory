<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="<c:url value='/assets/css/noti-stylet.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/noti-main-color.css'/>" id="colors">
<link rel="shortcut icon" href="#">

<style>
    textarea{
          width:100%;
        }
    .reply_reply {
            border: 2px solid #FF50CF;
        }
    .reply_modify {
            border: 2px solid #FFBB00;
        }
        
    #text {
    	word-break:break-all;
		overflow:hidden;
		width : 700px;
	}    
	
	.replyBox {
		display: block;
		word-break:break-all;
		overflow:hidden;
		width : 1000px;
	}
        
</style>



<!-- 실제 내용 시작 -->
<!-- Wrapper -->
<div id="wrapper">

<!-- Dashboard -->
<div id="dashboard">

<!-- Content
================================================== -->
	<div class="container">
		<div class="dashboard-content">
			<!-- Titlebar -->
			<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
	
					<h2>상 세 보 기</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="<c:url value='/Team/Member/Index.do'/>">Home</a></li>
							<li><a href="<c:url value='/Team/Matching/Board.do'/>">BBS</a></li>
							<li>${record.no }</li>
						</ul>
					</nav>
				</div>
			</div><!-- row -->
			</div><!-- title -->
	
			<div class="row">
				<div class="col-lg-12 col-md-12">
	
					<div class="messages-container margin-top-0">
						<div class="messages-headline">
							<h4>현재 페이지 ${nowPage}</h4>
						</div>
						
						<div class="messages-inbox">
	
							<ul>
								<li class="unread">
								  <a >
									<div class="message-by">
										<div class="message-avatar">
											<img src="https://placeimg.com/50/50/people" alt="" />
										</div>
										
										<div class="message-by-headline">
											<span>작성일 ${record.postDate }</span>
											<p>글번호 ${record.no}</p>
											
											<h5>아이디 ${record.id }</h5>
											
											<span>조회수 ${record.count}</span>
											
											<h4>
												${record.title }
											</h4>
										</div>
										<div id="text">
											${record.content}
										</div>
										
										<div id="btns">
											<c:if test="${id == record.id}">
												<button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Edit.do?no=${record.no}&nowPage=${param.nowPage}"/>';">
													수정
												</button>
												<button type="button" class="btn btn-success btn-sm" onclick="isDelete()">
													삭제
												</button>
											</c:if>
												<button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Board.do?nowPage=${param.nowPage}"/>';">
													목록
												</button>
										</div>
									</div>	
											
									</a>
								</li>
							</ul>
							
						</div><!-- messages-inbox -->
					</div><!-- messages-container -->
	
				</div>
		
       </div><!-- row -->
       </div><!-- dashboard -->
       </div><!-- container -->
</div> 
</div><!-- adfdasf -->

        

<script>
	function isDelete() {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			location.replace("<c:url value='/Team/Matching/Delete.do?no=${record.no}&nowPage=${param.nowPage}'/>");
		}
	}
	function fnMovePage() {
		$('#form').submit();
	}
</script>
