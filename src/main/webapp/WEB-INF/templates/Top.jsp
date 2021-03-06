<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  <!-- main jquery library js file -->
  <script src="<c:url value='/assets/js/jquery-3.3.1.min.js'/>"></script>
  <!-- bootstrap js file -->
  <script src="<c:url value='/assets/js/bootstrap.min.js'/>"></script>
  <!-- slick slider js file -->
  <script src="<c:url value='/assets/js/slick.min.js'/>"></script>
  <!-- lightcase js file -->
  <script src="<c:url value='/assets/js/lightcase.js'/>"></script>
  <!-- wow js file -->
  <script src="<c:url value='/assets/js/wow.min.js'/>"></script>
  <!-- tweenmax js file -->
  <script src='<c:url value='/assets/js/TweenMax.min.js'/>'></script>
  <!-- main js file -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>
  <!-- postcode.v2 -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- Alert UI -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <style>
  	/* #equal {
  		margin-left: 5%;
  	} */
  	
  	#topLogo {
  		height: 150px !important;
  	}
  </style>
  
<!-- preloader start -->
  <div id="preloader"></div>
  <!-- preloader end -->

  <div class="custom-cursor"></div>
  <!--  header-section start  -->
  <header class="header-section">
    <div class="header-bottom">
      <div class="container">
      
        <nav id="equal" class="navbar navbar-expand-lg">
          <a class="site-logo site-title" href="<c:url value='/Team/Member/Index.do'/>"><img id="topLogo" src="<c:url value='/assets/images/logo2.png'/>" alt="site-logo"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="menu-toggle"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav main-menu">
              <li><a href="<c:url value='/Team/Matching/Matching.do'/>">Matching</a></li>
              <li><a href="<c:url value='/Team/Matching/Betting.do'/>">Betting</a></li>
              <li><a href="<c:url value='/Team/Matching/Team.do'/>">Team</a></li>              
              <li><a href="<c:url value='/Team/Matching/statostics.do'/>">Personal</a></li>
              <li><a href="<c:url value='/Team/Matching/result.do'/>">Live</a></li>
              <li><a href="<c:url value='/Team/Matching/chat-ws.do'/>">Basketball</a>
              <li class="menu_has_children"><a href="#0">Community</a>              
                <ul class="sub-menu">                 
                  <li><a href="<c:url value='/Team/Matching/Board.do'/>">자유게시판</a></li>                
                   <li><a href="<c:url value='/Team/Matching/contact.do'/>">Q&A</a></li>  
                   <li><a href="<c:url value='/Team/Matching/Notice.do'/>">공지사항</a></li>                  
                </ul>
              </li>
              <li class="menu_has_children"><a href="#0">pages</a>
              
                <ul class="sub-menu">
               <%--    <li><a href="<c:url value='/Team/Matching/about.do'/>">About us</a></li> --%>
                  <li><a href="<c:url value='/Team/Matching/createTeam.do'/>">Create Team</a></li>
                  <li><a href="<c:url value='/Team/Matching/searchTeam.do'/>">Search Team</a></li>
                  <li><a href="<c:url value='/Team/Matching/gameSchedule.do'/>">Game Schedule</a></li>
                  <%-- <li><a href="<c:url value='/Team/Matching/service.do'/>">Services</a></li> --%>
                  <sec:authorize access="isAnonymous()"> 
                 		<li><a href="<c:url value='/Team/Matching/Register.do'/>">Registration</a></li>
                 </sec:authorize>
                
                  <%-- <li><a href="<c:url value='/Team/Matching/Privacy.do'/>">Privacy</a></li>
                  <li><a href="<c:url value='/Team/Matching/Error.do'/>">ERROR Page</a></li>
                  <li><a href="<c:url value='/Team/fcm.do'/>">fcm</a></li> --%>
                </ul>
              </li>
              <sec:authorize access="isAnonymous()"> 
             		<li><a href="<c:url value='/Team/Matching/Login.do'/>">Login</a></li>
			</sec:authorize>
            <%--   <li class="menu_has_children"><a href="#0">blog</a>
                <ul class="sub-menu">
                  <li><a href="<c:url value='/Team/Matching/Blog.do'/>">Blog page</a></li>
                  <li><a href="<c:url value='/Team/Matching/blog-details.do'/>">blog single</a></li>
                  
                </ul>
              </li> --%>
             
              <sec:authorize access="isAuthenticated()">
					<li><a href="javascript:logout()">Logout</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="<c:url value='/Team/admin/AdminIndex.do'/>">setting</a></li>
				</sec:authorize>
            </ul>
          </div>
        </nav>
        <form id="logoutForm" method="post" action="<c:url value='/logout'/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		<script>
			//csrf사용시에만 아래 함수 필요
			function logout(){
				$('#logoutForm').submit();
			}
		</script>
      </div>
    </div><!-- header-bottom end -->
  </header>
  <!--  header-section end  -->


