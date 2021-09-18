<%@page import="model.bean.Users"%>
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
<!-- partial:partials/_navbar.html -->
<header id="header" style="height: 155px;margin-top: -15px;">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="navbar-top">
				<div class="d-flex justify-content-between align-items-center">
					<ul class="navbar-top-right-menu">
						<%
						Users user_account = (Users) session.getAttribute("user_account");
						if (user_account == null) {
						%>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/index/login"
							class="nav-link">Đăng nhập</a></li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/index/register"
							class="nav-link">Đăng ký</a></li>
						<%
						} else {
						%>
						<li class="nav-item" style="width: 180px"><a href="<%=request.getContextPath()%>/index/edit_info?id=<%=user_account.getId() %>" class="nav-link">Xin chào <%=user_account.getUsername() %></a></li>
						<li class="nav-item" style="width: 180px"><a
							href="<%=request.getContextPath()%>/index/logout?index=2"
							class="nav-link">Đăng xuất</a></li>
						<%
						}
						%>
					</ul>
				</div>
			</div>
			<div class="navbar-bottom">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<a class="navbar-brand" href="<%=request.getContextPath()%>/index"><img
							src="${pageContext.request.contextPath}/public/assets/images/logo.svg"
							alt="" /></a>
					</div>
					<div>
						<button class="navbar-toggler" type="button"
							data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="navbar-collapse justify-content-center collapse"
							id="navbarSupportedContent">
							<ul
								class="navbar-nav d-lg-flex justify-content-between align-items-center">

								<li class="nav-item active"><a class="nav-link"
									href="<%=request.getContextPath()%>/index">Trang chủ</a></li>
								<%
								ArrayList<Categories> catList = (ArrayList<Categories>) request.getAttribute("catList");
								ArrayList<FootballCats> footballCatList = (ArrayList<FootballCats>) request.getAttribute("footballCatList");
								ArrayList<TennisCats> tennisCatList = (ArrayList<TennisCats>) request.getAttribute("tennisCatList");
								for (Categories categories : catList) {
								%>
								<li class="nav-item"><a class="nav-link" href="#"><%=categories.getName()%>
										<div class="noidung_dropdown">
											<%
											if (categories.getId() == 1) {
												for (FootballCats footballCats : footballCatList) {
											%>
											<a
												href="<%=request.getContextPath()%>/index/cats?cats_id=<%=footballCats.getId()%>&index=1"><%=footballCats.getName()%></a>
											<%
											}
											} else if (categories.getId() == 2) {
											for (TennisCats tennisCats : tennisCatList) {
											%>
											<a
												href="<%=request.getContextPath()%>/index/cats?cats_id=<%=tennisCats.getId()%>&index=1"><%=tennisCats.getName()%></a>
											<%
											}
											}
											%>

										</div> </a></li>
								<%
								}
								%>
								<li class="nav-item"><a class="nav-link"
									href="<%=request.getContextPath()%>/index/video?index=1">Video
										Highlight</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<%=request.getContextPath()%>/index/feedback">Liên hệ</a></li>
								<li style="height: 50px">
									<form
										action="<%=request.getContextPath()%>/index/search?index=1"
										method="post">
										<div class="input-group mb-3" style="width: 250px;">
											<input type="text" class="form-control"
												placeholder="Tìm kiếm ......"
												aria-label="Recipient's username" style="height: 50px;"
												name="txtSearch">

											<div class="input-group-append">

												<span class="input-group-text" style="width: 100px;">
													<input type="submit" name="search" value="Search"></i>
												</span>
											</div>
										</div>
									</form>
								</li>
							</ul>
						</div>
					</div>
					<ul class="social-media">
						<li><a href="https://www.facebook.com/nbnam28/"> <i class="mdi mdi-facebook"></i>
						</a></li>
						<li><a href="https://www.youtube.com/channel/UCR3bPboggJ3hjjI7jdpYeKA"> <i class="mdi mdi-youtube"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>

<!-- partial -->
