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

<style>

.WriteBtn{
	margin-top: 10px; 
	text-align: right;
	float:right;
}

.form-group-search{
	margin-top: 10px;
}

.form-group-search select {
	height: 50px;
}

#searchBtn{
	margin-bottom: 17px;
}

#btns {
	margin-top: 10px;
}

#page {
	text-align: center;
}

#linkTitle {
	color: 	#191970;
}

#linkTitle div {
	cursor : pointer;
}

</style>


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
	
					<h2>자 유 게 시 판</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="<c:url value='/Team/Member/Index.do'/>">Home</a></li>
							<li>BBS</li>
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
								<c:if test="${empty list }" var="isEmpty">
									<p align="center">등록된 게시물이 없습니다</p>
								</c:if>
								
								<c:if test="${!isEmpty }">
									<c:forEach var="item" items="${list }" varStatus="loop">
									
									<li class="unread">
									
									  <a ><%-- id="validate" href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage=${param.nowPage}'/>" --%>
										<%-- <c:out value='${param.nowPage}' default='5'/> --%>
										<div class="message-avatar">
											<img src="https://placeimg.com/50/50/people" alt="" />
										</div>
										
										<%-- <div class="textout" data-rel=${totalRecordCount - (((nowPage -1) * pageSize)+ loop.index)}> --%>
										
											<div class="message-by">
												<div class="message-by-headline">
													<span>작성일 ${item.postDate }</span>
													<p>글번호 ${item.no}</p>
													   
													
													<h5>아이디 ${item.id }</h5>
													<%-- <i id="unread${totalRecordCount - (((nowPage -1) * pageSize)+ loop.index)}">Unread</i> --%>
													
													<span>조회수 ${item.count}</span>
													
													<h4 id="linkTitle">
														<%-- <a href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item.title }</a> --%>
														<div onclick='location.href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage='/><c:out value='${nowPage}' default='1'/>"'>${item.title }</div>
														<%-- <c:out value='${param.nowPage}' default='1'/>${item.title } --%>
													</h4>
												</div>
											</div>	
											
										<!-- </div>textout -->
										
										</a>
									</li>
								</c:forEach>
							</c:if>
								
						</ul>
							
						</div><!-- messages-inbox -->
					</div><!-- messages-container -->
	
				</div>
				
			</div> <!-- row -->
			
			<!-- 검색용 UI -->
			<div class="row">
				<div class="col-md-10">
				<div class="text-center">
					<form class="form-inline" method="post"
						action="<c:url value='/Team/Matching/Board.do?${_csrf.parameterName}=${_csrf.token}'/>">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group-search">
							<select name="searchColumn" class="form-control">
								<option value="title">제목</option>
								<option value="id">작성자</option>
								<option value="content">내용</option>
							</select>
							<input type="text" name="searchWord" class="form-control" />
							<button id="searchBtn" type="submit" class="btn btn-primary btn-lg">검색</button>
						</div>
					</form>
				</div>	
				
				</div>
						
				<!-- Write -->
				<div class="col-md-2 WriteBtn">
					<a href="<c:url value='/Team/Matching/Write.do?id=${item.id}'/>" class="btn btn-info">글쓰기</a>
				</div>
			
			</div><!-- search row -->
					
				<!-- Pagination -->
				<div id="page" class="row">
					<div class="col-md-12">
						<div class="paging-container margin-top-30 margin-bottom-0">
							<nav class="paging">
								<ul>
									<li>${pagingString}</li>
									<!-- <li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li> -->
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<!-- Pagination / End -->

			</div><!-- dashboard-content -->
		</div><!-- cont -->
	</div><!-- dash -->
</div><!-- wrap -->
<!-- END -->