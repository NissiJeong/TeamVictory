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

<%-- <c:forEach items="${auth}" var="item">
	<h2>${item }</h2>
</c:forEach> --%>

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
							<li><a href="<c:url value='/Team/Member/AdminIndex.do'/>">Home</a></li>
							<li><a href="<c:url value='/Team/Matching/Notice.do'/>">공 지 사 항</a></li>
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
								<%-- <c:if test="${empty list }" var="isEmpty">
									<p align="center">등록된 게시물이 없습니다</p>
								</c:if> --%>
								
								<%-- <c:if test="${!isEmpty }">
									<c:forEach var="item" items="${list }" varStatus="loop"> --%>
									
								<li class="unread">
								
								  <a ><%-- id="validate" href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage=${param.nowPage}'/>" --%>
									<%-- <c:out value='${param.nowPage}' default='5'/> --%>
									
									
									<%-- <div class="textout" data-rel=${totalRecordCount - (((nowPage -1) * pageSize)+ loop.index)}> --%>
									
										<div class="message-by">
											<div class="message-avatar">
												<img src="https://placeimg.com/50/50/people" alt="" />
											</div>
											
											<div class="message-by-headline">
												<span>작성일 ${record.postDate }</span>
												<p>글번호 ${record.no}</p>
												
												<h5>아이디 ${record.id }</h5>
												<%-- <i id="unread${totalRecordCount - (((nowPage -1) * pageSize)+ loop.index)}">Unread</i> --%>
												
												<span>조회수 ${record.countNo}</span>
												
												<h4>
													${record.title }
													<%-- <a href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item.title }</a> --%>
													<%-- <div onclick='location.href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage='/><c:out value='${param.nowPage}' default='1'/>"'>${item.title }</div> --%>
													<%-- <c:out value='${param.nowPage}' default='1'/>${item.title } --%>
												</h4>
											</div>
											<div id="text">
												${record.content}
											</div>
											
											<div id="btns">
												<c:if test="${id == record.id}">
													<%-- <button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Edit.do?no=${item.no}&nowPage=${param.nowPage }"/>';"> --%>
													<button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Edit.do?no=${record.no}&nowPage=${param.nowPage}"/>';">
														<%-- <a href="<c:url value='/Team/Matching/Edit.do?no=${item.no}'/>">수정</a> --%>
														수정
													</button>
													<%-- <button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Delete.do?no=${item.no}"/>'"> --%>
													<button type="button" class="btn btn-success btn-sm" onclick="isDelete()">
														삭제<!-- onclick="isDelete()" -->
													</button>
												</c:if>
													<%-- <button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Board.do?nowPage=${param.nowPage}"/>';"> --%>
													<button type="button" class="btn btn-success btn-sm" onclick="location.href='<c:url value="/Team/Matching/Notice.do?nowPage=${param.nowPage}"/>';">
														<%-- <a href="<c:url value='/Team/Matching/Board.do?nowPage=${param.nowPage}'/>">목록</a> --%>
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
			</div> <!-- row -->

		</div>
	</div><!-- container -->
	
</div><!-- dashboard -->
</div><!-- wrapper -->
<!-- 실제 내용 끝 --> 

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
