<style>
.modal.modal-wide .modal-dialog {
  width: 90%;
}

.panel-info {
	border-color: #fe980f !important;
}

.panel-info>.panel-heading {
	color: #ffffff !important;
	background-color: #fe980f !important;
	order-color: #fe980f !important;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	color: white;
	text-align: center;
}

.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td,
	.table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
	border: 1px solid #ecc898 !important;
}
</style>
<style>
.bs-wizard {margin-top: 40px;}


.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background: #fbe8aa; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 50%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: #fbbd19; border-radius: 50px; position: absolute; top: 8px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #fbe8aa;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active_now > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active_now > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active_now > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }

.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {
    content: ' ';
    width: 14px;
    height: 14px;
    background: #ce811b;
    border-radius: 50px;
    position: absolute;
    top: 8px;
    left: 8px;
}

.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {
    content: ' ';
    width: 14px;
    height: 14px;
    background: #fbbd19;
    border-radius: 50px;
    position: absolute;
    top: 8px;
    left: 8px;
}

.bs-wizard > .bs-wizard-step > .progress > .progress-bar {
    width: 0px;
    box-shadow: none;
    background: #fe980f;
}

.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {
    color: #595959;
    font-size: 12px;
    margin-bottom: 5px;
}

.bs-wizard > .bs-wizard-step .bs-wizard-info {
        color: #100c0c;
    font-size: 12px;
}

</style>


<div class="container" style="margin-bottom: 100px">
	<div class="panel panel-info">
		<div class="panel-heading">Order Details</div>
		<div class="panel-body">
			<div class="col-sm-8">
				<table class="table table-bordered">
					<tr>
						<th>Order Id</th>
						<th><span class="orderId"></span></th>
					</tr>
					<tr>
						<th>Product Count</th>
						<th><span class="productCount"></span></th>
					</tr>
					<tr>
						<th>Total Rent Cost</th>
						<th>&#8377;<span class="totalRent"></span></th>
					</tr>
					<tr>
						<th>Total Deposit Cost</th>
						<th>&#8377;<span class="totalDeposit"></span></th>
					</tr>
					<tr>
						<th>Total Cost</th>
						<th>&#8377;<span class="totalOrderCost"></span></th>
					</tr>
					<tr>
						<th>Delivery Address</th>
						<td><textarea class="deliveryAddress"></textarea></td>
					</tr>
					<tr>
						<th>Contact Details</th>
						<th><span class="userName"></span><br /><span class="userEmail"></span><br /><span class="userMobile"></span></th>
					</tr>
				</table>
			</div>
			<div class="col-sm-4">
				<table class="table table-bordered">
					<tr>
						<th>Order Date</th>
						<th><span class="orderDate"></span></th>
					</tr>
				</table>
			</div>
			<div class="row">
				<table class="table table-bordered">
					<thead>
					<tr style="background-color: #c3af93" class="tr_header">
						<th></th>
						<th>Product Name</th>
						<th>Duration</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Custom Fitting<br /> Appointment Date</th>
						<th>Rent Cost</th>
						<th>Deposit Cost</th>
						<th>Total Cost</th>
					</tr>
				</thead>
				<tbody class="order_productList">
					<tr class="tr_order_info_template hide">
							<td><img class="productAvt"
								src=""
								alt="" height=100 width=60></td>
							<td><span class="productTitle"></span></td>
							<td><span class="productDuration"></span> Days</td>
							<td><span class="startDate"></span></td>
							<td><span class="endDate"></span></td>
							<td><span class="customFittingAppointmentDate"></span></td>
							<td>&#8377;<span class="rentCost"></span></td>
							<td>&#8377;<span class="depositCost"></span></td>
							<td>&#8377;<span class="totalCost"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="panel panel-info">
		<div class="panel-heading">Order Tracking</div>
		<div class="panel-body">
	
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step orderStatusDiv hide">
                  <div class="text-center bs-wizard-stepnum statusUpdatedDate"></div>
				  
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center statusInfo"></div>
                </div>
                
               <!--  <div class="col-xs-2 bs-wizard-step complete orderStatusDiv">
						complete
                  <div class="text-center bs-wizard-stepnum statusUpdatedDate">27-03-2018 20:18</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center statusInfo">Order Packing Progress</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step complete orderStatusDiv">
						complete
                  <div class="text-center bs-wizard-stepnum statusUpdatedDate">27-03-2018 20:18</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center statusInfo">Order Out for Delivery</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step complete orderStatusDiv">
						complete
                  <div class="text-center bs-wizard-stepnum statusUpdatedDate">27-03-2018 20:18</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center statusInfo">Order Delivered</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active_now orderStatusDiv">
						complete
                  <div class="text-center bs-wizard-stepnum statusUpdatedDate">28-03-2018 12:18</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center statusInfo">Order Return Back</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled orderStatusDiv">
						active
                  <div class="text-center bs-wizard-stepnum statusUpdatedDate">...</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center statusInfo">Order Deposit Amount Return</div>
                </div> -->
            </div>
        
	
		</div>

	</div>
</div>
