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
				        		out.print("<span style='color: blue;font-weight: bold;' >Th??m m???i danh m???c tin t???c th??nh c??ng!</span>");
				        	}
							if("2".equals(msg)){
				        		out.print("<span style='color: blue;font-weight: bold;' >Ch???nh s???a danh m???c tin t???c th??nh c??ng!</span>");
				        	}
							if("3".equals(msg)){
				        		out.print("<span style='color: blue;font-weight: bold;' >X??a danh m???c tin t???c th??nh c??ng!</span>");
				        	}
							String err = request.getParameter("err");
							if("1".equals(err)){
				        		out.print("<span style='color: red;font-weight: bold;' >C?? l???i x???y ra!</span>");
				        	}
							%>
							<h3 class="card-title">Danh s??ch Danh m???c Tin t???c</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>STT</th>
										<th>T??n danh m???c tin t???c</th>
										<th>Ch???c n??ng</th>
									</tr>
								</thead>
								<%
									ArrayList<FootballCats> footballCatList = (ArrayList<FootballCats>)request.getAttribute("footballCatList");
									ArrayList<TennisCats> tennisCatList = (ArrayList<TennisCats>)request.getAttribute("tennisCatList");
									int index = 0;
								%>
								<tbody>
								<%
									if(footballCatList != null && footballCatList.size() > 0) {
										for(FootballCats footballCats : footballCatList) {
											index++;
								%>
									<tr>
										<td class="center"><%=index %></td>
										<td class="center"><%=footballCats.getName() %> - B??ng ????</td>
										<td class="center">
                                            <a href="<%=request.getContextPath() %>/admin/cats/edit?id=<%=footballCats.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> S???a</a>
                                            <a href="<%=request.getContextPath() %>/admin/cats/delete?id=<%=footballCats.getId() %>" title="" class="btn btn-danger" onclick="return confirm('B???n c?? ch???c ch???n mu???n x??a?')"><i class="fas fa-trash"></i> X??a</a>
                                        </td>
									</tr>
								<%
										}
									}
								%>
								<%
									if(tennisCatList != null && tennisCatList.size() > 0) {
										for(TennisCats tennisCats : tennisCatList) {
											index++;
								%>
									<tr>
										<td class="center"><%=index %></td>
										<td class="center"><%=tennisCats.getName() %> - Qu???n v???t</td>
										<td class="center">
                                            <a href="<%=request.getContextPath() %>/admin/cats/edit?id=<%=tennisCats.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> S???a</a>
                                            <a href="<%=request.getContextPath() %>/admin/cats/delete?id=<%=tennisCats.getId() %>" title="" class="btn btn-danger" onclick="return confirm('B???n c?? ch???c ch???n mu???n x??a?')"><i class="fas fa-trash"></i> X??a</a>
                                        </td>
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