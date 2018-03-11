<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>
</head>

<body>
	<div class="loading">
			<img src="resources/images/loading.gif" class="center-block">
	</div>


	<div class="data_container hide">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="container">
			<div class="col-sm-2">
				<jsp:include page="adminsidebar.jsp"></jsp:include>
			</div>
			<div class="col-sm-10">
				<jsp:include page="content.jsp"></jsp:include>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>