<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->

 <!-- footer-section start -->
  <footer class="footer-section">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-sm-6">
            <div class="footer-widget widget-about">
              <a class="logo"><img src="<c:url value='/assets/images/logo2.png'/>" alt="image"/></a>
              <ul class="address-list">
                <li>9288 Peninsula Court Meriden, CT 06450</li>
                <li>demo@demomail.com</li>
                <li>+01-1234-9876</li>
              </ul>
              <ul class="social-links d-flex">
                <li><a href="#0"><i class=" fa fa-facebook-f"></i></a></li>
                <li><a href="#0"><i class=" fa fa-twitter"></i></a></li>
                <li><a href="#0"><i class=" fa fa-youtube"></i></a></li>
                <li><a href="#0"><i class=" fa fa-dribbble"></i></a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-sm-6">
            <div class="footer-widget widget-menu">
              <h3 class="widget-title">Menu</h3>
              <ul class="menu-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">Sports</a></li>
                <li><a href="#">In-play</a></li>
                <li><a href="#">Promotions</a></li>
                <li><a href="#">Statisti</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2 col-sm-6">
            <div class="footer-widget widget-menu">
              <h3 class="widget-title">Menu</h3>
              <ul class="menu-links">
                <li><a href="#">About Us</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Blog Details</a></li>
                <li><a href="#">Service</a></li>
                <li><a href="#">Contact us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-5 col-sm-6">
            <div class="footer-widget widget-subscribe">
              <h3 class="widget-title">subscribe</h3>
              <div class="widget-subscribe-body">
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <form class="subscribe-form">
                  <input type="email" name="subs-email" id="subs-email" class="subs-email" placeholder="Email Address">
                  <input type="submit" value="Subscribe" class="sub-btn">
                </form>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div><!-- footer-top end -->
    <div class="footer-bottom text-center">
      <div class="container">
        <p>2019 All Rights Reserved. - Created by <a href="index.html">Butlar</a></p>
      </div>
    </div>
  </footer>
  <!-- footer-section end -->

  <!-- scroll-to-top start -->
  <a href="#"><div class="scroll-to-top">
    <span class="scroll-icon">
      <i class="fa fa-angle-up"></i>
    </span>
  </div></a>
  <!-- scroll-to-top end -->