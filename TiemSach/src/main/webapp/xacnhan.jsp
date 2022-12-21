<%@page import="bean.xacnhanbean"%>
<%@page import="bean.dangnhapadminbean"%>
<%@page import="bean.khachhangbean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>XÁC NHẬN</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap Core CSS -->
<link href="Content/bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="Content/shop-homepage.css" rel="stylesheet" />
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="qlloaiController">Quản lý loại</a></li>
					<li><a href="qlsachController">Quản lý sách</a></li>
					<li><a href="themsachController">Thêm SÁCH</a></li>
					<li><a href="xacnhanController">Xác nhận</a></li>
      				<li><a href="danhsachchuyentienController">danh sách chuyển tiền</a></li>
					<li>
				      	<%if(session.getAttribute("admin")==null){ %>
				      	<a href="dangnhapadminController">ĐĂNG NHẬP ADMIN</a>
				       	<%}else{ %>
				       	<a href="#"> Hello Ông chủ</a>
				       </li>
					<li><a href="logoutController"
						style="color: white; font-weight: bold; text-decoration: none;">
							<img src="images/dangxuat.png" />ĐĂNG XUẤT</a>
					</li>
					<%} %>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>

	<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
    <br>
	<table class="table table-hover">
	   <%ArrayList<xacnhanbean> ds= (ArrayList<xacnhanbean>)request.getAttribute("ds");
	   int n=ds.size();
       for(int i=0;i<n;i++){
        	 xacnhanbean xn=ds.get(i);
	   %>
	      <tr>
	      	<td> <%=i %> </td>
	      	<td> <%=xn.getHoten() %> </td>
	      	<td> <%=xn.getTensach() %> </td>
	      	<td> <%=xn.getNgayMua() %> </td>
	      	<td> <%=xn.getGia() %> </td>
	      	<td> <%=xn.getThanhTien() %> </td>
	      	<td> <a href="xacnhanchuyentienController?mct=<%=xn.getMaChiTietHD()%>">
	      	Xác nhận </a> </td>
	      </tr>
	     <%} %>
	 </table>
	<!-- /.container -->
	<div class="container">
		<hr>
		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12"></div>
			</div>
		</footer>
	</div>
	<script src="/Scripts/jquery.js"></script>
	<script src="/Scripts/bootstrap.min.js"></script>
</body>
</html>

