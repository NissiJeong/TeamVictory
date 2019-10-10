<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

/* $(function() {

    var count=1;
    
    //$(window).scroll(function() { });
    
    //문서가 로드되면 20 row 생성 그리고 생성이 완료되면 scroll 이벤트 바인딩
    for(var i = 1; i <= 20; i++) {
        count = i;
        
        $("<h1>"+count+" line scroll</h1>").appendTo("#test1");

      
        if(count == 20) {
            $(window).bind("scroll",infinityScrollFunction);
        }
    }

    
    
    function infinityScrollFunction() {

        //현재문서의 높이를 구함.
        var documentHeight  = $(document).height();
        console.log("documentHeight : " + documentHeight);
        
        //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
        //스크롤바가 맨 위쪽에 있을때 , 위치는 0
        console.log("window의 scrollTop() : " + $(window).scrollTop()); 
        //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
        console.log("window의 height() : " + $(window).height());
        
        //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
        //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
        var scrollHeight = $(window).scrollTop()+$(window).height();         
        console.log("scrollHeight : " + scrollHeight);
            
        if(scrollHeight == documentHeight) { //문서의 맨끝에 도달했을때 내용 추가 
            for(var i = 0; i<10; i++) {
                //count = count + 1;
                count++;
                //$("<h1> infinity scroll </h>").appendTo("body");
                $("<h1>"+count+" line scroll</h1>").appendTo("#test1");
            }
        }
    }//function infinityScrollFunction()


}); */


