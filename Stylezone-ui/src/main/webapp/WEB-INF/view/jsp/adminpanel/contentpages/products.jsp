
<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6 ">
			<h4 class="pull-left">
				All Products <span class="proListCount"></span>
			</h4>
		</div>
		<div class="col-sm-6 ">
			<a class="btn btn-primary pull-right createProdctModalShow"> <span
				class="glyphicon glyphicon-edit" />Create Product
			</a>
		</div>
	</div>


	<table id="productsTable" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr>
				<th></th>
				<th>Title</th>
				<th>Gender</th>
				<th>In Stock</th>
				<th>Created By</th>
				<th>Created Date</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>


<!--create product modal-->
<div id="productCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><span class="modalTitle"></span></h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form class="productform" id="productform">
						<div class="message hide alert alert-dismissible col-sm-12"
							role="alert">
							<span class="text"></span>
						</div>
						<div class="form-group">
							<label for="productTitle">Product Name:</label> <input
								type="text" class="form-control controle productTitle"
								id="productTitle" placeholder="Enter Product Name"> <input
								type="text" class="form-control controle productId hide"
								id="productId">
								
								<input
								type="text" class="form-control controle productDetailsId hide"
								id="productDetailsId">
						</div>

						<div class="form-group">
							<label for="category_name">Select Category:</label> <select
								class="form-control catId controle" id="catId" parent="category">
								<!-- 	<option value="-1">Select</option>
								<option value="1">Most Trending</option>
								<option value="2">Most awaited</option>
								<option value="3">By Dj</option> -->
							</select>
						</div>
						<div class="form-group">
							<label for="brand_name">Select Brand:</label> <select
								class="form-control brandId controle" id="brandId"
								parent="brand">
								<!-- <option value="-1">Select</option>
								<option value="1">Most Trending</option>
								<option value="2">Most awaited</option>
								<option value="3">By Dj</option> -->
							</select>
						</div>


						<div class="form-group">
							<label for="color_name">Select Color:</label> <select
								class="form-control colorId controle" id="colorId"
								parent="color">
								<!-- <option value="-1">Select</option>
								<option value="#ffccff" style="background-color: #ffccff;">Gray</option>
								<option value="#ffccff" style="background-color: #fffccc;">Blue</option>
								<option value="#ffccff" style="background-color: #ffccfe;">Red</option> -->
							</select>
						</div>

						<div class="form-group">
							<label for="occasion_name">Select Occasion:</label> <select
								class="form-control occasionId controle" id="occasionId"
								parent="occasion">
								<!-- <option value="-1">Select</option>
								<option value="1">Most Trending</option>
								<option value="2">Most awaited</option>name
								<option value="3">By Dj</option> -->
							</select>
						</div>


						<div class="form-group">
							<label for="occasion_name">Product Description:</label>
							<textarea
								class="form-control controle productDescription controle"
								rows="5" id="productDescription" parent="productDetails"></textarea>
						</div>
						<div class="form-group">
							<label class="control-label">Product Image 1 :</label> <input
								type="file" class="filestyle controle avt1" data-icon="false" name="avt1"
								id="avt1" parent="productDetails">
						</div>
						<div class="form-group">
							<label class="control-label">Product Image 2 :</label> <input
								type="file" class="filestyle controle avt2" data-icon="false"  name="avt2"
								id="avt2" parent="productDetails">
						</div>
						<div class="form-group">
							<label class="control-label">Product Image 3 :</label> <input
								type="file" class="filestyle controle avt3" data-icon="false"  name="avt3"
								id="avt3" parent="productDetails">
						</div>

						<div class="form-group gendertype">
							<label class="control-label">Gender Type:</label> <br /> <input
								class="gender" type="radio" class="gender controle"
								name="gender" checkType="men" id="male" parent="productDetails">
							Men &nbsp;&nbsp; <input class="gender controle" type="radio"
								name="gender" checkType="women" id="female"
								parent="productDetails"> Women

						</div>


						<div class="men hide">
							<div class="form-group">
								<label class="control-label">Top Size :</label> <input
									type="number" class="form-control controle topSize hide"
									id="topSize" parent="productDetailsMale"
									placeholder="Enter Top Size">
							</div>
							<div class="form-group">
								<label class="control-label">Bottom Size :</label> <input
									type="number" class="form-control controle hide bottomSize"
									id="bottomSize" parent="productDetailsMale"
									placeholder="Enter Bottom Size">
							</div>
						</div>

						<div class="women hide">
							<div class="form-group">
								<label class="control-label">Size :</label> <input type="number"
									parent="productDetailFemaleAttr"
									class="form-control controle size hide" id="size"
									placeholder="Enter Top Size">
							</div>
							<div class="form-group">
								<label class="control-label">Bust :</label> <input type="number"
									parent="productDetailFemaleAttr"
									class="form-control controle bust hide" id="bust"
									placeholder="Enter Bust">
							</div>
							<div class="form-group">
								<label class="control-label">Waist :</label> <input
									type="number" parent="productDetailFemaleAttr"
									class="form-control controle waist hide" id="waist"
									placeholder="Enter Waist">
							</div>
							<div class="form-group">
								<label class="control-label">Hip :</label> <input type="number"
									parent="productDetailFemaleAttr"
									class="form-control controle hip hide" id="hip"
									placeholder="Enter Hip">
							</div>
							<div class="form-group">
								<label class="control-label">Height :</label> <input
									type="number" parent="productDetailFemaleAttr"
									class="form-control controle height hide" id="height"
									placeholder="Enter height">
							</div>
						</div>

						<div class="form-group">
							<label for="customFitting">Select Custtom Fitting
								Available :</label> <select class="form-control controle customFitting"
								id="customFitting" parent="productDetails">
								<option value="-1">Select</option>
								<option value="1">Yes</option>
								<option value="2">No</option>
							</select>
						</div>

						<div class="form-group duration">
							<label class="control-label">Duration:</label> <br /> <label
								class="checkbox-inline"><input type="checkbox"
								name="duration" class="controle duration4" id="duration4"
								parent="productDetails" value="">4 days</label> <label
								class="checkbox-inline"><input id="duration6"
								name="duration" type="checkbox" class="controle duration6"
								id="duration6" parent="productDetails" value="">6 days</label> <label
								class="checkbox-inline"><input type="checkbox"
								name="duration" id="duration8" class="controle duration8"
								value="">8 days</label>

						</div>


						<div class="form-group">
							<label for="rent_price">Rent Price :</label> <input type="number"
								class="form-control rentPrice controle" id="rentPrice"
								placeholder="Enter Rent Price">
						</div>

						<div class="form-group">
							<label for="rent_deposite">Deposite % :</label> <input
								type="number" class="form-control depositePercentage controle"
								id="depositePercentage" placeholder="Enter Rent Deposite %"
								parent="productDetails">
						</div>


						<button type="button" class="btn btn-success createProduct" value="Add Product"></button>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(
			function() {
				$(".products .createProduct").text("Create Product");
				$(".products .modalTitle").text("Create Product");
				
				
				ProductController.refresh();
				var productList = ProductController.loadProductList
						.getInstance().ajax.reload();

				$(".products #productsTable tbody").on(
						'click',
						'button',
						function() {
							var data = productList.row($(this).parents('tr'))
									.data();
							if ($(this).hasClass("update-btn")) {
								$(".products .createProduct").text("Update Product");
								$(".products .modalTitle").text("Update Product");
								
								
								/* $('#brandCreate .modal-title').text("Update Brand");
								$('#brandCreate .brandaddbtn').val("Update Brand");
								$('#brandCreate .brandName').val(data.brandName);
								$('#brandCreate .brandId').val(data.brandId);
								$('#brandCreate').modal('show'); */
								ProductController.fetchSingleProduct(data.pId);

							}

							/* if ($(this).hasClass("delete-btn")) {
								$('#deleteBrand .brandId').val(data.brandId);
								$('#deleteBrand').modal('show');
							} */
						});

				$("#female").change(function() {
					// female attribute
					if ($("#female").is(":checked")) {
						$(".productform  .topSize").addClass("hide");
						$(".productform  .bottomSize").addClass("hide");

						$(".productform  .size").removeClass("hide");
						$(".productform  .bust").removeClass("hide");
						$(".productform  .waist").removeClass("hide");
						$(".productform  .hip").removeClass("hide");
						$(".productform  .height").removeClass("hide");
					}
				});

				$("#male").change(function() {
					// female attribute
					if ($("#male").is(":checked")) {
						$(".productform  .topSize").removeClass("hide");
						$(".productform  .bottomSize").removeClass("hide");

						$(".productform  .size").addClass("hide");
						$(".productform  .bust").addClass("hide");
						$(".productform  .waist").addClass("hide");
						$(".productform  .hip").addClass("hide");
						$(".productform  .height").addClass("hide");
					}
				});
			});

	$(".createProduct").click(function() {
		ProductController.create();
	});
	$(".createProdctModalShow").click(function() {
		$(".products .createProduct").text("Create Product");
		$(".products .modalTitle").text("Create Product");
		
		$('#productCreate').modal('show');
	});
	
</script>
