<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
   
    
   
    $(".upModal").click(function(){
    	$.ajax({
    		url:"<c:url value='/Team/Matching/modal.do'/>",
    		type:'post',
    		dataType:'json',
    		data:{teamName:$('label:eq('+$(this).attr("title")+')').attr("title")},	
    		success:function(data){
    			console.log(data);
    		}
    	});
    });    
    
    
    $("#match").click(function(){
    	$.ajax({
    		url:"<c:url value='/Team/Matching/matching.do'/>",
    		type:'post',
    		dataType:'text',
    		data:$('#frm').serialize(),	
    		success:function(data){
    			console.log(data);
    			alert(data);
    		}
    	});
    });    
   
 });
</script>

   <!-- banner-section start -->  
  <section class="breadcum-section" style="margin-bottom: -70px">
    <div class="breadcum-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcum-content text-center">
              <h3 class="title">Matching</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">matching</li>
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
      		<div class="col-lg-6">
	          <div class="section-header text-center">
	            <h2 class="section-title fadeIn"  style="color:black">Start Matching!</h2>
	            <p>On insensible possession oh particular attachment at excellence in. The books arose but miles happy she.</p>
	          </div>
	        </div>
        <div class="col-lg-12">
          <div class="statistics-table-result-part">
            <ul class="nav justify-content-around" id="myTab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="teamMatch-tab" data-toggle="tab" href="#teamMatch" role="tab" aria-controls="all" aria-selected="true">
                  <i class="flaticon-match"></i>
                  <span>Team Matching</span>
            	  <p>May indulgence</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="soloMatch-tab" data-toggle="tab" href="#soloMatch" role="tab" aria-controls="football" aria-selected="false">
                  <i class="flaticon-soccer"></i>
                  <span>Training Mode</span>
                  <p>May indulgence</p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="cricket-tab" data-toggle="tab" href="#search" role="tab" aria-controls="cricket" aria-selected="false">
                  <i class="flaticon-transparency"></i>
                  <span>Team Search</span>
                  <p>May indulgence</p>
                   <input type="text" class="form" placeholder="Team Name" style="width:60%; height:30px"/>
	            <input type="button"  class="btn btn-info" value="search" style="margin-left: 5px"/>
                </a>
              </li>
            </ul>
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="teamMatch" role="tabpanel" aria-labelledby="all-tab">
                
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button"  data-target="#one-collapseOne" aria-expanded="true" aria-controls="one-collapseOne">Team Matching</button>
                      </h2>
                    </div>
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <section class="blog-section section-padding" style="margin-top: -80px">
					    <div class="container">
					      <div class="row mt-mb-15">
					        
					        <c:forEach var="item" items="${list}" varStatus="loop">
						        <div class="col-lg-4 col-sm-6"><!-- post-item start -->
						          <div class="post-item">
						            <div class="thumb">
						              <img src="<c:url value='/assets/images/baseball1.png'/>" alt="image"/>
						            </div>
						            <div class="content">
						              <ul class="post-meta">
						                <li><a href="#"><i class="fa fa-calendar"></i>04, March, 2019</a></li>
						              </ul>
						              <h3 class="post-title"><a href="#0"><label class="teamName" title="${item.teamName }" >${item.teamName }</label></a></h3>
						             	 지역 <span style="font-size: 1.3em; color: navy; font-weight: bold"> ${item.teamLoc }</span>
						              <p>Rating <span style="font-size: 1.3em; color: navy; font-weight: bold">${item.baseRating }</span> </p>
						              <button  type="button" class="btn btn-primary upModal"  data-toggle="modal" data-target="#myModal" title="${loop.index }">
									    Matching Start!
									  </button>
						            </div>
						          </div>
						        </div><!-- post-item end -->
					        </c:forEach>
					        
					        
					        
					       
					      </div>
					      
					    </div>
	 				 </section>
                   </div>
                 </div><!-- card end -->
                  
                
              </div>
			<div class="tab-pane fade" id="soloMatch" role="tabpanel" aria-labelledby="all-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" data-target="#one-collapseOne" aria-expanded="true" aria-controls="one-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <div class="card-body">
                        <div class="statistics-result-table d-flex">
                          <div class="statistics-team-area">
                            <h3 class="title">Selter Team</h3>
                            <div class="team-list-area">
                              <button type="button">All team<i class="fa fa-angle-down"></i></button>
                              <ul class="team-list">
                                <li>
                                  <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                  <span class="team-name">Brazil</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                  <span class="team-name">Uruguay</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                  <span class="team-name">USA</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                  <span class="team-name">Koria</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                  <span class="team-name">argentina</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                  <span class="team-name">swizerland</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                  <span class="team-name">england</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                  <span class="team-name">germany</span>
                                </li>
                              </ul>
                            </div>
                          </div><!-- statistics-team-area end -->
                          <div class="statistics-result-area">
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                    <span class="team-name">Brazil</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                    <span class="team-name">Uruguay</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                    <span class="team-name">USA</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                    <span class="team-name">koria</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                    <span class="team-name">argentina</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                    <span class="team-name">swizerland</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                    <span class="team-name">england</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                    <span class="team-name">germany</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                          </div><!-- statistics-result-area end -->
                        </div><!-- statistics-result-table end -->
                      </div>
                    </div>
                  </div><!-- card end -->
                  
                </div>
              </div>
              <div class="tab-pane fade" id="search" role="tabpanel" aria-labelledby="all-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link"  aria-expanded="true" aria-controls="one-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="one-collapseOne" class="collapse show" aria-labelledby="one-world-cup" data-parent="#accordionExample-2">
                      <div class="card-body">
                        <div class="statistics-result-table d-flex">
                          <div class="statistics-team-area">
                            <h3 class="title">Selter Team</h3>
                            <div class="team-list-area">
                              <button type="button">All team<i class="fa fa-angle-down"></i></button>
                              <ul class="team-list">
                                <li>
                                  <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                  <span class="team-name">Brazil</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                  <span class="team-name">Uruguay</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                  <span class="team-name">USA</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                  <span class="team-name">Koria</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                  <span class="team-name">argentina</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                  <span class="team-name">swizerland</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                  <span class="team-name">england</span>
                                </li>
                                <li>
                                  <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                  <span class="team-name">germany</span>
                                </li>
                              </ul>
                            </div>
                          </div><!-- statistics-team-area end -->
                          <div class="statistics-result-area">
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/brazil.jpg" alt="image"></span>
                                    <span class="team-name">Brazil</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/uruguay.jpg" alt="image"></span>
                                    <span class="team-name">Uruguay</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/usa.jpg" alt="image"></span>
                                    <span class="team-name">USA</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/koria.jpg" alt="image"></span>
                                    <span class="team-name">koria</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/argentina.jpg" alt="image"></span>
                                    <span class="team-name">argentina</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/swizerland.jpg" alt="image"></span>
                                    <span class="team-name">swizerland</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                            <div class="result-single d-flex align-items-center">
                              <div class="details">
                                <p>Sat 01 Mar</p>
                                <p>07:30 (EDT) (Your Time)</p>
                                <p>Gemstone Stadium, USA</p>
                              </div>
                              <div class="team-area">
                                <div class="first-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/england.jpg" alt="image"></span>
                                    <span class="team-name">england</span>
                                  </div>
                                  <span class="result">3</span>
                                </div>
                                <div class="second-team d-flex align-items-center justify-content-between">
                                  <div class="team">
                                    <span class="flag"><img src="assets/images/flag/germany.jpg" alt="image"></span>
                                    <span class="team-name">germany</span>
                                  </div>
                                  <span class="result">1</span>
                                </div>
                              </div>
                            </div><!-- result-single end -->
                          </div><!-- statistics-result-area end -->
                        </div><!-- statistics-result-table end -->
                      </div>
                    </div>
                  </div><!-- card end -->
                  
                </div>
              </div>
            </div>
          </div><!-- online-play-tab-part end -->
        </div>
      </div>
    </div>
  </section>
  <!-- statistics-section end -->
  
  
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Start Matching With Rival Team</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <img src="<c:url value='/assets/images/baseball1.png'/>" alt="이미지" />
                <h3 class="portfolio-modal-title text-secondary text-uppercase mb-0" style="display: inline">${team.teamName }asdfasd</h3>
                <p>최근 5경기 경기 결과</p>      
                  <table class="table table-striped" style="margin-top: 10px">
				    <thead>
				      <tr>
				        <th>4.18</th>
				        <th>4.20</th>
				        <th>4.22</th>
				        <th>4.25</th>
				        <th>4.30</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				      </tr>
				      <tr>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				      </tr>
				      <tr>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				        <td>두산전 승</td>
				      </tr>
				    </tbody>
				  </table>
				  </div>
				   <div class="col-lg-12">
                <hr style="border:solid 1px">
                </div>
                <div class="col-lg-8">
                <!-- Icon Divider -->
                <h3 class="portfolio-modal-title text-secondary text-uppercase mb-0" >Matching정보 입력</h3>
               	<form id="frm">
               	
               	<input name="awayteam" type="hidden" value='sdfg'/>
			    <div class="form-group" style="margin-bottom:-10px ">
			      <label for="sel1">Date</label>
			      <p><input name='date' type="text" id="datepicker" style="width:100%"></p>
			      <br>			   
			    </div>
			    <div class="form-group" style="margin-bottom:-10px ">
			      <label for="sel2" >Time</label>
			      <select class="form-control" id="sel2" name="time" >
			        <option value="00">00</option>
			        <option value="01">01</option>
			        <option value="02">02</option>
			        <option value="03">03</option>
			        <option value="04">04</option>
			        <option value="05">05</option>
			        <option value="06">06</option>
			        <option value="07">07</option>
			        <option value="08">08</option>
			        <option value="09">09</option>
			        <option value="10">10</option>
			        <option value="11">11</option>
			        <option value="12">12</option>
			        <option value="13">13</option>
			        <option value="14">14</option>
			        <option value="15">15</option>
			        <option value="16">16</option>
			        <option value="17">17</option>
			        <option value="18">18</option>
			        <option value="19">19</option>
			        <option value="20">20</option>
			        <option value="21">21</option>
			        <option value="22">22</option>
			        <option value="23">23</option>
			      </select>
			      <br>			   
			    </div>
			     <div class="form-group" style="margin-bottom:10px ">
			      <label for="sel3" >Stadium</label>
			      <select class="form-control" id="sel3" name="stadium" >
			        <option value="1">1</option>
			        <option value="2">2</option>
			        <option value="3">3</option>
			        <option value="4">4</option>
			      </select>
			      <br>			   
			    </div>
			    <button id="match" type="submit" class="btn btn-primary" href="#" data-dismiss="modal" style="width:100%;line-height: 40px">                  
                  	매칭 신청
                </button>
			  </form>
			</div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  

