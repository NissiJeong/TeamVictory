<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){
	




});

 function scoreBold(){
	var blue = parseInt($('.blue').html());
	var red = parseInt($('.red').html());
	console.log(blue-red);
	
	
	
	if (blue > red){
		$('.blue').css({'font-weight':'bold',color:'blue'});
	}
	else if (blue < red) {
		$('span.red').css({'font-weight':'bold',color:'red'});
	}
	else if (blue == red){
		$('span.blue').css({'font-weight':'normal',color:'black'});
		$('span.red').css({'font-weight':'normal',color:'black'});
	}
		
};
</script>
  <!-- banner-section start -->
  <section class="breadcum-section">  
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
            
              <h3 class="title">In Play</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">in play</li>
              </ol>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->


  <!-- play-section start -->
  <section class="play-section section-padding section-bg">
    <div class="container">
    
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="section-header text-center">
            <h2 class="section-title">Bet & Playing Now</h2>
            <p>On insensible possession oh particular attachment at excellence in. The books arose but miles happy she.</p>
          </div>
        </div>
      </div>
      
      
      <div class="row"> <!--  row  -->
        <div class="col-lg-12">
          <div class="online-play-tab-part">
            <ul class="nav justify-content-around" id="myTab" role="tablist">
        
              <li class="nav-item">
                <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="true">
                  <i class="flaticon-trophy"></i>
                  <span>All sports</span>
                </a>
              </li>
              
         
              <li class="nav-item">
                <a class="nav-link" id="football-tab" data-toggle="tab" href="#football" role="tab" aria-controls="football" aria-selected="false">
                  <i class="flaticon-football"></i>
                  <span>football</span>
                </a>
              </li>
              <!--  
              <li class="nav-item">
                <a class="nav-link" id="cricket-tab" data-toggle="tab" href="#cricket" role="tab" aria-controls="cricket" aria-selected="false">
                  <i class="flaticon-cricket"></i>
                  <span>cricket</span>
                </a>
              </li>
           
              <li class="nav-item">
                <a class="nav-link" id="tennis-tab" data-toggle="tab" href="#tennis" role="tab" aria-controls="tennis" aria-selected="false">
                  <i class="flaticon-tennis-racket"></i>
                  <span>tennis</span>
                </a>
              </li>
              -->
              <li class="nav-item">
                <a class="nav-link" id="bascketball-tab" data-toggle="tab" href="#bascketball" role="tab" aria-controls="bascketball" aria-selected="false">
                  <i class="flaticon-basketball"></i>
                  <span>bascketball</span>
                </a>
              </li>
            
              <li class="nav-item">
                <a class="nav-link" id="baseball-tab" data-toggle="tab" href="#baseball" role="tab" aria-controls="baseball" aria-selected="false">
                  <i class="flaticon-softball"></i>
                  <span>baseball</span>
                </a>
              </li>
              <!--  
              <li class="nav-item">
                <a class="nav-link" id="more-tab" data-toggle="tab" href="#more" role="tab" aria-controls="more" aria-selected="false">
                  <i class="flaticon-menu"></i>
                  <span>more sports</span>
                </a>
              </li>
              -->
            </ul>
            <div class="tab-content" id="myTabContent">
            <!--  전체 선택 -->
              <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                <div class="play-table-part" >
                  <div class="play-table"  >
                  
                    <table class="table table-bordered"  id="all-table" >
                      <thead id="th1">
                        <tr>
                          <th>번호</th>
                          <th >경기일시</th>
                          <th class="team-name ">팀명</th>
                          
                          <th>경기결과</th>
                          <th class="choice-team">배팅</th>
                          <th class="bet-num">참여 인원</th>
                          <th class="">상세보기</th>
                        </tr>
                      </thead>
                      <!-- 테이블 데이터 시작  -->
                      <tbody class="all-tbody"> 
                      
                       <!--  1행 -->
                       
                        <tr>
                          <td>
                            <!-- <div class="team-name-part"> </div> -->  
                             1  
                          </td>
                          
                          <td>  <!-- 경기 날짜  -->
                       
                          <span bat="1">2019-10-10</span>
                          </td>
                          
                          <td>  <!--  팀 vs 팀  -->
                          	기아&nbsp;&nbsp;<span class="blue">3</span>&nbsp;&nbsp; : &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp; 두산
                          </td>
                          <td>  <!-- 경기결과 --> 
                               <span class="win">승</span>  
                          </td>
                          <td>  <!-- 배팅--> 
                               배팅 
                          </td>
                          <td>  <!-- 참여인원 --> 
                               20
                          </td>
                          <td>  <!-- 상세보기 --> 
                               상세보기
                          </td>
                        </tr>  <!-- 1행끝 -->
                        
                        
                           <tr>
                          <td>
                             2
                          </td>
                          
                          <td>  <!-- 경기 날짜  -->
                       
                          <span bat="1">2019-10-10</span>
                          </td>
                          
                          <td>  <!--  팀 vs 팀  -->
                         SK&nbsp;&nbsp;<span class="blue">2</span>&nbsp;&nbsp; : &nbsp;&nbsp;<span class="red">2</span>&nbsp;&nbsp;롯데
                          </td>
                          
                          
                          <td>  <!-- 경기결과 --> 
                               <span class="win">무</span>  
                          </td>
                          <td>  <!-- 배팅--> 
                               배팅 
                          </td>
                          <td>  <!-- 참여인원 --> 
                              15
                          </td>
                          <td>  <!-- 상세보기 --> 
                               상세보기
                          </td>
                        </tr>  <!-- 2행끝 -->
                       
                        
                        
                      
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>  <!--  전체선택 끝  -->
              
              <!--  축구 선택  -->

              <div class="tab-pane fade" id="football" role="tabpanel" aria-labelledby="football-tab">
                <div class="play-table-part">
                  <div class="play-table">
                    <table>
                      <thead>
                        <tr>
                          <th class="team-name">name of the team</th>
                          <th class="goal">goal</th>
                          <th class="choice-team">bet your choose team</th>
                          <th class="bet-num">total bet</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>   <!--  축구 끝 -->

             

              <!-- 농구 선택  -->

              <div class="tab-pane fade" id="bascketball" role="tabpanel" aria-labelledby="bascketball-tab">
                <div class="play-table-part">
                  <div class="play-table">
                    <table>
                      <thead>
                        <tr>
                          <th class="team-name">name of the team</th>
                          <th class="goal">goal</th>
                          <th class="choice-team">bet your choose team</th>
                          <th class="bet-num">total bet</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-basketball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              
              

              <div class="tab-pane fade" id="baseball" role="tabpanel" aria-labelledby="baseball-tab">
                <div class="play-table-part">
                  <div class="play-table">
                    <table>
                      <thead>
                        <tr>
                          <th class="team-name">name of the team</th>
                          <th class="goal">goal</th>
                          <th class="choice-team">bet your choose team</th>
                          <th class="bet-num">total bet</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="flaticon-softball"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>  <!--  야구 끝 -->

				<!--  농구 선택 -->
              <div class="tab-pane fade" id="more" role="tabpanel" aria-labelledby="more-tab">
                <div class="play-table-part">
                  <div class="play-table">
                    <table>
                      <thead>
                        <tr>
                          <th class="team-name">name of the team</th>
                          <th class="goal">goal</th>
                          <th class="choice-team">bet your choose team</th>
                          <th class="bet-num">total bet</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="team-name-part">
                              <i class="fa fa-futbol-o"></i>
                              <div class="content">
                                <span class="name">Barcelona</span>
                                <span class="name">Real madrid</span>
                              </div>
                            </div>
                          </td>
                          <td>
                            <div class="score">
                              <span class="first-team-score">2</span>
                              <span class="second-team-score">2</span>
                            </div>
                          </td>
                          <td>
                            <div class="choice-team-part">
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-down"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                              <div class="single-item">
                                <span>Barcelona</span>
                                <p>2.5<i class="fa fa-angle-up"></i></p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <span class="bet-count-num">+19<i class="fa fa-angle-right"></i></span>
                          </td>
                        </tr>
                      </tbody>  <!--  테이블바디-->
                    </table>
                  </div>
                </div>
              </div>   <!--  야구끝 -->
              
            </div>
          </div><!-- online-play-tab-part end -->
        </div>
      </div>
    </div>
  </section>
  <!-- play-section end -->




  