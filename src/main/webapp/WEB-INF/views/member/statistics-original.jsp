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
                <a class="nav-link" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="false">
                  <i class="flaticon-trophy"></i>
                  <span>All sports</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" id="football-tab" data-toggle="tab" href="#football" role="tab" aria-controls="football" aria-selected="true">
                  <i class="flaticon-football"></i>
                  <span>football</span>
                </a>
              </li>
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
              <li class="nav-item">
                <a class="nav-link" id="more-tab" data-toggle="tab" href="#more" role="tab" aria-controls="more" aria-selected="false">
                  <i class="flaticon-menu"></i>
                  <span>more sports</span>
                </a>
              </li>
            </ul>
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade" id="all" role="tabpanel" aria-labelledby="all-tab">
                <div class="accordion" id="accordionExample-2">
                  <div class="card">
                    <div class="card-header" id="one-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#one-collapseOne" aria-expanded="true" aria-controls="one-collapseOne">World cup</button>
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
                  <div class="card">
                    <div class="card-header" id="one-europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#one-collapseTwo" aria-expanded="false" aria-controls="one-collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="one-collapseTwo" class="collapse" aria-labelledby="one-europa" data-parent="#accordionExample-2">
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

              <div class="tab-pane fade show active" id="football" role="tabpanel" aria-labelledby="football-tab">
                <div class="accordion" id="accordionExample-1">
                  <div class="card">
                    <div class="card-header" id="world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="world-cup" data-parent="#accordionExample-1">
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
                  <div class="card">
                    <div class="card-header" id="europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="europa" data-parent="#accordionExample-1">
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
                  <div class="card">
                    <div class="card-header" id="spain">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Spain League</button>
                      </h2>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="spain" data-parent="#accordionExample-1">
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
                  <div class="card">
                    <div class="card-header" id="english-lg">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Englisg Premier League</button>
                      </h2>
                    </div>
                    <div id="collapseFour" class="collapse" aria-labelledby="english-lg" data-parent="#accordionExample-1">
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

              <div class="tab-pane fade" id="cricket" role="tabpanel" aria-labelledby="cricket-tab">
                <div class="accordion" id="accordionExample-3">
                  <div class="card">
                    <div class="card-header" id="three-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#three-collapseOne" aria-expanded="true" aria-controls="three-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="three-collapseOne" class="collapse show" aria-labelledby="three-world-cup" data-parent="#accordionExample-3">
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
                  <div class="card">
                    <div class="card-header" id="three-europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#three-collapseTwo" aria-expanded="false" aria-controls="three-collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="three-collapseTwo" class="collapse" aria-labelledby="three-europa" data-parent="#accordionExample-3">
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

              <div class="tab-pane fade" id="tennis" role="tabpanel" aria-labelledby="tennis-tab">
                <div class="accordion" id="accordionExample-4">
                  <div class="card">
                    <div class="card-header" id="four-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#four-collapseOne" aria-expanded="true" aria-controls="four-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="four-collapseOne" class="collapse show" aria-labelledby="four-world-cup" data-parent="#accordionExample-4">
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
                  <div class="card">
                    <div class="card-header" id="four-europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#four-collapseTwo" aria-expanded="false" aria-controls="four-collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="four-collapseTwo" class="collapse" aria-labelledby="four-europa" data-parent="#accordionExample-4">
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

              <div class="tab-pane fade" id="bascketball" role="tabpanel" aria-labelledby="bascketball-tab">
                <div class="accordion" id="accordionExample-5">
                  <div class="card">
                    <div class="card-header" id="five-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#five-collapseOne" aria-expanded="true" aria-controls="five-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="five-collapseOne" class="collapse show" aria-labelledby="five-world-cup" data-parent="#accordionExample-5">
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
                  <div class="card">
                    <div class="card-header" id="five-europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#five-collapseTwo" aria-expanded="false" aria-controls="five-collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="five-collapseTwo" class="collapse" aria-labelledby="five-europa" data-parent="#accordionExample-5">
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

              <div class="tab-pane fade" id="baseball" role="tabpanel" aria-labelledby="baseball-tab">
                <div class="accordion" id="accordionExample-6">
                  <div class="card">
                    <div class="card-header" id="six-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#six-collapseOne" aria-expanded="true" aria-controls="six-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="six-collapseOne" class="collapse show" aria-labelledby="six-world-cup" data-parent="#accordionExample-6">
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
                  <div class="card">
                    <div class="card-header" id="six-europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#six-collapseTwo" aria-expanded="false" aria-controls="six-collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="six-collapseTwo" class="collapse" aria-labelledby="six-europa" data-parent="#accordionExample-6">
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

              <div class="tab-pane fade" id="more" role="tabpanel" aria-labelledby="more-tab">
                <div class="accordion" id="accordionExample-7">
                  <div class="card">
                    <div class="card-header" id="seven-world-cup">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#seven-collapseOne" aria-expanded="true" aria-controls="seven-collapseOne">World cup</button>
                      </h2>
                    </div>
                    <div id="seven-collapseOne" class="collapse show" aria-labelledby="seven-world-cup" data-parent="#accordionExample-7">
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
                  <div class="card">
                    <div class="card-header" id="seven-europa">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#seven-collapseTwo" aria-expanded="false" aria-controls="seven-collapseTwo">Europa League</button>
                      </h2>
                    </div>
                    <div id="seven-collapseTwo" class="collapse" aria-labelledby="seven-europa" data-parent="#accordionExample-7">
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