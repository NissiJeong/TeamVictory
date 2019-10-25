<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  	<!-- 실제 내용 시작 -->
    <div class="container">
    	<!-- 점보트론(Jumbotron) -->
    	<div class="jumbotron">
    		<h1>자유 게시판<small>상세보기 페이지</small></h1>
    	</div>
    	<div class="row">
    		<div class="col-md-offset-2 col-md-8">
    			<table class="table table-bordered table-striped">
    				<tr>
    					<th class="col-md-2 text-center">번호</th>
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
    				<li><a class="btn btn-success" href="javascript:fnMovePage()" >답변</a></li>
    				<c:if test="${sessionScope.id == record.id }">
    					<li><a class="btn btn-success" href="<c:url value='/community/bbs/Edit.bbs?no=${record.no}'/>" >수정</a></li>    				
    					<li><a class="btn btn-success" href="javascript:isDelete()" >삭제</a></li>
    				</c:if>
    				
    				<li><a class="btn btn-success" href="<c:url value='/community/bbs/Board.bbs?nowPage=${param.nowPage}'/>">목록</a></li>
    			</ul>   		
    		</div>
    	</div><!-- row --> 
    	
    	   	
    </div><!-- container -->
    
	<!-- 실제 내용 끝 -->    
   	<!-- 답변폼으로 이동을 POST방식으로 전송하기 -->
   	<form id="form" method="post" action="<c:url value='/community/bbs/ReplyForm.bbs'/>">
   		<input type="hidden" name="no" value="${record.no}"/>
   	</form>
   	<script>
   		function isDelete(){
   			if(confirm("정말로 삭제 하시겠습니까?")){
   				location.replace("<c:url value='/community/bbs/Delete.bbs?no=${record.no}'/>");
   			}
   		}
   		function fnMovePage(){
   			$('#form').submit();
   		}   	
   	</script>
 