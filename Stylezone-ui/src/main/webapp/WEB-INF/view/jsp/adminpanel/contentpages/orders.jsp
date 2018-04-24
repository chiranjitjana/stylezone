<div class="list_container">
	<div class="table_info row">
		<div class="col-sm-6">
			<h4 class="pull-left">
				All Orders <span class="orderListcount"></span>
			</h4>
		</div>
	</div>

	<table id="ordersTableAdmin" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Order ID</th>
				<th>Order Date</th>
				<th>Rent Cost</th>
				<th>Deposit Cost</th>
				<th>Total Cost</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			
		</tbody> 
	</table>
</div>

<!-- Modal -->
<div id="updateStatus" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Update Status</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="sel1">Select Staus:</label> <select
						class="form-control" id="trackerstatus">
					</select>
				</div>
				<button type="button" class="btn btn-success">Submit</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div id="viewOrderDetails" class="modal fade modal-wide" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content" style="width:100%">
			<div class="modal-header" style="width:100%">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">View Details</h4>
			</div>
			<div class="modal-body" style="width:100%">
				<jsp:include page="orderdetails.jsp"></jsp:include>
			</div>

		</div>
	</div>
</div>

<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
<script>
	$(document).ready(function() {
		var ordeList=UIcontroller.loadAllOrdersList.getInstance().ajax.reload();
		$(".adminorders #ordersTableAdmin tbody").on('click', 'button', function() {
			var data = ordeList.row($(this).parents('tr')).data();
			
			if ($(this).hasClass("update-status")) {
				UIcontroller.fetchAllTrackerListFromDBforOrder(data.orderId);
				$('#updateStatus').modal('show');
			}

			if ($(this).hasClass("view-details")) {
				UIcontroller.fetchOrderDetails(data.orderId);
			}
		});
		
	});
</script>
