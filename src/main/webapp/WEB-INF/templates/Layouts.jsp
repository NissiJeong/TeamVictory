<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="shortcut icon" type="image/png" href="<c:url value='/assets/images/favicon.jpg'/>"/>
  <title>Butlar - Sports Betting HTML Template</title>
  <!-- fontawesome css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css'/>">
  <!-- flat icon css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/flaticon.css'/>">
  <!-- bootstrap css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css'/>">
  <!-- animate css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/animate.css'/>">
  <!-- slick slider css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/slick.css'/>">
  <!-- lightcase css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/lightcase.css'/>">
  <!-- main style css link -->
  <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
  <!-- responsive css file -->
  <link rel="stylesheet" href="<c:url value='/assets/css/responsive.css'/>">
</head>
<body>
  		<!-- 탑 부분  -->
  		<tiles:insertAttribute name="Top"/>
  		<!-- 바디부분 -->
  		<tiles:insertAttribute name="Body"/>  
  		<div class="row">&nbsp;</div>		
  		<!-- 푸터 부분 -->
  		<tiles:insertAttribute name="Footer"/>
  </body>
</html>