<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page="header.jsp"></jsp:include>
<section id="form" style="margin-top:-10px!important">
	<!--form-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">



				<c:if test="${not empty activeactive}">
					<div class="alert alert-success alert-dismissible" role="alert"
						style="margin-top: 35px;">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="loginError">${activeactive}</div>
					</div>
				</c:if>

				<c:if test="${not empty accountnotactivate}">
					<div class="alert alert-danger alert-dismissible" role="alert"
						style="margin-top: 35px;">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="loginError">${accountnotactivate}</div>
					</div>
				</c:if>


				<c:if test="${not empty error}">
					<div class="alert alert-danger alert-dismissible" role="alert"
						style="margin-top: 35px;">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="loginError">${error}</div>
					</div>
				</c:if>
				<c:if test="${not empty duplicateSessionObject}">
					<div class="alert alert-danger alert-dismissible" role="alert"
						style="margin-top: 35px;">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="loginError">${duplicateSessionObject}</div>
					</div>
				</c:if>

				<c:if test="${not empty notApproved}">
					<div class="alert alert-danger alert-dismissible" role="alert"
						style="margin-top: 35px;">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="loginError">${notApproved}</div>
					</div>
				</c:if>

				<c:if test="${not empty accessdenided}">
					<div class="alert alert-danger alert-dismissible" role="alert"
						style="margin-top: 35px;">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="loginError">${accessdenided}</div>
					</div>
				</c:if>
				<div class="login-form">
					<!--login form-->
					<h2>Login to your account</h2>
					<form action="/Stylezone-ui/login" method="post">
						<input type="email" placeholder="Email ID" name="username" /> <input
							type="password" placeholder="Password" name="password" /> <a
							class="forgotPassButton">Forgot password</a>
						<button type="submit" class="btn btn-default">Login</button>
					</form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-1">
				<h2 class="or">OR</h2>
			</div>
			<div class="col-sm-4">
				<div class="signup-form" id="signup-form">

					<h2>New User Signup!</h2>


					<form id="signupfrmcontainer" class="signupfrmcontainer">
						<div class="message   hide alert alert-dismissible col-sm-12"
							role="alert">
							<span class="text"></span>
						</div>
						<div class="form-group ">
							<input type="text" placeholder="Name" class="controle userName"
								id="userName" />
						</div>
						<div class="form-group ">
							<input type="email" placeholder="Email ID"
								class="controle userEmail" id="userEmail" email />
						</div>
						<div class="form-group ">
							<input type="password" placeholder="Password"
								class="controle password" id="password" />
						</div>
						<div class="form-group ">
							<input type="number" placeholder="Phone Number"
								class="controle userMobileNo" id="userMobileNo" phone />
						</div>
						<div class="form-group ">
							<input type="text" class="form-control controle roleId hide"
								id="roleId" child="userRole"> <select
								class="form-control default_style" id="roleType"
								class="controle roleType">
								<option value="-1">Select Registration type</option>
								<option value="2">User</option>
								<option value="1">Admin</option>
							</select>
						</div>
						<button type="button" class="btn btn-default createUser">Signup</button>
					</form>
				</div>
				<!--/sign up form-->
			</div>
		</div>
	</div>
</section>
<div id="pwdModal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="text-center">Forgot Password</h4>
			</div>
			<div class="modal-body">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="text-center">
								<form class="forgotpass" id="forgotpass">
									'
									<p>If you have forgotten your password you can reset it
										here.</p>
									<div class="panel-body">
										<div class="message   hide alert alert-dismissible col-sm-12"
											role="alert">
											<span class="text"></span>
										</div>
										<div class="otpsending hide">
											<img alt="" src="resources/images/sending.gif" height="50">
										</div>

										<div class="form-group">
											<input class="form-control input-md userEmail controle"
												id="userEmail" placeholder="E-mail Address" type="email"
												child="user">
										</div>


										<div class="form-group hide otptxtbox">
											<input class="form-control input-md otptxtvalue controle"
												placeholder="Enter OTP" type="number" id="otptxtvalue">
										</div>

										<div class="form-group ">
											<input class="form-control input-md hide password1"
												placeholder="Enter Password" type="password">
										</div>

										<div class="form-group">
											<input class="form-control input-md hide password2"
												placeholder="Re-enter Password" type="password">
										</div>

										<div class="row">

											<button class="btn btn-md btn-primary btn-block sendOTP"
												type="button">Send OTP</button>


										</div>
										<div class="row">
											<div class="col-md-12">
												<button type="button"
													class="btn btn-md btn-primary btn-block checkOTP hide">Verify
													OTP</button>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<button type="button"
													class="btn btn-md btn-primary btn-block changePassword hide">Change
													Password</button>
											</div>
										</div>


									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<!--  <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	 -->
			</div>
		</div>
	</div>
</div>

<!--/form-->
<div style="margin-top: 100px">
	<jsp:include page="footer.jsp"></jsp:include>
</div>

<script>
	$("#signupfrmcontainer .createUser").click(function() {
		if(UIutiles.rquiredValidator($("#signupfrmcontainer")))
			UIcontroller.createUser();
	});
	
	$("#roleType").on("change", function() {
		$("#roleId").val( this.value);
	});
	
	$(".forgotPassButton").click(function(){
		 UIcontroller.reInitForgotPassword(); 
		$('#pwdModal').modal('show');
		
	});
	
	
	$(".sendOTP").click(function(){
		if(UIutiles.rquiredValidator($("#forgotpass")))
			UIcontroller.sendForgotPassOTP();
	});
	
	$(".checkOTP").click(function(){
		UIcontroller.verifyForgotPassOTP();
	});
	
	$(".changePassword").click(function(){
		UIcontroller.changePassword();
	});
	
	
</script>


