<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="shortcut icon" type="image/png" href="assets/images/favicon.jpg"/>
  <title>Butlar - Sports Betting HTML Template</title>
  <link rel="stylesheet" href="assets/css/fontawesome.min.css">
  <link rel="stylesheet" href="assets/css/flaticon.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/animate.css">
  <link rel="stylesheet" href="assets/css/slick.css">
  <link rel="stylesheet" href="assets/css/lightcase.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <!-- responsive css file -->
  <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body>

  <!-- preloader start -->
  <div id="preloader"></div>
  <!-- preloader end -->

  <div class="custom-cursor"></div>
  <!-- error-section start -->
  <section class="error-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="error-content text-center">
            <div class="parallax-container">
              <div class="error-image"><img src="<c:url value='assets/images/404.png'/>" alt=""/></div>
            </div>
            <h4 class="title">Opps! Page not found</h4>
            <p>The page you are looking is not available or has been removed.</p>
            <a href="index.html" class="cmn-btn btn-lg">Back to Home</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- error-section end -->

  <!-- main jquery library js file -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <!-- bootstrap js file -->
  <script src="assets/js/bootstrap.min.js"></script>
  <!-- slick slider js file -->
  <script src="assets/js/slick.min.js"></script>
  <!-- lightcase js file -->
  <script src="assets/js/lightcase.js"></script>
  <!-- wow js file -->
  <script src="assets/js/wow.min.js"></script>
  <!-- tweenmax js file -->
  <script src='assets/js/TweenMax.min.js'></script>
  <!-- main js file -->
  <script src="assets/js/main.js"></script>
</body>
</html>