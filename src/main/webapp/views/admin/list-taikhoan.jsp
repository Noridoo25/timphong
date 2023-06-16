<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class=container--admin>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<div class="row">
		<div class="col-12 col-xl-12">
			<h2 class="site-name py-4">Quản lý Users</h2>
			<a class="d-inline-flex mb-3 new-object-button"
				href="<c:url value='/admin/themtk'/>"> <i class="bi bi-plus-lg"></i>
				Thêm Tài Khoản
			</a>
		</div>
		<div class="col-12 col-xl-12 table-admin">
			<div class="table-admin-layer">
				<h3>Danh sách Seller: ${sellers.size() }</h3>
				<table class="table table-hover">
					<thead class="thead-dark table-header-admin">
						<tr>
							<th scope="col">STT</th>
							<th scope="col-1">Tài khoản</th>
							<th scope="col-2">Họ và tên</th>
							<th scope="col-2">SDT</th>
							<th scope="col-4">Email</th>
							<th scope="col-5">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sellers}" var="seller" varStatus="STT">
							<tr>
								<td scope="row">${STT.index+1}</td>
								<td class="col-1 text-center">${seller.tentk}</td>
								<td class="col-2 text-center">${seller.ho} ${seller.ten}</td>
								<td class="col-2 text-center">${seller.sdt}</td>
								<td class="col-4 text-center">${seller.email}</td>
								<td class="col-5 text-center"><a class="btn btn-success mr-4"
									href="<c:url value="/admin/taikhoan?id_tk=${seller.id_tk }"/>">Chỉnh
										sửa</a><a class="btn btn-danger"
									href="<c:url value="/admin/xoa-taikhoan?id_tk=${seller.id_tk }"/>">Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-12 col-xl-12 table-admin">
			<div class="table-admin-layer">
				<h3>Danh sách User: ${users.size() }</h3>
				<table class="table table-hover">
					<thead class="thead-dark table-header-admin">
						<tr>
							<th scope="col">STT</th>
							<th scope="col-1">Tài khoản</th>
							<th scope="col-2">Họ và tên</th>
							<th scope="col-2">SDT</th>
							<th scope="col-4">Email</th>
							<th scope="col-5">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user" varStatus="STT">
							<tr>
								<td scope="row">${STT.index+1}</td>
								<td class="col-1 text-center">${user.tentk }</td>
								<td class="col-2 text-center">${user.ho} ${user.ten}</td>
								<td class="col-2 text-center">${user.sdt}</td>
								<td class="col-4 text-center">${user.email}</td>
								<td class="col-5 text-center"><a class="btn btn-success mr-4"
									href="<c:url value="/admin/taikhoan?id_tk=${user.id_tk }"/>">Chỉnh
										sửa</a><a class="btn btn-danger"
									href="<c:url value="/admin/xoa-taikhoan?id_tk=${user.id_tk }"/>">Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
