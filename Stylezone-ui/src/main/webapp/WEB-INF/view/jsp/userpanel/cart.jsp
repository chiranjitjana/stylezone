<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Cart | E-Shopper</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/prettyPhoto.css" rel="stylesheet">
<link href="resources/css/price-range.css" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="resources/images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->
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

.cart_info table tr td {
	border-top: 0 none;
	vertical-align: inherit;
	margin-right: 50px;
}
</style>
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
								<li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88
										821</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>
										info@stylezone.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
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
							<a href="/Stylezone-ui/index"><img
								src="resources/images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">



								<%
									if (request.getSession().getAttribute("role") == "ROLE_User") {
								%>

								<li><a href="#" style="color: #FE980F">Welcome ,<span
										class="userName"></span></a></li>

								<li><a href="/Stylezone-ui/myaccount"><i
										class="fa fa-user"></i> My Account</a></li>


								<%
									}
								%>

								<!--<li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>-->
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>Cart(4)</a></li>

								<%
									if (request.getSession().getAttribute("role") != "ROLE_User") {
								%>
								<li><a href="/Stylezone-ui/userlogin"><i
										class="fa fa-lock"></i> Login</a></li>

								<%
									} else {
								%>

								<li><a href="/Stylezone-ui/logout"><i
										class="fa fa-lock"></i>Logout</a></li>
								<%
									}
								%>
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
								<li><a href="index.html" class="active"
									style="margin-top: 0px;">Home</a></li>
								<li class="dropdown"><a href="#">Mens<i
										class="fa fa-angle-down"></i></a>
									<ul role="" class="sub-menu dropdown-content"
										style="width: 800px;">
										<li>
											<div class="header row">
												<h4>New Arrival</h4>
												<h4>Stylezone Collection</h4>
											</div>
											<div class=" listbrand">
												<div class="column">
													<h4 class="color">Rent By Style</h4>
													<a href="#">View all</a> <a href="#">Suits & Tuxedos</a> <a
														href="#">Blazers</a> <a href="#">Nehru Jacket</a> <a
														href="#">Jodhpuri suits</a> <a href="#">Kurta Pyjamas
														set</a> <a href="#">Indo Western</a> <a href="#">Plain
														Sherwanis</a> <a href="#">Embriodered Sherwanis</a>
												</div>
												<div class="column">
													<h4 class="color">Rent By Occasion</h4>
													<a href="#">Cocktail & Reception</a> <a href="#">Sangeet</a>
													<a href="#">Mehendi</a> <a href="#">Wedding</a> <a href="#">Festivals</a>
													<a href="#">Club night</a> <a href="#">Formal dress for
														meetings</a>
												</div>
												<div class="column">
													<h4 class="color">Rent By Brands</h4>
													<a href="#">Armani</a> <a href="#">Raymond</a> <a href="#">The
														boston luxe</a> <a href="#">Zara</a> <a href="#">H & M</a>
												</div>
											</div>
										</li>
									</ul></li>

								<li class="dropdown"><a href="#">Womens<i
										class="fa fa-angle-down"></i></a>
									<ul role="" class="sub-menu dropdown-content"
										style="width: 800px;">
										<li>
											<div class="header row">
												<h4>New Arrival</h4>
												<h4>Stylezone Collection</h4>
											</div>
											<div class="listbrand">
												<div class="column">
													<h4 class="color">Rent By Style</h4>
													<a href="#">View all</a> <a href="#">Lehengas</a> <a
														href="#">Anarkalis</a> <a href="#">Gowns</a> <a href="#">Sarees</a>
													<a href="#">Kurta sets</a> <a href="#">Crop top & Skirt
														set</a> <a href="#">Dhoti set</a> <a href="#">Sharara sets</a>
													<a href="#">Saree gowns</a>
												</div>
												<div class="column">
													<h4 class="color">Rent By Collection</h4>
													<a href="#">Bridal wear</a> <a href="#">Western wear</a> <a
														href="#">The curve edit</a> <a href="#">Christian
														wedding gowns</a>
												</div>
												<div class="column">
													<h4 class="color">Rent By Occasion</h4>
													<a href="#">Cocktail & Reception</a> <a href="#">Sangeet</a>
													<a href="#">Mehendi</a> <a href="#">Wedding</a> <a href="#">Festivals</a>
													<a href="#">Club night</a> <a href="#">Formal dress for
														meetings</a>
												</div>
												<div class="column">
													<h4>Rent By Brands</h4>
													<a href="#">Levi's</a> <a href="#">Nike</a> <a href="#">Banin</a>
													<a href="#">Zara</a> <a href="#">H & M</a>
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

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Duration</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cart_product"><a href=""><img
									src="resources/images/home/product/1st.jpg" height="110"
									width="110" alt=""></a></td>
							<td class="cart_description">
								<h4>
									<a href="">HER CLOSET</a>
								</h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>&#8377;2499</p>
							</td>
							<td class="cart_quantity">
								<!-- <div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div> -->
								<p>4 Days</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">&#8377;2499</p>
							</td>
							<td class="cart_delete"><a class="cart_quantity_delete"
								href=""><i class="fa fa-times"></i></a></td>
						</tr>

						<tr>
							<td class="cart_product"><a href=""><img
									src="resources/images/home/product/2nd.jpg" alt="" height="110"
									width="110"></a></td>
							<td class="cart_description">
								<h4>
									<a href="">THE WARDROBE BY MEGHNA & SHREYA</a>
								</h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>&#8377;2999</p>
							</td>
							<td class="cart_quantity">
								<p>4 Days</p> <!-- <div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div> -->
							</td>
							<td class="cart_total">
								<p class="cart_total_price">&#8377;2999</p>
							</td>
							<td class="cart_delete"><a class="cart_quantity_delete"
								href=""><i class="fa fa-times"></i></a></td>
						</tr>
						<tr>
							<td class="cart_product"><a href=""><img
									src="resources/images/home/product/3rd.jpg" alt="" height="110"
									width="110"></a></td>
							<td class="cart_description">
								<h4>
									<a href="">HER CLOSET</a>
								</h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>&#8377;2000</p>
							</td>
							<td class="cart_quantity">
								<!-- <div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div> -->
								<p>4 Days</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">&#8377;2000</p>
							</td>
							<td class="cart_delete"><a class="cart_quantity_delete"
								href=""><i class="fa fa-times"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Payment Information </h3>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>&#8377;7498</span></li>
							<li>Eco Tax <span>&#8377;502</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>&#8377;8000</span></li>
						</ul>
						<a class="btn btn-default update" href="">Update</a> <a
							class="btn btn-default check_out" href="">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#do_action-->

	<jsp:include page="footer.jsp"></jsp:include>