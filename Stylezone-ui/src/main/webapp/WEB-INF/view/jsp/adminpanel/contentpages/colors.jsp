<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6 ">
			<h4 class="pull-left">All Colors <span class="colorlistcount"></span></h4>
		</div>
		<div class="col-sm-6">
			<a class="btn btn-primary pull-right createColorButton"><span
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
				<form id="colorform" class="colorform">
					<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>

					
						<div class="form-group">
						<input type="text"
								class="form-control hide controle colorId" id="colorId">
							<label for="colorName">Color Name:</label> <input type="text"
								class="form-control controle colorName " id="colorName"
								placeholder="Enter Color Name">
						</div>
						<div class="form-group">
							<label for="color_code">Color Code:</label> <input
								class="jscolor form-control colorCode controle" value="ffffff" id="colorCode"
								placeholder="Enter Color Code" style="z-index: 1051 !important">
						</div>
					</form>
				</div>
				<button type="submit" class="btn btn-success coloraddbtn">Add Color</button>
			</div>
		</div>
	</div>
</div>




<!--delete brand modal-->
<div id="deleteColor" class="modal fade" role="dialog">
	<div class="modal-dialog">
	<form class="deleteBrand">
		<div class="modal-content">
			<div class="modal-header">
				<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
				<h4>Delete Color</h4>
			</div>
			<div class="modal-body">
				<div class="message  hide alert alert-dismissible col-sm-12"
					role="alert">
					<span class="text"></span>
				</div>

				<input type="text" class="form-control colorId hide controle"
					id="colorId">
				<p>You are about to delete.</p>
				<p>Do you want to proceed?</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="btnYesColor" class="btn danger">Yes</a> <a href="#"
					data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
			</div>
		</div>
		</form>
	</div>
</div>




<script>
$(document).ready(function() {
	var colorlist=UIcontroller.loadColorList.getInstance().ajax.reload();
	$(".colors #colors tbody").on('click', 'button', function() {
		var data = colorlist.row($(this).parents('tr')).data();
		if ($(this).hasClass("update-btn")) {
			$('#colorCreate .modal-title').text("Update Color");
			$('#colorCreate .coloraddbtn').val("Update Color");
			
			$('#colorCreate .colorCode').val(data.colorCode);
			$('#colorCreate .colorName').val(data.colorName);
			$('#colorCreate .colorId').val(data.colorId);
			$('#colorCreate').modal('show');
		}

		if ($(this).hasClass("delete-btn")) {
			$('#deleteColor .colorId').val(data.colorId);
			$('#deleteColor').modal('show');
		}
	});
	
});


$(".colors .createColorButton").click(function() {
	$('#colorCreate .modal-title').text("Create Color");
	$('#colorCreate .coloraddbtn').val("Create Color");
	$('#colorCreate .colorCode').val("");
	$('#colorCreate .colorName').val("");
	$('#colorCreate .colorId').val("");
	$('#colorCreate').modal('show');
});


$(".coloraddbtn").click(function() {
	if (UIutiles.rquiredValidator($("#colorform")))
		UIcontroller.addColor();
});



$("#btnYesColor").click(function(){
	UIcontroller.deleteColor();
});



</script>