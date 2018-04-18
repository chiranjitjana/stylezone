<jsp:include page="header_for_listpage.jsp"></jsp:include>

<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<h4>Check out</h4>
		</div>
		<!--/breadcrums-->

		<div class="step-one">
			<h5 class="heading">Select Delivery Address</h5>
		</div>
		<div class="checkout-options">
			
		</div>
	

	
		<div class="review-payment">
			<h2>Review & Payment</h2>
		</div>

		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">Item</td>
						<td class="description"></td>
						<td class="price">Price</td>
						<td class="quantity">Quantity</td>
						<td class="total">Total</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="cart_product"><a href=""><img
								src="images/cart/one.png" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href="">Colorblock Scuba</a>
							</h4>
							<p>Web ID: 1089772</p>
						</td>
						<td class="cart_price">
							<p>$59</p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up" href=""> + </a> <input
									class="cart_quantity_input" type="text" name="quantity"
									value="1" autocomplete="off" size="2"> <a
									class="cart_quantity_down" href=""> - </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price">$59</p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href=""><i class="fa fa-times"></i></a></td>
					</tr>

					<tr>
						<td class="cart_product"><a href=""><img
								src="images/cart/two.png" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href="">Colorblock Scuba</a>
							</h4>
							<p>Web ID: 1089772</p>
						</td>
						<td class="cart_price">
							<p>$59</p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up" href=""> + </a> <input
									class="cart_quantity_input" type="text" name="quantity"
									value="1" autocomplete="off" size="2"> <a
									class="cart_quantity_down" href=""> - </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price">$59</p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href=""><i class="fa fa-times"></i></a></td>
					</tr>
					<tr>
						<td class="cart_product"><a href=""><img
								src="images/cart/three.png" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href="">Colorblock Scuba</a>
							</h4>
							<p>Web ID: 1089772</p>
						</td>
						<td class="cart_price">
							<p>$59</p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up" href=""> + </a> <input
									class="cart_quantity_input" type="text" name="quantity"
									value="1" autocomplete="off" size="2"> <a
									class="cart_quantity_down" href=""> - </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price">$59</p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href=""><i class="fa fa-times"></i></a></td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
						<td colspan="2">
							<table class="table table-condensed total-result">
								<tr>
									<td>Cart Sub Total</td>
									<td>$59</td>
								</tr>
								<tr>
									<td>Exo Tax</td>
									<td>$2</td>
								</tr>
								<tr class="shipping-cost">
									<td>Shipping Cost</td>
									<td>Free</td>
								</tr>
								<tr>
									<td>Total</td>
									<td><span>$61</span></td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="payment-options">
			<span> <label><input type="checkbox"> Direct
					Bank Transfer</label>
			</span> <span> <label><input type="checkbox"> Check
					Payment</label>
			</span> <span> <label><input type="checkbox"> Paypal</label>
			</span>
		</div>
	</div>
</section>
<!--/#cart_items-->

<!--/#do_action-->
<jsp:include page="footer_for_listpage.jsp"></jsp:include>
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
<script>
$(".header-bottom").show();
$(document).ready(function() {
	UIcontroller.updateUi("myprofile");
	UIWebsite.fetchCart();
});	

</script>
</script>
