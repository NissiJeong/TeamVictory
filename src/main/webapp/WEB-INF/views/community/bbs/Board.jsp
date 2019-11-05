<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.authorities" var="auth"/>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
.w-1 {
	width: 80px;
	text-align:center;
	border: 1px solid #333333;
}

.w-2 {
	width: 1600px;
	border: 1px solid #333333;
}

.w-3 {
	width: 200px;
	text-align:center;
	border: 1px solid #333333;
}

.w-4 {
	width: 250px;
	text-align:center;
	border: 1px solid #40A940;
}
.w-5 {
	width: 150px;
	text-align:center;
	border: 1px solid #40A940;
}
</style>
<section>
	<div class="container" style="border: blue 1px solid">

		<div class="row">
			<div class="col-md-12">

				<div class="d-flex bg-light justify-content-center pt-5 w-100"
					style="height: 120px">
					<div style="font-size: 40px">자유게시판</div>

				</div>

			</div>
		</div>
		<!-- row -->
		<div class="row" style="margin-bottom: 10px">
				<div class="col-md-12 text-right">
					<a href="<c:url value='/Team/Matching/Write.do'/>"
						class="btn btn-success">글쓰기</a>
				</div>
			</div>



		<div class="row">
			<div class="table-responsive col-md-12 ml-0">
				
				<table class="table table-bordered" class="A_tableMatchTen">

					<thead>
						<tr class="text-center" style="background-color: #1E82CD">

							<th class="w-1">번호</th>
							<th class="w-2">제목</th>
							<th class="w-3">작성자</th>
							<th class="w-4">작성일</th>
							<th class="w-5">조회수</th>
						</tr>
					</thead>

					<c:if test="${empty list }" var="isEmpty">
						<tr align="center">
							<td colspan="5" align="center">등록된 게시물이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${!isEmpty }">
						<c:forEach var="item" items="${list }" varStatus="loop">
							<tr>
								<td class="w-1">${totalRecordCount - (((nowPage -1) * pageSize)+ loop.index)}</td>
								<td class="text-left"><a
									href="<c:url value='/Team/Matching/View.do?no=${item.no }&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item.title }</a>

								</td>
								<td  class="w-3">${item.id }</td>
								<td  class="w-4">${item.postDate }</td>
								<td  class="w-5">${item.countNo }</td>								
							</tr>
						</c:forEach>
					</c:if>


				</table>
			</div>
			
		</div>
		<!-- 페이징 -->
		<div align="center">
			<div class="col-md-2" align="center">${pagingString}</div>
		</div>
		<!-- 검색용 UI -->
		<div class="row">
			<div class="text-center">
				<form class="form-inline" method="post"
					action="<c:url value='/Team/Matching/Board.do?${_csrf.parameterName}=${_csrf.token}'/>">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="form-group"
						style="margin-bottom: 20px; margin-left: 20px">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="form-group" style="margin-bottom: 20px">
						<input type="text" name="searchWord" class="form-control" />
					</div>

					<button type="submit" class="btn btn-primary"
						style="margin-bottom: 20px">검색</button>


				</form>
			</div>
		</div>

	</div>
</section>