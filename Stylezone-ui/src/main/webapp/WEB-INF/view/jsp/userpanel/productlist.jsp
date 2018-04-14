<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<jsp:include page="header_for_listpage.jsp"></jsp:include>
<style>
.product-template:hover
{
	border:2px solid yellow;
}
</style>

<section class="container">


	<div class="col-sm-12 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center">All Products</h2>
			<c:forEach var="product" items="${productlist}"> 
			<div class="col-sm-3 product-image-wrapper product-template" id="${product.product.productId}">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="../../FileServlet?path=${product.product.productDetails.avt1}">
							<h4>
								&#8377;${product.product.productDetails.rentPrice} 
							</h4>
							<p class="product_name">${product.product.productDetails.productTitle}</p>
							<p class="product_description">${product.product.productDetails.productDescription}</p>
							<%-- <a href="#" class="btn btn-default add-to-cart" productid="${product.product.productId}"><i
								class="fa fa-shopping-cart"></i>Add to cart</a> --%>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<script>
	$(".product-template").click(function(){
		 window.location=website.fetchProducts+$(this).attr("id")
	});


</script>

<jsp:include page="footer_for_listpage.jsp"></jsp:include>