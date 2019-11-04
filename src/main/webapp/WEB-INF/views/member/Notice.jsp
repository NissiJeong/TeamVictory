<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function () {
	// Hide all elements which id starts with text.
	$("[id^=text]").hide();

	$(".textout").click(function () {
	$("#text" + $(this).data("rel")).toggle();
	});
});
</script>


<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="<c:url value='/assets/css/noti-stylet.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/noti-main-color.css'/>" id="colors">



<!-- Wrapper -->
<div id="wrapper">

<!-- Dashboard -->
<div id="dashboard">


<!-- Content
================================================== -->
<div class="container">
	<div class="dashboard-content">

		<!-- Titlebar -->
		<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
					<h2>공 지 사 항</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="<c:url value='/Team/Member/Index.do'/>">Home</a></li>
							<li>Notice</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="row">
			
			<!-- Listings -->
			<div class="col-lg-12 col-md-12">

				<div class="messages-container margin-top-0">
					<div class="messages-headline">
						<h4>Inbox</h4>
					</div>
					
					<div class="messages-inbox">

						<ul>
							<li class="unread">
								<a href="#none">
									<div class="message-avatar">
										<img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" />
									</div>
									<div class="textout" data-rel="1">
										<div class="message-by">
											<div class="message-by-headline">
												<p>글번호</p>
												<h5>Kathy Brown <i>Unread</i></h5>
												<span>2 hours ago</span>
												
											</div>
											<p>
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus posuere
											ultricies...
											</p>
										
											<p>
											<div id="text1">
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus et erat. Nam
											posuere tristique sem, eu ultricies tortor lacinia neque
											imperdiet vitae...
											</div>
											</p>
										</div>
									</div>
								</a>
							</li>

							<li class="unread">
								<a href="#none">
									<div class="message-avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
									<div class="textout" data-rel="2">
									<div class="message-by">
										<div class="message-by-headline">
										<p>글번호</p>
											<h5>John Doe <i>Unread</i></h5>
											<span>4 hours ago</span>
										</div>
										<p>
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus posuere
											ultricies...
										</p>
										
										<p>
											<div id="text2">
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus et erat. Nam
											posuere tristique sem, eu ultricies tortor lacinia neque
											imperdiet vitae...
											</div>
										</p>
									</div>
									</div>
								</a>
							</li>
							
							<li>
								<a href="#none">
									<div class="message-avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
									<div class="textout" data-rel="3">
									<div class="message-by">
										<div class="message-by-headline">
										<p>글번호</p>
											<h5>Thomas Smith</h5>
											<span>Yesterday</span>
										</div>
										<p>
											
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus posuere
											ultricies...
											
											</p>
										
											<p>
											<div id="text3">
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus et erat. Nam
											posuere tristique sem, eu ultricies tortor lacinia neque
											imperdiet vitae...
											</div>
										</p>
									</div>
									</div>
								</a>
							</li>

							<li>
								<a href="#none">
									<div class="message-avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
									<div class="textout" data-rel="4">
									<div class="message-by">
										<div class="message-by-headline">
										<p>글번호</p>
											<h5>Mike Behringer</h5>
											<span>28.06.2017</span>
										</div>
										
											<p>
												Hello, I want to talk about your great listing! Morbi
												velit eros, sagittis in facilisis non, rhoncus posuere
												ultricies...
											</p>
										
											<p>
												<div id="text4">
												Hello, I want to talk about your great listing! Morbi
												velit eros, sagittis in facilisis non, rhoncus et erat. Nam
												posuere tristique sem, eu ultricies tortor lacinia neque
												imperdiet vitae...
												</div>
											</p>
										</div>
									</div>
								</a>
							</li>

							<li>
								<a href="#none">
									<div class="message-avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
									<div class="textout" data-rel="5">
									<div class="message-by">
										<div class="message-by-headline">
										<p>글번호</p>
											<h5>Robert Baker</h5>
											<span>22.06.2017</span>
										</div>
										<p>
											
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus posuere
											ultricies...
											
											</p>
										
											<p>
											<div id="text5">
											Hello, I want to talk about your great listing! Morbi
											velit eros, sagittis in facilisis non, rhoncus et erat. Nam
											posuere tristique sem, eu ultricies tortor lacinia neque
											imperdiet vitae...
											</div>
										</p>
									</div>
									</div>
								</a>
							</li>
						</ul>
						
					</div><!-- messages-inbox -->
				</div><!-- messages-container -->

				<!-- Pagination -->
				<div class="clearfix"></div>
				<div class="pagination-container margin-top-30 margin-bottom-0">
					<nav class="pagination">
						<ul>
							<li><a href="#" class="current-page">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li>
						</ul>
					</nav>
				</div>
				<!-- Pagination / End -->

			</div>

			<!-- Copyrights -->
			<div class="col-md-12">
				<div class="copyrights">© 2017 Listeo. All Rights Reserved.</div>
			</div>
		</div><!-- row -->

	</div><!-- dashboard-content -->
	<!-- Content / End -->
</div><!-- container -->

</div>
<!-- Dashboard / End -->


</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<!-- <script type="text/javascript" src="scripts/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery-migrate-3.1.0.min.js"></script>
<script type="text/javascript" src="scripts/mmenu.min.js"></script>
<script type="text/javascript" src="scripts/chosen.min.js"></script>
<script type="text/javascript" src="scripts/slick.min.js"></script>
<script type="text/javascript" src="scripts/rangeslider.min.js"></script>
<script type="text/javascript" src="scripts/magnific-popup.min.js"></script>
<script type="text/javascript" src="scripts/waypoints.min.js"></script>
<script type="text/javascript" src="scripts/counterup.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="scripts/tooltips.min.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script> -->


