
<div class="row" style="padding-top: 20px">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="list-group list-group-horizontal">
			<a href="#" class="list-group-item" div_container="brands">Manage
				Brands</a> <a href="#" class="list-group-item" div_container="colors">Manage
				Colors</a> <a href="#" class="list-group-item" div_container="occasions">Manage
				Occasions</a> <a href="#" class="list-group-item"
				div_container="category">Manage Category</a> <a href="#"
				class="list-group-item" div_container="products">Manage Products</a>
		</div>
	</div>

	<div class="stock_container col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="brands">
			<div class="list_container">
				<div class="table_info row">
					<div class="col-sm-6 ">
						<h4 class="pull-left">All Brands</h4>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-primary pull-right" data-toggle="modal"
							data-target="#brandCreate"><span
							class="glyphicon glyphicon-edit" /> Create Brand</a>
					</div>
				</div>
				<table id="brands" class="display" cellspacing="0" width="100%"
					class="row">
					<thead>
						<tr>
							<th>Brand Name</th>
							<th>Created Date</th>
							<th>Created By</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>BURBERRY</td>
							<td>21/05/2018</td>
							<td>Rohan Tiwari</td>
							<td><button class="btn btn-success" class="btn btn-info"
									data-toggle="modal" data-target="#update">Update</button></td>
							<td><button class="btn btn-danger" class="btn btn-info "
									data-toggle="modal" data-target="#view">Delete</button></td>
						</tr>
				</table>
			</div>
		</div>
		<div class="colors">
			<div class="list_container">
				<div class="table_info row">
					<div class="col-sm-6 ">
						<h4 class="pull-left">All Colors</h4>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-primary pull-right" data-toggle="modal"
							data-target="#colorCreate"><span
							class="glyphicon glyphicon-edit" /> Create Colors</a>
					</div>
				</div>
				<table id="colors" class="display" cellspacing="0" width="100%"
					class="row">
					<thead>
						<tr>
							<th>Color Name</th>
							<th>Color</th>
							<th>Created Date</th>
							<th>Created By</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Dark Chocolate</td>
							<td><input class="jscolor" value="ffffff"></td>
							<td>21/05/2018</td>
							<td>Rohan Tiwari</td>
							<td><button class="btn btn-success" class="btn btn-info"
									data-toggle="modal" data-target="#update">Update</button></td>
							<td><button class="btn btn-danger" class="btn btn-info "
									data-toggle="modal" data-target="#view">Delete</button></td>
						</tr>
				</table>
			</div>
		</div>
		<div class="occasions">
			<div class="list_container">
				<div class="table_info row">
					<div class="col-sm-6 ">
						<h4 class="pull-left">All Occasions</h4>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-primary pull-right" data-toggle="modal"
							data-target="#occasionCreate"><span
							class="glyphicon glyphicon-edit" /> Create Occasion</a>
					</div>
				</div>
				<table id="occasions" class="display" cellspacing="0" width="100%"
					class="row">
					<thead>
						<tr>
							<th>Occasion Name</th>
							<th>Created Date</th>
							<th>Created By</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Shadi</td>
							<td>21/05/2018</td>
							<td>Rohan Tiwari</td>
							<td><button class="btn btn-success" class="btn btn-info"
									data-toggle="modal" data-target="#update">Update</button></td>
							<td><button class="btn btn-danger" class="btn btn-info "
									data-toggle="modal" data-target="#view">Delete</button></td>
						</tr>
				</table>
			</div>
		</div>
		<div class="category">

			<div class="list_container">
				<div class="table_info row">
					<div class="col-sm-6 ">
						<h4 class="pull-left">All Category</h4>
					</div>
					<div class="col-sm-6">
						<a class="btn btn-primary pull-right" data-toggle="modal"
							data-target="#categoryCreate"><span
							class="glyphicon glyphicon-edit" /> Create Product</a>
					</div>
				</div>
				<table id="category" class="display" cellspacing="0" width="100%"
					class="row">
					<thead>
						<tr>
							<th>Category Name</th>
							<th>Created Date</th>
							<th>Created By</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>BURBERRY</td>
							<td>21/05/2018</td>
							<td>Rohan Tiwari</td>
							<td><button class="btn btn-success" class="btn btn-info"
									data-toggle="modal" data-target="#update">Update</button></td>
							<td><button class="btn btn-danger" class="btn btn-info "
									data-toggle="modal" data-target="#view">Delete</button></td>
						</tr>
				</table>
			</div>
		</div>
		<div class="products">
			<div class="list_container">
				<div class="table_info row">
					<div class="col-sm-6 ">
						<h4 class="pull-left">All Products</h4>
					</div>
					<div class="col-sm-6 ">
						<a class="btn btn-primary pull-right" data-toggle="modal"
							data-target="#productCreate"> <span
							class="glyphicon glyphicon-edit" /> Create Product
						</a>
					</div>
				</div>


				<table id="products" class="display" cellspacing="0" width="100%"
					class="row">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Created Date</th>
							<th>Created By</th>

							<th>Product IsInstock</th>
							<!-- <th>Brand Name</th>
							<th>Category Name</th>
							<th>Product Color</th>
							<th>Occasion Name</th> -->

							<th></th>
							<th></th>
							<th></th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Lungi</td>
							<td>21/05/2018</td>
							<td>Rohan Tiwari</td>

							<!-- <td>Yes</td>
							<td>XYZ</td>
							<td>PQR</td>
							<td><input class="jscolor" value="ffffff"></td> -->
							<td>Shadi</td>

							<td><button class="btn btn-info"
									data-toggle="modal" data-target="#update">View Details</button></td>
							<td><button class="btn btn-success" class="btn btn-info"
									data-toggle="modal" data-target="#update">Update</button></td>
							<td><button class="btn btn-danger" class="btn btn-info "
									data-toggle="modal" data-target="#view">Delete</button></td>
						</tr>
				</table>
			</div>


		</div>
	</div>

