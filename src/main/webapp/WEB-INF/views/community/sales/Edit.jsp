<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 실제 내용 시작 -->
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			자유 게시판<small>수정 페이지</small>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/community/bbs/Edit.bbs'/>">
				<input type="hidden" name="no" value="${record.no}" />
				<div class="form-group">
					<label class="col-md-2 control-label">제목</label>
					<div class="col-md-5">
						<input type="text" value="${record.title }" class="form-control"
							name="title" id="title" placeholder="제목을 입력하세요" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-2 control-label">내용</label>
					<div class="col-md-5">
						<textarea rows="10" name="content" id="content"
							class="form-control" placeholder="내용을 입력하세요">${record.content}</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-2 col-md-10">
						<button type="submit" class="btn btn-info">수정</button>
					</div>

				</div>
			</form>
		</div>
	</div>
	<!-- row -->
</div>
<!-- container -->
<!-- 실제 내용 끝 -->