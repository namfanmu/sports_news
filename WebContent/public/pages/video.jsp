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
									<%
									ArrayList<News> videoNewsList = (ArrayList<News>) request.getAttribute("videoNewsList");
									%>
									<h2 style="padding-left: 20px; font-weight: bold; color: blue;">VIDEO
										HIGHLIGHT</h2>
								</div>
								<div class="row">
									<div class="col-lg-8">
										<%
										for (News news : videoNewsList) {
										%>
										<div class="row">
											<div class="col-sm-4 grid-margin">
												<div class="rotate-img">
													<img
														src="<%=request.getContextPath()%>/files/<%=news.getImage()%>"
														alt="banner" class="img-fluid"
														style="height: 150px; width: 195px;" />
												</div>
											</div>
											<div class="col-sm-8 grid-margin">
												<h2 class="font-weight-600 mb-2">
													<a
														href="<%=request.getContextPath()%>/index/detail?id=<%=news.getId()%>&index=1"
														title="<%=news.getTitle()%> "
														style="text-decoration: none;"><%=news.getTitle()%></a>
												</h2>
												<p class="fs-13 text-muted mb-0">
													<span class="mr-2">Ngày đăng: <%=news.getCreated_date()%> </span>
												</p>
											</div>
										</div>
										<%
										}
										%>
										<div class="paging">
										<%
											int endPage = (Integer) request.getAttribute("endPage");
											int index = (Integer)request.getAttribute("index");
											if(index == 1) {
											%>
											<a href="#">&laquo;</a>
											<%
											} else if(index > 1) {
											%>
											<a href="<%=request.getContextPath()%>/index/video?index=<%=index - 1%>">&laquo;</a>
											<%	
											}
											
											for (int i = 1; i <= endPage; i++) {
												
											%>
											<a class="<%if(i == index) out.print("active"); %>" href="<%=request.getContextPath()%>/index/video?index=<%=i%>"><%=i%></a>
											<%
											}
											%>
											<%
											if(index == endPage) {
											%>
											<a href="#">&raquo;</a>
											<%
											} else if(index < endPage) {
											%>
											<a href="<%=request.getContextPath()%>/index/video?index=<%=index + 1%>">&raquo;</a>
											<%
											}
											%>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="trending">
											<h2 class="mb-4 text-primary font-weight-600"
												style="margin-top: -80px;">Xem nhiều nhất</h2>
											<div class="mb-4">
												<%
												NewsDAO newsDAO = new NewsDAO();
												ArrayList<News> allMostViewVideoNewsList = newsDAO.getAllMostViewVideoNews();
												for (News mostViewVideoNews : allMostViewVideoNewsList) {
												%>
												<div style="margin-bottom: 30px; border-bottom: solid 1px;">
													<div class="rotate-img">
														<img
															src="<%=request.getContextPath()%>/files/<%=mostViewVideoNews.getImage()%>"
															alt="banner" class="img-fluid"
															style="height: 175px; width: 310px;" />
													</div>
													<h3 class="mt-3 font-weight-600">
														<a
															href="<%=request.getContextPath()%>/index/detail?id=<%=mostViewVideoNews.getId()%>&index=1"
															title="<%=mostViewVideoNews.getTitle()%> "
															style="text-decoration: none;"><%=mostViewVideoNews.getTitle()%></a>
													</h3>
													<p class="fs-13 text-muted mb-0">
														<span class="mr-2">Ngày đăng: <%=mostViewVideoNews.getCreated_date()%></span>
													</p>
												</div>
												<%
												}
												%>
											</div>
										</div>
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
</body>
</html>
