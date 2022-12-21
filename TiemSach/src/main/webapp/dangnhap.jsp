<%@page import="bean.khachhangbean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ĐĂNG NHẬP TÀI KHOẢN</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="Content/bootstrap.css" rel="stylesheet" />
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
		</div>
	</nav>

	<!-- --------------------------------------------------------------------------------------------------------------------------------- -->

	<div class="form">
		<form action="ktdn" method="post" class="dangnhap">
			Tên đăng nhập: <input name="txtun" type="text" value="" class="one">
			<br> Mật khẩu: <input name="txtpass" type="password" value="" class="one" style="margin-left: 36px;"> <br> 
			<input name="but1" type="submit" value="Login" Style="margin-left: 160px; width: 88px; padding-top: 5px; margin-top: 15px;"><br>
				<%if(request.getParameter("kt")!=null){
		    	  out.print("<script>alert('Bạn đăng nhập sai rồi, đăng nhập lại đi');</script>");
		      }
    	  %>
		</form>
	</div>
	<h1 style="width: 373px; margin-left: 822px; margin-top: -24px; display: block; font-weight: bold;">
	   Nhà Sách Long Long
	   </h1>
	<img src="./photo/sach.jpg" alt="" class="img">
</body>
</html>