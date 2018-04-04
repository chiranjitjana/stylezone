
<div class="row" style="padding-top: 20px">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="list-group list-group-horizontal">
			<a href="#" class="list-group-item" div_container="brands">Manage
				Brands</a> <a href="#" class="list-group-item" div_container="colors">Manage
				Colors</a> <a href="#" class="list-group-item" div_container="occasions">Manage
				Occasions</a> <a href="#" class="list-group-item"
				div_container="category">Manage Category</a> <a href="#"
				class="list-group-item" div_container="products">Manage Products</a>
		</div>
	</div>

	<div class="stock_container col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="brands">
			<jsp:include page="brands.jsp"></jsp:include>
		</div>
		<div class="colors">
			<jsp:include page="colors.jsp"></jsp:include>
		</div>
		<div class="occasions">
			<jsp:include page="occasions.jsp"></jsp:include>
		</div>
		<div class="category">
			<jsp:include page="category.jsp"></jsp:include>
		</div>
		<div class="products">
			<jsp:include page="products.jsp"></jsp:include>
		</div>
	</div>

</div>


<%-- <jsp:include page="../footer.jsp"></jsp:include>	 --%>
<script>
         $(document).ready(function() {
			
		/* 	$('#products').DataTable( {
         		"pagingType": "full_numbers"
         	} ); */
			
			
			$(".list-group a").click(function(){
				$(".list-group").children().each(function(){
					$(this).removeClass("active");
				});
					$(this).addClass("active");
					$(".stock_container").children().each(function(){
						$(this).addClass("hide");
					});
					console.log($(this).attr("div_container"))
					$("."+$(this).attr("div_container")).removeClass("hide");
				}
			);
			
			
			$(".list-group").children().each(function(index){
					$(this).removeClass("active");
					if(index==0){
							$(this).addClass("active");
							showContainer($(this).attr("div_container"));
						}
					
				});
			
			function showContainer(container){
				$(".stock_container").children().each(function(index){
						$(this).addClass("hide");
						$("."+container).removeClass("hide");
				});
			}
			
			$(".gender").change(function() {
			  if($(this).attr("checkType")== "men")
			  {
				$(".men").removeClass("hide");
				$(".women").addClass("hide");
			  }else
			  {
				$(".men").addClass("hide");
				$(".women").removeClass("hide");
			  }
			});
			
         } );
         
        
         
      </script>
</body>
</html>