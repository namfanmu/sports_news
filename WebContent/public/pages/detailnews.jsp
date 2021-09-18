<%@page import="model.bean.Comments"%>
<%@page import="model.dao.TennisCatsDAO"%>
<%@page import="model.dao.FootballCatsDAO"%>
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

			<%@ include file="../../public/partials/_navbar.jsp"%>

			<div class="content-wrapper">
				<div class="container">
					<div class="col-sm-12">
						<div class="card" data-aos="fade-up">
							<div class="card-body">
								<div class="row">
									<div class="col-lg-8">
										<div style="border-bottom: solid; padding-bottom: 20px;">
											<%
											News news = (News) request.getAttribute("news");
											if ("".equals(news.getUrl_video())) {
											%>
											<h1 class="font-weight-600 mb-1"><%=news.getTitle()%></h1>
											<p class="fs-13 text-muted mb-0">
												<span class="mr-2">Ngày đăng: <%=news.getCreated_date()%>
												</span>
											</p>

											<p class="mb-4 fs-15"><%=news.getDetail()%></p>
											<%
											} else {
											%>
											<h1 class="font-weight-600 mb-1"><%=news.getTitle()%></h1>
											<iframe width="650" height="365"
												src="<%=news.getUrl_video()%>" title="YouTube video player"
												frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
											<%
											}
											%>
										</div>
										<br>
										<div class="d-lg-flex">
											<span class="fs-16 font-weight-600 mr-2 mb-1">Tags</span>
											<%
											FootballCatsDAO footballCatsDAO = new FootballCatsDAO();
											TennisCatsDAO tennisCatsDAO = new TennisCatsDAO();
											if (news.getCat_id() == 1) {
												ArrayList<FootballCats> footballCatsList = footballCatsDAO.getAllFootballCategories();
												for (FootballCats footballCats : footballCatList) {
											%>
											<a
												href="<%=request.getContextPath()%>/index/cats?cats_id=<%=footballCats.getId()%>&index=1"><span
												class="badge badge-outline-dark mr-2 mb-1"><%=footballCats.getName()%></span></a>
											<%
											}
											} else if (news.getCat_id() == 2) {
											ArrayList<TennisCats> tennisCatsList = tennisCatsDAO.getAllTennisCategories();
											for (TennisCats tennisCats : tennisCatList) {
											%>
											<a
												href="<%=request.getContextPath()%>/index/cats?cats_id=<%=tennisCats.getId()%>&index=1"><span
												class="badge badge-outline-dark mr-2 mb-1"><%=tennisCats.getName()%></span></a>
											<%
											}
											}
											%>
										</div>
										<div class="post-comment-section">
											<h3 class="font-weight-600">Liên quan</h3>
											<div class="row">
												<%
												NewsDAO newsDAO = new NewsDAO();
												ArrayList<News> relatedNewsList = newsDAO.getRelatedNews(news);
												for (News relatedNews : relatedNewsList) {
												%>
												<div class="col-sm-6">

													<div class="post-author">
														<div class="rotate-img">
															<img
																src="<%=request.getContextPath()%>/files/<%=relatedNews.getImage()%>"
																alt="banner" class="img-fluid"
																style="height: 200px; width: 307px" />
														</div>
														<div class="post-author-content" style="height: 140px;">
															<h5 class="mb-1">
																<a
																	href="<%=request.getContextPath()%>/index/detail?id=<%=relatedNews.getId()%>&index=1"
																	title="<%=relatedNews.getTitle()%> "
																	style="text-decoration: none;"><%=relatedNews.getTitle()%></a>
															</h5>
															<p class="fs-13 text-muted mb-0">
																<span class="mr-2"><%=relatedNews.getCreated_date()%></span>
															</p>
														</div>
													</div>

												</div>
												<%
												}
												%>
											</div>

											<div class="comment-section">
												<h5 class="font-weight-600">BÌNH LUẬN</h5>
												<div id="comments">
													<form class="form-cmt">
														<div class="form-item">
															<input type="hidden" name="news_id" id="news_id"
																value="<%=news.getId()%>" disabled="disabled" />
														</div>
														<br> <br>
														<div class="form-item">
															<input type="text" name="cmt" id="cmt" value=""
																placeholder="Nhập bình luận" required="required"
																style="height: 50px; width: -webkit-fill-available; margin-top: -20px;" />

														</div>
														<br> <a href="javascript:void(0)" title=""
															class="btn" onclick="return getComment()"
															style="margin-left: 557px; color: blue; border: solid 1px blue; margin-top: -10px; font-weight: bold;">Bình
															luận</a>
													</form>
												</div>
												<script type="text/javascript">
													function getComment() {
														var cmt=$("#cmt").val();
														var news_id=$("#news_id").val();
														$.ajax({
															url: '<%=request.getContextPath()%>/index/comment?index=1',
																	type : 'POST',
																	cache : false,
																	data : {
																		cmt : cmt,
																		news_id : news_id
																	},
																	success : function(
																			data) {
																		$(
																				".ajax-data")
																				.html(
																						data);
																	},
																	error : function() {
																		alert("Vui lòng đăng nhập để gửi BÌNH LUẬN của bạn!");
																	}

																});
														return false;
													}
												</script>
												<div class="ajax-data">
													<%
													ArrayList<Comments> cmtList = (ArrayList<Comments>) request.getAttribute("cmtList");
													if (cmtList != null && cmtList.size() > 0) {
														for (Comments cmt : cmtList) {
													%>
													<div class="comment-box">
														<div class="d-flex align-items-center">
															<div class="rotate-img">
																<img
																	src="<%=request.getContextPath()%>/files/<%=cmt.getImage()%>"
																	alt="banner" class="img-fluid img-rounded mr-3" />
															</div>
															<div>
																<p class="fs-12 mb-1 line-height-xs"><%=cmt.getComment_date()%></p>
																<p class="fs-16 font-weight-600 mb-0 line-height-xs"><%=cmt.getUsername()%></p>
															</div>
														</div>

														<p class="fs-12 mt-3" style="font-size: 16px;"><%=cmt.getComment()%></p>
													</div>
													<%
													}
													} else {
													%>
													<p>Chưa có bình luận!</p>
													<%
													}
													%>
												</div>
												<div class="paging">
													<a href="#">&laquo;</a>
													<%
													int endPage = (Integer) request.getAttribute("endPage");
													int index = (Integer) request.getAttribute("index");
													for (int i = 1; i <= endPage; i++) {
													%>
													<a class="<%if (i == index)
	out.print("active");%>"
														href="<%=request.getContextPath()%>/index/detail?id=<%=news.getId()%>&index=<%=i%>"><%=i%></a>
													<%
													}
													%>
													<a href="#">&raquo;</a>
												</div>
											</div>
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
																<span class="mr-2"><%=latestNews.getCreated_date()%></span>
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
														<span class="mr-2"><%=mostViewNews.getCreated_date()%></span>
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