</div>





<!--create brand modal-->
<div id="brandCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form id="brandform" class="brandform">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Brand</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
				
						<div class="form-group">
							<label for="brand_name">Brand Name:</label> <input type="text"
								class="form-control brandName controle" id="brandName"
								placeholder="Enter brand Name">
								 <input type="text"
								class="form-control brandId hide controle" id="brandId"
								placeholder="Enter brand Name">
						</div>
				
				</div>
				<input type="button" class="btn btn-success brandaddbtn" value="Add Brand">
			</div>
		</div>
		</form>
	</div>
</div>

<!--create color modal-->
<div id="colorCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Color</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form>
						<div class="form-group">
							<label for="color_name">Color Name:</label> <input type="text"
								class="form-control" id="color_name"
								placeholder="Enter Color Name">
						</div>
						<div class="form-group">
							<label for="color_code">Color Code:</label> <input
								class="jscolor form-control" value="ffffff" id="color_code"
								placeholder="Enter Color Code" style="z-index: 1051 !important">
						</div>
					</form>
				</div>
				<button type="submit" class="btn btn-success">Add Color</button>
			</div>
		</div>
	</div>
</div>


<!--create occasions modal-->
<div id="occasionCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Occasion</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form>
						<div class="form-group">
							<label for="occasion_name">Occasion Name:</label> <input
								type="text" class="form-control" id="occasion_name"
								placeholder="Enter Occasion Name">
						</div>
					</form>
				</div>
				<button type="submit" class="btn btn-success">Add Occasion</button>
			</div>
		</div>
	</div>
</div>


<!--create category modal-->
<div id="categoryCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Category</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form>
						<div class="form-group">
							<label for="category_name">Category Name:</label> <input
								type="text" class="form-control" id="category_name"
								placeholder="Enter Category Name">
						</div>
					</form>
				</div>
				<button type="submit" class="btn btn-success">Add Category</button>
			</div>
		</div>
	</div>
</div>

