<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6 ">
			<h4 class="pull-left">All Colors <span class="colorlistcount"></span></h4>
		</div>
		<div class="col-sm-6">
			<a class="btn btn-primary pull-right" data-toggle="modal"
				data-target="#colorCreate"><span
				class="glyphicon glyphicon-edit" ></span> Create Colors</a>
		</div>
	</div>
	<table id="colors" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr>
				<th></th>
				<th>Color Code</th>
				<th>Color</th>
				<th>Color Name</th>
				<th>Created Date</th>
				<th>Created By</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody class="colorList">
		</tbody>
	</table>
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
<script>
$(document).ready(function() {
	UIcontroller.loadColorList.getInstance().ajax.reload();
});

</script>