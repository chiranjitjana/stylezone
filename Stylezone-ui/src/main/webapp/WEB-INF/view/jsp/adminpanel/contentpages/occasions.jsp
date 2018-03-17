
<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6 ">
			<h4 class="pull-left">All Occasions<span class="occasionlistcount"></span></h4>
		</div>
		<div class="col-sm-6">
			<a class="btn btn-primary pull-right" ><span
				class="glyphicon glyphicon-edit createOccasion" /> Create Occasion</a>
		</div>
	</div>
	<table id="occasions" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr>
				<th></th>
				<th>Occasion Name</th>
				<th>Created Date</th>
				<th>Created By</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody class="occasionList">
		<!-- 	<tr>
				<td>Shadi</td>
				<td>21/05/2018</td>
				<td>Rohan Tiwari</td>
				<td><button class="btn btn-success" class="btn btn-info"
						data-toggle="modal" data-target="#update">Update</button></td>
				<td><button class="btn btn-danger" class="btn btn-info "
						data-toggle="modal" data-target="#view">Delete</button></td>
			</tr> -->
	</table>
</div>


<!--create occasions modal-->
<div id="occasionCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form id="occasionform" class="occasionform">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Occasion</h4>
			</div>
			<div class="modal-body">
				<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>
				<div class="form-group">
					
						<div class="form-group">
						<input type="text"
								class="form-control occasionId controle hide" id="occasionId"/>
							<label for="occasion_name">Occasion Name:</label> <input
								type="text" class="form-control controle occasionName" id="occasionName"
								placeholder="Enter Occasion Name">
						</div>
					
				</div>
				<input type="button" class="btn btn-success addOccasionBtn" value="Add Occasion">
			</div>
		</div>
		</form>
	</div>
</div>

<!--delete brand modal-->
<div id="deleteOccasion" class="modal fade" role="dialog">
	<div class="modal-dialog">
	<form class="deleteOccasion">
		<div class="modal-content">
			<div class="modal-header">
				<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
				<h4>Delete Occasion</h4>
			</div>
			<div class="modal-body">
				<div class="message  hide alert alert-dismissible col-sm-12"
					role="alert">
					<span class="text"></span>
				</div>

				<input type="text" class="form-control occasionId hide controle"
					id="occasionId">
				<p>You are about to delete.</p>
				<p>Do you want to proceed?</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="btnYesOccasions" class="btn danger">Yes</a> <a href="#"
					data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
			</div>
		</div>
		</form>
	</div>
</div>


<script>
	$(document).ready(function() {
		/*  UIcontroller.fetchAllBrands(); */
		var occasionlist = UIcontroller.loadOccasionList.getInstance().ajax.reload();

		$(".occasions #occasions tbody").on('click', 'button', function() {
			var data = occasionlist.row($(this).parents('tr')).data();
			if ($(this).hasClass("update-btn")) {
				$('#occasionCreate .modal-title').text("Update Occasion");
				$('#occasionCreate .addOccasionBtn').val("Update Occasion");
				$('#occasionCreate .occasionName').val(data.occasionName);
				$('#occasionCreate .occasionId').val(data.occasionId);
				$('#occasionCreate').modal('show');
			}

			 if ($(this).hasClass("delete-btn")) {
				$('#deleteOccasion .occasionId').val(data.occasionId);
				$('#deleteOccasion').modal('show');
			} 
		});
	});

	$(".occasions .createOccasion").click(function() {
		$('#occasionCreate .modal-title').text("Create Occasion");
		$('#occasionCreate .addOccasionBtn').val("Create Occasion");
		$('#occasionCreate .occasionName').val("");
		$('#occasionCreate .occasionId').val("");
		$('#occasionCreate').modal('show');
	});

	
	$("#btnYesOccasions").click(function(){
		UIcontroller.deleteOccasion();
	});
	
	
	$(".addOccasionBtn").click(function() {
		if (UIutiles.rquiredValidator($("#occasionform")))
			UIcontroller.addOcasions();
	}); 
</script>