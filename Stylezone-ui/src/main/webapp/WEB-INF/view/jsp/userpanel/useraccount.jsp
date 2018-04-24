<jsp:include page="header.jsp"></jsp:include>
<script>
	$(".header-bottom").hide();

</script>
<style>
.marigin-bottom {
	marigin-bottom: 10px !important;
}

.active {
    color: #fe980f!important;
    background-color: #f5f5f5!important;
}


.active:hover {
    color: #ffffff;
}

a:hover {
    outline: none;
    text-decoration: none;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	color: white;
	text-align: center;
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
								<a class="active" containerId="myprofile">My Profile</a>
							</h4>
						</div>
					</div>

					<div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a  containerId="orders">All Orders  (<span class="orders_list_count"></span>)</a>
							</h4>
						</div>
					</div>
					<!--  <div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a  containerId="payment">My Cards (0)</a>
							</h4>
						</div>
					</div> -->
					<div class="panel panel-default marigin-bottom">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a  class="addressMenu" containerId="delivery_address">Delivery Address (<span class="delivery_add_count"></span>)</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-9 padding-right">
				<div class="features_items">
					<div class="myprofile containerItem">
						<jsp:include page="userprofile.jsp"></jsp:include>
					</div>
					<div class="orders hide containerItem">
					<jsp:include page="orderlist.jsp"></jsp:include>
					</div>
					<!-- <div class="payment hide containerItem">
					
					</div> -->
					
					<div class="delivery_address hide containerItem">
						<jsp:include page="deliveryadds.jsp"></jsp:include>
					</div>
				
				</div>

			</div>


		</div>
	</div>
</section>
<div class="footer">
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
	$(".left-sidebar").find("a").click(function(){
		
		$(".features_items .containerItem").each(function(){
			$(this).addClass("hide");
		});
		
		$(".left-sidebar a").each(function(){
			$(this).removeClass("active");
		});
		
		$("."+$(this).attr("containerId")).removeClass("hide");
		$(this).addClass("active");
	});

</script>
