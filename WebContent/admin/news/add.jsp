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
						<h4 class="card-title">Thêm mới Tin tức</h4>
						<form class="forms-sample" method="post"
							enctype="multipart/form-data" id="form">
							<div class="form-group">
								<label for="exampleInputTitle">Title</label> <input type="text"
									class="form-control" id="exampleInputTitle" placeholder=""
									name="title">
							</div>
							<div class="form-group">
								<label for="exampleInputPreview">Preview</label> <input
									type="text" class="form-control" id="exampleInputPreview"
									placeholder="" name="preview">
							</div>
							<div class="form-group">
								<label for="exampleInputDetail">Detail</label>
								<textarea class="form-control" id="exampleInputDetail"
									name="detail" rows="4"></textarea>
							</div>
							<div class="form-group">
								<label>Danh mục tin tức</label> <select
									class="js-example-basic-single w-100" id="cats" name="cats">
									<%
									for (Categories categories : catList) {
									%>
									<optgroup label="<%=categories.getName()%>">
										<%
										if (categories.getId() == 1) {
											for (FootballCats footballCats : footballCatList) {
										%>
										<option
											<%if (id != null && id.equals(String.valueOf(footballCats.getId())))
	out.print(" selected");%>
											value="<%=footballCats.getId()%>"><%=footballCats.getName()%></option>
										<%
										}
										} else if (categories.getId() == 2) {
										for (TennisCats tennisCats : tennisCatList) {
										%>
										<option
											<%if (id != null && id.equals(String.valueOf(tennisCats.getId())))
	out.print(" selected");%>
											value="<%=tennisCats.getId()%>"><%=tennisCats.getName()%></option>
										<%
										}
										}
										%>
									</optgroup>
									<%
									}
									%>
								</select>
							</div>
							<div class="form-group">
								<label>Thể loại tin tức</label>
								<div class="col-md-6">
									<div class="form-group">
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="cat_news" id="optionsRadios1"
												value="1"> Tin tức
											</label>
										</div>
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="cat_news" id="optionsRadios2"
												value="2" checked> Video
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>File hình ảnh</label> <input type="file" name="image"
									class="file-upload-default">
								<div class="input-group col-xs-12">
									<input type="text" class="form-control file-upload-info"
										disabled placeholder="Upload Image"> <span
										class="input-group-append">
										<button class="file-upload-browse btn btn-primary"
											type="button">Upload</button>
									</span>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputURL">URL Video</label> <input
									type="text" class="form-control" id="exampleInputURL"
									name="url_video">
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
										"title": {
											required: true
										}
									},
									messages: {
										"title": {
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
	<script type="text/javascript">
		CKEDITOR.replace('detail');
	</script>
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