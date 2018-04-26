<jsp:include page="header_for_listpage.jsp"></jsp:include>


<section id="cart_items">
	<div class="container">

		<!--/breadcrums-->

		<div class="cart_wrapper">
			<div class="breadcrumbs">
				<h4>Check out</h4>
			</div>
			<h4>Select Delivery Address</h4>
			<div class="delivery_address col-sm-8">

				<div class="well hide address_template"
					style="padding: 5px; background-color: #f5f5f5; border: 1px solid #e3e3e3;">
					<div class="row" style="height: 50px;">
						<div class="col-sm-2">
							<input type="radio" name="deliveryAddoption"
								class="addressradiobtn"
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
				<center>
					<H4>Please Create Delivery Address in My account selection
						first</H4>
				</center>
			</div>

		</div>
	</div>
	<div class="container checkoutpage cart_wrapper">

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
				<tbody class="product_detaills">
					<tr class="tr hide">
						<td class="cart_product"><a href=""><img class="avt"
								src="resources/images/home/product/1st.jpg" height="110"
								width="110" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href="" class="productTiltle">HER CLOSET</a>
							</h4> <span class="customFittingCalendar"></span>
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
						<td class="cart_delete"><a class="cart_quantity_delete"><i
								class="fa fa-times"></i></a></td>
					</tr>

					<tr class="cost_info">
						<td colspan="6">&nbsp;</td>
						<td colspan="2">
							<table class="table table-condensed total-result">
								<tr>
									<td>Total Rental Cost</td>
									<td><span>&#8377;<span class="total_rental_cost"></span></td>
								</tr>
								<tr>
									<td>Total Refundable Cost</td>
									<td><span>&#8377;<span class="total_refunable_cost"></span></td>
								</tr>
								<!-- <tr class="shipping-cost">
									<td>Shipping Cost</td>
									<td>Free</td>
								</tr> -->
								<tr>
									<td>Total</td>
									<td><span>&#8377;<span
											class="total_rental_refundable"></span></span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr class="cost_info paynow">
						<td colspan="6">&nbsp;</td>
						<td colspan="2">
					
						
						
							<div>
								<Button class="btn btn-primary makePayment" data-toggle="modal"
									data-target="#payNOw">Select Payment Options</Button>
							</div>
						
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="emptycart">
		<div class="container">
			<center>
				<h3>No Product Available in Your Cart!!</h3>
			</center>
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
				
					<h4 class="mb-3">Payment</h4>
					<div>
							<input type="radio" name="pymt_type" checked class="pymt_type" value="online">Online
							<input type="radio" name="pymt_type" class="pymt_type" value="cod">COD(Cash on delivery)
							
					</div>
				
				<form class="needs-validation paynowcontainer">
					<div class="payment_status row hide col-sm-12"
						style="padding-bottom: 20px;">
						<span class="payment_status_msg"></span>
					</div>

					<h4 class="mb-3">Payment</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="credit" name="paymentMethod" type="radio"
								class="custom-control-input" checked="" required=""
								value="credit"> <label class="custom-control-label"
								for="credit">Credit card</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="debit" name="paymentMethod" type="radio"
								class="custom-control-input" required="" value="debit">
							<label class="custom-control-label" for="debit">Debit
								card</label>
						</div>
					</div>
					<hr />
					<div class="row">
						<div class="col-md-12 mb-12">
							<label for="cc-name">Name on card</label> <input type="text"
								class="form-control" id="cc-name"
								title="Please Provide Name Present on Card"
								placeholder="Please Provide Name Present on Card"> <small
								class="text-muted">Full name as displayed on card</small>
							<div class="invalid-feedback hide">Name on card is required
							</div>
						</div>
						<div class="col-md-12 mb-12">
							<label for="cc-number">Credit card number</label> <input
								type="number" onKeyPress="return check(event,value)"
								onInput="checkLength(16,this)" class="form-control"
								id="cc-number" placeholder="Provide 16 Digit card number"
								required="" title="Please Provide Card Number">
							<div class="invalid-feedback hide">Credit card number is
								required</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 mb-12">
							<div class="col-md-12"
								style="margin-left: 0px !important; padding-left: 0px;">
								<label for="cc-number col-md-12">Expiration Date</label>
							</div>
							<select id="exMonth" title="select a month"
								class="col-md-6 mb-6 monthExp"
								style="border: 1px solid #cccccc; background: #fff"
								title="Please select month">
								<option value="-1">Enter month</option>
								<option value="01">January</option>
								<option value="02">February</option>
								<option value="03">March</option>
								<option value="04">April</option>
								<option value="05">May</option>
								<option value="06">June</option>
								<option value="07">July</option>
								<option value="08">August</option>
								<option value="09">September</option>
								<option value="10">October</option>
								<option value="11">November</option>
								<option value="12">December</option>
							</select> <select id="exYear" title="select a year"
								class="col-md-6 mb-6 yearExp"
								style="border: 1px solid #cccccc; background: #fff"
								title="Please Select year">
								<option value="-1">Enter year</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
								<option value="2026">2026</option>
								<option value="2027">2027</option>
								<option value="2028">2028</option>
								<option value="2029">2029</option>
								<option value="2030">2030</option>
								<option value="2031">2031</option>
							</select>


							<div class="invalid-feedback hide">Expiration date required
							</div>
						</div>
						<div class="col-md-4 mb-4">
							<label for="cc-expiration">CVV</label> <input type="number"
								class="form-control" id="cc-cvv"
								onKeyPress="return check(event,value)"
								onInput="checkLength(3,this)" required=""
								title="Please Provide Valid CVV Number"
								placeholder="Please Provide  CVV">

						</div>

					</div>
					<hr class="mb-4">
					
				</form>
				<button class="btn btn-primary btn-lg btn-block paynowbtn"
						type="button">Pay</button>
			</div>
		</div>

	</div>
</div>
<div class="modal fade" id="OrderAck" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Order Success</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="margin-top: -20px;!important">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<center>
					<span class="glyphicon glyphicon-ok"
						style="color: #13bd29; font-size: 50px; text-align: center;"></span>
					<p>We've sent a order details to your e-mail</p>
				</center>
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
function checkLength(len,ele){
	  var fieldLength = ele.value.length;
	  if(fieldLength <= len){
	    return true;
	  }
	  else
	  {
	    var str = ele.value;
	    str = str.substring(0, str.length - 1);
	    ele.value = str;
	  }
	}


$(".header-bottom").show();
$(document).ready(function() {
	UIcontroller.updateUi("myprofile");
	UIWebsite.fetchCart();
	UIWebsite.loadAddressList();
	
	$(".pymt_type").change(function() {
        if ($(this).val() == 'online') {
        	$(".paynowcontainer").removeClass("hide");
        }
        else if ($(this).val() == 'cod') {
        	$(".paynowcontainer").addClass("hide");

        }
    });
	
});	

$(".paynowbtn").click(function(){
	if(UIWebsite.ValidateCard() || $("input[name='pymt_type']:checked").val()=='cod'){
		$(".payment_status").addClass("hide");
		$(".payment_status_msg").addClass("alert alert-danger");
		$(".payment_status_msg").text("Please Provide Complete Card Details .");
		UIWebsite.makeCheckout();
	}else
		{
			$(".payment_status").removeClass("hide");
			$(".payment_status_msg").addClass("alert alert-danger");
			$(".payment_status_msg").text("Please Provide Complete Card Details .");
		
		}
});




</script>
