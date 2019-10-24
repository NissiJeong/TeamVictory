<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	
});//////////
</script>

  
  <!-- contact-section start -->
  <section class="contact-section section-padding" style="margin-top: -50px">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-7">
          <div class="section-header text-center">
            <h2 class="section-title">Create Your Team!!</h2>
            <p>On insensible possession oh particular attachment at excellence in. The books arose but miles happy she.</p>
          </div>
        </div>
      </div>
      <!-- <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex">
            <div class="icon">
              <i class="fa fa-home"></i>
            </div>
            <div class="content">
              <h5 class="title">Address</h5>
              <p>2 Country Club Street<br> Vienna, VA 22180</p>
            </div>
          </div>
        </div>contact-item end
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex">
            <div class="icon">
              <i class="fa fa-headphones"></i>
            </div>
            <div class="content">
              <h5 class="title">Phone Number</h5>
              <p>+1-202-555-0108</p>
              <p>+1-202-555-0109</p>
            </div>
          </div>
        </div>contact-item end
        <div class="col-lg-4 col-md-6">
          <div class="contact-item d-flex">
            <div class="icon">
              <i class="fa fa-envelope"></i>
            </div>
            <div class="content">
              <h5 class="title">Email Address</h5>
              <p>random1@example.com</p>
              <p>random2@example.com</p>
            </div>
          </div>
        </div>contact-item end
      </div> -->
      <div class="row" style="margin-top: -50px">
        <div class="col-lg-8">
          <div class="contact-form-area">
            <form class="cmn-form contact-form" action="<c:url value='/Team/matching/teamJoin.do'/>">
              <div class="row">
                <div class="col-md-6">
                  <div class="frm-group">
                  	<label for="sel3">팀 명</label>
                    <input type="text" name="teamName" id="teamName" placeholder="Team Name*">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  	<label for="sel3" >종목</label>
                   <select class="form-control" id="sel3" name="category" >
			        <option value="futsal">풋살</option>
			        <option value="baseball">야구</option>
			        <option value="basketball">농구</option>
			      </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  <label for="sel3" >팀장 ID</label>
                    <input type="text" name="manager_id" id="manager_id" placeholder="Manager_ID*">
                  </div>
                </div>
                <div class="col-md-6" >
                  <div class="frm-group">
                  <label for="sel3" >RATING</label>
                    <input type="text" name="teamRating" id="teamRating" placeholder="1500" disabled value="1500">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="frm-group">
                  	<label for="sel3" >팀 활동 지역</label>
                   <select class="form-control" id="sel3" name="teamLoc" >
			        <option value="guro">구로구</option>
			        <option value="gumcheon">금천구</option>
			        <option value="mapo">마포구</option>
			      </select>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="frm-group">
                  <label for="sel3" >간단한 팀 소개</label>
                    <textarea name="teamInfo" id="teamInto" placeholder="Write Message"></textarea>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="frm-group text-center">
                    <button type="submit" class="submit-btn">등록</button>
                  </div>
                </div>
              </div>
            </form>
            <div class="contact-thumb">
              <img src="<c:url value='assets/images/contact.png'/>" alt="image"/>
            </div>
           
          </div>
        </div>
      </div>
    </div>
  </section>
 