<!--create product modal-->
<div id="productCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Product</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form>
						<div class="form-group">
							<label for="product_name">Product Name:</label> <input
								type="text" class="form-control" id="product_name"
								placeholder="Enter Product Name">
						</div>

						<div class="form-group">
							<label for="category_name">Select Category:</label> <select
								class="form-control" id="category_name">
								<option value="-1">Select</option>
								<option value="1">Most Trending</option>
								<option value="2">Most awaited</option>
								<option value="3">By Dj</option>
							</select>
						</div>

						<div class="form-group">
							<label for="brand_name">Select Brand:</label> <select
								class="form-control" id="brand_name">
								<option value="-1">Select</option>
								<option value="1">Most Trending</option>
								<option value="2">Most awaited</option>
								<option value="3">By Dj</option>
							</select>
						</div>


						<div class="form-group">
							<label for="color_name">Select Color:</label> <select
								class="form-control" id="color_name">
								<option value="-1">Select</option>
								<option value="#ffccff" style="background-color: #ffccff;">Gray</option>
								<option value="#ffccff" style="background-color: #fffccc;">Blue</option>
								<option value="#ffccff" style="background-color: #ffccfe;">Red</option>
							</select>
						</div>

						<div class="form-group">
							<label for="occasion_name">Select Occasion:</label> <select
								class="form-control" id="occasion_name">
								<option value="-1">Select</option>
								<option value="1">Most Trending</option>
								<option value="2">Most awaited</option>
								<option value="3">By Dj</option>
							</select>
						</div>


						<div class="form-group">
							<label for="occasion_name">Product Description:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea>
						</div>
						<div class="form-group">
							<label class="control-label">Product Image 1 :</label> <input
								type="file" class="filestyle" data-icon="false">
						</div>
						<div class="form-group">
							<label class="control-label">Product Image 2 :</label> <input
								type="file" class="filestyle" data-icon="false">
						</div>
						<div class="form-group">
							<label class="control-label">Product Image 3 :</label> <input
								type="file" class="filestyle" data-icon="false">
						</div>

						<div class="form-group">
							<label class="control-label">Gender Type:</label>
								<br/>
								<input class="gender" type="radio" name="gender"
									checkType="men"> Men
									
									&nbsp;&nbsp;
									
									 <input
									class="gender" type="radio" name="gender" checkType="women"> Women
					
						</div>


						<div class="men hide">
							<div class="form-group">
								<label class="control-label">Top Size :</label> <input
									type="text" class="form-control" id="top_size"
									placeholder="Enter Top Size">
							</div>
							<div class="form-group">
								<label class="control-label">Bottom Size :</label> <input
									type="text" class="form-control" id="bottom_size"
									placeholder="Enter Bottom Size">
							</div>
						</div>

						<div class="women hide">
							<div class="form-group">
								<label class="control-label">Size :</label> <input type="text"
									class="form-control" id="size" placeholder="Enter Top Size">
							</div>
							<div class="form-group">
								<label class="control-label">Bust :</label> <input type="text"
									class="form-control" id="bust" placeholder="Enter Bust">
							</div>
							<div class="form-group">
								<label class="control-label">Waist :</label> <input type="text"
									class="form-control" id="waist" placeholder="Enter Waist">
							</div>
							<div class="form-group">
								<label class="control-label">Hip :</label> <input type="text"
									class="form-control" id="hip" placeholder="Enter Hip">
							</div>
							<div class="form-group">
								<label class="control-label">Height :</label> <input type="text"
									class="form-control" id="height" placeholder="Enter height">
							</div>
						</div>

						<div class="form-group">
							<label for="occasion_name">Select Custtom Fitting
								Available :</label> <select class="form-control" id="occasion_name">
								<option value="-1">Select</option>
								<option value="1">Yes</option>
								<option value="2">No</option>
							</select>
						</div>

						<div class="form-group">
							<label class="control-label">Duration:</label>
							<br/>
								<label class="checkbox-inline"><input type="checkbox"
									value="">4 days</label> <label class="checkbox-inline"><input
									type="checkbox" value="">6 days</label> <label
									class="checkbox-inline"><input type="checkbox" value="">8
									days</label>
							
						</div>


						<div class="form-group">
							<label for="rent_price">Rent Price :</label> <input type="number"
								class="form-control" id="rent_price"
								placeholder="Enter Rent Price">
						</div>

						<div class="form-group">
							<label for="rent_deposite">Deposite % :</label> <input
								type="number" class="form-control" id="rent_deposite"
								placeholder="Enter Rent Deposite %">
						</div>



					</form>
				</div>
				<button type="submit" class="btn btn-success">Add Product</button>
			</div>
		</div>
	</div>
