<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page="header_for_listpage.jsp"></jsp:include>
<style>
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

<div class="container" style="margin-bottom: 100px">
	<div class="panel panel-info">
		<div class="panel-heading">Order Details</div>
		<div class="panel-body">
			<div class="col-sm-8">
				<table class="table table-bordered">
					<tr>
						<th>Order Id</th>
						<th>${orderDetails.orderId}</th>
					</tr>
					<tr>
						<th>Product Count</th>
						<th>${orderDetails.productCount}</th>
					</tr>
					<tr>
						<th>Total Rent Cost</th>
						<th>&#8377;${orderDetails.rentTotal}</th>
					</tr>
					<tr>
						<th>Total Deposit Cost</th>
						<th>&#8377;${orderDetails.depositeTotal}</th>
					</tr>
					<tr>
						<th>Total Cost</th>
						<th>&#8377;${orderDetails.total}</th>
					</tr>
					<tr>
						<th>Delivery Address</th>
						<td><textarea>${orderDetails.address}</textarea></td>
					</tr>
					<tr>
						<th>Contact Details</th>
						<th>${orderDetails.username}<br />${orderDetails.useremail}<br />${orderDetails.userphone}</th>
					</tr>
				</table>
			</div>
			<div class="col-sm-4">
				<table class="table table-bordered">
					<tr>
						<th>Order Date</th>
						<th>${orderDetails.createdDate}</th>
					</tr>
				</table>
			</div>
			<div class="row">
				<table class="table table-bordered">
					<tr style="background-color: #c3af93">
						<th><th>Product Name<th>Duration<
		
										/th><th>Start Date</th>
						<th>End Date</th>
						<th>Custom Fitting<br /> Appointment Date</th>
						<th>Rent Cost</th>
						<th>Deposit Cost</th>
						<th>Total Cost</th>
					</tr>
					<c:forEach var="order" items="${orderProductList}"> 
					
					<tr>
							<td><img
								src="../../FileServlet?path=${order.productAvt}"
								alt="${order.productTitle}" height=100 width=60></td>
							<td>${order.productTitle}</td>
							<td>${order.duration} Days</td>
							<td>${order.startDate}</td>
							<td>${order.endDate}</td>
							<td>${order.customFittingAppointmentDate}</td>
							<td>&#8377;${order.rentPrice}</td>
							<td>&#8377;${order.deposite}</td>
							<td>&#8377;${order.totalPrice}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<div class="panel panel-info">
		<div class="panel-heading">Order Tracking</div>
		<div class="panel-body">
		<div class="container">
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">27-03-2018 16:18</div>
				  
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Order Request Accepted </div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step complete">
						<!-- complete -->
                  <div class="text-center bs-wizard-stepnum">27-03-2018 20:18</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Order Packing Done</div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step active_now">
						<!-- complete -->
                  <div class="text-center bs-wizard-stepnum">28-03-2018 12:18</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Order is out for delivery</div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled">
						<!-- active -->
                  <div class="text-center bs-wizard-stepnum">...</div>
                  <div class="progress">
							<div class="progress-bar"></div>
						</div>
                  <a href="#" class="bs-wizard-dot"></a>
                  <div class="bs-wizard-info text-center">Order Delivered</div>
                </div>
            </div>
        
	</div>
		</div>

	</div>
</div>
<div class="footer">
	<jsp:include page="footer_for_listpage.jsp"></jsp:include>
</div>
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
