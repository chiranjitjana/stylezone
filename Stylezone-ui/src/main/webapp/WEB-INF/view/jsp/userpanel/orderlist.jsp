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
	border: 1px solid #dcd8d2 !important;
}
</style>

<div class="list_container_orders">
	<div class="table_info row height_topper">
		<div class="col-sm-6">
			<h4 class="pull-left a_text">
				All Orders <span class="orderListcount"></span>
			</h4>
		</div>
	</div>
	<table id="usersOrdersTable" class="display" cellspacing="0" width="100%"
		class="row">
		<thead>
			<tr style="background-color: #fe980f; color: #fff;">
				<!-- <th>Brand Id</th> -->
		
				<th>Order ID</th>
				<th>Order Date</th>
				<th>Order Rent Cost</th>
				<th>Order Deposit Cost</th>
				<th>Order Total Cost</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<tr>
				<!-- <th>Brand Id</th> -->

				<td>Order ID</td>
				<td>Order Date</td>
				<td>Order Status</td>
				<td>Order Rent Cost</td>
				<td>Order Deposit Cost</td>
				<td><Button class="btn btn-info view-btn">View Details</Button></td>
			</tr>
		</tbody>
	</table>
</div>
<script>
	$(document).ready(function() {
		UIWebsite.loadMyOrdersList.getInstance().ajax.reload();
		
	/* 	$('#ordersTable').DataTable({
			"pagingType" : "full_numbers"
		}); */
	});
</script>