<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6">
			<h4 class="pull-left">
				All Admin Request <span class="listAdminRequestCount"></span>
			</h4>
		</div>
	</div>
	<table id="adminRequestTable" class="display" cellspacing="0"
		width="100%" class="row">
		<thead>
			<tr>
				<!-- <th>Brand Id</th> -->
				<th></th>
				<th>User Name</th>
				<th>User Email</th>
				<th>User Phone Number</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody class="adminRequestTbody">
		</tbody>
	</table>
</div>


<!--create brand modal-->
<div id="acceptRQ" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form id="acceptRQform" class="acceptRQform">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Accept Request</h4>
				</div>
				<div class="modal-body">
					<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>

					<div class="form-group">
						<input type="text" class="form-control userId hide controle"
							id="userId">
						<p>You are want to accept Request ?.</p>
					</div>
					<div class="modal-footer">
					<a href="#" id="btnYesAccept" class="btn danger">Yes</a> <a
						href="#" data-dismiss="modal" aria-hidden="true"
						class="btn secondary">No</a>
				</div>
				</div>
			</div>
		</form>
	</div>
</div>

<!--delete brand modal-->
<div id="rejectRQ" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<form class="rejectRQform">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
					<h4>Reject Request</h4>
				</div>
				<div class="modal-body">
					<div class="message  hide alert alert-dismissible col-sm-12"
						role="alert">
						<span class="text"></span>
					</div>

					<input type="text" class="form-control userId hide controle"
						id="userId">
					<p>You are want to reject Request ?.</p>
				</div>
				<div class="modal-footer">
					<a href="#" id="btnYesRejected" class="btn danger">Yes</a> <a
						href="#" data-dismiss="modal" aria-hidden="true"
						class="btn secondary">No</a>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		var reuqestList=UIcontroller.loadAllInActiveAdminList.getInstance().ajax.reload();

			$(".createstaff #adminRequestTable tbody").on('click', 'button', function() {
				var data = reuqestList.row($(this).parents('tr')).data();
				if ($(this).hasClass("accept-request")) {
					$('#acceptRQ .userId').val(data.userId);
					$('#acceptRQ').modal('show');
				}
				
				if ($(this).hasClass("reject-request")) {
					$('#rejectRQ .userId').val(data.userId);
					$('#rejectRQ').modal('show');
				}
			}); 
	});
	
	
	
	$("#btnYesAccept").click(function(){
		
		UIcontroller.UpdateRequest("accept");
	});
	
	
	$("#btnYesRejected").click(function(){
		UIcontroller.UpdateRequest("reject");
	});
	
</script>