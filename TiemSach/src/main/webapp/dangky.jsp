<%@page import="bean.khachhangbean"%>
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
	<div class="form" Style="height: 449px;">
           <h2 style="text-align:center">ĐĂNG KÝ THÀNH VIÊN</h2>
               <form action="ktdk" method="post">
               <table align="center">
               <tbody>
                   <tr style="height:40px">
                       <td> Họ tên khách hàng:</td>
                       <td>
                           <input id="HotenKH" name="HotenKH" type="text" value="">

                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td> Tên đăng nhập:</td>
                       <td>
                           <input id="TenDN" name="TenDN" type="text" value="">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td>  Mật khẩu:</td>
                       <td>
                           <input id="Matkhau" name="Matkhau" type="password">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td>Mật khẩu nhập lại: </td>
                       <td>
                           <input id="Matkhaunhaplai" name="Matkhaunhaplai" type="password">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td> Email:</td>
                       <td>
                           <input id="Email" name="Email" type="text" value="">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td> Địa chỉ:</td>
                       <td>
                           <input id="Diachi" name="Diachi" type="text" value="">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td>Điện thoại:</td>
                       <td>
                           <input id="Dienthoai" name="Dienthoai" type="text" value="">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td> Ngày sinh :</td>
                       <td>
                           <input type="date" name="Ngaysinh">
                       </td>
                   </tr>
                   <tr style="height:40px">
                       <td></td>
                       <td>
                           <input type="Submit" value="Đăng ký">
                       </td>
                   </tr>
               </tbody>
               </table>
               </form>
               
           </div>
           
        <h1 style="width: 373px; margin-left: 822px; margin-top: -24px; display: block; font-weight: bold;">
	   Nhà Sách Long Long
	   </h1>
	<img src="./photo/sach.jpg" alt="" class="img">
</body>
</html>