<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin container--admin--full">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<div class="mx-3">
		<div class="row">
			<div class="col-9">
				<div class="row">
					<div class="col-12 col-xl-12">
						<h2 class="site-name py-4">Quản lý phòng</h2>
					</div>
					<div class="col-12 table-admin">
						<div class="table-admin-layer">
							<h3 class="font-weight-bold py-2">Danh sách phòng</h3>
							<div>
								<input type="text"
									class="input-find input--border m-0 d-inline-block"
									placeholder="Nhập phòng cần tìm" name="keyword" id="keyword">
								<button class="btn button mt-2 px-3 py-1 btn-find"
									onClick="searchPhong()">Tìm</button>
								<div>
									 <select
										onchange="locPhong()" name="thutu" id="thutu"
										class="form-control px-3">
										<option value="0">Mặc định</option>
										<option value="1">Mới nhất</option>
										<option value="2">Cũ nhất</option>
										<option value="3">Giá từ thấp đến cao</option>
										<option value="4">Giá từ cao đến thấp</option>
										<option value="5">Đánh giá thấp đến cao</option>
										<option value="6">Đánh giá cao đến thấp</option>
									</select>
								</div>
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr style="vertical-align: middle;">
											<th scope="col">STT</th>
											<th class="col-2" scope="col">Hình ảnh</th>
											<th class="col-2" scope="col">Tên phòng</th>
											<th class="col-1" scope="col">Giá</th>
											<th class="col-3" scope="col">Địa chỉ</th>
											<th class="col-2" scope="col">Chủ phòng</th>

											<th class="" scope="col"></th>
										</tr>
									</thead>
									<tbody id="load">
										<c:forEach items="${phongs}" var="phong" varStatus="STT">
											<tr class="phong">
											<td class="col-1">${STT.index+1}</td>
												<td class="col-4"><c:url
														value="/hinhanh?fname=${phong.anhchinh}" var="hinhanh" />
													<img style = "height:120px; width:160px" class="img-thumbnail"
													src="${hinhanh}" /></td>
												<td class="col-2">${phong.ten}</td>
												<td class="col-1">${phong.gia}</td>
												<td class="col-2">${phong.getXa().getTenxa()},
													${phong.getXa().getHuyen().getTenhuyen()},
													${phong.getXa().getHuyen().getTinh().getTentinh() }</td>
												<td class="col-2 p-5"><a class="main-name-object"
													href="<c:url value="/admin/taikhoan?id_tk=${phong.getTaikhoan().getId_tk() }"/>">${phong.getTaikhoan().getTentk()}</a></td>
												<td class="col-1"><a class="d-inline-block mb-3 mr-3"
													href="<c:url value="/admin/phong?id_p=${phong.id_p }&id_taikhoan=${user.id_tk }"/>"><button
															class="btn btn-success btn-sm rounded-0" type="button"
															data-toggle="tooltip" data-placement="top" title="Edit">
															<i class="bi bi-pencil-square"></i>
														</button></a><a
													href="<c:url value="/admin/xoa-phong?id_p=${phong.id_p }"/>"><button
															class="btn btn-danger btn-sm rounded-0" type="button"
															data-toggle="tooltip" data-placement="top" title="Delete">
															<i class="bi bi-trash"></i>
														</button></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div>
									<button onClick="loadMore()" class="btn btn-primary">Xem
										tiếp</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-3" style="margin-top: 7rem;">
				<div class="mb-5">
					<h3 class="text-black h5  font-family-2">Lọc phòng theo</h3>
					<button class="btn button mt-2 px-3 py-1 btn-find"
						onClick="locPhong()">Lọc</button>
					<h4></h4>
					<div class="form-group">
						<div class="select-wrap">
							<span class="icon icon-keyboard_arrow_down"></span> <select
								onchange="LoadListings()" id="loaiphong"
								class="form-control px-3">
								<option value="0" selected>Loại phòng</option>
								<c:forEach items="${loaiphongs }" var="lp">
									<option value="${lp.id_lp }">${lp.tenloai }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="select-wrap">
							<span class="icon icon-keyboard_arrow_down"></span> <select
								id="songuoi" class="form-control px-3">
								<option value="0" selected>Số người ở</option>
								<option value="1">1 người</option>
								<option value="2">2 người</option>
								<option value="4">4 người</option>
								<option value="8">8 người</option>
								<option value="10">10 người</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="select-wrap">
							<span class="icon icon-keyboard_arrow_down"></span> <select
								onchange="loadLocHuyen()" id="blcity" class="form-control px-3">
								<option value="0" selected>Chọn tỉnh, thành phố</option>
								<c:forEach items="${tinhs }" var="tinh">
									<option value="${tinh.getMatinh() }">${tinh.getTentinh() }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="select-wrap">
							<span class="icon icon-keyboard_arrow_down"></span> <select
								onchange="loadLocXa()" id="bldistrict" class="form-control px-3"
								disabled>
								<option value="0" selected>Chọn quận huyện</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="select-wrap">
							<span class="icon icon-keyboard_arrow_down"></span> <select
								onchange="" id="blward" class="form-control px-3" disabled>
								<option value="0" selected>Chọn phường xã</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<script>
		function searchPhong() {
			/* tạo viên amount để Gọi và đếm classname là product */
			var resultSearch = document.getElementById('load')
			var thutu = document.getElementById('thutu').value;
			var keyword = document.getElementById('keyword').value;
			var loading = "<div class='spinner-border' role='status'><span class='visually-hidden'>Loading...</span></div>"
			resultSearch.innerHTML = loading;
			$.ajax({
				url : "/timphong/timkiem", //send to Controller
				type : "post", //send it through get method
				data : {
					key : keyword,
					thutu : thutu
				},
				success : function(data) {
					resultSearch.innerHTML = data;
				}
			});
		};

		function locPhong() {
			/* tạo viên amount để Gọi và đếm classname là product */
			var resultSearch = document.getElementById('load')
			var keyword = document.getElementById('keyword').value;
			var lp = document.getElementById('loaiphong').value;
			var city = document.getElementById('blcity').value;
			var district = document.getElementById('bldistrict').value;
			var ward = document.getElementById('blward').value;
			var thutu = document.getElementById('thutu').value;
			var songuoi = document.getElementById('songuoi').value;
			var loading = "<div class='spinner-border' role='status'><span class='visually-hidden'>Loading...</span></div>"
			resultSearch.innerHTML = loading;
			$.ajax({
				url : "/timphong/filter", //send to Controller
				type : "post", //send it through get method
				data : {
					key : keyword,
					loaiphong : lp,
					tinh : city,
					huyen : district,
					xa : ward,
					thutu : thutu,
					songuoi : songuoi
				},
				success : function(data) {
					resultSearch.innerHTML = data;
				}
			});
		};

		function loadMore() {
			/* tạo viên amount để Gọi và đếm classname là product */
			var amount = document.getElementsByClassName("phong").length;
			var resultSearch = document.getElementById('load')
			var keyword = document.getElementById('keyword').value;
			var lp = document.getElementById('loaiphong').value;
			var city = document.getElementById('blcity').value;
			var district = document.getElementById('bldistrict').value;
			var ward = document.getElementById('blward').value;
			var thutu = document.getElementById('thutu').value;
			/* 		var loading = document.getElementById('loading');
			 loading.style.display="block"; */
			$.ajax({
				url : "/timphong/next", //send to Controller
				type : "post", //send it through get method
				data : {
					exits : amount,
					key : keyword,
					loaiphong : lp,
					tinh : city,
					huyen : district,
					xa : ward,
					thutu : thutu
				},
				success : function(data) {
					$("#load").append(data);
				}
			});
			/* 		loading.style.display="none"; */
		};
	</script>