
<div class="col-sm-12 div_border">
	<div class="wrapper">
		<div class="row height_topper">
			<div class="header">
				<a href="#" class="pull-left a_text">My Profile</a>
				<button type="button"
					class="btn btn-success btn-sm pull-right a_text" id="editContent">
					<span class="glyphicon glyphicon-pencil"></span> Edit
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 padding">
			<div  class="message hide alert alert-dismissible" role="alert">
				<span class="text"></span>
			</div>
			
				<form id="formcontainer">
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control readonly controle userName" id="userName"
							readonly>
							<input type="text"
							class="form-control controle userId hide" id="userId"  >
					</div>
					<div class="form-group">
						<label for="designation">Designation:</label> <input type="text"
							class="form-control controle roleName" id="designation"  readonly>
							 <input type="text"
							class="form-control controle roleId hide" id="roleId" child="userRole" >
					</div>

					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control readonly controle userEmail" id="userEmail"
							 readonly>
					</div>


					<div class="form-group">
						<label for="phone">Phone Number:</label> <input type="number"
							class="form-control readonly controle userMobileNo" id="userMobileNo" 
							readonly>
					</div>


					<div class="form-group ">
						<label for="password">Password:</label> <input type="password"
							class="form-control readonly controle password" id="password" 
							readonly>
					</div>
					<center>
						<input type="button" class="btn btn-success hide" value="Update"
							id="updateMyProfile"></button>
					</center>
				</form>
			</div>

		</div>
	</div>
</div>
<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
<script>
	$("#editContent").click(function() {
		UIcontroller.profileEditButtonClick();
	});
	
	$("#updateMyProfile").click(function() {
		if(UIutiles.rquiredValidator($("#formcontainer")))
			UIcontroller.profileUpdateButtonClick();
	});
</script>

