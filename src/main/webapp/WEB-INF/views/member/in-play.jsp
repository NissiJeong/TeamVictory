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
      <div class="row">
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
              <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
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
              </div>

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
              </div>

              <div class="tab-pane fade" id="cricket" role="tabpanel" aria-labelledby="cricket-tab">
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
                              <i class="flaticon-cricket"></i>
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
                              <i class="flaticon-cricket"></i>
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
                              <i class="flaticon-cricket"></i>
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
                              <i class="flaticon-cricket"></i>
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
                              <i class="flaticon-cricket"></i>
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
                              <i class="flaticon-cricket"></i>
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
                              <i class="flaticon-cricket"></i>
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

              <div class="tab-pane fade" id="tennis" role="tabpanel" aria-labelledby="tennis-tab">
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
                              <i class="flaticon-tennis-racket"></i>
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
                              <i class="flaticon-tennis-racket"></i>
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
                              <i class="flaticon-tennis-racket"></i>
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
                              <i class="flaticon-tennis-racket"></i>
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
                              <i class="flaticon-tennis-racket"></i>
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
                              <i class="flaticon-tennis-racket"></i>
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
                              <i class="flaticon-tennis-racket"></i>
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
              </div>

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
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- online-play-tab-part end -->
        </div>
      </div>
    </div>
  </section>
  <!-- play-section end -->

  