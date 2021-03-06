<%@page import="model.bean.News"%>
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
			News news = (News) request.getAttribute("news");
			String title = request.getParameter("title");
			String preview = request.getParameter("preview");
			String detail = request.getParameter("detail");
			String url_video = request.getParameter("url_video");
			String cats_id = request.getParameter("cats");
			String cat_news_id = request.getParameter("cat_news");
			String image = "";
			if (news != null) {
				title = news.getTitle();
				preview = news.getPreview();
				detail = news.getDetail();
				if(news.getCat_id() == 1) {
					cats_id = String.valueOf(news.getFootball_cat_id());
				} else if(news.getCat_id() == 2) {
					cats_id = String.valueOf(news.getTennis_cat_id());
				}
				
				cat_news_id = String.valueOf(news.getCat_news_id());
				image = news.getImage();
				url_video = news.getUrl_video();
			}
			%>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card-body">
						<h4 class="card-title">Ch???nh s???a Tin t???c</h4>
						<form class="forms-sample" method="post"
							enctype="multipart/form-data" id="form">
							<div class="form-group">
								<label for="exampleInputTitle">Title</label> <input type="text"
									class="form-control" id="exampleInputTitle" placeholder=""
									name="title" value="<%if (title != null)
	out.print(title);%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPreview">Preview</label> <input
									type="text" class="form-control" id="exampleInputPreview"
									placeholder="" name="preview"
									value="<%if (preview != null)
	out.print(preview);%>">
							</div>
							<div class="form-group">
								<label for="exampleInputDetail">Detail</label>
								<textarea class="form-control" id="exampleInputDetail"
									name="detail" rows="4">
									<%
									if (detail != null)
										out.print(detail);
									%>
								</textarea>
							</div>
							<div class="form-group">
								<label>Danh m???c tin t???c</label> <select
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
											<%if (cats_id != null && cats_id.equals(String.valueOf(footballCats.getId())))
	out.print(" selected");%>
											value="<%=footballCats.getId()%>"><%=footballCats.getName()%></option>
										<%
										}
										} else if (categories.getId() == 2) {
										for (TennisCats tennisCats : tennisCatList) {
										%>
										<option
											<%if (cats_id != null && cats_id.equals(String.valueOf(tennisCats.getId())))
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
								<label>Th??? lo???i tin t???c</label>
								<div class="col-md-6">
									<div class="form-group">
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="cat_news" id="optionsRadios1"
												value="1"
												<%if (Integer.parseInt(cat_news_id) == 1)
	out.print("checked");%>>
												Tin t???c
											</label>
										</div>
										<div class="form-check">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="cat_news" id="optionsRadios2"
												value="2"
												<%if (Integer.parseInt(cat_news_id) == 2)
	out.print("checked");%>>
												Video
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>File h??nh ???nh</label> <input type="file" name="image"
									class="file-upload-default">
								<div class="input-group col-xs-12">
									<input type="text" class="form-control file-upload-info"
										value="<%if (image != null)
	out.print(image);%>"
										disabled="disabled"> <span class="input-group-append">
										<button class="file-upload-browse btn btn-primary"
											type="button">Upload</button>
									</span>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputURL">URL Video</label> <input
									type="text" class="form-control" id="exampleInputURL"
									name="url_video"
									value="<%if (url_video != null)
	out.print(url_video);%>">
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
											required: "Vui l??ng nh???p th??ng tin!"
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