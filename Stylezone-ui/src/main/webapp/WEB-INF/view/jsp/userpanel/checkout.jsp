<jsp:include page="header_for_listpage.jsp"></jsp:include>

<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<h4>Check out</h4>
		</div>
		<!--/breadcrums-->

		<div class="">
			<h4>Select Delivery Address</h4>
			<div class="delivery_address col-sm-8">

				<div class="well hide address_template"
					style="padding:5px; background-color: #f5f5f5; border: 1px solid #e3e3e3;">
					<div class="row" style="height:50px;">
						<div class="col-sm-2">
							<input type="radio" name="deliveryAddoption"
								style="height: 50px; width: 25px; float: left;">
						</div>
						<div class="col-sm-10">
							<div class="heading">
								<h5 style="color: #807e7e;">
									<span class="address"></span>
								</h5>


							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="rq_address">
				<center><H4>Please Create Delivery Address in My account selection first</H4></center>
			</div>

		</div>
</div>
<div class="container checkoutpage">

		<div class="review-payment">
			<h2>Review & Payment</h2>


		</div>

		<div class="table-responsive cart_info">
			<table class="table table-condensed">
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
				<tbody>
				<tr class="tr hide product_detaials">
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
	
					<tr class="cost_info">
						<td colspan="6">&nbsp;</td>
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
					<tr class="cost_info">
						<td colspan="6">&nbsp;</td>
						<td colspan="2">
							<Button class="btn btn-primary" data-toggle="modal" data-target="#payNOw">Pay Now</Button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>


<!-- Modal -->
<div id="payNOw" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Pay Now</h4>
      </div>
      <div class="modal-body">
        <form class="needs-validation" novalidate="">
            

            <h4 class="mb-3">Payment</h4>
			
            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                <label class="custom-control-label" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                <label class="custom-control-label" for="debit">Debit card</label>
              </div>
            </div>
            <hr/>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback hide">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                <div class="invalid-feedback hide">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                <div class="invalid-feedback hide">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                <div class="invalid-feedback hide">
                  Security code required
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
          </form>
      </div>
    </div>

  </div>
</div>




<!--/#cart_items-->

<!--/#do_action-->
<jsp:include page="footer_for_listpage.jsp"></jsp:include>
<style>
.btn span.glyphicon {
	opacity: 0;
}

.btn.active span.glyphicon {
	opacity: 1;
}

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
	UIWebsite.loadAddressList();
});	

</script>
