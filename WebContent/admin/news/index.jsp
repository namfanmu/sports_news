<%@page import="model.dao.NewsDAO"%>
<%@page import="model.bean.TennisCats"%>
<%@page import="model.bean.FootballCats"%>
<%@page import="model.bean.Categories"%>
<%@page import="model.dao.TennisCatsDAO"%>
<%@page import="model.dao.FootballCatsDAO"%>
<%@page import="model.dao.CatsDAO"%>
<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sports Paradise Admin</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sports Paradise Admin</title>

<!-- plugins:css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/vendors/feather/feather.css">
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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/public/assets/images/favicon.png" />
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

</head>
<body>
	<div class="container-scroller">
		<%@ include file="../../admin/partials/_navbar.jsp"%>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="../../admin/partials/_settings-panel.jsp"%>

			<!-- partial -->
			<%@ include file="../../admin/partials/_sidebar.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card">
						<div class="card-header">
							<%
							String msg = request.getParameter("msg");
							if("1".equals(msg)){
				        		out.print("<span style='color: blue;font-weight: bold;' >Th??m m???i tin t???c th??nh c??ng!</span>");
				        	}
							if("2".equals(msg)){
				        		out.print("<span style='color: blue;font-weight: bold;' >Ch???nh s???a tin t???c th??nh c??ng!</span>");
				        	}
							if("3".equals(msg)){
				        		out.print("<span style='color: blue;font-weight: bold;' >X??a tin t???c th??nh c??ng!</span>");
				        	}
							String err = request.getParameter("err");
							if("1".equals(err)){
				        		out.print("<span style='color: red;font-weight: bold;' >C?? l???i x???y ra!</span>");
				        	}
							%>
							<h3 class="card-title">Danh s??ch Tin t???c </h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>STT</th>
										<th>Title</th>
										<th>Danh m???c</th>
										<th>L?????t xem</th>
										<th>T??c gi???</th>
										<th>H??nh ???nh</th>
										<th>Ch???c n??ng</th>
									</tr>
								</thead>
								<%
									ArrayList<News> newsList = (ArrayList<News>)request.getAttribute("newsList");
									CatsDAO catsDAO = new CatsDAO();
									FootballCatsDAO footballCatsDAO = new FootballCatsDAO();
									TennisCatsDAO tennisCatsDAO = new TennisCatsDAO();
								%>
								<tbody>
								<%
									if(newsList != null && newsList.size() > 0) {
										int index = 0;
										for(News news : newsList) {
											Categories categories = catsDAO.getCatsById(news.getCat_id());
											FootballCats footballCats = new FootballCats();
											TennisCats tennisCats = new TennisCats();
											if(categories.getId() == 1) {
												footballCats = footballCatsDAO.getFootballCatById(news.getFootball_cat_id());
											} else if(categories.getId() == 2) {
												tennisCats = tennisCatsDAO.getTennisCatById(news.getTennis_cat_id());
											}
											index++;
								%>
									<tr>
										<td class="center"><%=index %></td>
										<td class="center"><%=news.getTitle() %></td>
										<%
											if(categories.getId() == 1) {
										%>
												<td class="center"><%=categories.getName() %> - <%=footballCats.getName() %></td>
										<%
											} else if(categories.getId() == 2) {
										%>
												<td class="center"><%=categories.getName() %> - <%=tennisCats.getName() %></td>
										<%
											}
										%>
										
										<td class="center"><%=news.getView() %></td>
										<td class="center"><%=news.getAuthor() %></td>
										<td class="center">
											<img width="200px" height="200px" src="<%=request.getContextPath() %>/files/<%=news.getImage() %>" alt=""/>
                                        </td>
                                        <%
                                        NewsDAO newsDAO = new NewsDAO();
                                        String role = newsDAO.getRoleByUsername(news.getAuthor()); 
                                        if("ADMIN".equals(admin_account.getRole()) || "MOD".equals(role)) {
                                        %>
										<td class="center">
                                            <a href="<%=request.getContextPath() %>/admin/news/edit?id=<%=news.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> S???a</a>
                                            <a href="<%=request.getContextPath() %>/admin/news/delete?id=<%=news.getId() %>" title="" class="btn btn-danger" onclick="return confirm('B???n c?? ch???c ch???n mu???n x??a?')"><i class="fas fa-trash"></i> X??a</a>
                                        </td>
                                        <%
                                        } else if((admin_account.getUsername()).equals(news.getAuthor())) {
                                        %>
                                        <td class="center">
                                            <a href="<%=request.getContextPath() %>/admin/news/edit?id=<%=news.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> S???a</a>
                                            <a href="<%=request.getContextPath() %>/admin/news/delete?id=<%=news.getId() %>" title="" class="btn btn-danger" onclick="return confirm('B???n c?? ch???c ch???n mu???n x??a?')"><i class="fas fa-trash"></i> X??a</a>
                                        </td>
                                        <%
                                        } else {
                                        %>
                                        <td class="center">
                                        </td>
                                        <%
                                        }
                                        %>
									</tr>
								<%
										}
									}
								%>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->

					<!-- /.card-body -->
				</div>

				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<%@ include file="../../admin/partials/_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
	</div>
	<!-- page-body-wrapper ends -->
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
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

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jszip/jszip.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	
	

	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : true,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>
	<!-- End custom js for this page-->

</body>
</html>