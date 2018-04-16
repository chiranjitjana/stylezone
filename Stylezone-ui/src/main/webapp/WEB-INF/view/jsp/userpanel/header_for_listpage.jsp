<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../resources/css/font-awesome.min.css" rel="stylesheet">
<link href="../../resources/css/prettyPhoto.css" rel="stylesheet">
<link href="../../resources/css/price-range.css" rel="stylesheet">
<link href="../../resources/css/animate.css" rel="stylesheet">
<link href="../../resources/css/main.css" rel="stylesheet">
<link href="../../resources/css/responsive.css" rel="stylesheet">
<link href="../../resources/css/prettyPhoto.css" rel="stylesheet">
<link href="../../resources/css/price-range.css" rel="stylesheet">
<link href="../../resources/css/animate.css" rel="stylesheet">
<link href="../../resources/css/main.css" rel="stylesheet">
<link href="../../resources/css/responsive.css" rel="stylesheet">
<link href="../../resources/css/custom_style.css" rel="stylesheet">
<script src="../../resources/js/jquery.js"></script>
<script src="../../resources/js/price-range.js"></script>
<script src="../../resources/js/jquery.scrollUp.min.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
<script src="../../resources/js/jquery.prettyPhoto.js"></script>
<script src="../../resources/js/main.js"></script>
<script src="../../resources/js/uiusers.js"></script>
<style>
.navbar a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #FE980F;
	width: 100%;
	left: 0;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.dropdown-content .header {
	background: #FE980F;
	padding: 16px;
	color: white;
}

.dropdown:hover .dropdown-content {
	display: block;
}

/* Create three equal columns that floats next to each other */
.column {
	float: left;
	width: 33.33%;
	padding: 10px;
}

.column a {
	float: none;
	color: #fff;
	padding: 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.column  h4 {
	color: #fff;
}

.column a:hover {
	background-color: #ddd;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media ( max-width : 600px) {
	.column {
		width: 100%;
		height: auto;
	}
}

.listbrand {
	background-color: #ccc;
}

.color {
	color: #fff;
}
</style>












<header id="header">
	<!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88
									821</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>
									info@stylezone.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<!-- <div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div> -->
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
						<a href="/Stylezone-ui/index"><img
							src="../../resources/images/home/logo.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">



							<%
								if (request.getSession().getAttribute("role") == "ROLE_User") {
				
							%>

							<li><a href="#" style="color: #FE980F">Welcome ,<span class="userName"></span></a></li>

							<li><a href="/Stylezone-ui/myaccount"><i
									class="fa fa-user"></i> My Account</a></li>


							<%
								}
							%>

							<!--<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>-->
							<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>Cart(<span class="cartcount">0</span>)</a></li>

							<%
								if (request.getSession().getAttribute("role")!= "ROLE_User") {
							%>
							<li><a href="/Stylezone-ui/userlogin"><i
									class="fa fa-lock"></i> Login</a></li>

							<%
								}else {
									
							%>

							<li><a href="/Stylezone-ui/logout"><i class="fa fa-lock"></i>Logout</a></li>
							<% } %>
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
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="/Stylezone-ui/index" class="active" style="margin-top: 0px;">Home</a></li>
							<li class="dropdown"><a href="#">Mens<i
									class="fa fa-angle-down"></i></a>
								<ul role="" class="sub-menu dropdown-content menlist"
									style="width: 800px;">
									<li>
										<div class="header row">
											<h4>New Arrival</h4>
											<h4>Stylezone Collection</h4>
										</div>
										<div class="listbrand">
											<div class="column">
												<h4 class="color">Rent By Style/Categories</h4>
												<div class="category_list">
													
												</div>
												
												<!--  <a href="#">Suits & Tuxedos</a> <a
													href="#">Blazers</a> <a href="#">Nehru Jacket</a> <a
													href="#">Jodhpuri suits</a> <a href="#">Kurta Pyjamas
													set</a> <a href="#">Indo Western</a> <a href="#">Plain
													Sherwanis</a> <a href="#">Embriodered Sherwanis</a> -->
											</div>
											<div class="column">
												<h4 class="color">Rent By Occasion</h4>
												<div class="occasion_list">
													
												</div>
												<!-- 
												<a href="#">Cocktail & Reception</a> <a href="#">Sangeet</a>
												<a href="#">Mehendi</a> <a href="#">Wedding</a> <a href="#">Festivals</a>
												<a href="#">Club night</a> <a href="#">Formal dress for
													meetings</a> -->
											</div>
											<div class="column">
												<h4 class="color">Rent By Brands</h4>
												<div class="brand_list">
													
												</div>
											<!-- 	<a href="#">Armani</a> <a href="#">Raymond</a> <a href="#">The
													boston luxe</a> <a href="#">Zara</a> <a href="#">H & M</a> -->
											</div>
										</div>
									</li>
								</ul></li>

							<li class="dropdown"><a href="#">Womens<i
									class="fa fa-angle-down"></i></a>
								<ul role="" class="sub-menu dropdown-content womenlist"
									style="width: 800px;">
									<li>
										<div class="header row">
											<h4>New Arrival</h4>
											<h4>Stylezone Collection</h4>
										</div>
										<div class="listbrand">
											<div class="column">
												<h4 class="color">Rent By Style/Categories</h4>
												<div class="category_list">
													
												</div>
												
									
											</div>
											<div class="column">
												<h4 class="color">Rent By Brand</h4>
												<!-- <a href="#">Bridal wear</a> <a href="#">Western wear</a> <a
													href="#">The curve edit</a> <a href="#">Christian
													wedding gowns</a> -->
												<div class="brand_list">
													
												</div>
											</div>
											<div class="column">
												<h4 class="color">Rent By Occasion</h4>
												<!-- <a href="#">Cocktail & Reception</a> <a href="#">Sangeet</a>
												<a href="#">Mehendi</a> <a href="#">Wedding</a> <a href="#">Festivals</a>
												<a href="#">Club night</a> <a href="#">Formal dress for
													meetings</a> -->
													
												<div class="occasion_list">
													
												</div>
											</div>
											<div class="column">
												<h4>Products By Color</h4>
												<!-- <a href="#">Levi's</a> <a href="#">Nike</a> <a href="#">Banin</a>
												<a href="#">Zara</a> <a href="#">H & M</a> -->
												<div class="color_list">
													
												</div>
											</div>
										</div>
									</li>
								</ul></li>







							<!--<li><a href="404.html">404</a></li>-->

							<li><a href="/Stylezone-ui/contactus">Contact Us</a></li>
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
<script>
$(".header-bottom").show();
$(document).ready(function(){
	UIcontroller.updateUi("myprofile");
});

</script>

<!--/header-->