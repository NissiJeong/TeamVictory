<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
.w-1 {
	width: 80px;
	border: 1px solid #333333;
}

.w-2 {
	width: 1800px;
	border: 1px solid #333333;
}

.w-3 {
	width: 200px;
	border: 1px solid #333333;
}

.w-4 {
	width: 250px;
	border: 1px solid #333333;
}
</style>
<section>
	<div class="container" style="border: blue 1px solid">

		<div class="row">
			<div class="col-md-12">

				<div class="d-flex bg-light justify-content-center pt-4 w-100"
					style="height: 150px">
					<div style="font-size: 40px">자유게시판</div>

				</div>

			</div>
		</div>
		<!-- row -->




		<div class="row">
			<div class="table-responsive col-md-12 ml-0">
				<!--  A팀 테이블 -->
				<table class="table table-bordered" class="A_tableMatchTen">
					<thead>
						<div class="row" style="margin-bottom: 10px">
							<div class="col-md-12 text-right">
								<a href="<c:url value='/BBS/Write.bbs'/>"
									class="btn btn-success">등록</a>
							</div>
						</div>

						<tr class="text-center">

							<th class="w-1">번호</th>
							<th class="w-2">내용</th>
							<th class="w-3">작성자</th>
							<th class="w-4">작성일</th>
						</tr>
					</thead>

					<tbody>
						<tr class="text-center">
							<td>9</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>8</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>7</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>6</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>5</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>4</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>3</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>2</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>
						<tr class="text-center">
							<td>1</td>
							<td>예시</td>
							<td>가길동</td>
							<td>2019-10-23</td>
						</tr>



					</tbody>

				</table>
				<div class="row">
					<div class="text-center">
						<form class="form-inline" method="post"
							action="<c:url value='/ReplyBBS/BBS/List.bbs'/>">
							<div class="form-group">
								<select name="searchColumn" class="form-control">
									<option value="title">제목</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" name="searchWord" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">검색</button>

						</form>
					</div>
				</div>
			</div>
	</div>		
</section>