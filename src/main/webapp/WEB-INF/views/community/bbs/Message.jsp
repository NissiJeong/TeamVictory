<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>
	
	<c:when test="${WHERE=='EDT' }">
		<c:set var="successMsg" value="수정 성공했어요"/>
		<c:set var="failMsg" value="수정 실패했어요"/>
		<c:set var="successUrl" value="/Team/Matching/View.do?no=${param.no}&nowPage=${param.nowPage}"/>
	</c:when>
	<c:otherwise>
		<c:set var="successMsg" value="삭제 성공했어요"/>
		<c:set var="failMsg" value="삭제 실패했어요"/>
		<c:set var="successUrl" value="/Team/Matching/Board.do?nowPage=${param.nowPage}"/>	
	</c:otherwise>	
</c:choose>
<script>
	<c:choose>
		<c:when test="${SUCFAIL == 1 }">
			alert('${successMsg}');
			location.replace('<c:url value="${successUrl}"/>');
		</c:when>
		<c:when test="${SUCFAIL == 0 }">
			alert('${failMsg}');
			history.back();
		</c:when>
		
	</c:choose>
</script>

