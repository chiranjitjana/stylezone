<jsp:include page="header.jsp"></jsp:include>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	color: white;
	text-align: center;
}
</style>
<div id="contact-page" class="container">
	<div class="bg">
		<div class="row">
			<div class="col-sm-8">
				<div class="contact-form">
					<h2 class="title text-center">Get In Touch</h2>
					<div class="message hide alert alert-dismissible" role="alert">
						<span class="text"></span>
					</div>

					<form id="main-contact-form" class="contact-form row"
						name="contact-form">
						<div class="form-group col-md-6">
							<input type="text" name="name"
								class="form-control controle userName" id="userName"
								required="required" placeholder="Name"
								title="Please provide Name">
						</div>
						<div class="form-group col-md-6">
							<input type="email" name="email"
								class="form-control controle userEmail" id="userEmail" email
								required="required" placeholder="Email"
								title="Please provide email">
						</div>
						<div class="form-group col-md-12">
							<input type="text" name="subject"
								class="form-control controle messageSubject" id="messageSubject"
								required="required" placeholder="Subject"
								title="Please provide subject">
						</div>
						<div class="form-group col-md-12">
							<textarea name="message" id="messageText" required="required"
								id="messageSubject" class="form-control controle messageSubject"
								rows="8" placeholder="Your Message Here"
								title="Please provide message"></textarea>
						</div>
						<div class="form-group col-md-12">
							<button type="button" name="submitMessage"
								class="btn btn-primary pull-right btnSubmit">Submit</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="contact-info">
					<h2 class="title text-center">Contact Info</h2>
					<address>
						<p>StyleZone.com</p>
						<p>RJ College,Ghatkopar</p>
						<p>Mumbai - 400086</p>
						<p>Mobile: +2346 17 38 93</p>
						<p>Email: info@stylezone.com</p>
					</address>
				</div>
			</div>
		</div>
	</div>
</div>
<!--/#contact-page-->
<div class="footer">
	<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
	$(".header-bottom").show();
	$(document).ready(function() {
		UIcontroller.updateUi("myprofile");
	});

	$(".btnSubmit").click(
			function() {
				if (UIutiles.rquiredValidator($("#main-contact-form"))) {
					$("#main-contact-form").find("#message").addClass("hide");

					//save the contact details through service method

					$("#main-contact-form").trigger("reset");
				} else {
					$("#main-contact-form").find("#message").text(
							"Please provide all the details !!");
					$("#main-contact-form").find("#message")
							.removeClass("hide");
				}
			});
</script>