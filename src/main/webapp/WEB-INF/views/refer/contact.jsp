<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             ">
    <meta name="author" content="Webpixels">
    <title>Boomerang UI Kit - Free Bootstrap Framework by Webpixels</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800|Roboto:400,500,700" rel="stylesheet">
    <!-- Theme CSS -->
    <link type="text/css" href="../assets/css/theme.css" rel="stylesheet">
    <!-- Demo CSS - No need to use these in your project -->
    <link type="text/css" href="../assets/css/demo.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-transparent navbar-light bg-white py-4">
      <div class="container">
        <a class="navbar-brand" href="../"><strong>Boomerang</strong> UI Kit</a>
        <button class="navbar-toggler" type="button" data-action="offcanvas-open" data-target="#navbar_main" aria-controls="navbar_main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse offcanvas-collapse" id="navbar_main">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <h6 class="dropdown-header font-weight-600 d-lg-none px-0">Menu</h6>
            <li class="nav-item ">
              <a class="nav-link" href="../index.html">Overview</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbar_main_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
              <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
                <a class="dropdown-item" href="../pages/homepage.html">Homepage</a>
                <a class="dropdown-item" href="../pages/about.html">About us</a>
                <a class="dropdown-item" href="../pages/sign-in.html">Sign in</a>
                <a class="dropdown-item" href="../pages/contact.html">Contact</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../docs/introduction.html">Docs</a>
            </li>
            <li class="nav-item">
              <a href="https://github.com/webpixels/boomerang-ui-kit/archive/master.zip" target="_blank" class="nav-link d-lg-none">Download Free</a>
              <a href="https://github.com/webpixels/boomerang-ui-kit/archive/master.zip" target="_blank" class="btn btn-sm btn-primary d-none d-lg-inline-flex">Download Free</a>
            </li>
            <div class="dropdown-divider d-lg-none my-4"></div>
            <h6 class="dropdown-header font-weight-600 d-lg-none px-0">Social Media</h6>
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="https://instagram.com/webpixelsofficial/" target="_blank"><i class="fab fa-instagram"></i><span class="ml-2 d-lg-none">Instagram</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="https://web.facebook.com/webpixels" target="_blank"><i class="fab fa-facebook"></i><span class="ml-2 d-lg-none">Facebook</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="https://dribbble.com/webpixels" target="_blank"><i class="fab fa-dribbble"></i><span class="ml-2 d-lg-none">Dribbble</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="https://github.com/webpixels" target="_blank"><i class="fab fa-github"></i><span class="ml-2 d-lg-none">Github</span></a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <main class="main">
      <section class="slice slice-xl">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-7">
              <div class="text-center pt-lg-md">
                <h2 class="heading h1 mb-4">
                  Wanna work together?
                </h2>
                <p class="lead lh-180">
                  We are a professional digital agency providing premium themes, UI/UX design and web apps that you will simply love.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice bg-tertiary bg-cover bg-size--cover" style="background-image: url('../assets/images/backgrounds/img-1.jpg')">
        <span class="mask bg-tertiary alpha-9"></span>
        <div class="container">
          <div class="row cols-xs-space cols-sm-space cols-md-space">
            <div class="col-lg-6">
              <div class="card bg-dark alpha-container text-white border-0 overflow-hidden">
                <a href="#" target="_blank">
                  <div class="card-img-bg" style="background-image: url('../assets/images/prv/city-1.jpg');"></div>
                  <span class="mask bg-dark alpha-5 alpha-4--hover"></span>
                  <div class="card-body px-5 py-5">
                    <div style="min-height: 300px;">
                      <h3 class="heading h1 text-white mb-3">New York Office</h3>
                      <p class="mt-4 mb-1 h5 text-white lh-180">
                        E: newyork@company.com
                      </p>
                      <p class="mb-1 h5 text-white lh-180">
                        T: 0755.222.333
                      </p>
                    </div>
                    <span href="#" class="text-white text-uppercase font-weight-500">
                      See on map
                      <i class="fas fa-arrow-right ml-2"></i>
                    </span>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="card bg-dark alpha-container text-white border-0 overflow-hidden">
                <a href="#" target="_blank">
                  <div class="card-img-bg" style="background-image: url('../assets/images/prv/city-2.jpg');"></div>
                  <span class="mask bg-dark alpha-5 alpha-4--hover"></span>
                  <div class="card-body px-5 py-5">
                    <div style="min-height: 300px;">
                      <h3 class="heading h1 text-white mb-3">New York Office</h3>
                      <p class="mt-4 mb-1 h5 text-white lh-180">
                        E: newyork@company.com
                      </p>
                      <p class="mb-1 h5 text-white lh-180">
                        T: 0755.222.333
                      </p>
                    </div>
                    <span href="#" class="text-white text-uppercase font-weight-500">
                      See on map
                      <i class="fas fa-arrow-right ml-2"></i>
                    </span>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice slice-lg">
        <div class="container">
          <div class="row align-items-center cols-xs-space cols-sm-space cols-md-space">
            <div class="col-lg-6">
              <h3 class="heading h3 mb-4">Send us a message</h3>
              <form>
                <div class="row">
                  <div class="col-12">
                    <div class="form-group">
                      <input class="form-control" placeholder="Name" type="text">
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
            <div class="col-lg-5 ml-lg-auto">
              <h3 class="heading heading-3 strong-300">
                150 Southeast Pidgeon Meadow
                <br>
                Claflin Terrace, 305458
              </h3>
              <p class="lead mt-4 mb-4">
                E: <a href="#">support@webpixels.io</a>
                <br>
                T: 0755.222.333
              </p>
              <p class="">
                Probably the most complete UI kit out there. Multiple functionalities and controls added,  extended color palette and beautiful typography, designed as its own extended version of Bootstrap at  the highest level of quality.                             
              </p>
            </div>
          </div>
        </div>
      </section>
    </main>
    <footer class="pt-5 pb-3 footer  footer-dark bg-tertiary">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-4">
            <div class="pr-lg-5">
              <h1 class="heading h6 text-uppercase font-weight-700 mb-3"><strong>Boomerang</strong> UI Kit</h1>
              <p>Boomerang is a high quality UI Kit built on top of the well known Bootstrap 4 Framework. This theme was designed as its own extended version of Bootstrap with multiple functionalities and controls added, extended color palette and beautiful typography.</p>
            </div>
          </div>
          <div class="col-6 col-md">
            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">Features</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Cool stuff</a></li>
              <li><a class="text-muted" href="#">Random feature</a></li>
              <li><a class="text-muted" href="#">Team feature</a></li>
              <li><a class="text-muted" href="#">Stuff for developers</a></li>
              <li><a class="text-muted" href="#">Another one</a></li>
              <li><a class="text-muted" href="#">Last time</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">Solutions</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Resource</a></li>
              <li><a class="text-muted" href="#">Resource name</a></li>
              <li><a class="text-muted" href="#">Another resource</a></li>
              <li><a class="text-muted" href="#">Final resource</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">Resources</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Business</a></li>
              <li><a class="text-muted" href="#">Education</a></li>
              <li><a class="text-muted" href="#">Government</a></li>
              <li><a class="text-muted" href="#">Gaming</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5 class="heading h6 text-uppercase font-weight-700 mb-3">About</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Team</a></li>
              <li><a class="text-muted" href="#">Locations</a></li>
              <li><a class="text-muted" href="#">Privacy</a></li>
              <li><a class="text-muted" href="#">Terms</a></li>
            </ul>
          </div>
        </div>
        <hr>
        <div class="d-flex align-items-center">
          <span class="">
            &copy; 2018 <a href="https://webpixels.io/" class="footer-link" target="_blank">Webpixels</a>. All rights reserved.
          </span>
          <ul class="nav ml-lg-auto">
            <li class="nav-item">
              <a class="nav-link active" href="https://instagram.com/webpixelsofficial" target="_blank"><i class="fab fa-instagram"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="https://facebook.com/webpixels" target="_blank"><i class="fab fa-facebook"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="https://github.com/webpixels" target="_blank"><i class="fab fa-github"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="https://dribbble.com/webpixels" target="_blank"><i class="fab fa-dribbble"></i></a>
            </li>
          </ul>
        </div>
      </div>
    </footer>
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