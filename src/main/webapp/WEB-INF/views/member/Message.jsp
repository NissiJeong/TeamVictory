<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:set var="id1" value="${id }"/>
<script>
	<c:choose>
		<c:when test="${SUCFAIL == 1 }">
			alert('팀 생성이 완료되었습니다');
			location.replace('<c:url value="/Team/Matching/Team.do?id=${id1}"/>');
		</c:when>
		<c:when test="${SUCFAIL == 0 }">
			alert('팀 생성이 실패했습니다');
			history.back();
		</c:when>
	</c:choose>
</script>