</div>




<!-- Modal -->
<div id="update" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Update Status</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="sel1">Select Staus:</label> <select
						class="form-control" id="sel1">
						<option value="-1">Select</option>
						<option value="1">Order Packing Progress</option>
						<option value="2">Order Out for Delivary</option>
						<option value="3">Order Delevired</option>
						<option value="4">Order Return Back</option>
						<option value="5">Order Deposite Amount Return</option>
					</select>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div id="view" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">View Details</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="order_id">Order ID:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="order_id">Order Date:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="order_id">Order Status:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="order_id">Customer Name:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="order_id">Customer Email:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="order_id">Customer Phone:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="comment">Customer Address:</label>
						<textarea class="form-control" rows="5" id="comment" readonly></textarea>
					</div>
					<div class="form-group">
						<label for="comment">Order Return Back Date:</label> <input
							type="text" class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="comment">Order Deposite %:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="comment">Order Amount:</label> <input type="text"
							class="form-control" id="orderid" readonly>
					</div>
					<div class="form-group">
						<label for="comment">Note to Customer:</label>
						<textarea class="form-control" rows="5" id="comment"></textarea>
					</div>
					<div class="form-group">
						<label for="comment">Return Deposite Amount:</label> <input
							type="text" class="form-control" id="orderid">
					</div>
					<button type="submit" class="btn btn-success">Make Note
						for the customer</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%-- <jsp:include page="../footer.jsp"></jsp:include>	 --%>
<script>
         $(document).ready(function() {
         	$('#brands').DataTable( {
         		"pagingType": "full_numbers"
         	} );
			
			$('#occasions').DataTable( {
         		"pagingType": "full_numbers"
         	} );
			
			$('#colors').DataTable( {
         		"pagingType": "full_numbers"
         	} );
			
			$('#category').DataTable( {
         		"pagingType": "full_numbers"
         	} );
			
			$('#products').DataTable( {
         		"pagingType": "full_numbers"
         	} );
			
			
			$(".list-group a").click(function(){
				$(".list-group").children().each(function(){
					$(this).removeClass("active");
				});
					$(this).addClass("active");
					$(".stock_container").children().each(function(){
						$(this).addClass("hide");
					});
					console.log($(this).attr("div_container"))
					$("."+$(this).attr("div_container")).removeClass("hide");
				}
			);
			
			
			$(".list-group").children().each(function(index){
					$(this).removeClass("active");
					if(index==0){
							$(this).addClass("active");
							showContainer($(this).attr("div_container"));
						}
					
				});
			
			function showContainer(container){
				$(".stock_container").children().each(function(index){
						$(this).addClass("hide");
						$("."+container).removeClass("hide");
				});
			}
			
			$(".gender").change(function() {
			  if($(this).attr("checkType")== "men")
			  {
				$(".men").removeClass("hide");
				$(".women").addClass("hide");
			  }else
			  {
				$(".men").addClass("hide");
				$(".women").removeClass("hide");
			  }
			});
			
         } );
         
         $(".brandaddbtn").click(function(){
        	 $("#brandform .brandId").remove();
        	 if(UIutiles.rquiredValidator($("#brandform")))
        		 UIcontroller.addBrand();
         });
      </script>
</body>
</html>