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