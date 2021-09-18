<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sports Paradise</title>
<script
	src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.js"></script>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/vertical-layout-light/style.css">
<!-- endinject -->
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/select2/select2.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/public/assets/images/favicon.png" />
</head>

<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-lg-4 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<img
									src="${pageContext.request.contextPath}/public/assets/images/logo.svg"
									alt="logo">
							</div>
							
							<h4>Đăng ký ngay tại đây?</h4>
							<h6 class="font-weight-light">Chỉ một vài bước đơn giản là bạn có thể tạo cho mình một tài khoản mới</h6>
							<%
							String err = request.getParameter("err");
							if("1".equals(err)){
				        		out.print("<span style='color: red;font-weight: bold;' >Tên đăng nhập đã tồn tại!</span>");
				        	} else if("2".equals(err)){
				        		out.print("<span style='color: red;font-weight: bold;' >Có lỗi xảy ra!</span>");
				        	}
							%>
							<form action="<%=request.getContextPath()%>/index/register"
								class="pt-3 form" method="post" enctype="multipart/form-data"
								id="form">
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="username" name="username" placeholder="Tên đăng nhập">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="password" name="password" placeholder="Mật khẩu">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-lg"
										id="repassword" name="repassword"
										placeholder="Nhập lại mật khẩu">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-lg"
										id="email" name="email" placeholder="Email">
								</div>

								<div class="form-group">
									<input type="file" name="image" class="file-upload-default">
									<div class="input-group col-xs-12">
										<input type="text" class="form-control file-upload-info"
											disabled placeholder="Tải ảnh lên"> <span
											class="input-group-append">
											<button class="file-upload-browse btn btn-primary"
												type="button">Tải lên</button>
										</span>
									</div>
								</div>
								<div class="mb-4">
									<div class="form-check">
										<label class="form-check-label text-muted"> <input
											type="checkbox" class="form-check-input"> Tôi đồng ý với các Điều khoản & Điều kiện
										</label>
									</div>
								</div>
								<div class="mt-3">
									<button type="submit" class="btn btn-primary mr-2"
										style="margin-left: 130px;">ĐĂNG KÝ</button>
								</div>
								<div class="text-center mt-4 font-weight-light">
									Bạn đã có một tài khoản? <a href="<%=request.getContextPath() %>/index/login"
										class="text-primary">Đăng nhập</a>
								</div>
							</form>
							
							<style>
								.error {
									color: red;
								}
							</style>
							
							<script type="text/javascript">
								$(document).ready(function() {
									$('.form').validate({
										rules: {
											"username": {
												required: true
											},
											"password": {
												required: true
											},
											"repassword": {
												required: true,
												equalTo: "#password"
											},
											"image": {
												required: true
											}
										},
										messages: {
											"username": {
												required: "Vui lòng nhập thông tin!"
											},
											"password": {
												required: "Vui lòng nhập thông tin!"
											},
											"repassword": {
												required: "Vui lòng nhập thông tin!",
												equalTo: "Vui lòng nhập đúng Mật khẩu!"
											},
											"image": {
												required: "Vui lòng chọn một ảnh!"
											}
										}
									});
								});
							</script>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script
		src="${pageContext.request.contextPath}/admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="${pageContext.request.contextPath}/admin/js/off-canvas.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/js/hoverable-collapse.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/template.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/todolist.js"></script>
	<!-- endinject -->
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="${pageContext.request.contextPath}/admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="${pageContext.request.contextPath}/admin/vendors/typeahead.js/typeahead.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/vendors/select2/select2.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="${pageContext.request.contextPath}/admin/js/off-canvas.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/hoverable-collapse.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/template.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="${pageContext.request.contextPath}/admin/js/file-upload.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/typeahead.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/select2.js"></script>
	<!-- End custom js for this page-->
	
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
</body>

</html>
