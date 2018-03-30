<jsp:include page="header.jsp"></jsp:include>
<script>
	$(".header-bottom").hide();

</script>
<style>
.marigin-bottom {
	marigin-bottom: 10px !important;
}

.active {
    color: #ffffff;
    
}


.active:hover {
    color: #ffffff;
}

a:hover {
    outline: none;
    text-decoration: none;
}
</style>


<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3 panel-group " style="    border: 1px solid #b7b734;
    margin-bottom: 35px;
    padding-bottom: 20px;
    padding-top: 15px;">
				<div class="left-sidebar">
					<h2>Manage Account</h2>

					<div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/" class="active">My Profile</a>
							</h4>
						</div>
					</div>

					<div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/">All Orders  (20)</a>
							</h4>
						</div>
					</div>
					<div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/">Payment Option (Paytm Only)</a>
							</h4>
						</div>
					</div>
					<div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/">Delivery Address (5)</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9 padding-right">
				<div class="features_items">
					<div class="myprofile">
						<jsp:include page="userprofile.jsp"></jsp:include>
					</div>
					<div class="orders hide">
					
					</div>
					<div class="payment hide">
					
					</div>
					
					<div class="delivery_address hide">
					
					</div>
				
				</div>

			</div>


		</div>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>