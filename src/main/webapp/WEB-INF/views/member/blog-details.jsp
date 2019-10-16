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
              <h3 class="title">Blog details</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">blog details</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- banner-section end -->

  <!-- blog-details-section start -->
   <div class="row justify-content-center">
	        <div class="col-lg-6" style="padding-top: 100px">
	          <div class="section-header text-center">
	            <h2 class="section-title">Find the Team And Play Together!</h2>
	            <p>You can find other Other players And Play Together!</p>
	          </div>
	        </div>
	      </div>
  <section class="blog-details-section section-padding">
    <div class="container">
      <div class="row">
      	
        <div class="col-lg-8">
        	<ul style="padding-left: 10px">
          	<button class="btn btn-info">Location2</button>
         	<button class="btn btn-info">Location3</button>
          	<button class="btn btn-info">Location4</button>
          	<button class="btn btn-info">Location5</button>
           	<button class="btn btn-info">Location6</button>
            <button class="btn btn-info">Location7</button>
            <button class="btn btn-info">Location8</button>
            </ul>
          <div class="blog-details-wrapper">
          
					<div class="tab-pane fade show active" id="all" role="tabpanel"
						aria-labelledby="all-tab">
						
						<div class="play-table-part">
							
							<div class="play-table">
								<table class="table table-bordered" id="all-table">
									<thead id="th1">
										<tr>
											<th >번호</th>
											<th >방제목</th>
											<th >지역</th>
											<th>참여인원</th>
											<th>포지션</th>
											<th >상세보기</th>
										</tr>
									</thead>
									<!-- 테이블 데이터 시작  -->
									<tbody class="all-tbody">
										<!--  1행 -->
										<tr>
											<td>
												<!-- <div class="team-name-part"> </div> --> 1
											</td>
											<!-- 경기 날짜  -->
											<td><span bat="1">2019-10-10</span></td>
											<!--  팀 vs 팀  -->
											<td>기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp;
												: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
											</td>
											<!-- 경기결과 -->
											<td><span class="badge badge-primary">승</span></td>
											<!-- 비고 -->
											<td>우천</td>
											<!-- 배팅-->
											<td class="bettingTd"><span id="bettingSpan"
												class="badge badge-warning" data-toggle="modal"
												data-target="#myModal">배팅</span></td>
																				
										</tr>
										<!-- 1행끝 -->
										<!--  1행 -->
										<tr>
											<td>
												<!-- <div class="team-name-part"> </div> --> 1
											</td>
											<!-- 경기 날짜  -->
											<td><span bat="1">2019-10-10</span></td>
											<!--  팀 vs 팀  -->
											<td>기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp;
												: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
											</td>
											<!-- 경기결과 -->
											<td><span class="badge badge-primary">승</span></td>
											<!-- 비고 -->
											<td>우천</td>
											<!-- 배팅-->
											<td class="bettingTd"><span id="bettingSpan"
												class="badge badge-warning" data-toggle="modal"
												data-target="#myModal">배팅</span></td>
																				
										</tr>
										<!-- 1행끝 -->
										<tr>
											<!-- 번호 -->
											<td>2</td>
											<!-- 경기 날짜  -->
											<td><span bat="1">2019-10-10</span></td>
											<!--  팀 vs 팀  -->
											<td>SK&nbsp;&nbsp;<span class="blue">2</span>&nbsp;&nbsp;
												: &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp;롯데
											</td>
											<!-- 경기결과 -->
											<td><span class="badge badge-secondary">무</span></td>
											<!-- 비고 -->
											<td>기타</td>
											<td>
												<!-- 배팅-->
												<button type="button" class="btn btn-warning"
													style="height: 33px;" data-toggle="modal"
													data-target="#myModal">
													배팅 <span class="badge badge-secondary">15</span>
												</button>
											</td>
											
										</tr>
										<!-- 2행끝 -->
										<tr>
											<!-- 번호 -->
											<td>3</td>
											<!-- 경기 날짜  -->
											<td><span bat="1">2019-10-10</span></td>
											<!--  팀 vs 팀  -->
											<td>넥센&nbsp;&nbsp;<span class="blue"></span>&nbsp;&nbsp;
												: &nbsp;&nbsp;<span class="red"></span>&nbsp;&nbsp;한화
											</td>
											<!-- 경기결과 -->
											<td><span class="badge badge-secondary"></span></td>
											<!-- 비고 -->
											<td></td>
											<td>
												<!-- 배팅--> 배팅

											</td>
											
										</tr>
										<!-- 3행끝 -->
										<tr>
											<!-- 번호 -->
											<td>3</td>
											<!-- 경기 날짜  -->
											<td><span bat="1">2019-10-10</span></td>
											<!--  팀 vs 팀  -->
											<td>넥센&nbsp;&nbsp;<span class="blue"></span>&nbsp;&nbsp;
												: &nbsp;&nbsp;<span class="red"></span>&nbsp;&nbsp;한화
											</td>
											<!-- 경기결과 -->
											<td><span class="badge badge-secondary"></span></td>
											<!-- 비고 -->
											<td></td>
											<td>
												<!-- 배팅--> 배팅

											</td>
											
										</tr>
										<tr>
											<!-- 번호 -->
											<td>3</td>
											<!-- 경기 날짜  -->
											<td><span bat="1">2019-10-10</span></td>
											<!--  팀 vs 팀  -->
											<td>넥센&nbsp;&nbsp;<span class="blue"></span>&nbsp;&nbsp;
												: &nbsp;&nbsp;<span class="red"></span>&nbsp;&nbsp;한화
											</td>
											<!-- 경기결과 -->
											<td><span class="badge badge-secondary"></span></td>
											<!-- 비고 -->
											<td></td>
											<td>
												<!-- 배팅--> 배팅

											</td>
											
										</tr>
									</tbody>
								</table>
							</div>
							<!--  play-table end -->
						</div>
					</div>
					<!--  전체선택 끝  -->
				</div><!-- blog-details-wrapper end -->
          <div class="comment-area">
          
          </div><!-- comment-area end -->
          
        </div>
        <div class="col-lg-4">
          <div class="sidebar">
            <div class="widget widget-search">
              <form class="widget-search-form">
                <input type="search" name="search" id="widget-search" placeholder="Keyword">
                <button class="widget-search-btn"><i class="fa fa-search"></i></button>
              </form>
            </div><!-- widget end -->
            <div class="widget widget-categories">
              <h4 class="widget-title">category</h4>
              <ul>
                <li><a href="#0">football<span>(54)</span></a></li>
                <li><a href="#0">basball<span>(22)</span></a></li>
                <li><a href="#0">ludo<span>(33)</span></a></li>
                <li><a href="#0">powerball<span>(12)</span></a></li>
                <li><a href="#0">tenis<span>(05)</span></a></li>
              </ul>
            </div><!-- widget end -->
            <div class="widget widget-most-view-post">
              <h4 class="widget-title">Most Viewed Posts</h4>
              <ul class="small-post-list">
                <li>
                  <div class="small-post-item">
                    <div class="small-post-thumb">
                      <img src="<c:url value='/assets/images/blog/s1.jpg'/>" alt="image"/>
                    </div>
                    <div class="small-post-content">
                      <h6><a href="#0">Turn Your Bet Into A High Performing...</a></h6>
                      <ul class="post-meta">
                        <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
                      </ul>
                    </div>
                  </div>
                </li><!-- small-post-item end -->
                <li>
                  <div class="small-post-item">
                    <div class="small-post-thumb">
                      <img src="<c:url value='/assets/images/blog/s2.jpg" alt="image'/>"/>
                    </div>
                    <div class="small-post-content">
                      <h6><a href="#0">Turn Your Bet Into A High Performing...</a></h6>
                      <ul class="post-meta">
                        <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
                      </ul>
                    </div>
                  </div>
                </li><!-- small-post-item end -->
                <li>
                  <div class="small-post-item">
                    <div class="small-post-thumb">
                      <img src="<c:url value='/assets/images/blog/s3.jpg" alt="image'/>"/>
                    </div>
                    <div class="small-post-content">
                      <h6><a href="#0">Turn Your Bet Into A High Performing...</a></h6>
                      <ul class="post-meta">
                        <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
                      </ul>
                    </div>
                  </div>
                </li><!-- small-post-item end -->
                <li>
                  <div class="small-post-item">
                    <div class="small-post-thumb">
                      <img src="<c:url value='/assets/images/blog/s4.jpg'/>" alt="image"/>
                    </div>
                    <div class="small-post-content">
                      <h6><a href="#0">Turn Your Bet Into A High Performing...</a></h6>
                      <ul class="post-meta">
                        <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
                      </ul>
                    </div>
                  </div>
                </li><!-- small-post-item end -->
                <li>
                  <div class="small-post-item">
                    <div class="small-post-thumb">
                      <img src="<c:url value='/assets/images/blog/s5.jpg'/>" alt="image"/>
                    </div>
                    <div class="small-post-content">
                      <h6><a href="#0">Turn Your Bet Into A High Performing...</a></h6>
                      <ul class="post-meta">
                        <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
                      </ul>
                    </div>
                  </div>
                </li><!-- small-post-item end -->
              </ul>
            </div><!-- widget end -->
            <div class="widget widget-instagram">
              <h4 class="widget-title">instgram</h4>
              <ul class="instagram-list">
                <li><a href="assets/images/blog/1.jpg" data-rel="lightcase:myCollection:slideshow" title="Your title"><img src="<c:url value='assets/images/blog/insta1.jpg'/>" alt="image"/></a></li>
                <li><a href="assets/images/blog/2.jpg" data-rel="lightcase:myCollection:slideshow" title="Your title"><img src="<c:url value='assets/images/blog/insta2.jpg'/>" alt="image"/></a></li>
                <li><a href="assets/images/blog/3.jpg" data-rel="lightcase:myCollection:slideshow" title="Your title"><img src="<c:url value='assets/images/blog/insta3.jpg'/>" alt="image"/></a></li>
                <li><a href="assets/images/blog/1.jpg" data-rel="lightcase:myCollection:slideshow" title="Your title"><img src="<c:url value='assets/images/blog/insta4.jpg'/>" alt="image"/></a></li>
                <li><a href="assets/images/blog/2.jpg" data-rel="lightcase:myCollection:slideshow" title="Your title"><img src="<c:url value='assets/images/blog/insta5.jpg'/>" alt="image"/></a></li>
                <li><a href="assets/images/blog/3.jpg" data-rel="lightcase:myCollection:slideshow" title="Your title"><img src="<c:url value='assets/images/blog/insta6.jpg'/>" alt="image"/></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- blog-details-section end -->

 

  