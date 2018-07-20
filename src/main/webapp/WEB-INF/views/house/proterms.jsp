<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>Full House</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
  </head>
  <body>
  
  <!-- 인글루드 시작 -->
  <%@include file="pronav2.jsp" %>
	
<main class="main">
      <section class="slice slice-xl">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-7">
              <div class="text-center pt-lg-md">
                <h2 class="heading h1 mb-4">
                  이용약관
                </h2>
              </div>
            </div>
          </div>
        </div>

      <section class="slice slice-lg">
        <div class="container">
          <div class="row align-items-center cols-xs-space cols-sm-space cols-md-space">
            <div class="col-lg-6">
            
              <form>
                <div class="row"  >
                  <div class="col-12">
                    <div class="form-group">
                      <input class="form-control" placeholder="Namdfse" type="text" align="center">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <div class="form-group">
                      <input class="form-control" placeholder="Email address" type="email">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <div class="form-group">
                      <textarea class="form-control" rows="5" placeholder="Your message"></textarea>
                    </div>
                  </div>
                </div>
                <div class="mt-4">
                  <button type="submit" class="btn btn-primary px-4">
                    Send message
                  </button>
                </div>
              </form>
            </div>
         
          </div>
        </div>
      </section>
    </main>
   

</body>
</html>