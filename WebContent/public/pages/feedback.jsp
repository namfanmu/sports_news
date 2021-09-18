<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Sports Paradise</title>
<!-- plugin css for this page -->
<script
	src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/assets/vendors/mdi/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/assets/vendors/aos/dist/aos.css/aos.css" />
<!-- End plugin css for this page -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/public/assets/images/favicon.png" />
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/assets/css/style.css">
<!-- endinject -->

<style type="text/css">
.nav-item {
	float: left;
	overflow: hidden;
}

/* nút dropdown */
.nav-item .nav-link {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

/* thêm màu background khi nút dropdown khi hover */
.navbar a:hover, .nav-item:hover .nav-link {
	background-color: #0080ff;
}

/* Ẩn nội dung dropdown*/
.noidung_dropdown {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* thiết lập style cho đường dẫn bên trong dropdown */
.noidung_dropdown a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

/* chọn background cho đường dẫn bên trong dropdown khi hover*/
.noidung_dropdown a:hover {
	background-color: #ddd;
}

/* Hiển thị nội dung dropdown khi được hover */
.nav-item:hover .noidung_dropdown {
	display: block;
}
</style>
<style>
.paging {
	display: inline-block;
}

.paging a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.paging a.active {
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.paging a:hover:not(.active) {
	background-color: #ddd;
	border-radius: 5px;
}
</style>
</head>

<body>
	<div class="container-scroller">
		<div class="main-panel">
			<!-- partial:../partials/_navbar.html -->
			<%@ include file="../../public/partials/_navbar.jsp"%>

			<!-- partial -->

			<div class="content-wrapper">
				<div class="container">
					<div class="col-sm-12">
						<div class="card" data-aos="fade-up">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-12">
										<%
										String msg = request.getParameter("msg");
										if("1".equals(msg)){
							        		out.print("<span style='color: blue;font-weight: bold;' >Đánh giá - Góp ý của bạn đã được gửi!</span>");
							        	}
										String err = request.getParameter("err");
										if("1".equals(err)){
							        		out.print("<span style='color: red;font-weight: bold;' >Vui lòng đăng nhập trước khi gửi Đánh giá - Góp ý của bạn!</span>");
							        	}
										if("2".equals(err)){
							        		out.print("<span style='color: red;font-weight: bold;' >Có lỗi xảy ra!</span>");
							        	}
										%>
										<h3 class="font-weight-600 mb-4" style="color: blue;">
											ĐÁNH GIÁ - GÓP Ý</h3>
										<p>Gửi các đánh giá cũng như các góp ý của bạn tại đây sẽ
											giúp cho chúng tôi hoàn thiên Website một cách tốt hơn, đem
											lại cho bạn một trải nghiệm vô cùng thú vị</p>
										
										<form action="<%=request.getContextPath() %>/index/feedback" class="forms-sample" method="post" id="form">
											<div class="form-group">
												<label for="exampleInputDetail">Đánh giá - Góp ý của
													bạn</label>
												<textarea class="form-control" id="exampleInputDetail"
													name="feedback" rows="4"></textarea>
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
														"feedback": {
															required: true
														}
													},
													messages: {
														"feedback": {
															required: "Vui lòng nhập thông tin!"
														}
													}
												});
											});
										</script>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-8">
										<div class="row"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- main-panel ends -->
			<!-- container-scroller ends -->

			<!-- partial:../partials/_footer.html -->
			<%@ include file="../../public/partials/_footer.jsp"%>

			<!-- partial -->
		</div>
	</div>
	<!-- inject:js -->
	<script
		src="${pageContext.request.contextPath}/public/assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- plugin js for this page -->

	<script
		src="${pageContext.request.contextPath}/public/assets/vendors/aos/dist/aos.js/aos.js"></script>
	<!-- End plugin js for this page -->
	<!-- Custom js for this page-->
	<script
		src="${pageContext.request.contextPath}/public/assets/js/demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/public/assets/js/jquery.easeScroll.js"></script>
	<!-- End custom js for this page-->
	
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
</body>
</html>
