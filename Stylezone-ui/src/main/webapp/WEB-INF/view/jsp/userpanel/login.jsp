<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Login | E-Shopper</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/prettyPhoto.css" rel="stylesheet">
<link href="resources/css/price-range.css" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">
<link href="resources/css/custom_style.css" rel="stylesheet">

<style>
.default_style {
	background: #F0F0E9;
	border: medium none;
	color: #696763;
	display: block;
	font-family: 'Roboto', sans-serif;
	font-size: 14px;
	font-weight: 300;
	height: 40px;
	margin-bottom: 10px;
	outline: medium none;
	padding-left: 10px;
	width: 100%;
}

.button {
	background: #FE980F !important;
	border: medium none !important;
	border-radius: 0 !important;
	color: #FFFFFF !important;
	display: block !important;
	font-family: 'Roboto', sans-serif;
	padding: 6px 25px !important;
}
</style>
</head>
<!--/head-->

<body>
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href=""><i class="fa fa-phone"></i> +2 95 01 88
										821</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>
										info@domain.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-twitter"></i></a></li>
								<li><a href=""><i class="fa fa-linkedin"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.html"><img
								src="resources/images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-user"></i> Account</a></li>
								<li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i>
										Checkout</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<li><a href="login.html" class="active"><i
										class="fa fa-lock"></i> Login</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="/">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.html">Products</a></li>
										<li><a href="product-details.html">Product Details</a></li>
										<li><a href="checkout.html">Checkout</a></li>
										<li><a href="cart.html">Cart</a></li>
										<li><a href="login.html" class="active">Login</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Blog<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="blog.html">Blog List</a></li>
										<li><a href="blog-single.html">Blog Single</a></li>
									</ul></li>
								<li><a href="404.html">404</a></li>
								<li><a href="contact-us.html">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
	<!--/header-->

	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
				
				
				
				<c:if test="${not empty activeactive}">
						<div class="alert alert-success alert-dismissible" role="alert"
							style="margin-top: 35px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="loginError">${activeactive}</div>
						</div>
					</c:if>
				
					<c:if test="${not empty accountnotactivate}">
						<div class="alert alert-danger alert-dismissible" role="alert"
							style="margin-top: 35px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="loginError">${accountnotactivate}</div>
						</div>
					</c:if>


					<c:if test="${not empty error}">
						<div class="alert alert-danger alert-dismissible" role="alert"
							style="margin-top: 35px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="loginError">${error}</div>
						</div>
					</c:if>
					<c:if test="${not empty duplicateSessionObject}">
						<div class="alert alert-danger alert-dismissible" role="alert"
							style="margin-top: 35px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="loginError">${duplicateSessionObject}</div>
						</div>
					</c:if>

					<c:if test="${not empty notApproved}">
						<div class="alert alert-danger alert-dismissible" role="alert"
							style="margin-top: 35px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="loginError">${notApproved}</div>
						</div>
					</c:if>

					<c:if test="${not empty accessdenided}">
						<div class="alert alert-danger alert-dismissible" role="alert"
							style="margin-top: 35px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="loginError">${accessdenided}</div>
						</div>
					</c:if>
					<div class="login-form">
						<!--login form-->
						<h2>Login to your account</h2>
						<form action="/Stylezone-ui/login" method="post">
							<input type="email" placeholder="Email ID" name="username" /> <input
								type="password" placeholder="Password" name="password" />
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form" id="signup-form">

						<h2>New User Signup!</h2>


						<form id="signupfrmcontainer" class="signupfrmcontainer">
							<div class="message   hide alert alert-dismissible col-sm-12"
								role="alert">
								<span class="text"></span>
							</div>
							<div class="form-group ">
								<input type="text" placeholder="Name" class="controle userName"
									id="userName" />
							</div>
							<div class="form-group ">
								<input type="email" placeholder="Email ID"
									class="controle userEmail" id="userEmail" email />
							</div>
							<div class="form-group ">
								<input type="password" placeholder="Password"
									class="controle password" id="password" />
							</div>
							<div class="form-group ">
								<input type="number" placeholder="Phone Number"
									class="controle userMobileNo" id="userMobileNo" phone />
							</div>
							<div class="form-group ">
								<input type="text" class="form-control controle roleId hide"
									id="roleId" child="userRole"> <select
									class="form-control default_style" id="roleType"
									class="controle roleType">
									<option value="-1">Select Registration type</option>
									<option value="2">User</option>
									<option value="1">Admin</option>
								</select>
							</div>
							<button type="button" class="btn btn-default createUser">Signup</button>
						</form>
					</div>
					<!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form-->


	<footer id="footer">
		<!--Footer-->

		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Online Help</a></li>
								<li><a href="">Contact Us</a></li>
								<li><a href="">Order Status</a></li>
								<li><a href="">Change Location</a></li>
								<li><a href="">FAQ’s</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">T-Shirt</a></li>
								<li><a href="">Mens</a></li>
								<li><a href="">Womens</a></li>
								<li><a href="">Gift Cards</a></li>
								<li><a href="">Shoes</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privecy Policy</a></li>
								<li><a href="">Refund Policy</a></li>
								<li><a href="">Billing System</a></li>
								<li><a href="">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Company Information</a></li>
								<li><a href="">Careers</a></li>
								<li><a href="">Store Location</a></li>
								<li><a href="">Affillate Program</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default">
									<i class="fa fa-arrow-circle-o-right"></i>
								</button>
								<p>
									Get the most recent updates from <br />our site and be updated
									your self...
								</p>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All
						rights reserved.</p>
					<p class="pull-right">
						Designed by <span><a target="_blank"
							href="http://www.themeum.com">Themeum</a></span>
					</p>
				</div>
			</div>
		</div>

	</footer>
	<!--/Footer-->



	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/price-range.js"></script>
	<script src="resources/js/jquery.scrollUp.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.prettyPhoto.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/servicecontroller.js"></script>
	<script src="resources/js/uicontroller.js"></script>
	<script src="resources/js/uiconstants.js"></script>
	<script src="resources/js/ajaxhandler.js"></script>
	<script src="resources/js/uiutiles.js"></script>




	<script>
	$("#signupfrmcontainer .createUser").click(function() {
		if(UIutiles.rquiredValidator($("#signupfrmcontainer")))
			UIcontroller.createUser();
	});
	
	$("#roleType").on("change", function() {
		$("#roleId").val( this.value);
	});
</script>

</body>
</html>