<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    
  <link rel="apple-touch-icon" sizes="76x76" href="../kanu/main/로고.png">
  <link rel="icon" type="image/png" href="../kanu/main/로고.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Main : FullHouse
  </title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
  </head>
  <body>
  <%@include file="pronav.jsp" %>
    <main class="main">
      <section class="spotlight parallax bg-cover bg-size--cover" data-spotlight="fullscreen" style="background-image: url('../kanu/images/proback.jpeg')">
        <span class="mask bg-tertiary alpha-7"></span>
        <div class="spotlight-holder py-lg pt-lg-xl">
          <div class="container d-flex align-items-center no-padding">
            <div class="col">
              <div class="row cols-xs-space align-items-center text-center text-md-left justify-content-center">
                <div class="col-lg-7">
                  <div class="text-center mt-5">
                    <h1 class="heading h1 text-white">
                      			대한민국 1등 부동산 광고 플랫폼 </br>
                      			 풀 하우스
                    </h1>
					<iframe width="560" height="315" align="center" src="https://www.youtube.com/embed/GuUz6bHWR5c" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice slice-lg">
      <div class="container">
        <div class="mb-5 text-center">
          <h3 class="heading h2">Stay tuned with our company news</h3>
          <h3 class="heading h2">여기다가 일단 틀만 만들어 놓은것! </h3>
          
          
          
          <div class="fluid-paragraph text-center">
            <p class="lead mb-0">Daily insights from our company</p>
          </div>
        </div>
        <div class="row cols-md-space cols-sm-space cols-xs-space">
          <div class="col-lg-4">
            <div class="card border-0">
              <img src="../assets/images/prv/img-1-800x600.jpg" class="img-fluid img-center rounded z-depth-2">
              <div class="pt-4">
                <span class="text-muted">Oct 15, 2018</span>
                <a href="#" class="heading h4 d-block mt-1">Listen to the nature</a>
                <a href="#" class="heading h4 d-block mt-1">틀3</a>
                <p class="mt-3">
                  When we strive to become better than we are, everything around us becomes better, too.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card border-0">
              <img src="../assets/images/prv/img-2-800x600.jpg" class="img-fluid img-center rounded z-depth-2">
              <div class="pt-4">
                <span class="text-muted">Oct 15, 2018</span>
                <a href="#" class="heading h4 d-block mt-1">Listen to the nature</a>
                <a href="#" class="heading h4 d-block mt-1">틀 1</a>
                <p class="mt-3">
                  When we strive to become better than we are, everything around us becomes better, too.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card border-0">
              <img src="../assets/images/prv/img-3-800x600.jpg" class="img-fluid img-center rounded z-depth-2">
              <div class="pt-4">
                <span class="text-muted">Oct 15, 2018</span>
                <a href="#" class="heading h4 d-block mt-1">Listen to the nature</a>
                <a href="#" class="heading h4 d-block mt-1">틀2</a>
                <p class="mt-3">
                  When we strive to become better than we are, everything around us becomes better, too.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <%@include file="./footer.jsp" %>
  <!-- Core -->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/popper/popper.min.js"></script>
  <script src="../assets/js/bootstrap/bootstrap.min.js"></script>
  <!-- FontAwesome 5 -->
  <script src="../assets/vendor/fontawesome/js/fontawesome-all.min.js" defer></script>
  <!-- Page plugins -->
  <script src="../assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
  <script src="../assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
  <script src="../assets/vendor/input-mask/input-mask.min.js"></script>
  <script src="../assets/vendor/nouislider/js/nouislider.min.js"></script>
  <script src="../assets/vendor/textarea-autosize/textarea-autosize.min.js"></script>
  <!-- Theme JS -->
  <script src="../assets/js/theme.js"></script>
</body>
</html>