<%@page import="model.bean.TennisCats"%>
<%@page import="model.bean.FootballCats"%>
<%@page import="model.bean.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sports Paradise Admin</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sports Paradise Admin</title>
<!-- plugins:css -->
<script
	src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="../../admin/vendors/feather/feather.css">
<link rel="stylesheet"
	href="../../admin/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="../../admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="../../admin/vendors/select2/select2.min.css">
<link rel="stylesheet"
	href="../../admin/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="../../admin/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/public/assets/images/favicon.png" />
<script src="<%=request.getContextPath()%>/lib/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="container-scroller">
		<%@ include file="../../admin/partials/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="../../admin/partials/_settings-panel.jsp"%>

			<!-- partial -->
			<%@ include file="../../admin/partials/_sidebar.jsp"%>
			<!-- partial -->

			<%
			ArrayList<Categories> catList = (ArrayList<Categories>) request.getAttribute("catList");
			ArrayList<FootballCats> footballCatList = (ArrayList<FootballCats>) request.getAttribute("footballCatList");
			ArrayList<TennisCats> tennisCatList = (ArrayList<TennisCats>) request.getAttribute("tennisCatList");
			String id = request.getParameter("cats");
			%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card-body">
						<h3 class="card-title">Thêm mới Danh mục Tin tức</h3>
						<form class="forms-sample" method="post" id="form">

							<div class="form-group">
								<label>Môn thể thao</label>
								<div class="col-md-6">
									<div class="form-group">
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="cats_id" id="optionsRadios1"
												value="1"> Bóng đá
											</label>
										</div>
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="cats_id" id="optionsRadios2"
												value="2" checked> Quần vợt
											</label>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="exampleInputTitle">Tên danh mục tin tức</label> <input type="text"
									class="form-control" id="exampleInputTitle" placeholder=""
									name="name">
							</div>
							<button type="submit" class="btn btn-primary mr-2">Submit</button>
							<button class="btn btn-light">Cancel</button>
						</form>
						
						<style>
							.error {
								color: red;
							}
						</style>
						
						<script type="text/javascript">
							$(document).ready(function() {
								$('#form').validate({
									rules: {
										"name": {
											required: true
										}
									},
									messages: {
										"name": {
											required: "Vui lòng nhập thông tin!"
										}
									}
								});
							});
						</script>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<%@ include file="../../admin/partials/_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../../admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="../../admin/vendors/typeahead.js/typeahead.bundle.min.js"></script>
	<script src="../../admin/vendors/select2/select2.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../../admin/js/off-canvas.js"></script>
	<script src="../../admin/js/hoverable-collapse.js"></script>
	<script src="../../admin/js/template.js"></script>
	<script src="../../admin/js/settings.js"></script>
	<script src="../../admin/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="../../admin/js/file-upload.js"></script>
	<script src="../../admin/js/typeahead.js"></script>
	<script src="../../admin/js/select2.js"></script>
	<!-- End custom js for this page-->

		<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
</body>
</html>