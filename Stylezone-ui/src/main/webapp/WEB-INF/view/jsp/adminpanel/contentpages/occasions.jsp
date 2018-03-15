
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
