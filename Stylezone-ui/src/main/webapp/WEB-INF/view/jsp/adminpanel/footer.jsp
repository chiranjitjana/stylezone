
<script src="resources/js/jquery.js"></script>
<script src="resources/js/price-range.js"></script>
<script src="resources/js/jquery.scrollUp.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.prettyPhoto.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/custom_action.js"></script>
<script src="resources/js/UiConstants.js"></script>
<script src="resources/js/ajaxhandler.js"></script>
<script>
	$(document).ready(function(){
		var userID="<%=request.getSession().getAttribute("email")%>";
		UIcontroller.loadHeader(userID);
	});
</script>