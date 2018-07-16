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
    <nav class="navbar navbar-expand-lg navbar-transparent navbar-dark bg-dark py-4">
      <div class="container">
        <a class="navbar-brand" href="./"><strong>Boomerang</strong> UI Kit</a>
        <button class="navbar-toggler" type="button" data-action="offcanvas-open" data-target="#navbar_main" aria-controls="navbar_main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse offcanvas-collapse" id="navbar_main">
          <ul class="navbar-nav ml-auto align-items-lg-center">
            <h6 class="dropdown-header font-weight-600 d-lg-none px-0">Menu</h6>
            <li class="nav-item active">
              <a class="nav-link" href="./index.html">Overview</a>
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
              <a href="https://github.com/webpixels/boomerang-ui-kit/archive/master.zip" target="_blank" class="btn btn-sm bg-white d-none d-lg-inline-flex">Download Free</a>
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
      <section class="spotlight parallax bg-cover bg-size--cover" data-spotlight="fullscreen" style="background-image: url('../assets/images/backgrounds/img-1.jpg')">
        <span class="mask bg-primary alpha-7"></span>
        <div class="spotlight-holder py-lg pt-lg-xl">
          <div class="container d-flex align-items-center no-padding">
            <div class="col">
              <div class="row cols-xs-space align-items-center text-center text-md-left justify-content-center">
                <div class="col-7">
                  <div class="text-center mt-5">
                    <img src="../assets/images/brand/icon.png" style="width: 200px;" class="img-fluid animated" data-animation-in="jackInTheBox" data-animation-delay="1000">
                    <h2 class="heading display-4 font-weight-400 text-white mt-5 animated" data-animation-in="fadeInUp" data-animation-delay="2000">
                      <span class="font-weight-700">Boomerang</span> UI Kit
                    </h2>
                    <p class="lead text-white mt-3 lh-180 c-white animated" data-animation-in="fadeInUp" data-animation-delay="2500">
                      Free HTML UI Kit based on the well known Bootstrap 4 Framework brought to you by <strong class="text-white">Webpixels</strong>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice slice-lg">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-10">
              <!-- Typography -->
              <div class="row align-items-center mb-5">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Typography</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/typography.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <div class="row typeface-palette cols-xs-space cols-sm-space cols-md-space">
                <div class="col-sm-4">
                  <a>
                    <div class="typeface-entry">
                      <span class="badge badge-md typeface-badge badge-pill bg-primary text-white">Regular</span>
                      <h3 class="heading display-3 font-weight-400 text-dark">
                        Aa
                      </h3>
                      <p>
                        Mist enveloped the ship three hours out from port.
                      </p>
                    </div>
                  </a>
                </div>
                <div class="col-sm-4">
                  <a>
                    <div class="typeface-entry">
                      <span class="badge badge-md typeface-badge badge-pill bg-primary text-white">Semi-bold</span>
                      <h3 class="heading display-3 font-weight-600 text-dark">
                        Aa
                      </h3>
                      <p>
                        A shining crescent far beneath the flying.
                      </p>
                    </div>
                  </a>
                </div>
                <div class="col-sm-4">
                  <a data-value="'Quicksand', sans-serif">
                    <div class="typeface-entry">
                      <span class="badge badge-md typeface-badge badge-pill bg-primary text-white">Bold</span>
                      <h3 class="heading display-3 font-weight-700 text-dark">
                        Aa
                      </h3>
                      <p>
                        A shining crescent far beneath the flying.
                      </p>
                    </div>
                  </a>
                </div>
              </div>
              <!-- Color palette -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Color palette</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/colors.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p>Boomerang has extended the color palette that Bootstrap offers by default. Instead of two primary colors, you get now three. These can be easily customized using the included Sass files.</p>
              <div class="row-wrapper">
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Primary colors</h3>
                <div class="row color-palette cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Primary">
                      <div class="color-entry bg-primary">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #288cff
                        </span>
                      </div>
                    </a>
                  </div>
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Secondary">
                      <div class="color-entry bg-secondary">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #e8f2ff
                        </span>
                      </div>
                    </a>
                  </div>
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Tertiary">
                      <div class="color-entry bg-tertiary">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #192b3f
                        </span>
                      </div>
                    </a>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Other colors</h3>
                <div class="row color-palette cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Warning">
                      <div class="color-entry bg-warning">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #ff3b00
                        </span>
                      </div>
                    </a>
                  </div>
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Danger">
                      <div class="color-entry bg-danger">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #ff0033
                        </span>
                      </div>
                    </a>
                  </div>
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Success">
                      <div class="color-entry bg-success">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #43c115
                        </span>
                      </div>
                    </a>
                  </div>
                </div>
                <div class="row color-palette cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Warning">
                      <div class="color-entry bg-info">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #73e9ef
                        </span>
                      </div>
                    </a>
                  </div>
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Danger">
                      <div class="color-entry bg-dark">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #3f87f5
                        </span>
                      </div>
                    </a>
                  </div>
                  <div class="col-4">
                    <a href="#" data-toggle="tooltip" title="Success">
                      <div class="color-entry bg-light">
                        <span class="color-code z-depth-2 font-weight-bold text-uppercase rounded">
                          #3f87f5
                        </span>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <!-- Form elements -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Form elements</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/forms.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">We have extended the form functionalities by including more options and plugins such as: selectpickers, input masks, sliders, tags input, toggle switches, custom checkboxes and radio buttons. It is, by far, the most complete free UI Kit version ever offered. Curious about how the PRO version will be like? Stay tuned!</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control" placeholder="Default">
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control is-valid" placeholder="Is valid">
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control is-invalid" placeholder="Is invalid">
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <input type="text" class="form-control" placeholder="Disabled" disabled>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <div class="input-group input-group-transparent mb-4">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Search">
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <div class="input-group input-group-transparent mb-4">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Username">
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <div class="input-group input-group-transparent mb-4">
                        <input type="text" class="form-control" placeholder="Birthday">
                        <div class="input-group-append">
                          <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="form-group">
                      <div class="input-group input-group-transparent mb-4">
                        <input type="text" class="form-control" placeholder="Credit card">
                        <div class="input-group-append">
                          <span class="input-group-text"><i class="fas fa-credit-card"></i></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Selectpickers</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" title="Simple select">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                      <option>Modals</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" title="Option groups">
                      <optgroup label="Components">
                        <option>Alerts</option>
                        <option>Badges</option>
                        <option>Buttons</option>
                        <option>Cards</option>
                      </optgroup>
                      <optgroup label="Utilities">
                        <option>Borders</option>
                        <option>Colors</option>
                        <option>Typography</option>
                      </optgroup>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" multiple title="Multiple select">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                      <option>Modals</option>
                      <option>Borders</option>
                      <option>Colors</option>
                      <option>Typography</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" multiple data-selected-text-format="count" title="Selected text format">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                      <option>Modals</option>
                      <option>Borders</option>
                      <option>Colors</option>
                      <option>Typography</option>
                    </select>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" data-live-search="true" data-live-search-placeholder="Search ..." title="Live search">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                      <option>Modals</option>
                      <option>Borders</option>
                      <option>Colors</option>
                      <option>Typography</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" data-live-search="true" title="Keyword search">
                      <option data-tokens="alerts notifications">Alerts</option>
                      <option data-tokens="badges labels">Badges</option>
                      <option data-tokens="buttons links">Buttons</option>
                      <option data-tokens="cards content">Cards</option>
                      <option data-tokens="forms input">Forms</option>
                      <option data-tokens="typography headings paragraphs">Typography</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" title="Icons">
                      <option data-icon="fas fa-bell">Alerts</option>
                      <option data-icon="fas fa-certificate">Badges</option>
                      <option data-icon="fas fa-square">Cards</option>
                      <option data-icon="fas fa-wpforms">Forms</option>
                      <option data-icon="fas fa-window-maximize">Modals</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" title="Subtext">
                      <option data-subtext="This is a subtext">Hot Dog, Fries and a Soda</option>
                      <option data-subtext="This is a subtext">Burger, Shake and a Smile</option>
                      <option data-subtext="This is a subtext">Sugar, Spice and all things nice</option>
                    </select>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" data-style="btn-primary" title="Primary color">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" data-style="btn-success" title="Success color">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" data-style="btn-danger" title="Danger color">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                    </select>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <select class="selectpicker" data-style="btn-warning" title="Warning color">
                      <option>Alerts</option>
                      <option>Badges</option>
                      <option>Buttons</option>
                      <option>Cards</option>
                      <option>Forms</option>
                    </select>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Tags input</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-12">
                    <div class="example">
                      <input type="text" class="form-control" value="Amsterdam,Washington,Sydney,Beijing,Cairo" data-role="tagsinput" />
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Checkboxes</h3>
                    <div class="row cols-xs-space cols-sm-space cols-md-space">
                      <div class="col-md-6">
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input" id="customCheck1">
                          <label class="custom-control-label" for="customCheck1">Unchecked</label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input" id="customCheck2" checked="">
                          <label class="custom-control-label" for="customCheck2">Checked</label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input" id="customCheck3" disabled="">
                          <label class="custom-control-label" for="customCheck3">Disabled unchecked</label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input" id="customCheck4" checked="" disabled="">
                          <label class="custom-control-label" for="customCheck4">Disabled checked</label>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input is-valid" id="customCheck5">
                          <label class="custom-control-label" for="customCheck5">Valid checkbox</label>
                        </div>
                        <div class="custom-control custom-checkbox mb-3">
                          <input type="checkbox" class="custom-control-input is-invalid" id="customCheck6">
                          <label class="custom-control-label" for="customCheck6">Invalid checkbox</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Radios</h3>
                    <div class="row cols-xs-space cols-sm-space cols-md-space">
                      <div class="col-md-6">
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" name="custom-radio-1" class="custom-control-input" id="customRadio1">
                          <label class="custom-control-label" for="customRadio1">Unchecked</label>
                        </div>
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" name="custom-radio-1"  class="custom-control-input" id="customRadio2" checked="">
                          <label class="custom-control-label" for="customRadio2">Checked</label>
                        </div>
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" name="custom-radio-1"  class="custom-control-input" id="customRadio3" disabled="">
                          <label class="custom-control-label" for="customRadio3">Disabled unchecked</label>
                        </div>
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" name="custom-radio-1"  class="custom-control-input" id="customRadio4" checked="" disabled="">
                          <label class="custom-control-label" for="customRadio4">Disabled checkbox</label>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" name="custom-radio-1" class="custom-control-input is-valid" id="customRadio5">
                          <label class="custom-control-label" for="customRadio5">Valid radio</label>
                        </div>
                        <div class="custom-control custom-radio mb-3">
                          <input type="radio" name="custom-radio-1"  class="custom-control-input is-invalid" id="customRadio6" checked="">
                          <label class="custom-control-label" for="customRadio6">Invalid radio</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Switches</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Untoggled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox">
                      <span class="toggle-switch-slider"></span>
                    </label>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Toggled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox" checked>
                      <span class="toggle-switch-slider"></span>
                    </label>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Disabled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox" disabled>
                      <span class="toggle-switch-slider"></span>
                    </label>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Disabled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox" disabled checked>
                      <span class="toggle-switch-slider"></span>
                    </label>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Untoggled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox">
                      <span class="toggle-switch-slider rounded-circle"></span>
                    </label>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Toggled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox" checked>
                      <span class="toggle-switch-slider rounded-circle"></span>
                    </label>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Disabled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox" disabled>
                      <span class="toggle-switch-slider rounded-circle"></span>
                    </label>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <label class="d-block">Disabled switch</label>
                    <label class="toggle-switch">
                      <input type="checkbox" disabled checked>
                      <span class="toggle-switch-slider rounded-circle"></span>
                    </label>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Sliders</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <!-- Default input slider -->
                    <div class="input-slider-container">
                      <div id="input-slider" class="input-slider" data-range-value-min="100" data-range-value-max="500"></div>
                      <!-- Input slider values -->
                      <div class="row mt-3">
                        <div class="col-6">
                          <span id="input-slider-value" class="range-slider-value" data-range-value-low="100"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="range-slider-wrapper">
                      <!-- Range slider container -->
                      <div id="input-slider-range" data-range-value-min="100" data-range-value-max="500"></div>
                      <!-- Range slider values -->
                      <div class="row cols-xs-space cols-sm-space cols-md-space">
                        <div class="col-6">
                          <span class="range-slider-value value-low" data-range-value-low="200" id="input-slider-range-value-low"></span>
                        </div>
                        <div class="col-6 text-right">
                          <span class="range-slider-value value-high" data-range-value-high="400" id="input-slider-range-value-high"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Buttons -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Buttons</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/buttons.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">Beautiful buttons with plenty of options and styles, including the animated and social versions.</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <h3 class="heading h6 text-uppercase text-primary mb-4">Primary</h3>
                    <button type="button" class="btn btn-block btn-primary">Default</button>
                    <button type="button" class="btn btn-block btn-primary active">Active</button>
                    <button type="button" class="btn btn-block btn-primary" disabled>Disabled</button>
                    <button type="button" class="btn btn-block btn-primary">
                      <i class="fas fa-circle-notch fa-spin"></i>
                    </button>
                    <button type="button" class="btn btn-block btn-outline-primary mt-5">Outline</button>
                    <button type="button" class="btn btn-block btn-outline-primary active">Outline Active</button>
                    <button type="button" class="btn btn-block btn-outline-primary" disabled>Outline Disabled</button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <h3 class="heading h6 text-uppercase text-primary mb-4">Secondary</h3>
                    <button type="button" class="btn btn-block btn-secondary">Default</button>
                    <button type="button" class="btn btn-block btn-secondary active">Active</button>
                    <button type="button" class="btn btn-block btn-secondary" disabled>Disabled</button>
                    <button type="button" class="btn btn-block btn-secondary">
                      <i class="fas fa-circle-notch fa-spin"></i>
                    </button>
                    <button type="button" class="btn btn-block btn-outline-secondary mt-5">Outline</button>
                    <button type="button" class="btn btn-block btn-outline-secondary active">Outline Active</button>
                    <button type="button" class="btn btn-block btn-outline-secondary" disabled>Outline Disabled</button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <h3 class="heading h6 text-uppercase text-primary mb-4">Tertiary</h3>
                    <button type="button" class="btn btn-block btn-tertiary">Default</button>
                    <button type="button" class="btn btn-block btn-tertiary active">Active</button>
                    <button type="button" class="btn btn-block btn-tertiary" disabled>Disabled</button>
                    <button type="button" class="btn btn-block btn-tertiary">
                      <i class="fas fa-circle-notch fa-spin"></i>
                    </button>
                    <button type="button" class="btn btn-block btn-outline-tertiary mt-5">Outline</button>
                    <button type="button" class="btn btn-block btn-outline-tertiary active">Outline Active</button>
                    <button type="button" class="btn btn-block btn-outline-tertiary" disabled>Outline Disabled</button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <h3 class="heading h6 text-uppercase text-primary mb-4">Danger</h3>
                    <button type="button" class="btn btn-block btn-danger">Default</button>
                    <button type="button" class="btn btn-block btn-danger active">Active</button>
                    <button type="button" class="btn btn-block btn-danger" disabled>Disabled</button>
                    <button type="button" class="btn btn-block btn-danger">
                      <i class="fas fa-circle-notch fa-spin"></i>
                    </button>
                    <button type="button" class="btn btn-block btn-outline-danger mt-5">Outline</button>
                    <button type="button" class="btn btn-block btn-outline-danger active">Outline Active</button>
                    <button type="button" class="btn btn-block btn-outline-danger" disabled>Outline Disabled</button>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-12">
                    <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Animated</h3>
                    <div class="btn-container">
                      <button type="button" class="btn btn-primary btn-animated btn-animated-x">
                        <span class="btn-inner--visible">Play music</span>
                        <span class="btn-inner--hidden"><i class="fas fa-play"></i></span>
                      </button>
                      <button type="button" class="btn btn-secondary btn-animated btn-animated-y">
                        <span class="btn-inner--hidden">Buy</span>
                        <span class="btn-inner--visible"><i class="fas fa-shopping-cart"></i></span>
                      </button>
                      <button type="button" class="btn btn-primary btn-animated btn-animated-x">
                        <span class="btn-inner--visible">Next step</span>
                        <span class="btn-inner--hidden"><i class="fas fa-arrow-right"></i></span>
                      </button>
                      <button type="button" class="btn btn-dark btn-animated btn-animated-y">
                        <span class="btn-inner--visible"><i class="fas fa-play"></i></span>
                        <span class="btn-inner--hidden"><i class="fas fa-pause"></i></span>
                      </button>
                    </div>
                    <div class="row cols-xs-space cols-sm-space cols-md-space">
                      <div class="col-lg-6">
                        <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Only icons</h3>
                        <div class="btn-container">
                          <button type="button" class="btn btn-primary btn-icon-only">
                            <span class="btn-inner--icon"><i class="fas fa-user"></i></span>
                          </button>
                          <button type="button" class="btn btn-secondary btn-icon-only">
                            <span class="btn-inner--icon"><i class="fas fa-arrow-left"></i></span>
                          </button>
                          <button type="button" class="btn btn-danger btn-icon-only">
                            <span class="btn-inner--icon"><i class="fas fa-trash-alt"></i></span>
                          </button>
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Rounded circle</h3>
                        <div class="btn-container">
                          <button type="button" class="btn btn-primary btn-icon-only rounded-circle">
                            <span class="btn-inner--icon"><i class="fas fa-user"></i></span>
                          </button>
                          <button type="button" class="btn btn-secondary btn-icon-only rounded-circle">
                            <span class="btn-inner--icon"><i class="fas fa-arrow-left"></i></span>
                          </button>
                          <button type="button" class="btn btn-danger btn-icon-only rounded-circle">
                            <span class="btn-inner--icon"><i class="fas fa-trash-alt"></i></span>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Social buttons</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-facebook btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-facebook"></i></span>
                      <span class="btn-inner--text">Facebook</span>
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-twitter btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-twitter"></i></span>
                      <span class="btn-inner--text">Twitter</span>
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-google-plus btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-google-plus-g"></i></span>
                      <span class="btn-inner--text">Google +</span>
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-instagram btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-instagram"></i></span>
                      <span class="btn-inner--text">Instagram</span>
                    </button>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-pinterest btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-pinterest"></i></span>
                      <span class="btn-inner--text">Pinterest</span>
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-youtube btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-youtube"></i></span>
                      <span class="btn-inner--text">Youtube</span>
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-slack btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-slack"></i></span>
                      <span class="btn-inner--text">Slack</span>
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-dribbble btn-icon-label">
                      <span class="btn-inner--icon"><i class="fab fa-dribbble"></i></span>
                      <span class="btn-inner--text">Dribbble</span>
                    </button>
                  </div>
                </div>
              </div>
              <!-- Dropdown -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Dropdown</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/dropdowns.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">Can this UI kit get any better? We guess so. Check out these cool dropdowns where we have included some pre-build styles for <strong>user account settings</strong> and <strong>notifications</strong>.</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <div class="dropdown">
                      <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown button
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        User account
                      </button>
                      <div class="dropdown-menu">
                        <h6 class="dropdown-header">User menu</h6>
                        <a class="dropdown-item" href="#">
                          <span class="float-right badge badge-primary">4</span>
                          <i class="fas fa-envelope text-primary"></i>Messages
                        </a>
                        <a class="dropdown-item" href="#">
                          <i class="fas fa-cog text-primary"></i>Settings
                        </a>
                        <div class="dropdown-divider" role="presentation"></div>
                        <a class="dropdown-item" href="#">
                          <i class="fas fa-sign-out-alt text-primary"></i>Sign out
                        </a>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Notifications
                      </button>
                      <div class="dropdown-menu dropdown-menu-xl py-0">
                        <div class="py-3 px-3">
                          <h5 class="heading h6 mb-0">Notifications</h5>
                        </div>
                        <div class="list-group">
                          <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                            <div class="list-group-img">
                              <span class="avatar bg-purple">JD</span>
                            </div>
                            <div class="list-group-content">
                              <div class="list-group-heading">Johnyy Depp <small>10:05 PM</small></div>
                              <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                            </div>
                          </a>
                          <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                            <div class="list-group-img">
                              <span class="avatar bg-pink">TC</span>
                            </div>
                            <div class="list-group-content">
                              <div class="list-group-heading">Tom Cruise <small>10:05 PM</small></div>
                              <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                            </div>
                          </a>
                          <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                            <div class="list-group-img">
                              <span class="avatar bg-blue">WS</span>
                            </div>
                            <div class="list-group-content">
                              <div class="list-group-heading">Will Smith <small>10:05 PM</small></div>
                              <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                            </div>
                          </a>
                        </div>
                        <div class="py-3 text-center">
                          <a href="#" class="link link-sm link--style-3">View all notifications</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Modals -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Modals</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/modal.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">We love colorful modals. That's why you get now more styles with eye catching colors that you will simply love.</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-block btn-light" data-toggle="modal" data-target="#modal_1">
                      Default modal
                    </button>
                    <!-- Modal -->
                    <div class="modal modal-fluid fade" id="modal_1" tabindex="-1" role="dialog" aria-labelledby="modal_1" aria-hidden="true">
                      <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                          <div class="modal-body">
                            <div class="row justify-content-center">
                              <div class="col-lg-8 text-center py-4">
                                <h4 class="heading h3">Unleash your creativity!</h4>
                                <p class="lead text-muted">
                                  You can easy create stackable modal boxes. For example, your inline content or Ajax response can contain a gallery:
                                </p>
                                <div class="py-md">
                                  <img src="../assets/images/prv/splash.png" class="img-fluid img-center">
                                </div>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Let's do this!</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-block btn-danger" data-toggle="modal" data-target="#modal_5">
                      Danger modal
                    </button>
                    <!-- Modal -->
                    <div class="modal modal-danger fade" id="modal_5" tabindex="-1" role="dialog" aria-labelledby="modal_5" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="modal_title_6">This is way to dangerous</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <div class="py-3 text-center">
                              <i class="fas fa-exclamation-circle fa-4x"></i>
                              <h4 class="heading mt-4">Should we stop now?</h4>
                              <p>
                                You can easy create stackable modal boxes. For example, your inline content or Ajax response can contain a gallery:
                              </p>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Probably not</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Popovers and tooltips -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Popovers &amp; Tooltips</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/tooltips.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <div class="row-wrapper">
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Tooltips</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-toggle="tooltip" data-placement="top" title="Tooltip on top">
                      Tooltip on top
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-toggle="tooltip" data-placement="right" title="Tooltip on right">
                      Tooltip on right
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">
                      Tooltip on bottom
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-toggle="tooltip" data-placement="left" title="Tooltip on left">
                      Tooltip on left
                    </button>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Popovers</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-container="body" data-title="Please, help!" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                      Popover on top
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-container="body" data-toggle="popover" data-color="primary" data-placement="right" data-title="Please, help!" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                      Popover on right
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-container="body" data-toggle="popover" data-color="secondary" data-placement="bottom" data-title="Please, help!" data-title="Please, help!" data-content="Vivamus
							sagittis lacus vel augue laoreet rutrum faucibus.">
                      Popover on bottom
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-secondary" data-container="body" data-toggle="popover" data-color="tertiary" data-placement="left" data-title="Please, help!" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                      Popover on left
                    </button>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-danger" data-container="body" data-toggle="popover" data-color="danger" data-placement="top" data-title="Please, help!" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                      Danger popover
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-warning" data-container="body" data-toggle="popover" data-color="warning" data-placement="right" data-title="Please, help!" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                      Warning popover
                    </button>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <button type="button" class="btn btn-block btn-success" data-container="body" data-toggle="popover" data-color="success" data-placement="left" data-title="Please, help!" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                      Success popover
                    </button>
                  </div>
                </div>
              </div>
              <!-- Avatars -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Avatars</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/avatars.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">Multiple style and sizes for avatars inspired by the Material Design.</p>
              <div class="row-wrapper">
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Large</h3>
                <span class="clearfix"></span>
                <span class="avatar avatar-lg bg-blue mr-3">WS</span>
                <span class="avatar avatar-lg bg-twitter mr-3"><i class="fab fa-twitter"></i></span>
                <span class="avatar avatar-lg bg-red mr-3"><i class="fas fa-heart"></i></span>
                <span class="avatar avatar-lg mr-3">A</span>
                <img src="../assets/images/prv/thumb-1.jpg" class="avatar avatar-lg mr-3">
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Medium</h3>
                <span class="clearfix"></span>
                <span class="avatar bg-blue mr-3">WS</span>
                <span class="avatar bg-twitter mr-3"><i class="fab fa-twitter"></i></span>
                <span class="avatar bg-red mr-3"><i class="fas fa-heart"></i></span>
                <span class="avatar mr-3">A</span>
                <img src="../assets/images/prv/thumb-1.jpg" class="avatar mr-3">
                <span class="clearfix"></span>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Small</h3>
                <span class="avatar avatar-sm bg-blue mr-3">WS</span>
                <span class="avatar avatar-sm bg-twitter mr-3"><i class="fab fa-twitter"></i></span>
                <span class="avatar avatar-sm bg-red mr-3"><i class="fas fa-heart"></i></span>
                <span class="avatar avatar-sm mr-3">A</span>
                <img src="../assets/images/prv/thumb-1.jpg" class="avatar avatar-sm">
              </div>
              <!-- Navbar -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Navbar</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/navbar.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">Navigation made simple with multiple color variations that can be changed with the pre-defined modifier classes. The PRO version will come with even more options and layout styles. Stay tuned!</p>
              <div class="mb-5">
                <nav class="navbar navbar-expand-lg navbar-dark bg-primary rounded">
                  <a class="navbar-brand" href="#">Boomerang</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_example_1" aria-controls="navbar_example_1" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbar_example_1">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbar_1_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                      </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                      <li class="nav-item">
                        <a class="nav-link nav-link-icon" href="#"><i class="fas fa-cogs"></i></a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link nav-link-icon" href="#" id="navbar_1_dropdown_2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i></a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-xl py-0">
                          <div class="py-3 px-3">
                            <h5 class="heading h6 mb-0">Notifications</h5>
                          </div>
                          <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                              <div class="list-group-img">
                                <span class="avatar bg-purple">JD</span>
                              </div>
                              <div class="list-group-content">
                                <div class="list-group-heading">Johnyy Depp <small>10:05 PM</small></div>
                                <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                              </div>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                              <div class="list-group-img">
                                <span class="avatar bg-pink">TC</span>
                              </div>
                              <div class="list-group-content">
                                <div class="list-group-heading">Tom Cruise <small>10:05 PM</small></div>
                                <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                              </div>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                              <div class="list-group-img">
                                <span class="avatar bg-blue">WS</span>
                              </div>
                              <div class="list-group-content">
                                <div class="list-group-heading">Will Smith <small>10:05 PM</small></div>
                                <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                              </div>
                            </a>
                          </div>
                          <div class="py-3 text-center">
                            <a href="#" class="link link-sm link--style-3">View all notifications</a>
                          </div>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link nav-link-icon" href="#" id="navbar_1_dropdown_3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user"></i></a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <h6 class="dropdown-header">User menu</h6>
                          <a class="dropdown-item" href="#">
                            <span class="float-right badge badge-primary">4</span>
                            <i class="fas fa-envelope text-primary"></i>Messages
                          </a>
                          <a class="dropdown-item" href="#">
                            <i class="fas fa-cog text-primary"></i>Settings
                          </a>
                          <div class="dropdown-divider" role="presentation"></div>
                          <a class="dropdown-item" href="#">
                            <i class="fas fa-sign-out-alt text-primary"></i>Sign out
                          </a>
                        </div>
                      </li>
                    </ul>
                  </div>
                </nav>
              </div>
              <div class="mb-5">
                <nav class="navbar navbar-expand-lg navbar-light bg-secondary rounded">
                  <a class="navbar-brand" href="#">Boomerang</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_example_2" aria-controls="navbar_example_2" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbar_example_2">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbar_1_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                      </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                      <li class="nav-item">
                        <a class="nav-link nav-link-icon" href="#"><i class="fas fa-cogs"></i></a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link nav-link-icon" href="#" id="navbar_2_dropdown_2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i></a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-xl py-0">
                          <div class="py-3 px-3">
                            <h5 class="heading h6 mb-0">Notifications</h5>
                          </div>
                          <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                              <div class="list-group-img">
                                <span class="avatar bg-purple">JD</span>
                              </div>
                              <div class="list-group-content">
                                <div class="list-group-heading">Johnyy Depp <small>10:05 PM</small></div>
                                <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                              </div>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                              <div class="list-group-img">
                                <span class="avatar bg-pink">TC</span>
                              </div>
                              <div class="list-group-content">
                                <div class="list-group-heading">Tom Cruise <small>10:05 PM</small></div>
                                <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                              </div>
                            </a>
                            <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                              <div class="list-group-img">
                                <span class="avatar bg-blue">WS</span>
                              </div>
                              <div class="list-group-content">
                                <div class="list-group-heading">Will Smith <small>10:05 PM</small></div>
                                <p class="text-sm">Lorem ipsum dolor sit amet consectetur adipiscing eiusmod tempor</p>
                              </div>
                            </a>
                          </div>
                          <div class="py-3 text-center">
                            <a href="#" class="link link-sm link--style-3">View all notifications</a>
                          </div>
                        </div>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link nav-link-icon" href="#" id="navbar_2_dropdown_3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user"></i></a>
                        <div class="dropdown-menu dropdown-menu-right">
                          <h6 class="dropdown-header">User menu</h6>
                          <a class="dropdown-item" href="#">
                            <span class="float-right badge badge-primary">4</span>
                            <i class="fas fa-envelope text-primary"></i>Messages
                          </a>
                          <a class="dropdown-item" href="#">
                            <i class="fas fa-cog text-primary"></i>Settings
                          </a>
                          <div class="dropdown-divider" role="presentation"></div>
                          <a class="dropdown-item" href="#">
                            <i class="fas fa-sign-out-alt text-primary"></i>Sign out
                          </a>
                        </div>
                      </li>
                    </ul>
                  </div>
                </nav>
              </div>
              <div class="">
                <nav class="navbar navbar-expand-lg navbar-dark bg-tertiary rounded">
                  <a class="navbar-brand" href="#">Boomerang</a>
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_3" aria-controls="navbar_3" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbar_3">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbar_3_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                      </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                      <input class="form-control form-control-sm mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-sm btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                  </div>
                </nav>
              </div>
              <!-- Tabs -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Tabs</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/navs.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">Customize with ease the tab's navigation with any of the icons offered by Font Awesome. Check out the dedicated section to see all examples.</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <ul class="nav nav-pills nav-fill flex-column flex-sm-row" id="myTab" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link mb-sm-3 active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">UI/UX Design</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link mb-sm-3" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Programming</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link mb-sm-3" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Web Development</a>
                      </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                      <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
                        <p>Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <p>Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
                        <p>Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <ul class="nav nav-pills nav-fill mb-3" id="tabs_2" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#tabs_2_1" role="tab" aria-controls="home" aria-selected="true">
                          <span class="nav-link-icon d-block"><i class="fab fa-connectdevelop fa-2x"></i></span>
                          <span class="d-none d-sm-block mt-3">UI/UX Design</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#tabs_2_2" role="tab" aria-controls="profile" aria-selected="false">
                          <span class="nav-link-icon d-block"><i class="fas fa-code fa-2x"></i></span>
                          <span class="d-none d-sm-block mt-3">Programming</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#tabs_2_3" role="tab" aria-controls="contact" aria-selected="false">
                          <span class="nav-link-icon d-block"><i class="fab fa-node-js fa-2x"></i></span>
                          <span class="d-none d-sm-block mt-3">Web Development</span>
                        </a>
                      </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                      <div class="tab-pane fade show active" id="tabs_2_1" role="tabpanel" aria-labelledby="home-tab">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
                        <p>Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div class="tab-pane fade" id="tabs_2_2" role="tabpanel" aria-labelledby="profile-tab">
                        <p>Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                      <div class="tab-pane fade" id="tabs_2_3" role="tabpanel" aria-labelledby="contact-tab">
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
                        <p>Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Other elements -->
              <h2 class="heading h3 mb-3" style="margin-top: 7rem;">Other elements</h2>
              <p class="mb-5">Check out these customized UI components with extended functionalities and styles. From progress bars, basges, alerts, badges you get everything you need in beautiful free pack. <a href="../docs/introduction.html">Learn more in the Docs</a></p>
              <div class="row-wrapper">
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Progress</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <!-- Default -->
                    <div class="progress-wrapper mt-0 mb-5">
                      <div class="progress bg-primary">
                        <div class="progress-bar bg-base-1" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <!-- Default -->
                    <div class="progress-wrapper mt-0 mb-5">
                      <div class="progress bg-secondary">
                        <div class="progress-bar bg-base-1" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <!-- Outer label and percentage -->
                    <div class="progress-wrapper">
                      <h4 class="progress-label text-uppercase">Style 2</h4>
                      <h4 class="progress-percentage text-uppercase">40%</h4>
                      <div class="progress" style="height: 5px;">
                        <div class="progress-bar bg-purple" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <!-- Outer label and percentage -->
                    <div class="progress-wrapper">
                      <h4 class="progress-label text-uppercase">Style 2</h4>
                      <h4 class="progress-percentage text-uppercase">40%</h4>
                      <div class="progress" style="height: 5px;">
                        <div class="progress-bar bg-cyan" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <!-- Label as tooltip -->
                    <div class="progress-wrapper">
                      <h4 class="progress-tooltip text-uppercase" style="left: 60%;">Identity</h4>
                      <div class="progress" style="height: 3px;">
                        <div class="progress-bar bg-dark" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <!-- Label as tooltip -->
                    <div class="progress-wrapper">
                      <h4 class="progress-tooltip text-uppercase" style="left: 60%;">Identity</h4>
                      <div class="progress" style="height: 3px;">
                        <div class="progress-bar bg-red" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Badges</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <div class="mb-4">
                      <span class="badge badge-pill badge-primary text-uppercase">Primary</span>
                      <span class="badge badge-pill badge-secondary text-uppercase">Secondary</span>
                      <span class="badge badge-pill badge-success text-uppercase">Success</span>
                      <span class="badge badge-pill badge-danger text-uppercase">Danger</span>
                      <span class="badge badge-pill badge-warning text-uppercase">Warning</span>
                      <span class="badge badge-pill badge-info text-uppercase">Info</span>
                    </div>
                    <div class="mb-4">
                      <span class="badge badge-md badge-pill badge-primary text-uppercase">Primary</span>
                      <span class="badge badge-md badge-pill badge-secondary text-uppercase">Secondary</span>
                      <span class="badge badge-md badge-pill badge-success text-uppercase">Success</span>
                      <span class="badge badge-md badge-pill badge-danger text-uppercase">Danger</span>
                      <span class="badge badge-md badge-pill badge-warning text-uppercase">Warning</span>
                      <span class="badge badge-md badge-pill badge-info text-uppercase">Info</span>
                    </div>
                    <div class="">
                      <span class="badge badge-lg badge-pill badge-primary text-uppercase">Primary</span>
                      <span class="badge badge-lg badge-pill badge-secondary text-uppercase">Secondary</span>
                      <span class="badge badge-lg badge-pill badge-success text-uppercase">Success</span>
                      <span class="badge badge-lg badge-pill badge-danger text-uppercase">Danger</span>
                      <span class="badge badge-lg badge-pill badge-warning text-uppercase">Warning</span>
                      <span class="badge badge-lg badge-pill badge-info text-uppercase">Info</span>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="">
                      <button type="button" class="btn btn-primary">
                        Notifications <span class="badge badge-light ml-2">4</span>
                      </button>
                    </div>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Pagination</h3>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-6">
                    <!-- Pagination with text -->
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                    </nav>
                  </div>
                  <div class="col-lg-6">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                      <ul class="pagination pagination-lg">
                        <li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-left"></i></a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li>
                      </ul>
                    </nav>
                  </div>
                </div>
                <h3 class="heading h6 text-uppercase text-primary mt-5 mb-4">Alerts</h3>
                <div class="alert alert-primary alert-dismissible fade show" role="alert">
                  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                  <button type="button" class="undo" aria-label="Undo">Undo</button>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                  <button type="button" class="undo" aria-label="Undo">Undo</button>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                  <button type="button" class="undo" aria-label="Undo">Undo</button>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                  <button type="button" class="undo" aria-label="Undo">Undo</button>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                  <button type="button" class="undo" aria-label="Undo">Undo</button>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="alert alert-dark alert-dismissible fade show" role="alert">
                  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                  <button type="button" class="undo" aria-label="Undo">Undo</button>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
              </div>
              <!-- Typography -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Typography</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="../docs/typography.html" class="btn btn-sm btn-primary">Open in Docs</a>
                </div>
              </div>
              <p class="mb-5">Useful modifier classes and options were added to make typography look beautiful. We chose the <strong>Nunito</strong> typeface for this UI Kit. Easy to read, it looks great in every scenario with a little bit of roundness to make it even more gorgeous.</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3">
                    <h3 class="heading h6 text-uppercase text-primary">Headings</h3>
                  </div>
                  <div class="col-lg-9">
                    <h1 class="heading heading-1 mb-4">h1. Boomerang heading</h1>
                    <h2 class="heading heading-2 mb-4">h2. Boomerang heading</h2>
                    <h3 class="heading heading-3 mb-4">h3. Boomerang heading</h3>
                    <h4 class="heading heading-4 mb-4">h4. Boomerang heading</h4>
                    <h5 class="heading heading-5 mb-4">h5. Boomerang heading</h5>
                    <h6 class="heading heading-6">h6. Boomerang heading</h6>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3">
                    <h3 class="heading h6 text-uppercase text-primary">Paragraph</h3>
                  </div>
                  <div class="col-lg-9">
                    <p>
                      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.
                    </p>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3">
                    <h3 class="heading h6 text-uppercase text-primary">Lead text</h3>
                  </div>
                  <div class="col-lg-9">
                    <p class="lead">
                      Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.
                    </p>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col-lg-3">
                    <h3 class="heading h6 text-uppercase text-primary">Quote</h3>
                  </div>
                  <div class="col-lg-9">
                    <blockquote class="blockquote">
                      <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                      <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
                    </blockquote>
                  </div>
                </div>
              </div>
              <!-- Icons -->
              <div class="row align-items-center mb-4 mt-lg">
                <div class="col-8">
                  <h2 class="heading h3 mb-0">Icons</h2>
                </div>
                <div class="col-4 text-right">
                  <a href="https://fontawesome.com/icons" target="_blank" class="btn btn-sm btn-primary">See all icons</a>
                </div>
              </div>
              <p class="mb-5">For this UI kit we are using the latest library of Font Awesome 5 which comes with plenty of icons and styles: solid, regular and light. There is a FREE version and a PRO one. Each user who wants to benefit of all its features should get a license.</p>
              <div class="row-wrapper">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-address-book" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-adjust" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-archive" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-balance-scale" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bed" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bell" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bicycle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1 d-sm-none">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bicycle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1 d-sm-none d-md-none">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bicycle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1 d-sm-none d-md-none">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bicycle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1 d-sm-none d-md-none">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bicycle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col lg-1 d-sm-none d-md-none">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bicycle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-double-up" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-double-down" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-double-right" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-double-left" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-up" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-right" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-angle-down" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bullhorn" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-bullseye" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-calendar" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-camera-retro" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-chart-bar" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-check-circle" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-clock" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-cloud-download-alt" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fab fa-cloudscale" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fab fa-cloudsmith" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-code" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-cogs" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-comment-alt" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-compass" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-credit-card" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-envelope-open" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-frown" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-hand-peace" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-handshake" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-heart" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="text-center">
                      <div class="px-2 py-3">
                        <i class="fas fa-jenkins" style="font-size: 24px;"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center mt-5">
                <a href="https://fontawesome.com/icons" target="_blank" class="btn btn-primary">See all icons</a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice slice-lg bg-tertiary bg-cover bg-size--contain" style="background-image: url('../assets/images/backgrounds/img-1.png'); background-position: center 10%;">
        <span class="mask bg-primary alpha-7"></span>
        <div class="container text-center">
          <div class="row cols-xs-space cols-sm-space cols-md-space">
            <div class="col-12">
              <h2 class="heading text-white h1 strong-600">
                Complete features at your hand
              </h2>
              <div class="row justify-content-center mt-4">
                <div class="col-lg-8">
                  <p class="lead text-white">
                    Boomerang is a great free UI package based on Bootstrap 4 that includes the most important components and features so you can jumpstart the hard work and get right to the website creation fast and easy.
                  </p>
                  <div class="btn-container mt-5">
                    <a href="https://github.com/webpixels/boomerang-ui-kit/archive/master.zip" class="btn btn-lg bg-white px-4">
                      Download Free
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice-lg">
        <div class="container">
          <h2 class="heading h3 strong-600 text-center mb-5">
            What you get in the FREE version
          </h2>
          <div class="row-wrapper">
            <div class="row cols-xs-space cols-sm-space cols-md-space">
              <div class="col-md-6">
                <div class="card bg-primary">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fab fa-twitter text-white"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading text-white h4">Latest Bootstrap framework <small>(v4.0.0)</small></h3>
                        <p class="text-white mb-0">Build responsive, mobile-first projects on the web with the world's most popular front-end component library.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fab fa-sass"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading h4">Built with Sass <small>(included)</small></h3>
                        <p class="mb-0">Change one variable and the theme adapts. And there are tones: colors, fonts, sizes are just a few things you can change with Sass.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row cols-xs-space cols-sm-space cols-md-space">
              <div class="col-md-6">
                <div class="card bg-primary">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fas fa-th-large text-white"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading text-white h4">50 customized components</h3>
                        <p class="text-white mb-0">We took the most used Bootstrap components and add them a little Boomerang touch with modular elements that makes them reusable and easy to work with.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fas fa-tint"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading h4">Extended color palette</h3>
                        <p class="mb-0">Boomerang has extended the color palette that Bootstrap offers by default. Instead of two primary colors, you get now three. These can be easily customized using the included Sass files.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row cols-xs-space cols-sm-space cols-md-space">
              <div class="col-md-6">
                <div class="card bg-primary">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fas fa-code text-white"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading text-white h4">Five integrated plugins</h3>
                        <p class="text-white mb-0">Get even more functionality with the ready to use plugins we have integrated in this theme for you.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fas fa-font"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading h4">Font Awesome 5</h3>
                        <p class="mb-0">1000 Free icons + 1500 Pro icons make FontAwesome one of the most popular vector icons on the web.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row cols-xs-space cols-sm-space cols-md-space">
              <div class="col-md-6">
                <div class="card bg-primary">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fas fa-file-alt text-white"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading text-white h4">Five example pages</h3>
                        <p class="text-white mb-0">We took a step further and created a set of 5 pages that makes it the ideal point to start building websites of any kind.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card">
                  <div class="card-body py-5">
                    <div class="d-flex align-items-start">
                      <div class="icon icon-lg">
                        <i class="fas fa-question-circle"></i>
                      </div>
                      <div class="icon-text">
                        <h3 class="heading h4">Free support on Github</h3>
                        <p class="mb-0">You get a professional theme and a promise that we will respond to each issue you are having with our theme on Github.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="slice pt-0 sct-color-1">
        <div class="container">
          <div class="row justify-content-center align-items-center">
            <div class="col-lg-8 text-center">
              <h3 class="heading h3 font-weight-400">
                I am ready to start a new project with <span class="font-weight-700">Boomerang</span> UI Kit.
              </h3>
              <div class="mt-5">
                <a href="https://github.com/webpixels/boomerang-ui-kit/archive/master.zip" class="btn btn-lg btn-primary px-4">
                  Download free
                </a>
                <a href="https://github.com/webpixels/boomerang-ui-kit/issues" target="_blank" class="btn btn-link">Have an issue?</a>
              </div>
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
