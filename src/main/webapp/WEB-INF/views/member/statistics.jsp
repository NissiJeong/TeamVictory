<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<script>

 $(function() {

	 
    var count=1;
    
    //$(window).scroll(function() { });
    
    //문서가 로드되면 20 row 생성 그리고 생성이 완료되면 scroll 이벤트 바인딩
    for(var i = 1; i <= 5; i++) {
        count = i;
        
        
        $('<div class="play-table-part" style="border:1px solid green">').appendTo("#all");
        $('<div class="play-table">').appendTo("#all");
        $('<div>').appendTo("#all");
        $('<div class="summary">').appendTo("#all");
        $('<dl class="info">').appendTo("#all");
        $('<dt>01.07(토) 09:00</dt>').appendTo("#all");
        $('<dd>에이스볼파크</dd>').appendTo("#all");
        $('</dl>').appendTo("#all");
        $('<div style="float: left; width: 50%">').appendTo("#all");
        $('<dl>').appendTo("#all");
        $('<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>').appendTo("#all");
        $('<dd>').appendTo("#all");
        $('<span class="result ">패</span>').appendTo("#all");
        $('<span class="name">누리TLC</span>').appendTo("#all");
        $('<span class="add_info" style="height:13px"></span>').appendTo("#all");
        $('</dd>').appendTo("#all");
        $('<dd><span class="score">5</span></dd>').appendTo("#all");
        $('</dl>').appendTo("#all");
        $('</div>').appendTo("#all");
        $('<div style="float: left; width: 50%">').appendTo("#all");
        $('<dl>').appendTo("#all");
        $('<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style=float:left"><span class="cover"></span></a></dt>').appendTo("#all");
        $('<dd>').appendTo("#all");
        $('<span class="result win">승</span>').appendTo("#all");
        $('<span class="name">포켓스터야구단</span>').appendTo("#all");
        $('<span class="add_info" style="height:13px"></span>').appendTo("#all");
        $('</dd><!--mm-->').appendTo("#all");
        $('<dd><span class="score">14</span></dd>').appendTo("#all");
        $('</dl>').appendTo("#all");
        $('</div>').appendTo("#all");
        $('<p>').appendTo("#all");
        $('<strong>1번 타자</strong>').appendTo("#all");
        $('<span class="add_info">(유격수)</span>').appendTo("#all");
        $('<strong>임지성</strong>(69)').appendTo("#all");
        $('</p>').appendTo("#all");
        $('</div>').appendTo("#all");
        $('</div>').appendTo("#all");
        $('<table>').appendTo("#all");
        $('<thead>').appendTo("#all");
        $('<tr>').appendTo("#all");
        $('<th>타자기록</th>').appendTo("#all");
        $('<th>타수</th>').appendTo("#all");
        $('<th>안타</th>').appendTo("#all");
        $('<th>타점</th>').appendTo("#all");
        $('<th>득점</th>').appendTo("#all");
        $('<th>도루</th>').appendTo("#all");
        $('<th>타율</th>').appendTo("#all");
        $('</tr>').appendTo("#all");
        $('</thead>').appendTo("#all");
        $('<tbody>').appendTo("#all");
        $('<tr>').appendTo("#all");
        $('<td></td>').appendTo("#all");
        $('<td>5</td>').appendTo("#all");
        $('<td>4</td>').appendTo("#all");
        $('<td>3</td>').appendTo("#all");
        $('<td>2</td>').appendTo("#all");
        $('<td>1</td>').appendTo("#all");
        $('<td>0.800</td>').appendTo("#all");
        $('</tr>').appendTo("#all");
        $('</tbody>').appendTo("#all");
        $('</table>').appendTo("#all");
        $('<table>').appendTo("#all");
        $('<thead>').appendTo("#all");
        $('<tr>').appendTo("#all");
        $('<th>시즌기록</th>').appendTo("#all");
        $('<th>타수</th>').appendTo("#all");
        $('<th>안타</th>').appendTo("#all");
        $('<th>타점</th>').appendTo("#all");
        $('<th>득점</th>').appendTo("#all");
        $('<th>타율</th>').appendTo("#all");
        $('</tr>').appendTo("#all");
        $('</thead>').appendTo("#all");
        $('</thead>').appendTo("#all");
        $('<tbody>').appendTo("#all");
        $('<tr>').appendTo("#all");
        $('<td></td>').appendTo("#all");
        $('<td>195</td>').appendTo("#all");
        $('<td>83</td>').appendTo("#all");
        $('<td>32</td>').appendTo("#all");
        $('<td>33</td>').appendTo("#all");
        $('<td>25</td>').appendTo("#all");
        $('<td>0.461</td>').appendTo("#all");
        $('</tr>').appendTo("#all");
        $('</tbody>').appendTo("#all");
        $('</table>').appendTo("#all");
        $('</div>').appendTo("#all");
        $('</div>').appendTo("#all");
       
        
        if(count == 5) {
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
            for(var i = 0; i<3; i++) {
                //count = count + 1;
                count++;
                
                $('<div class="play-table-part" style="border:1px solid green">').appendTo("#all");
                $('<div class="play-table">').appendTo("#all");
                $(' <div>').appendTo("#all");
                $('<div class="summary">').appendTo("#all");
                $('<dl class="info">').appendTo("#all");
                $('<dt>01.07(토) 09:00</dt>').appendTo("#all");
                $('<dd>에이스볼파크</dd>').appendTo("#all");
                $('</dl>').appendTo("#all");
                $('<div style="float: left; width: 50%">').appendTo("#all");
                $('<dl>').appendTo("#all");
                $('<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>').appendTo("#all");
                $('<dd>').appendTo("#all");
                $('<span class="result ">패</span>').appendTo("#all");
                $('<span class="name">누리TLC</span>').appendTo("#all");
                $('<span class="add_info" style="height:13px"></span>').appendTo("#all");
                $('</dd>').appendTo("#all");
                $('<dd><span class="score">5</span></dd>').appendTo("#all");
                $('</dl>').appendTo("#all");
                $('</div>').appendTo("#all");
                $('<div style="float: left; width: 50%">').appendTo("#all");
                $('<dl>').appendTo("#all");
                $('<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style=float:left"><span class="cover"></span></a></dt>').appendTo("#all");
                $('<dd>').appendTo("#all");
                $('<span class="result win">승</span>').appendTo("#all");
                $('<span class="name">포켓스터야구단</span>').appendTo("#all");
                $('<span class="add_info" style="height:13px"></span>').appendTo("#all");
                $('</dd><!--mm-->').appendTo("#all");
                $('<dd><span class="score">14</span></dd>').appendTo("#all");
                $('</dl>').appendTo("#all");
                $('</div>').appendTo("#all");
                $('<p>').appendTo("#all");
                $('<strong>1번 타자</strong>').appendTo("#all");
                $('<span class="add_info">(유격수)</span>').appendTo("#all");
                $('<strong>임지성</strong>(69)').appendTo("#all");
                $('</p>').appendTo("#all");
                $('</div>').appendTo("#all");
                $('</div>').appendTo("#all");
                $('<table>').appendTo("#all");
                $('<thead>').appendTo("#all");
                $('<tr>').appendTo("#all");
                $('<th>타자기록</th>').appendTo("#all");
                $('<th>타수</th>').appendTo("#all");
                $('<th>안타</th>').appendTo("#all");
                $('<th>타점</th>').appendTo("#all");
                $('<th>득점</th>').appendTo("#all");
                $('<th>도루</th>').appendTo("#all");
                $('<th>타율</th>').appendTo("#all");
                $('</tr>').appendTo("#all");
                $('</thead>').appendTo("#all");
                $('<tbody>').appendTo("#all");
                $('<tr>').appendTo("#all");
                $('<td></td>').appendTo("#all");
                $('<td>5</td>').appendTo("#all");
                $('<td>4</td>').appendTo("#all");
                $('<td>3</td>').appendTo("#all");
                $('<td>2</td>').appendTo("#all");
                $('<td>1</td>').appendTo("#all");
                $('<td>0.800</td>').appendTo("#all");
                $('</tr>').appendTo("#all");
                $('</tbody>').appendTo("#all");
                $('</table>').appendTo("#all");
                $('<table>').appendTo("#all");
                $('<thead>').appendTo("#all");
                $('<tr>').appendTo("#all");
                $('<th>시즌기록</th>').appendTo("#all");
                $('<th>타수</th>').appendTo("#all");
                $('<th>안타</th>').appendTo("#all");
                $('<th>타점</th>').appendTo("#all");
                $('<th>득점</th>').appendTo("#all");
                $('<th>타율</th>').appendTo("#all");
                $('</tr>').appendTo("#all");
                $('</thead>').appendTo("#all");
                $('</thead>').appendTo("#all");
                $('<tbody>').appendTo("#all");
                $('<tr>').appendTo("#all");
                $('<td></td>').appendTo("#all");
                $('<td>195</td>').appendTo("#all");
                $('<td>83</td>').appendTo("#all");
                $('<td>32</td>').appendTo("#all");
                $('<td>33</td>').appendTo("#all");
                $('<td>25</td>').appendTo("#all");
                $('<td>0.461</td>').appendTo("#all");
                $('</tr>').appendTo("#all");
                $('</tbody>').appendTo("#all");
                $('</table>').appendTo("#all");
                $('</div>').appendTo("#all");
                $('</div>').appendTo("#all");
            }
        }
    }//function infinityScrollFunction()


});

 
 
 
 
 
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
                <a class="nav-link active" id="football-tab" data-toggle="tab" href="#football" role="tab" aria-controls="football" aria-selected="false">
                  <i class="flaticon-football"></i>
                  <span>적절한 쓰레드형 게시판</span>
                </a>
              </li>
             
              
             
              <li class="nav-item">
                <a class="nav-link" id="bascketball-tab" data-toggle="tab" href="#bascketball" role="tab" aria-controls="bascketball" aria-selected="true">
                  <i class="flaticon-basketball"></i>
                  <span>데이터 입력 폼</span>
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
                  <div class="card" id="test1"  style="text-align:center" >
                    
                    <!-- blog-details-section start -->
					  <section class="blog-details-section section-padding">
					    <div class="container">
					      <div class="row">
					     	<div class="col-lg-2" >
					     	</div>
					        <div class="col-lg-8"  style="border:1px solid gold"  >
					          <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
				                
				                
				                <div class="play-table-part" style="border:1px solid green">
				                  <div class="play-table">
						              <div>
						                <div class="summary">
											<dl class="info">
												<dt>01.07(토) 09:00</dt>
												<dd>에이스볼파크</dd>
											</dl>
											<div style="float: left; width: 50%">
												<dl>
													<dt><a href="/club/?club_idx=14322" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style="float:left" ><span class="cover"></span></a></dt>
													<dd>
														<span class="result ">패</span>
														<span class="name">누리TLC</span>
														<span class="add_info" style="height:13px"></span>
													</dd><!--mm-->
													<dd><span class="score">5</span></dd>
												</dl>
											</div>
											<div style="float: left; width: 50%">
												<dl>
													<dt><a href="/club/?club_idx=19031" target="_blank"><img data-original="//file.clubone.kr/symbol/club/symbol14322.jpg" class="lazy_image" src="//file.clubone.kr/symbol/club/symbol14322.jpg" style=float:left"><span class="cover"></span></a></dt>
													<dd>
														<span class="result win">승</span>
														<span class="name">포켓스터야구단</span>
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



			  <div class="tab-pane fade" id="bascketball" role="tabpanel" aria-labelledby="bascketball-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card">
                    
                    <!-- blog-details-section start -->
					  <section class="blog-details-section section-padding">
					    <div class="container">
					     <div class="row">
					     	<div class="col-lg-2" >
					     	</div>
					        <div class="col-lg-8"  style="border:1px solid gold">
							   
							   <form class="cmn-form registration-form" id="submit" method="post" action="<c:url value='/Team/Matching/InsertHitter.do'/>">
				                 
				                <div class="frm-group">
				                  <h1 style="color:white">　　　</h1>
				                  
				                  <select class="game-select" name="baseball_key" id="baseball_key"  style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid orange;">
									<option>경기 선택</option>		
									<option>2019-10-17 / 키움-SK / 고척  / 1830</option>		
									<option>2019-10-16 / SK-키움  / 문학  / 2000</option>
								  </select>
				                  
				                  <select class="position-select" name="baseball_pos" id="baseball_pos" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid orange;">
									<option>포지션</option>		
									<option>투수</option>		
									<option>포수</option>
									<option>1루수</option>
									<option>2루수</option>
									<option>3루수</option>
									<option>유격수</option>
									<option>좌익수</option>
									<option>중견수</option>
									<option>우익수</option>
									<option>지명타자</option>	
								  </select>
				                </div>
				                 <div class="frm-group">
				                  <select class="baseball_start" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid orange;">
									<option>선발</option>
									<option>교체</option>
									<option>미출전</option>		
								  </select>
				                </div>
				                
				                <div class="frm-group">
				                  <select class="baseball_horder" name="baseball_horder" style="width: 50%;display: inline; border-style: none; border-bottom: 1.5px solid orange;">
									<option>타순</option>
									<option>1</option>		
									<option>2</option>		
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
								  </select>
				                </div>
				                
				                <div class="frm-group">
				                  	<input type="text" name="baseball_pa" id="baseball_pa" style="width:50%;" placeholder="타석">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_ab" id="baseball_ab" style="width:50%;" placeholder="타수">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_h" id="baseball_h" style="width:50%;" placeholder="안타">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_b2" id="baseball_b2" style="width:50%;" placeholder="2루타">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_b3" id="baseball_b3" style="width:50%;" placeholder="3루타">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_hr" id="baseball_hr" style="width:50%;" placeholder="홈런">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_rbi" id="baseball_rbi" style="width:50%;" placeholder="타점">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_sb" id="baseball_sb" style="width:50%;" placeholder="도루">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_cs" id="baseball_cs" style="width:50%;" placeholder="도루실패">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_bb" id="baseball_bb" style="width:50%;" placeholder="볼넷">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_hbp" id="baseball_hbp" style="width:50%;" placeholder="몸에맞는볼">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_so" id="baseball_so" style="width:50%;" placeholder="삼진">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_gdp" id="baseball_gdp" style="width:50%;" placeholder="병살">
				                </div>
				                <div class="frm-group">
				                  	<input type="text" name="baseball_e" id="baseball_e" style="width:50%;" placeholder="실책">
				                </div>
				                
								
				                <div class="frm-group">
				                    <button type="submit" class="submit-btn" style="margin-top: 100px">전송</button>
				                </div>
				              </form>
						   
							   
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
