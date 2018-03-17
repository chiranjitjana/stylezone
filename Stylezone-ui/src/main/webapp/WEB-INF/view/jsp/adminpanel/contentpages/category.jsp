<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6 ">
			<h4 class="pull-left">All Category <span class="catlistcount"></span></h4>
		</div>
		<div class="col-sm-6">
			<a class="btn btn-primary pull-right createCatBtn"><span
				class="glyphicon glyphicon-edit" ></span> Create Product</a>
		</div>
	</div>
	<table id="category" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr>
				<th></th>
				<th>Category Name</th>
				<th>Created By</th>
				<th>Created Date</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody class="catList">
			<!-- <tr>
				<td>BURBERRY</td>
				<td>21/05/2018</td>
				<td>Rohan Tiwari</td>
				<td><button class="btn btn-success" class="btn btn-info"
						data-toggle="modal" data-target="#update">Update</button></td>
				<td><button class="btn btn-danger" class="btn btn-info "
						data-toggle="modal" data-target="#view">Delete</button></td>
			</tr> -->
		</tbody>
	</table>
</div>

<!--create category modal-->
<div id="categoryCreate" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form id="catform" class="catform">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Category</h4>
			</div>
			<div class="modal-body">
				<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>
				
					
						<div class="form-group">
							<label for="category_name">Category Name:</label> <input
								type="text" class="form-control catName controle" id="catName"
								placeholder="Enter Category Name">
								 <input type="text"
								class="form-control catId hide controle" id="catId">
						</div>
					
				
				<input type="button" class="btn btn-success addCategory" value="Add Category">
			</div>
		</div>
		</form>
	</div>
</div>
<!--delete brand modal-->
<div id="deleteCat" class="modal fade" role="dialog">
	<div class="modal-dialog">
	<form class="deleteCat">
		<div class="modal-content">
			<div class="modal-header">
				<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
				<h4>Delete Category</h4>
			</div>
			<div class="modal-body">
				<div class="message  hide alert alert-dismissible col-sm-12"
					role="alert">
					<span class="text"></span>
				</div>

				<input type="text" class="form-control catId hide controle"
					id="catId">
				<p>You are about to delete.</p>
				<p>Do you want to proceed?</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="btnYesCat" class="btn danger">Yes</a> <a href="#"
					data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
			</div>
		</div>
		</form>
	</div>
</div>


<script>
$(document).ready(function() {

	var catlist = UIcontroller.loadCatList.getInstance().ajax.reload();
	$(".category #category tbody").on('click', 'button', function() {
		var data = catlist.row($(this).parents('tr')).data();
		if ($(this).hasClass("update-btn")) {
			$('#categoryCreate .modal-title').text("Update Category");
			$('#categoryCreate .addCategory').val("Update Category");
			$('#categoryCreate .catId').val(data.catId);
			$('#categoryCreate .catName').val(data.catName);
			$('#categoryCreate').modal('show');
		}

		if ($(this).hasClass("delete-btn")) {
			$('#deleteCat .catId').val(data.catId);
			$('#deleteCat').modal('show');
		}
	});
});




$(".category .createCatBtn").click(function() {
	$('#categoryCreate .modal-title').text("Create Category");
	$('#categoryCreate .addCategory').val("Create Category");
	$('#categoryCreate .catName').val("");
	$('#categoryCreate .catId').val("");
	$('#categoryCreate').modal('show');
});


$("#btnYesCat").click(function(){
	UIcontroller.deleteCat();
});


$(".addCategory").click(function() {
	if (UIutiles.rquiredValidator($("#catform")))
		UIcontroller.addCat();
});


</script>
