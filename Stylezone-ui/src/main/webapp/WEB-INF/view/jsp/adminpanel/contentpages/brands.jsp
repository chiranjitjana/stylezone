<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6">
			<h4 class="pull-left">
				All Brands <span class="brandlistcount"></span>
			</h4>
		</div>
		<div class="col-sm-6">
			<a class="btn btn-primary pull-right createBrandButton"><span
				class="glyphicon glyphicon-edit" ></span>Create Brand</a>
		</div>
	</div>
	<table id="brands" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr>
				<!-- <th>Brand Id</th> -->
				<th></th>
				<th>Brand Name</th>
				<th>Created By</th>
				<th>Created Date</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody class="brandList">
		</tbody>
	</table>
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
					<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>

					<div class="form-group">

						
							<label for="brand_name">Brand Name:</label> <input type="text"
								class="form-control brandName controle" id="brandName"
								placeholder="Enter brand Name"> <input type="text"
								class="form-control brandId hide controle" id="brandId">
					

					</div>
					<input type="button" class="btn btn-success brandaddbtn"
						value="Add Brand">
				</div>
			</div>
		</form>
	</div>
</div>

<!--delete brand modal-->
<div id="deleteBrand" class="modal fade" role="dialog">
	<div class="modal-dialog">
	<form class="deleteBrand">
		<div class="modal-content">
			<div class="modal-header">
				<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
				<h4>Delete Brand</h4>
			</div>
			<div class="modal-body">
				<div class="message  hide alert alert-dismissible col-sm-12"
					role="alert">
					<span class="text"></span>
				</div>

				<input type="text" class="form-control brandId hide controle"
					id="brandId">
				<p>You are about to delete.</p>
				<p>Do you want to proceed?</p>
			</div>
			<div class="modal-footer">
				<a href="#" id="btnYesBrand" class="btn danger">Yes</a> <a href="#"
					data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
			</div>
		</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		/*  UIcontroller.fetchAllBrands(); */
		var brandlist = UIcontroller.loadBrandList.getInstance().ajax.reload();

		$(".brands #brands tbody").on('click', 'button', function() {
			var data = brandlist.row($(this).parents('tr')).data();
			if ($(this).hasClass("update-btn")) {
				$('#brandCreate .modal-title').text("Update Brand");
				$('#brandCreate .brandaddbtn').val("Update Brand");
				$('#brandCreate .brandName').val(data.brandName);
				$('#brandCreate .brandId').val(data.brandId);
				$('#brandCreate').modal('show');
			}

			if ($(this).hasClass("delete-btn")) {
				$('#deleteBrand .brandId').val(data.brandId);
				$('#deleteBrand').modal('show');
			}
		});
	});

	$(".brands .createBrandButton").click(function() {
		$('#brandCreate .modal-title').text("Create Brand");
		$('#brandCreate .brandaddbtn').val("Create Brand");
		$('#brandCreate .brandName').val("");
		$('#brandCreate .brandId').val("");
		$('#brandCreate').modal('show');
	});

	
	$("#btnYesBrand").click(function(){
		UIcontroller.deleteBrand();
	});
	
	
	$(".brandaddbtn").click(function() {
		if (UIutiles.rquiredValidator($("#brandform")))
			UIcontroller.addBrand();
	});
</script>