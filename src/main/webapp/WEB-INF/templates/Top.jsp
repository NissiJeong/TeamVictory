<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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


<!-- preloader start -->
  <div id="preloader"></div>
  <!-- preloader end -->

  <div class="custom-cursor"></div>
  <!--  header-section start  -->
  <header class="header-section">
    <div class="header-bottom">
      <div class="container">
        <nav class="navbar navbar-expand-lg">
          <a class="site-logo site-title" href="#"><img src="<c:url value='/assets/images/logo.png'/>" alt="site-logo"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="menu-toggle"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav main-menu ml-auto">
              <li class="active"><a href="<c:url value='/Team/Member/Index.do'/>">Home</a></li>
              <li><a href="<c:url value='/Team/Matching/Matching.do'/>">Matching</a></li>
              <li><a href="<c:url value='/Team/Matching/Betting.do'/>">Betting</a></li>
              <li><a href="<c:url value='/Team/Matching/Team.do'/>">Team</a></li>
              <li><a href="<c:url value='/Team/Matching/statostics.do'/>">Personal</a></li>
              <li><a href="<c:url value='/Team/Matching/result.do'/>">Live</a></li>
              <li><a href="<c:url value='/chat-ws.do'/>">Basketball</a>
              <li class="menu_has_children"><a href="#0">pages</a>
                <ul class="sub-menu">
                  <li><a href="<c:url value='/Team/Matching/about.do'/>">About us</a></li>
                  <li><a href="<c:url value='/Team/Matching/service.do'/>">Services</a></li>
                  <li><a href="<c:url value='/Team/Matching/Login.do'/>">Login</a></li>
                  <li><a href="<c:url value='/Team/Matching/Register.do'/>">Registration</a></li>
                  <li><a href="<c:url value='/Team/Matching/FAQ.do'/>">FAQ</a></li>
                  <li><a href="<c:url value='/Team/Matching/Privacy.do'/>">Privacy</a></li>
                  <li><a href="<c:url value='/Team/Matching/Error.do'/>">ERROR Page</a></li>
                </ul>
              </li>
              <li class="menu_has_children"><a href="#0">blog</a>
                <ul class="sub-menu">
                  <li><a href="<c:url value='/Team/Matching/Blog.do'/>">Blog page</a></li>
                  <li><a href="<c:url value='/Team/Matching/blog-details.do'/>">blog single</a></li>
                </ul>
              </li>
              <li><a href="contact.html">contact us</a></li>
            </ul>
          </div>
        </nav>
      </div>
    </div><!-- header-bottom end -->
  </header>
  <!--  header-section end  -->


