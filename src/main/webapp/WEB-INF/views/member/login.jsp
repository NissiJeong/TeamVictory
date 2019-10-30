<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

  

  <section class="login-section section-padding">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="login-block text-center">
            <div class="login-block-inner">
              
              <%-- <c:if test="${! empty sessionScope.id }" var="isLogin">
				<div class="alert alert-success col-md-5">${sessionScope.id}님 즐감하세요</div>
				<form class="cmn-form login-form" action="<c:url value='/Team/Matching/Logout.do'/>">
					<button type="submit" class="submit-btn">Sign out</button>
				</form>
			</c:if>
			<c:if test="${not isLogin}">
              <form class="cmn-form login-form" action="<c:url value='/Team/Matching/IsMember.do'/>">
              
                <div class="frm-group">
                  <input type="text" name="id" id="f-name" placeholder="Your Name">
                </div>
                <div class="frm-group">
                  <input type="password" name="pwd" id="pass" placeholder="Your Password">
                </div>
                <div class="frm-group">
                  <button type="submit" class="submit-btn">Sign In</button>
                </div>
                <span>${NotMember }</span>
                
              </form>
              </c:if> --%>
              <sec:authorize access="isAuthenticated()"> 
              	<form class="cmn-form login-form" method="post" action="<c:url value='/logout'/>">
              		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button type="submit" class="submit-btn">Sign out</button>
				</form>
              </sec:authorize>
              <sec:authorize access="isAnonymous()">
              	<h3 class="title">login your account </h3>
              	<form class="cmn-form login-form" method="post" action="<c:url value='/Team/Matching/IsMember.do'/>">
              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="frm-group">
                  <input type="text" name="id" id="f-name" placeholder="Your Name">
                </div>
                <div class="frm-group">
                  <input type="password" name="pwd" id="pass" placeholder="Your Password">
                </div>
                <div class="frm-group">
                  <button type="submit" class="submit-btn">Sign In</button>
                </div>
                <span>${NotMember }</span>
                
              </form>
              </sec:authorize>
              <p><a href="#0">Haven't your any account in here?</a><a href="#0">Forget password?</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
