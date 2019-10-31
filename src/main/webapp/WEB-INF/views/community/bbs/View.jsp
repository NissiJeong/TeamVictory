<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	<!-- 실제 내용 시작 -->
    <div class="container">
    	<!-- 점보트론(Jumbotron) -->
    	<div class="jumbotron">
    		<h1>자유 게시판<small>상세보기 페이지</small></h1>
    	</div>
    	<div class="row">
    		<div class="col-md-offset-2 col-md-6">
    			<table class="table table-bordered table-striped">
    				<tr>
    					<th class="w-1;col-md-2 text-center">번호</th>
    					<td>${record.no}</td>
    				</tr>
    				<tr>
    					<th class="text-center">제목</th>
    					<td>${record.title}</td>
    				</tr>
    				<tr>
    					<th class="text-center">작성자</th>
    					<td>${record.name}</td>
    				</tr>    				
    				<tr>
    					<th class="text-center">등록일</th>
    					<td>${record.postDate}</td>
    				</tr>
    				<tr>
    					<th class="text-center" colspan="2">내용</th>    					
    				</tr>
    				<tr>
    					<td colspan="2">${record.content}</td>    					
    				</tr>    			
    			</table>
    		</div>    	
    	</div><!-- row --> 
    	<div class="row">
    		<div class="col-md-offset-2 col-md-8">
    			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
    			<ul id="pillMenu" class="nav nav-pills center-block" style="width:280px">    				
    				<c:if test="${sessionScope.id == record.id }">
    					<li><a class="btn btn-success" href="<c:url value='/Team/Matching/Edit.do?no=${record.no}'/>" >수정</a></li>    				
    					<li><a class="btn btn-success" href="javascript:isDelete()" >삭제</a></li>
    				</c:if>    				
    				<li><a class="btn btn-success" href="<c:url value='/Team/Matching/Board.do?nowPage=${param.nowPage}'/>">목록</a></li>
    			</ul>   		
    		</div>
    	</div><!-- row --> 
    	
    	   	
    </div><!-- container -->
    
	<!-- 실제 내용 끝 -->    
   	<!-- 답변폼으로 이동을 POST방식으로 전송하기 -->
   	<form id="form" method="post" action="<c:url value='/Team/Matching/ReplyForm.do'/>">
   		<input type="hidden" name="no" value="${record.no}"/>
   	</form>
   	<script>
   		function isDelete(){
   			if(confirm("정말로 삭제 하시겠습니까?")){
   				location.replace("<c:url value='/Team/Matching/Delete.do?no=${record.no}'/>");
   			}
   		}
   		function fnMovePage(){
   			$('#form').submit();
   		}   	
   	</script>
 