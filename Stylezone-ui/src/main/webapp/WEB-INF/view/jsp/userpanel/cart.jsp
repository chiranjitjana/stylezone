
<jsp:include page="header.jsp"></jsp:include>


<div class="cart_wrapper">
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<h3>My Cart</h3>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed cart_table">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="start_date">Start Date</td>
							<td class="duration">Duration</td>
							<td class="rental_cost">Rental Cost</td>
							<td class="deposite_cost">Deposite</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody class="cart_table_body">
						<tr class="tr hide">
							<td class="cart_product"><a href=""><img class="avt"
									src="resources/images/home/product/1st.jpg" height="110"
									width="110" alt=""></a></td>
							<td class="cart_description">
								<h4>
									<a href="" class="productTiltle">HER CLOSET</a>
								</h4>
								<span class="customFittingCalendar"></span>
							</td>
							<td class="startDate">24-05-2018</td>
							<td class="duration">
								<p>4 Days</p>
							</td>
							<td>
								<p>
									&#8377;<span class="rental_price"></span>
								</p>
							</td>

							<td>
								<p>
									&#8377;<span class="refundable_price"></span>
								</p>
							</td>

							<td class="cart_total_price">
								<p>
									&#8377;<span class="product_total_price">2499</span>
								</p>
							</td>
							<td class="cart_delete"><a class="cart_quantity_delete" 
								><i class="fa fa-times"></i></a></td>
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
				<h3>Payment Information</h3>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="total_area">
						<ul>
							<li>Total Rental Cost <span>&#8377;<span
									class="total_rental_cost"></span></span></li>
							<li>Total Refundable Cost <span>&#8377;<span
									class="total_refunable_cost"></span></span></li>
							<li>Total <span>&#8377;<span
									class="total_rental_refundable"></span></span></li>
						</ul>
						<a class="btn btn-default check_out" href="/Stylezone-ui/myaccount/show/checkout">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<div class="emptycart">
	<section class="container">
		<center>
			<h3>Your Cart is Empty</h3>
		</center>
	</section>
</div>





<!--/#do_action-->
<jsp:include page="footer.jsp"></jsp:include>
	

	<style>
#ui-datepicker-div {
	z-index: 101 !important;
}
</style>
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

<script>
	$(".header-bottom").show();
	$(document).ready(function() {
		UIcontroller.updateUi("myprofile");
		UIWebsite.fetchCart();
	});	
	
</script>