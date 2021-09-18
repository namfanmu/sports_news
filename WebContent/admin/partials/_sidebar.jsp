<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/index">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Trang chủ</span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#users" aria-expanded="false" aria-controls="users">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">Người dùng</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="users">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/users">Danh sách</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#news" aria-expanded="false" aria-controls="news">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Tin tức</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="news">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/news">Danh sách</a></li>
              </ul>
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/news/add">Thêm mới</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#cats" aria-expanded="false" aria-controls="cats">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">Danh mục</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="cats">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/cats">Danh sách</a></li>
              </ul>
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/cats/add">Thêm mới</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#feedbacks" aria-expanded="false" aria-controls="feedbacks">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">Góp ý</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="feedbacks">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/admin/feedback">Danh sách</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Tài liệu</span>
            </a>
          </li>
          
        </ul>
      </nav>