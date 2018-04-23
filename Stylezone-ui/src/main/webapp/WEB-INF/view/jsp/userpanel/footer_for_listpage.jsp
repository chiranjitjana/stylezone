	<script src="../../resources/js/jquery.js"></script>
	<script src="../../resources/js/price-range.js"></script>
	<script src="../../resources/js/jquery.scrollUp.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/jquery.prettyPhoto.js"></script>

	<script src="../../resources/js/servicecontroller.js"></script>
	<script src="../../resources/js/uicontroller.js"></script>
	<script src="../../resources/js/uiconstants.js"></script>
	<script src="../../resources/js/ajaxhandler.js"></script>
	<script src="../../resources/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet"
		href="../../resources/jquery-ui-1.12.1.custom/jquery-ui.css" />
	<script src="../../resources/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

	<style>
#ui-datepicker-div {
	z-index: 101 !important;
}
</style>
	<script src="../../resources/js/uiusers.js"></script>
	<script src="../../resources/js/uiutiles.js"></script>

<script>
	$(document).ready(function(){
		UIWebsite.loadMenMenu("M");
		UIWebsite.loadMenMenu("F");
		UIWebsite.loadProductListLatestHome();
		UIWebsite.fetchCart();
	});
</script>


<footer id="footer" style="margin-top:20px;">


	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<p class="pull-left">Copyright &copy; 2018 STYLEZONE Inc. All rights
					reserved.</p>
			</div>
		</div>
	</div>

</footer>

<!--/Footer-->