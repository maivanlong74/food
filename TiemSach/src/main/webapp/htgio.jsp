<%@page import="bean.khachhangbean"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cửa Hàng Sách</title>
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
				<a class="navbar-brand" href="#">Long Long</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="htsachController">TRANG CHỦ</a></li>
					<li><a href="dangkyController">ĐĂNG KÝ</a></li>
					<li>
				      	<%if(session.getAttribute("admin")==null){ %>
				      	<a href="dangnhapadminController">ĐĂNG NHẬP ADMIN</a>
				       	<%}%>
				       </li>
				       <li>
				      	<%if(session.getAttribute("kh")==null){ %>
				      	<a href="dangnhapController">ĐĂNG NHẬP</a>
				       	<%}else{ %>
				       	<a href="#"> Hello: <%khachhangbean ten =(khachhangbean)session.getAttribute("kh");
					        out.print(ten.getHoten());
					       %>
					       </a>
				       </li>
				     <li><a href="logoutController">ĐĂNG XUẤT</a></li>
				     <%} %>
					<li><a href="lichsuController">LỊCH SỬ MUA HÀNG</a></li>
					<li><a href="htgioController"
						style="color: white; font-weight: bold; text-decoration: none;">
							<img src="images/giohang.gif" />GIỎ HÀNG (<%=session.getAttribute("i")%>)
					</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>

	<!-- --------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<p class="lead">CHỦ ĐỀ SÁCH</p>
				<div class="list-group">
					<c:forEach var="l" items="${dsloai}">
						<a href="htsachController?ml=${l.getMaloai()}"
							class="list-group-item"> ${l.getTenloai()} </a>
					</c:forEach>
				</div>
			</div>

			<div class="col-md-9">
				<div class="row carousel-holder">
					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img class="slide-image" src="images/ancient-place.jpg" alt="">

								</div>
								<div class="item">
									<img class="slide-image" src="images/riverside-city.jpg" alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="images/kayaks.jpg" alt="">
								</div>


							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>
				</div>
				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
				<table>
					<tr>
						<div class="menu">
							Trang 1/3;
							<div class="MenuTrang">

								<div class="pagination-container">
									<ul class="pagination">
										<li class="active"><a>1</a></li>
										<li><a href="/BookStore?page=2">2</a></li>
										<li><a href="/BookStore?page=3">3</a></li>
										<li class="PagedList-skipToNext"><a
											href="/BookStore?page=2" rel="next">»</a></li>
									</ul>
								</div>
							</div>
							<style>
							.MenuTrang li {
								display: inline;
							}
							</style>
						</div>

					</tr>
					<tr>
						<div class="timkiem"
							Style="margin-top: -70px; margin-left: 600px;">
							<form action="htsachController" method="post">
								<input class="form-control" name="txttk" type="text" value=""
									placeholder="Nhap tt" Style="width: 250px"> <input
									class="btn-primary" name="butt" type="submit" value="Search">
							</form>
						</div>
					</tr>
				</table>
				<br>

				<!-- --------------------------------------------------------------------------------------------------------------------------------- -->

				<form action="suaxoaController" class="tong">
					<table class="table table-hover" class="giohang">
						<tr class="tieude">
							<td></td>
							<td>Mã sách</td>
							<td>Tên sách</td>
							<td>Giá sách</td>
							<td>Số lượng</td>
							<td>Thành tiền</td>

						</tr>
						<%
						   giohangbo gh=(giohangbo)session.getAttribute("gio");
						   String x=request.getParameter("sl"); %>
						   <% if(gh!=null){
							   for(giohangbean h: gh.ds){%>
						<tr>

							<td><input type="checkbox" name="check"
								value="<%=h.getMasach()%>"></td>
							<td><%=h.getMasach() %></td>
							<td><%=h.getTensach() %></td>
							<td><%=h.getGia()%>.VND</td>
							<td style="color: black;">
								<input name="<%=h.getMasach()%>"
									style="width: 100px;" type="number" min="0"
									value="<%=h.getSoluong()%>"> 
								<button value="<%=h.getMasach()%>" name="butsua" type="submit">save
								</button></td>
							<td><%=h.getThanhtien()%>.VND</td>
							<td style="color: black;">

								<button name="butxoa" type="submit" value=<%=h.getMasach()%>>Remove
								</button>

							</td>
						</tr>

						<%}%>
						<tr>
						</tr>
					</table>

					<div class="xoa">
						<button name="ALL" type="submit"
							style="color: black; width: 310px; margin-left: 25px;">HỦY
							HÀNG</button>
						<button name="xoachon" type="submit"
							style="color: black; width: 310px; margin-left: 127px;">XÓA
							CHỌN</button>
						<div class="tinhtien">
							<h1>
								Tổng tiền:
								<%out.print(gh.Tongtien());%>.VND
							</h1>
							<!-- <button class="thanhtoan" name="thanhtoan" type="submit" >THANH TOÁN</button> -->
						</div>
					</div>
				</form>

				<form action="thanhtoanController">
					<button class="thanhtoan" name="but1" type="submit">THANH TOÁN</button>
				</form>
				<%}else{%>
				<h1>Không có sản phẩm trong giỏ</h1>
				<%} %>

				<!-- /.container -->
				<div class="container">
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
