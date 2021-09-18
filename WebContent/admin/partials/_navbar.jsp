<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.bean.Users"%>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="<%=request.getContextPath()%>/admin/index"><img src="${pageContext.request.contextPath}/public/assets/images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="<%=request.getContextPath()%>/admin/index"><img src="${pageContext.request.contextPath}/public/assets/images/favicon.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="<%=request.getContextPath() %>/admin/images/faces/face_ad.jpg" alt="profile"/>
            </a>
          </li>
           
          <%
          Users admin_account = (Users) session.getAttribute("admin_account");
          if(admin_account != null) {
          %>
          <li class="nav-item nav-profile dropdown">
          <span class="nav-link dropdown-toggle" style="margin-left: -20px;">Xin chào <%=admin_account.getUsername() %></span>
          <a class="nav-link dropdown-toggle" style="padding-left: 20px;" href="<%=request.getContextPath()%>/index/logout?index=1">Đăng xuất</a>
          </li>
          <%
          }
          %>
          
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>