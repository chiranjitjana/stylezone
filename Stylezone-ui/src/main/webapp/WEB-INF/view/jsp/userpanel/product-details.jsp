<!------ Include the above in your HEAD tag ---------->
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="../../resources/css/productdts.css" />



</head>
<body>
	<!-- Demo page craeted by https://github.com/petr-goca -->
	<jsp:include page="header_for_listpage.jsp"></jsp:include>
	<section aria-label="Main content" role="main" class="product-detail">
		<div itemscope itemtype="http://schema.org/Product">
			<div class="shadow">
				<div class="_cont detail-top">
					<div class="cols">
						<div class="left-col">
							<div class="thumbs">
								<a class="thumb-image active "
									href="${product.product.productDetails.avt2}" data-index="0">
									<span><img
										src="../../FileServlet?path=${product.product.productDetails.avt2}"
										alt="${product.product.productDetails.productTitle}"></span>
								</a> <a class="thumb-image"
									href="${product.product.productDetails.avt2}" data-index="1">
									<span><img
										src="../../FileServlet?path=${product.product.productDetails.avt3}"
										alt="${product.product.productDetails.productTitle}"></span>
								</a> <a class="thumb-image"
									href="${product.product.productDetails.avt1}" data-index="2">
									<span><img
										src="../../FileServlet?path=${product.product.productDetails.avt1}"
										alt="${product.product.productDetails.productTitle}"></span>
								</a>
							</div>
							<div class="big">
								<span id="big-image" class="img" quickbeam="image"
									style="background-image: url('../../FileServlet?path=${product.product.productDetails.avt1}')">
								</span>
								<div id="banner-gallery" class="swipe">
									<div class="swipe-wrap">
										<div
											style="background-image: url('../../FileServlet?path=${product.product.productDetails.avt1}')">
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="right-col">
							<h1 productName="name">${product.product.productDetails.productTitle}</h1>
							<input type="text" class="hide productId" value="${product.product.productId}">
							<div>
								<div class="price-shipping">
									<div class="price" id="price-preview">&#x20B9;<span class="price-info-txt">${product.product.productDetails.rentPrice}</span> <span class="durationfor"></span></div>
								</div>

								<div class="price-shipping">
									<div class="" id="price-preview">
										REFUNDABLE DEPOSIT
										<h4 style="color: #989698;">
											&#x20B9;<span class="refundable_amt">${product.product.productDetails.depositePercentage}</span></h4>
									</div>
								</div>

								<div class="product-attributes">
									<c:if test="${not empty product.productDetailsMale}">
										<div class="col-sm-3">
											<div class="swatch clearfix" data-option-index="0">
												<div class="">Top Size</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailsMale.topSize} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="swatch clearfix text-center"
												data-option-index="0">
												<div class="">Bottom Size</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailsMale.bottomSize} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>
									</c:if>



									<c:if test="${not empty product.productDetailFemaleAttr}">

										<div class="col-sm-2">
											<div class="swatch clearfix text-center"
												data-option-index="0">
												<div class="">Size</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailFemaleAttr.size} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="swatch clearfix text-center"
												data-option-index="0">
												<div class="">Bust</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailFemaleAttr.bust} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>

										<div class="col-sm-2">
											<div class="swatch clearfix text-center"
												data-option-index="0">
												<div class="">Waist</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailFemaleAttr.waist} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>

										<div class="col-sm-2">
											<div class="swatch clearfix text-center"
												data-option-index="0">
												<div class="">Hip</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailFemaleAttr.hip} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="swatch clearfix text-center"
												data-option-index="0">
												<div class="">Height</div>
												<div data-value="M"
													class="swatch-element plain m available text-center">
													<input id="swatch-0-m" type="radio" name="option-0"
														value="M" checked /> <label for="swatch-0-m">
														${product.productDetailFemaleAttr.height} <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
													</label>
												</div>
											</div>
										</div>

									</c:if>
								</div>

								<div class="col-sm-12 "
									style="margin-top: 10px; margin-bottom: 10px;">
									<div class="swatch clearfix" data-option-index="1">
										<div class="header">Color</div>
										<div data-value="Blue"
											class="swatch-element color blue available">
											<div class="tooltip">${product.product.color.colorName}</div>
											<input quickbeam="color" id="swatch-1-blue" type="radio"
												name="option-1" value="Blue" checked /> <label
												for="swatch-1-blue"
												style="border-color: #${product.product.color.colorCode}">
												<img class="crossed-out"
												src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
												<span
												style="background-color: #${product.product.color.colorCode}"></span>
											</label>
										</div>

									</div>
									<c:if test="${product.product.productDetails.customFitting==1}">
										<div class="col-sm-8" data-toggle="modal"
											data-target="#customFittingInfo"
											style="margin-top: 30px; border: 1px solid #086fcf; border-radius: 10px;">

											<div class="wr">
												<div class="col-sm-4">
													<img
														src="../../resources/images/shop/customFitImageWomen.png">
												</div>
												<div class="col-sm-8">
													<h5 style="margin-top: 20px;">Custom Fitting Available</h5>
												</div>
											</div>


										</div>
									</c:if>
								</div>

								<div class="col-sm-12"
									style="margin-top: 10px; margin-bottom: 10px;">
									<div class="swatch clearfix" data-option-index="1">
										<div class="header">Durations</div>

										<c:if
											test="${product.product.productDetails.duration4 eq 'Y'.charAt(0)}">
											<div class="swatch clearfix" data-option-index="0">
												<div class="">4 Days</div>
												<div data-value="M" id="duration4"
													class="swatch-element color blue available">
													<input  type="radio" 
														value="M" /> <label for="swatch-0-m"
														style="border-color: #fdb45e" checked> <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
														<span style="background-color: #fdb45e"></span>
													</label>
												</div>
											</div>
										</c:if>

										<c:if
											test="${product.product.productDetails.duration6 eq 'Y'.charAt(0)}">
											<div class="swatch clearfix" data-option-index="1">
												<div class="">6 Days</div>
												<div data-value="M" id="duration6"
													class="swatch-element color blue available">
													<input  type="radio" 
														value="M" /> <label for="swatch-0-m"
														style="border-color: #fdb45e"> <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
														<span style="background-color: #fdb45e"></span>
													</label>
												</div>
											</div>
										</c:if>

										<c:if
											test="${product.product.productDetails.duration8 eq 'Y'.charAt(0)}">
											<div class="swatch clearfix" data-option-index="2">
												<div class="">8 Days</div>
												<div data-value="M" id="duration8"
													class="swatch-element color blue available">
													<input id="duration8" type="radio"
														value="M" /> <label for="swatch-0-m"
														style="border-color: #fdb45e"> <img
														class="crossed-out"
														src="//cdn.shopify.com/s/files/1/1047/6452/t/1/assets/soldout.png?10994296540668815886" />
														<span style="background-color: #fdb45e"></span>
													</label>
												</div>
											</div>
										</c:if>

									</div>



								</div>

								<div style="marigin-top: 8px; margin-bottom: 8px"
									class="col-sm-6">
									<div
										style="border: 1px solid #086fcf; padding: 8px; border-radius: 10px"
										class="deliveryDateInput" id="deliveryDateInput"
										class="col-sm-12">
										<span class="glyphicon glyphicon-calendar"
											style="color: #086fcf;"></span> <input type="text" class="deliveryDP"
											id="datepicker" placeholder="Select Delivery Date"
											style="border: none">
									</div>
								</div>



								<!-- <form method="post" enctype="multipart/form-data" id="AddToCartForm"> -->
								<div class="row">
									<form id="AddToCartForm" class="">
										<div class="btn-and-quantity-wrap">
											<div class="btn-and-quantity">
												<div id="AddToCart" quickbeam="add-to-cart">
													<span id="AddToCartText">Add to Cart</span>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="row">
									<div class="tabs">
										<div class="tab-labels">
											<span data-id="1" class="active">Description</span>
										</div>
										<div class="tab-slides">
											<div id="tab-slide-1" itemprop="description" class="active "
												style="color: #000; background-color: #fff;">${ product.product.productDetails.productDescription}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div id="customFittingInfo" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title font-base-medium big-font">Custom
							Fitting Available</h4>
					</div>
					<div class="modal-body">
						<div class="col-sm-12">
							<div class="col-sm-4">
								<i class="sprite-custom-fitting sprite-big"></i>
							</div>
							<div class="col-sm-8" style="margin-top: 25px;">
								<h4>What gets customised?</h4>

							</div>
						</div>





						<div class="full-width position-relative pl-30 howItworks">


							<div class="font-base-regular medium-font mb-15">
								<!--Our caller will call you to schedule a home visit by our fit expert.-->
								1 . While placing the order, you will get an option to choose a
								date &amp; time for taking measurements for custom fitting.
							</div>


							<div class="font-base-regular medium-font mb-15">
								<!--Our fit expert will visit you and take your measurements.-->
								2. Our fit expert will visit at the selected date &amp; time to
								take your measurements.
							</div>

							<div class="font-base-regular medium-font">
								<!--The outfit will be custom fitted in our studio and delivered on your chosen date.-->
								3.We carefully alter each outfit according to your measurements
								and deliver it on your chosen date..
							</div>
						</div>
					</div>
				</div>

			</div>




		</div>
		</div>



		<style>

