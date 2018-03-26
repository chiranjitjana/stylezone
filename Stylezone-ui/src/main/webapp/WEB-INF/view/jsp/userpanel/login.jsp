<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page="header.jsp"></jsp:include>
<section id="form">
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
							href="#" data-target="#pwdModal" data-toggle="modal">Forgot
							my password</a>
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
					aria-hidden="true">�</button>
				<h4 class="text-center">Forgot Password</h4>
			</div>
			<div class="modal-body">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="text-center">

								<p>If you have forgotten your password you can reset it
									here.</p>
								<div class="panel-body">
									<fieldset>
										<div class="form-group">
											<input class="form-control input-md"
												placeholder="E-mail Address" name="email" type="email">
										</div>

										<div class="form-group hide">
											<input class="form-control input-md "
												placeholder="Enter OTP" name="otp" type="number">
										</div>

										<div class="form-group hide">
											<input class="form-control input-md"
												placeholder="Enter Password" name="otp" type="password">
										</div>

										<div class="form-group hide">
											<input class="form-control input-md"
												placeholder="Re-enter Password" name="otp" type="password">
										</div>
									
											<div class="row">
												<div class="col-md-6">
												<input class="btn btn-md btn-primary btn-block"
													value="Send OTP" type="submit">
												</div>
												<div class="col-md-6 hide">
													 <input
													class="btn btn-md btn-primary btn-block " disabled
													value="Change Password" type="submit">
												</div>
											</div>
									
									</fieldset>
								</div>
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
<jsp:include page="footer.jsp"></jsp:include>


<script>
	$("#signupfrmcontainer .createUser").click(function() {
		if(UIutiles.rquiredValidator($("#signupfrmcontainer")))
			UIcontroller.createUser();
	});
	
	$("#roleType").on("change", function() {
		$("#roleId").val( this.value);
	});
</script>


