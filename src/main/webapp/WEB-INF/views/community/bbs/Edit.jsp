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

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<link href="<c:url value='/assets/css/bootstrap.css'/>" rel="stylesheet" >
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<!-- include summernote-ko-KR -->
<!-- <script src="/WEB-INF/views/community/bbs/dist/lang/summernote-ko-KR.js"></script> -->

<%-- <c:forEach items="${auth}" var="item">
	<h2>${item }</h2>
</c:forEach> --%>
<style>
	#headtitle { 
		font-weight: bold;
	}
	
	#postBtn {
		text-align: right;
		padding-right: 60px;
	}
	
	#contentBox {
    	word-break:break-all;
		overflow:hidden;
		width : 900px;
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
	
					<h2 id="headtitle">등 록</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="<c:url value='/Team/Member/Index.do'/>">Home</a></li>
							<li><a href="<c:url value='/Team/Matching/Board.do'/>">BBS</a></li>
							<li>수 정</li>
						</ul>
					</nav>
				</div>
			</div><!-- row -->
			</div><!-- title -->
	
			<div class="row">
				<div class="col-lg-12 col-md-12">
	
					<div class="messages-container margin-top-0">
						<div class="messages-headline">
							<h4>수 정</h4>
						</div>
						
						<div class="messages-inbox">
	
							<ul>
								<li class="unread">
								  <a>
								  
									<div class="row">
										<div class="message-by">
									      	<div class="message-avatar">
												<img src="https://placeimg.com/100/100/people" alt="" />
											</div>
									      
									         <form class="form-horizontal" method="post"
									            action="<c:url value='/Team/Matching/Edit.do?nowPage=${param.nowPage }'/>">
									            <div class="form-group">
											    	<div class="col-md-2 control-label">작성자</div>
											    	<div class="col-md-6">${record.id}</div>
											    </div>
									            
									            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									            <input type="hidden" name="no" value="${record.no}" />
									            <div class="form-group">
									               <div class="col-md-2 control-label">제목</div>
									               <div class="col-md-10">
									                  <input value="${record.title }" type="text" class="form-control" name="title" id="title"
									                     placeholder="제목을 입력하세요" />
									               </div>
									            </div>
									            
									            <div class="form-group" id="contentBox">
									               <div class="col-md-2 control-label">내용</div>
									               <div class="col-md-10">
									                  <textarea rows="10" name="content" id="content" 
									                     class="summernote" placeholder="내용을 입력하세요">${record.content}</textarea>
									               </div>
									            </div>
									         
									            <div class="form-group">
									               	<div id="postBtn" class="col-md-12">
									                  <button type="submit" class="btn btn-info btn-lg">수  정</button>
									                </div>
									            </div>
									         </form>
										</div><!-- mb -->
									</div><!-- ROW -->
											
									</a>
								</li>
							</ul>
							
						</div><!-- messages-inbox -->
					</div><!-- messages-container -->
	
				</div>
			</div> <!-- row -->

		</div>
	</div><!-- container -->
	
</div><!-- dashboard -->
</div><!-- wrapper -->
<!-- 실제 내용 끝 -->

<script>
$(function() {
     $('.summernote').summernote({
      height:400,
      lang: 'ko-KR'
     })
   });
</script>