.sprite-custom-fitting {
	width: 96px;
	height: 96px;
	background-position: -835px -541px;
}

.sprite-big {
	background-image:
		url(../../resources/images/shop/sprite-big-icon-images.png);
	background-repeat: no-repeat;
	display: inline-block;
	cursor: pointer;
	-webkit-transform: scale(.5);
	transform: scale(.5);
}

.durationfor
{
	font-size: 18px;
	font-family: monospace;
}

</style>








	</section>
	<!-- Quickbeam cart-->
	<jsp:include page="footer_for_listpage.jsp"></jsp:include>
	<link rel="stylesheet"
		href="../../resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
	<script src="../../resources/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

	<style>
#ui-datepicker-div {
	z-index: 101 !important;
}
</style>



	<script>
	
	var intitialPrice=$(".price-info-txt").text();
	
	
	
		$(document).ready(function() {
		 	$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				minDate : 0
			}); 
			
		 	
		 
		
		if ($('#duration4').length) {
						$("#duration4").find("input[type='radio']").prop(
								"checked", true);
						
						$(".durationfor").text(" for 4 Days");
					} else if ($('#duration6').length) {
						$("#duration6").find("input[type='radio']").prop(
								"checked", true);
						
						$(".durationfor").text(" for 6 Days");
					} else {
						$("#duration8").find("input[type='radio']").prop(
								"checked", true);
						
						$(".durationfor").text(" for 8 Days");
					}
				});

		$(".thumbs .thumb-image").click(function() {
			var value = $(this).find("img").attr("src");
			var path = "background-image: url(" + value + ")";
			$(".big").find("#big-image").removeAttr("style");
			$(".big").find("#big-image").attr("style", path);
			$(".thumbs").find(".thumb-image").each(function() {
				$(this).removeClass("active");
			});

			$(this).addClass("active");
		});

		$("#duration8").click(function() {

			/* 	alert("8"); */
			$(".price-info-txt").text(parseInt(intitialPrice)+1000);
			$(".durationfor").text(" for 8 Days");
			$("#duration8").find("input[type='radio']").prop("checked", true);
			$("#duration4").find("input[type='radio']").prop("checked", false);
			$("#duration6").find("input[type='radio']").prop("checked", false);
		});

		$("#duration6").click(function() {
			/* alert("6"); */
			$(".price-info-txt").text(parseInt(intitialPrice)+500);
			$(".durationfor").text(" for 6 Days");
			$("#duration6").find("input[type='radio']").prop("checked", true);
			$("#duration4").find("input[type='radio']").prop("checked", false);
			$("#duration8").find("input[type='radio']").prop("checked", false);
		});

		$("#duration4").click(function() {

			/* 		alert("4"); */
			$(".price-info-txt").text(parseInt(intitialPrice));
			$(".durationfor").text(" for 4 Days");
			$("#duration4").find("input[type='radio']").prop("checked", true);
			$("#duration6").find("input[type='radio']").prop("checked", false);
			$("#duration8").find("input[type='radio']").prop("checked", false);
		});

		$("#AddToCart").click(function() {
			UIWebsite.AddtoCart();
		});

		function deliveryDate() {
			alert("hello");

		}
	</script>