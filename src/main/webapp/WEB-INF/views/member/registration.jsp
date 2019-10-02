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
              <h3 class="title">Registration</h3>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">home</a></li>
                <li class="breadcrumb-item active">Registration</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- banner-section end -->

  <section class="registration-section section-padding">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="registration-block text-center">
            <div class="registration-block-inner">
              <h3 class="title">Create a new account</h3>
              <form class="cmn-form registration-form">
                <div class="frm-group">
                  <input type="text" name="f-name" id="f-name" placeholder="First Name">
                </div>
                <div class="frm-group">
                  <input type="text" name="l-name" id="l-name" placeholder="Last Name">
                </div>
                <div class="frm-group">
                  <input type="email" name="name" id="name" placeholder="Your Email">
                </div>
                <div class="frm-group">
                  <input type="password" name="pass" id="pass" placeholder="Your Password">
                </div>
                <div class="frm-group">
                  <input type="password" name="re-pass" id="re-pass" placeholder="Enter Re-Password">
                </div>
                <div class="frm-group">
                    <button type="submit" class="submit-btn">Sign Up</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
