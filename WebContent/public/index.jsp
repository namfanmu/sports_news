<%@page import="model.dao.CatsDAO"%>
<%@page import="model.bean.CatNews"%>
<%@page import="model.dao.CatNewsDAO"%>
<%@page import="model.bean.News"%>
<%@page import="model.dao.NewsDAO"%>
<%@page import="model.bean.Categories"%>
<%@page import="model.bean.FootballCats"%>
<%@page import="model.bean.TennisCats"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" media="screen" />
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
</head>

<body>
							<%
							String msg = request.getParameter("msg");
							if("2".equals(msg)){
				        		msg = "Cập nhật thông tin cá nhân thành công!";
				        		
							%>
							<script type="text/javascript">
							    var msg = "<%=msg%>";
							    alert(msg);
							</script>
							<%
							}
							%>
							
	<div class="container-scroller">
		<div class="main-panel">

			<%@ include file="../../public/partials/_navbar.jsp"%>

			<div class="content-wrapper">
				<div class="container">
					<div class="row" data-aos="fade-up">
						<div class="col-xl-8 stretch-card grid-margin">
							<%
							NewsDAO newsDAO = new NewsDAO();
							News latestTextNews = newsDAO.getLatestTextNews();
							%>
							<div class="position-relative">
								<img
									src="<%=request.getContextPath()%>/files/<%=latestTextNews.getImage()%>"
									alt="banner" class="img-fluid" style="height: 537px" />
								<div class="banner-content">
									<%
									CatsDAO catsDAO = new CatsDAO();
									Categories categories = catsDAO.getCatsById(latestTextNews.getCat_id());
									%>
									<div class="badge badge-danger fs-12 font-weight-bold mb-3">
										<%=categories.getName()%></div>
									<h1 class="mb-0">
										<a
											href="<%=request.getContextPath()%>/index/detail?id=<%=latestTextNews.getId()%>&index=1"
											title="<%=latestTextNews.getTitle()%> "
											style="text-decoration: none;"><%=latestTextNews.getTitle()%></a>
									</h1>
									<h3 class="mb-2"><%=latestTextNews.getPreview()%></h3>
									<div class="fs-12">
										<span>Ngày đăng: </span> <%=latestTextNews.getCreated_date()%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 stretch-card grid-margin">
							<div class="card bg-dark text-white">
								<div class="card-body">
									<h2>Xem nhiều nhất</h2>
									<%
									ArrayList<News> mostViewTextNewsList = newsDAO.getMostViewTextNews();
									for (News news : mostViewTextNewsList) {
									%>
									<div
										class="d-flex border-bottom-blue pt-3 pb-4 align-items-center justify-content-between">
										<div class="pr-3">
											<h5>
												<a
													href="<%=request.getContextPath()%>/index/detail?id=<%=news.getId()%>&index=1"
													title="<%=news.getTitle()%> "
													style="text-decoration: none;"><%=news.getTitle()%></a>
											</h5>
											<div class="fs-12">
												<span>Ngày đăng: </span> <%=news.getCreated_date()%> <br>
												<span>Lượt xem: </span> <%=news.getView() %>
											</div>
										</div>
										<div class="rotate-img">
											<img
												src="<%=request.getContextPath()%>/files/<%=news.getImage()%>"
												alt="thumb" class="img-fluid img-lg"
												style="width: 250px; height: 100px" />
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
					<div class="row" data-aos="fade-up">
						<div class="col-lg-3 stretch-card grid-margin">
							<div class="card">
								<div class="card-body">
									<h2>Danh mục tin tức</h2>
									<h4>Bóng đá</h4>
									<ul class="vertical-menu">
										<%
										for (FootballCats footballCats : footballCatList) {
										%>
										<li><a
											href="<%=request.getContextPath()%>/index/cats?cats_id=<%=footballCats.getId()%>&index=1"><%=footballCats.getName()%></a></li>
										<%
										}
										%>
									</ul>
									<br>
									<h4>Quần vợt</h4>
									<ul class="vertical-menu">
										<%
										for (TennisCats tennisCats : tennisCatList) {
										%>
										<li><a
											href="<%=request.getContextPath()%>/index/cats?cats_id=<%=tennisCats.getId()%>&index=1"><%=tennisCats.getName()%></a></li>
										<%
										}
										%>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-9 stretch-card grid-margin">
							<div class="card">
								<div class="card-body">
									<%
									ArrayList<News> newsExceptLatestList = newsDAO.getAllNewsExceptLatest();
									for (News news : newsExceptLatestList) {
									%>
									<div class="row">
										<div class="col-sm-4 grid-margin">
											<div class="position-relative">
												<div class="rotate-img">
													<img
														src="<%=request.getContextPath()%>/files/<%=news.getImage()%>"
														alt="thumb" class="img-fluid"
														style="width: 230px; height: 170px" />
												</div>
												<%
												Categories cats = catsDAO.getCatsById(news.getCat_id());
												%>
												<div class="badge-positioned">
													<span class="badge badge-danger font-weight-bold"><%=cats.getName()%></span>
												</div>
											</div>
										</div>
										<div class="col-sm-8  grid-margin">
											<h2 class="mb-2 font-weight-600">
												<a
													href="<%=request.getContextPath()%>/index/detail?id=<%=news.getId()%>&index=1"
													title="<%=news.getTitle()%> "
													style="text-decoration: none;"><%=news.getTitle()%></a>
											</h2>
											<div class="fs-13 mb-2">
												<%=news.getCreated_date()%>
											</div>
											<p class="mb-0"><%=news.getPreview()%></p>
										</div>
									</div>
									<%
									}
									%>
									<div class="row">
										<h4 style="padding-left: 20px;">
											<a href="<%=request.getContextPath()%>/index/text?index=1"
												style="text-decoration: none;">Xem tất cả</a>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" data-aos="fade-up">
						<div class="col-sm-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-8">
											<div class="card-title">Video Highlight</div>
											<div class="row">
												<%
												ArrayList<News> videoNewsList = newsDAO.getAllVideoNews();
												for (News news : videoNewsList) {
													Categories cats = catsDAO.getCatsById(news.getCat_id());
												%>
												<div class="col-sm-6 grid-margin">
													<div class="position-relative">
														<div class="rotate-img">
															<img
																src="<%=request.getContextPath()%>/files/<%=news.getImage()%>"
																alt="thumb" class="img-fluid"
																style="height: 240px; width: 320px" />
														</div>



														<div class="badge-positioned w-90">
															<div
																class="d-flex justify-content-between align-items-center">
																<span class="badge badge-danger font-weight-bold"><%=cats.getName()%></span>
																<div class="video-icon">
																	<i class="mdi mdi-play"></i>
																</div>
															</div>
														</div>

													</div>
													<h4 style="padding-top: 5px">
														<a
															href="<%=request.getContextPath()%>/index/detail?id=<%=news.getId()%>&index=1"
															title="<%=news.getTitle()%> "
															style="text-decoration: none;"><%=news.getTitle()%></a>
													</h4>
												</div>
												<%
												}
												%>
											</div>
											<div class="row">
												<h4 style="padding-left: 20px;">
													<a href="<%=request.getContextPath()%>/index/video?index=1"
														style="text-decoration: none;">Xem tất cả</a>
												</h4>
											</div>
										</div>
										<div class="col-lg-4">
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="card-title">Xem nhiều nhất</div>
											</div>
											<%
											ArrayList<News> mostViewVideoNewsList = newsDAO.getMostViewVideoNews();
											for (News news : mostViewVideoNewsList) {
											%>
											<div class="rotate-img">
												<img
													src="<%=request.getContextPath()%>/files/<%=news.getImage()%>"
													alt="banner" class="img-fluid"
													style="height: 175px; width: 310px;" />
											</div>
											<div
												class="d-flex justify-content-between align-items-center border-bottom pb-2">
												<h4 class="font-weight-600 mb-0"
													style="padding-bottom: 10px; padding-top: 10px;">
													<a
														href="<%=request.getContextPath()%>/index/detail?id=<%=news.getId()%>&index=1"
														title="<%=news.getTitle()%> "
														style="text-decoration: none;"><%=news.getTitle()%></a>
												</h4>
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
			<!-- main-panel ends -->
			<!-- container-scroller ends -->

			<%@ include file="../../public/partials/_footer.jsp"%>

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
