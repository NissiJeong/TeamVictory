<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!-- banner-section start -->
  <section class="breadcum-section">
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
              <h3 class="title">Login</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">Login</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->

  <section class="login-section section-padding">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="login-block text-center">
            <div class="login-block-inner">
              <h3 class="title">login your account </h3>
              <c:if test="${! empty sessionScope.id }" var="isLogin">
				<div class="alert alert-success col-md-5">${sessionScope.id}님 즐감하세요</div>
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
              </c:if>
              <p><a href="#0">Haven't your any account in here?</a><a href="#0">Forget password?</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
