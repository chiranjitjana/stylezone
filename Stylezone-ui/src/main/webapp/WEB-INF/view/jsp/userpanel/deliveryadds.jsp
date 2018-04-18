<style>
.div_border {
	border: 1px solid #F0F0E9;
	border-radius: 5px;
}

.height_topper {
	height: 40px;
	background: #F0F0E9;
}

.a_text {
	color: #FE980F;
	padding: 5px;
}

.a_text:hover {
	color: #fff !important;
}

.padding {
	padding: 5px;
}

label {
	color: #696763 !important;
}

.btn-success {
	color: #fff !important;
	background-color: #f09622 !important;
	border-color: #fe980f !important;
}
.list_container {
    border: 1px solid #dcd8d2!important;
}
</style>

<div class="list_container">
	<div class="table_info row height_topper">
		<div class="col-sm-6">
			<h4 class="pull-left a_text">
				All Address <span class="addlistcount"></span>
			</h4>
		</div>
		<div class="col-sm-6">
			<a class="btn  btn-sm pull-right a_text createAdd"><span
				class="glyphicon glyphicon-edit"></span>Create Address</a>
		</div>
	</div>
	<table id="adressTable" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr style="background-color: #fe980f;
    color: #fff;">
				<!-- <th>Brand Id</th> -->
				<th></th>
				<th>Line 1</th>
				<th>Line 2</th>
				<th>City</th>
				<th>State</th>
				<th>Postcode</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>


<!--create brand modal-->
<div id="addressModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
	
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
					<h4 class="modal-title">Create Address</h4>
				</div>
				<div class="modal-body">
					<form class="addressfrom" id="addressfrom">
					<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>






					<!-- Text input-->
					<div class="form-group"
						style="padding-top: 10px; padding-bottom: 20px">
						<label class="col-sm-2 control-label" for="textinput">Line
							1</label>
						<div class="col-sm-10">
							<input type="text" placeholder="Address Line 1" id="line1"
								class="form-control line1 controle">
								
								<input type="text" placeholder="Address Line 1" id="addId"
								class="form-control addId controle hide">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group"
						style="padding-top: 10px; padding-bottom: 20px">
						<label class="col-sm-2 control-label" for="textinput">Line
							2</label>
						<div class="col-sm-10">
							<input type="text" placeholder="Address Line 2" id="line2"
								class="form-control line2 controle">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group"
						style="padding-top: 10px; padding-bottom: 20px">
						<label class="col-sm-2 control-label" for="textinput">City</label>
						<div class="col-sm-10">
							<input type="text" id="city" placeholder="City"
								class="form-control controle city">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group"
						style="padding-top: 10px; padding-bottom: 20px">
						<label class="col-sm-2 control-label" for="textinput">State</label>
						<div class="col-sm-4">
							<select class="form-control state controle" id="state">
								<option value="-1">SELECT STATE</option>
								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Arunachal Pradesh">Arunachal Pradesh</option>
								<option value="Assam">Assam</option>
								<option value="Bihar">Bihar</option>
								<option value="Chhattisgarh">Chhattisgarh</option>
								<option value="Dadra and Nagar Haveli">Dadra and Nagar
									Haveli</option>
								<option value="Daman and Diu">Daman and Diu</option>
								<option value="Delhi">Delhi</option>
								<option value="Goa">Goa</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Haryana">Haryana</option>
								<option value="Himachal Pradesh">Himachal Pradesh</option>
								<option value="Jammu and Kashmir">Jammu and Kashmir</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="Karnataka">Karnataka</option>
								<option value="Kerala">Kerala</option>
								<option value="Madhya Pradesh">Madhya Pradesh</option>
								<option value="Maharashtra">Maharashtra</option>
								<option value="Manipur">Manipur</option>
								<option value="Meghalaya">Meghalaya</option>
								<option value="Mizoram">Mizoram</option>
								<option value="Nagaland">Nagaland</option>
								<option value="Orissa">Orissa</option>
								<option value="Puducherry">Puducherry</option>
								<option value="Punjab">Punjab</option>
								<option value="Rajasthan">Rajasthan</option>
								<option value="Sikkim">Sikkim</option>
								<option value="Tamil Nadu">Tamil Nadu</option>
								<option value="Telangana">Telangana</option>
								<option value="Tripura">Tripura</option>
								<option value="Uttar Pradesh">Uttar Pradesh</option>
								<option value="Uttarakhand">Uttarakhand</option>
								<option value="West Bengal">West Bengal</option>
							</select>
						</div>

						<label class="col-sm-2 control-label" for="textinput">Postcode</label>
						<div class="col-sm-4">
							<input type="text" placeholder="Post Code"
								class="form-control controle postcode" id="postcode">
						</div>
					</div>





					<div class="form-group"
						style="padding-top: 10px; padding-bottom: 20px">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="pull-right">
								<button type="button" class="btn btn-primary createFinalAddress">Save</button>
							</div>
						</div>
					</div>
					
		</form>
					<!-- /.col-lg-12 -->
				</div>

			</div>


	</div>
</div>

<!--delete brand modal-->
<div id="deleteAddress" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<form class="deleteProduct">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
					<h4>Delete Address</h4>
				</div>
				<div class="modal-body">
					<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>

					<input type="text" class="form-control addId hide controle"
						id="addId">
					<p>You are about to delete.</p>
					<p>Do you want to proceed?</p>
				</div>
				<div class="modal-footer">
					<a href="#" id="btnYesAddress" class="btn danger">Yes</a> <a
						href="#" data-dismiss="modal" aria-hidden="true"
						class="btn secondary">No</a>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		var addList=UIWebsite.loadMyAddressList.getInstance().ajax.reload();
		
		
		$(".delivery_address #adressTable tbody").on('click', 'button', function() {
			var data = addList.row($(this).parents('tr')).data();
			if ($(this).hasClass("update-btn")) {
				$('#addressModal .modal-title').text("Update Address");
				$("#addressModal .addId").val(data.addId);
				$("#addressModal .line1").val(data.line1);
				$("#addressModal .line2").val(data.line2);
				$("#addressModal .city").val(data.city);
				$("#addressModal .postcode").val(data.postcode);
				$("#addressModal .state").val(data.state);
				$('#addressModal').modal('show');
			}

			if ($(this).hasClass("delete-btn")) {
				$('#deleteAddress .addId').val(data.addId);
				$('#deleteAddress').modal('show');
			}
		});
	});

	$(".delivery_address .createAdd").click(function() {
	 		$('#addressModal .modal-title').text("Create Address");
	 		UIutiles.resetForm("#addressModal");
			$('#addressModal').modal('show');
	});

	$("#btnYesAddress").click(function() {
		UIWebsite.deleteAddress();
	});

	$(".createFinalAddress").click(function() {
		if (UIutiles.rquiredValidator($("#addressfrom"))){
			UIWebsite.createAddress();
		}
			
	});
</script>