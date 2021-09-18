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
									ArrayList<News> textNewsList = (ArrayList<News>) request.getAttribute("textNewsList");
									FootballCats footballCats = (FootballCats) request.getAttribute("footballCats");
									TennisCats tennisCats = (TennisCats) request.getAttribute("tennisCats");
									%>
									<div class="col-sm-12">
										<%
										if (footballCats != null) {
										%>
										<h1 class="font-weight-600 mb-4"><%=footballCats.getName()%></h1>
										<%
										} else if (tennisCats != null) {
										%>
										<h1 class="font-weight-600 mb-4"><%=tennisCats.getName()%></h1>
										<%
										}
										%>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-8">
										<%
										for (News news : textNewsList) {
										%>
										<div class="row">
											<div class="col-sm-4 grid-margin">
												<div class="rotate-img">
													<img
														src="<%=request.getContextPath()%>/files/<%=news.getImage()%>"
														alt="banner" class="img-fluid" />
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
												<p class="fs-15"><%=news.getPreview()%></p>
											</div>
										</div>
										<%
										}
										%>
										<div class="paging">
										<%
											int cats_id = (Integer) request.getAttribute("cats_id");
											int endPage = (Integer) request.getAttribute("endPage");
											int index = (Integer)request.getAttribute("index");
											if(index == 1) {
											%>
											<a href="#">&laquo;</a>
											<%
											} else if(index > 1) {
											%>
											<a href="<%=request.getContextPath()%>/index/cats?cats_id=<%=cats_id %>&index=<%=index - 1%>">&laquo;</a>
											<%	
											}
											
											for (int i = 1; i <= endPage; i++) {
												
											%>
											<a class="<%if(i == index) out.print("active"); %>" href="<%=request.getContextPath()%>/index/cats?cats_id=<%=cats_id %>&index=<%=i%>"><%=i%></a>
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
											<a href="<%=request.getContextPath()%>/index/cats?cats_id=<%=cats_id %>&index=<%=index + 1%>">&raquo;</a>
											<%
											}
											%>
										</div>
									</div>
									<div class="col-lg-4">
										<h2 class="mb-4 text-primary font-weight-600">Tin mới
											nhất</h2>
										<div class="row">
											<div class="col-sm-12">
												<div class="border-bottom pb-4 pt-4">
													<div class="row" style="margin-top: -30px">
														<%
														NewsDAO newsDAO = new NewsDAO();
														ArrayList<News> allLatestNews = newsDAO.getAllLatestNews();
														for (News latestNews : allLatestNews) {
														%>
														<div class="col-sm-8" style="height: 120px">
															<h5 class="font-weight-600 mb-1">
																<a
																	href="<%=request.getContextPath()%>/index/detail?id=<%=latestNews.getId()%>&index=1"
																	title="<%=latestNews.getTitle()%> "
																	style="text-decoration: none;"><%=latestNews.getTitle()%></a>
															</h5>
															<p class="fs-13 text-muted mb-0">
																<span class="mr-2">Ngày đăng: <%=latestNews.getCreated_date()%></span>
															</p>
														</div>
														<div class="col-sm-4" style="height: 120px">
															<div class="rotate-img">
																<img
																	src="<%=request.getContextPath()%>/files/<%=latestNews.getImage()%>"
																	alt="banner" class="img-fluid"
																	style="width: 250px; height: 95px" />
															</div>
														</div>
														<%
														}
														%>
													</div>
												</div>
											</div>
										</div>

										<div class="trending">
											<h2 class="mb-4 text-primary font-weight-600">Xem nhiều
												nhất</h2>
											<div class="mb-4">
												<%
												ArrayList<News> allMostViewNewsList = newsDAO.getAllMostViewNews();
												for (News mostViewNews : allMostViewNewsList) {
												%>
												<div style="margin-bottom: 30px; border-bottom: solid 1px;">
													<div class="rotate-img">
														<img
															src="<%=request.getContextPath()%>/files/<%=mostViewNews.getImage()%>"
															alt="banner" class="img-fluid"
															style="height: 175px; width: 310px;" />
													</div>
													<h3 class="mt-3 font-weight-600">
														<a
															href="<%=request.getContextPath()%>/index/detail?id=<%=mostViewNews.getId()%>&index=1"
															title="<%=mostViewNews.getTitle()%> "
															style="text-decoration: none;"><%=mostViewNews.getTitle()%></a>
													</h3>
													<p class="fs-13 text-muted mb-0">
														<span class="mr-2">Ngày đăng: <%=mostViewNews.getCreated_date()%></span>
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
