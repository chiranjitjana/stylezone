
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

				<td><button class="btn btn-info" data-toggle="modal"
						data-target="#update">View Details</button></td>
				<td><button class="btn btn-success" class="btn btn-info"
						data-toggle="modal" data-target="#update">Update</button></td>
				<td><button class="btn btn-danger" class="btn btn-info "
						data-toggle="modal" data-target="#view">Delete</button></td>
			</tr>
	</table>
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
							<label class="control-label">Gender Type:</label> <br /> <input
								class="gender" type="radio" name="gender" checkType="men">
							Men &nbsp;&nbsp; <input class="gender" type="radio" name="gender"
								checkType="women"> Women

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
							<label class="control-label">Duration:</label> <br /> <label
								class="checkbox-inline"><input type="checkbox" value="">4
								days</label> <label class="checkbox-inline"><input
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