</script>

  <!-- banner-section start -->
  <section class="breadcum-section">
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
              <h3 class="title">Statistics</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">statistics</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->

  <!-- statistics-section start -->
  <section class="statistics-section section-padding padding-top-95">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="statistics-table-result-part">
            <ul class="nav justify-content-around" id="myTab" role="tablist">
              
              <li class="nav-item">
                <a class="nav-link active" id="football-tab" data-toggle="tab" href="#football" role="tab" aria-controls="football" aria-selected="true">
                  <i class="flaticon-football"></i>
                  <span>적절한 쓰레드형 게시판</span>
                </a>
              </li>
              
             
              <li class="nav-item">
                <a class="nav-link" id="bascketball-tab" data-toggle="tab" href="#bascketball" role="tab" aria-controls="bascketball" aria-selected="false">
                  <i class="flaticon-basketball"></i>
                  <span>적절한 쓰레드형 히스토리</span>
                </a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" id="baseball-tab" data-toggle="tab" href="#baseball" role="tab" aria-controls="baseball" aria-selected="false">
                  <i class="flaticon-softball"></i>
                  <span>적절한 선수페이지</span>
                </a>
             </li>
             
             <li class="nav-item">
                <a class="nav-link" id="test-tab" data-toggle="tab" href="#test" role="tab" aria-controls="test" aria-selected="false">
                  <i class="flaticon-softball"></i>
                  <span>적절한 마이페이지</span>
                </a>
             </li>
              
            </ul>
            <div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="football" role="tabpanel" aria-labelledby="football-tab">
                <div class="accordion" id="accordionExample-1">
                  <div class="card" id="test1" >
                    
                    <!-- blog-details-section start -->
					  <section class="blog-details-section section-padding">
					    <div class="container">
					      <div class="row">
					     	<div class="col-lg-2" >
					     	</div>
					        <div class="col-lg-8"  style="border:1px solid gold"  >
					          
					          <div class="comment-form-wrap" >
					            <h3 class="title"></h3>
					              <form class="cmn-form comment-form">
					                <div class="row">
					                  <div class="col-md-12">
					                    <div class="frm-group">
					                      <textarea name="message" id="message" placeholder="글 쓰기"></textarea>
					                    </div>
					                  </div>
					                  <div class="col-md-12">
					                    <div class="frm-group">
					                      <button type="submit" class="submit-btn">게시</button>
					                    </div>
					                  </div>
					                </div>
					             </form>
					          </div>
					        
					          
					          <div class="blog-details-wrapper" >
					            
					            <div class="blog-details-content" >
					            
					              <ul class="post-meta">
					                <li><a href="#"><i class="fa fa-user"></i>04, March, 2019</a></li>
					                <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
					              </ul>
					              <h2 class="blog-details-title">적절한 제목</h2>
					              <p> 적절하지 못한 내용 </p>
					              <p> 적절한 내용 </p>
					            </div>
					            <div class="blog-details-footer d-flex justify-content-between">
					              <div class="post-tags">
					                <i class="fa fa-tags"></i>
					                <a href="#">Bet</a>
					                <a href="#">football</a>
					                <a href="#">casino</a>
					                <a href="#">news</a>
					              </div>
					              <div class="meta-share">
					                <i class="fa fa-share"></i>
					                <a href="#"><i class="fa fa-facebook-f"></i></a>
					                <a href="#"><i class="fa fa-google-plus"></i></a>
					                <a href="#"><i class="fa fa-twitter"></i></a>
					                <a href="#"><i class="fa fa-vimeo"></i></a>
					              </div>
					            </div>
					          </div><!-- blog-details-wrapper end -->
					          <div class="comment-area">
					            <h3 class="title">3 Comments</h3>
					            <ul class="comment-list">
					              <li>
					                <div class="single-comment-wrap">
					                  <div class="thumb">
					                    <img src="<c:url value='/assets/images/blog/rp1.jpg'/>" alt="comment-thumb"/>
					                  </div>
					                  <div class="content">
					                    <h6 class="name">David Jacson</h6>
					                    <span class="reply-time">02 Hours Ago</span>
					                    <a href="#" class="reply"><i class="fa fa-reply"></i></a>
					                    <p>practice practice</p>
					                  </div>
					                </div>
					              </li>
					              <li class="has-children">
					                <ul>
					                  <li>
					                    <div class="single-comment-wrap">
					                      <div class="thumb">
					                        <img src="<c:url value='/assets/images/blog/rp2.jpg'/>" alt="comment-thumb"/>
					                      </div>
					                      <div class="content">
					                        <h6 class="name">David Jacson</h6>
					                        <span class="reply-time">02 Hours Ago</span>
					                        <a href="#" class="reply"><i class="fa fa-reply"></i></a>
					                        <p>연습 </p>
					                      </div>
					                    </div>
					                  </li>
					                </ul>
					              </li>
					              
					            </ul>
					          </div><!-- comment-area end -->
					          <div class="comment-form-wrap">
					            <h3 class="title">Leave a reply</h3>
					            <form class="cmn-form comment-form">
					                <div class="row">
					                  
					                  <div class="col-md-12">
					                    <div class="frm-group">
					                      <textarea name="message" id="message" placeholder="Write Message"></textarea>
					                    </div>
					                  </div>
					                  <div class="col-md-12">
					                    <div class="frm-group">
					                      <button type="submit" class="submit-btn">Comment</button>
					                    </div>
					                  </div>
					                </div>
					              </form>
					          </div>
					        </div>
					      </div>  
					    
					    </div>
					  </section>
					  <!-- blog-details-section end -->
					   
                  </div>	
                </div>
              </div>
              

			  <div class="tab-pane fade" id="bascketball" role="tabpanel" aria-labelledby="bascketball-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card" style="text-align:center">
                    
                    <!-- blog-details-section start -->
					  <section class="blog-details-section section-padding">
					    <div class="container">
					     <div class="row">
					     	<div class="col-lg-2" >
					     	</div>
					        <div class="col-lg-8"  style="border:1px solid gold"  >
							   <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
				                <div class="play-table-part">
				                  <div class="play-table">
						              <div>
						                <div class="summary">
											<dl class="info">
												<dt>01.07(토) 09:00</dt>
												<dd>에이스볼파크</dd>
											</dl>
											<div style="display:inline">
												<dl>
													<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>
													<dd>
														<span class="result ">패</span>
														<span class="name" style="width: 80px; margin-left: 5px;">누리TLC</span>
														<span class="add_info" style="height:13px"></span>
													</dd><!--mm-->
													<dd><span class="score">5</span></dd>
												</dl>
											</div>
											<div style="display:inline">
												<dl>
													<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol19031.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol19031.jpg" style=float:left"><span class="cover"></span></a></dt>
													<dd>
														<span class="result win">승</span>
														<span class="name">포켓몬스터야구단</span>
														<span class="add_info" style="height:13px"></span>
													</dd><!--mm-->
													<dd><span class="score">14</span></dd>
												</dl>
											</div>
											<p>
												<strong>1번 타자</strong>
												<span class="add_info">(유격수)</span>
												<strong>임지성</strong>(69)
											</p>
										</div>
						              </div>
				                    <table>
				                      <thead>
				                        <tr>
				                          <th>타자기록</th>
				                          <th>타수</th>
				                          <th>안타</th>
				                          <th>타점</th>
				                          <th>득점</th>
				                          <th>도루</th>
				                          <th>타율</th>
				                        </tr>
				                      </thead>
				                      <tbody>
				                        <tr>
				                          <td></td>
				                          <td>5</td>
				                          <td>4</td>
				                          <td>3</td>
				                          <td>2</td>
				                          <td>1</td>
				                          <td>0.800</td>
				                        </tr>
				                      </tbody>
				                    </table>
				                    <table>
				                      <thead>
				                        <tr>
				                          <th>시즌기록</th>
				                          <th>타수</th>
				                          <th>안타</th>
				                          <th>타점</th>
				                          <th>득점</th>
				                          <th>도루</th>
				                          <th>타율</th>
				                        </tr>
				                      </thead>
				                      <tbody>
				                        <tr>
				                          <td></td>
				                          <td>195</td>
				                          <td>83</td>
				                          <td>32</td>
				                          <td>33</td>
				                          <td>25</td>
				                          <td>0.461</td>
				                        </tr>
				                      </tbody>
				                    </table>
				                  </div>
				                </div>
				              </div>
					        </div>
					      </div>  
					    </div>
					  </section>
					  <!-- blog-details-section end -->
					  
                  </div>	
                </div>
              </div>



              <div class="tab-pane fade" id="baseball" role="tabpanel" aria-labelledby="baseball-tab">
                <div class="accordion" id="accordionExample-3">
                  <div class="card">
                  	
                	<div class="row">
				      <div class="col-lg-2" >
				     	</div>
				        <div class="col-lg-8"  style="border:1px solid gold">
					          
					     <div class="content">     
					      
					      <h1>적절한 div로 내 스탯 상세 출력</h1>
					      
					      <h3>정보 입력/보여주기</h3>
					      <table>
					        <tr style="background-color:white">
					            <th style="width:20%">출신고교</th>
					            <td><input type="text" name="id" size="20" /></td>
					        </tr>
					        <tr style="background-color:white">
					            <th>투타구분</th>
					            <td>
					                <input type="radio" name="gender" value="man" />우투우타
					                <input type="radio" name="gender" value="woman" />우투좌타
					                <input type="radio" name="gender" value="trans" />좌투좌타
					                <input type="radio" name="gender" value="trans" />좌투우타
					            </td>
					        </tr>
					        <tr style="background-color:white">
					            <th>선출구분</th>
					            <td>
					                <input type="radio" name="gender" value="man" />비선출
					                <input type="radio" name="gender" value="woman" />중출
					                <input type="radio" name="gender" value="trans" />고출 이상
					                
					            </td>
					        </tr>
					        <tr style="background-color:white">
					            <th style="width:20%">신장</th>
					            <td><input type="text" name="id" size="20" />cm</td>
					        </tr>
					        <tr style="background-color:white">
					            <th style="width:20%">몸무게</th>
					            <td><input type="text" name="id" size="20" />kg</td>
					        </tr>
					   
					        <tr style="background-color:white">
					            <td colspan="2" align="center">					                
					                  <input type="submit" value="확인" title="type=submit" />					                        
					            </td>
					        </tr>
					    </table>    
					    </div>    
					   </div>
					</div>  
                 </div>
              </div>
		     </div>
		     
		     <div class="tab-pane fade" id="test" role="tabpanel" aria-labelledby="test-tab">
                <div class="accordion" id="accordionExample-3">
                  <div class="card">
                  	
                	<div class="row">
				     	<div class="col-lg-2" >
				     	</div>
				        <div class="col-lg-8"  style="border:1px solid gold">
					         	
				          <h1>사진수정을 위한 div</h1>
				          <img src="http://file.clubone.kr/player/member_default.jpg"/>
				          
				          <h1>비밀번호변경 하는척</h1>
				          <h1>휴대폰번호</h1>
				          <h1>연고지</h1>
				          <h1>기타 등등</h1>
					        
					   </div>
					</div>  
                 </div>
              </div>
		     </div>
		     
          </div><!-- online-play-tab-part end -->
        </div>
      </div>
    </div>
   </div>
  </section>
  <!-- statistics-section end -->
