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
	width: 800px;
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
	width: 650px;
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
					<div style="font-size: 40px">문의게시판</div>

				</div>

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
							<th class="w-5">메일</th>
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
								<td class="w-1">${item.no }</td>
								<td class="text-left"><a
									href="<c:url value='/Team/Matching/Qview.do?no=${item.no }&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item.title }</a>

								</td>
								<td  class="w-3">${item.id }</td>
								<td  class="w-4">${item.postDate }</td>		
								<td  class="w-5">${item.mail }</td>
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
		
		
	</div>
</section>