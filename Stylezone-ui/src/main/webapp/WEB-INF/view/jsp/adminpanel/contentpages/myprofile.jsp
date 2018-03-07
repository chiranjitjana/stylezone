
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
				<form id="formcontainer">
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control readonly controle" id="name" value="Chiranjit Jana"
							readonly>
					</div>
					<div class="form-group">
						<label for="designation">Designation:</label> <input type="text"
							class="form-control controle" id="designation" value="Admin" hidden_id="2"  readonly>
					</div>

					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control readonly controle" id="email"
							value="cjadmin@gmail.com" readonly>
					</div>


					<div class="form-group">
						<label for="phone">Phone Number:</label> <input type="number"
							class="form-control readonly controle" id="number" value="9664335226"
							readonly>
					</div>


					<div class="form-group ">
						<label for="password">Password:</label> <input type="password"
							class="form-control readonly controle" id="password" value="12345"
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
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	$("#editContent").click(function() {
		UIcontroller.profileEditButtonClick();
	});
	
	$("#updateMyProfile").click(function() {
		if(UIcontroller.profileUpdateButtonClickValidator($("#formcontainer")));
			UIcontroller.profileUpdateButtonClick();
	});
</script>

