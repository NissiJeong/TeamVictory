<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->

<script>
	/* function isMember(page){
		$.ajax({
			url:"<c:url value='/OneMemo/Auth/IsMember.bbs'/>",
			dataType:'text',
			success:function(data){
				console.log('서버 데이터:',data);
				if(data!==""){
					alert(data);
					location.replace("<c:url value='/OneMemo/Auth/login.bbs'/>");
				}
				else{
					location.replace("<c:url value='/OneMemo/BBS/"+page+"'/>");
				}
			},
			error:function(e){console.log(e)}
		});
	} */
</script>
<div class="footer text-center">© 2019 Copyright:
    <a href="#"> 한국소프트웨어 인재 개발원</a>
</div>