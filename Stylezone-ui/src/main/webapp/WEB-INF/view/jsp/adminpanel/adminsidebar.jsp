<div class="sidebarcontainer">
	<button type="button" class="btn normal_state col-sm-12"
		sidebar="myprofile">MyProfile</button>
	<br />
	<button type="button" class="btn normal_state col-sm-12"
		sidebar="orders">Orders</button>
	<br />
	<button type="button" class="btn normal_state col-sm-12"
		sidebar="stock">Stock</button>
	<br />
	<!-- <button type="button" class="btn normal_state col-sm-12"
		sidebar="report">Reports</button> -->
	<br />
	<!-- <button type="button" class="btn normal_state col-sm-12"
		sidebar="notification">Contact Us Request</button> -->
	<br />
	<button type="button" class="btn normal_state col-sm-12 hide approveStaff"
		sidebar="createstaff">Approve Staff</button>
</div>

<script>
	$(document).ready(function() {
		$(".sidebarcontainer button").each(function(index) {
			$(this).removeClass("active");
			
			if(index==0){
				$(this).addClass("active");
				$(this).removeClass("normal_state");
				$("." + $(this).attr("sidebar")).removeClass("hide");
				
			}
		});
		
	});

	$(".sidebarcontainer button").click(function() {

		$(".sidebarcontainer button").each(function(index) {
			$(this).removeClass("active");
			$(this).addClass("normal_state");
			$("." + $(this).attr("sidebar")).addClass("hide");
		});
		$(this).removeClass("normal_state");
		$(this).addClass("active");
		$("." + $(this).attr("sidebar")).removeClass("hide");
		UIcontroller.updateUi($(this).attr("sidebar"));
	});
</script>