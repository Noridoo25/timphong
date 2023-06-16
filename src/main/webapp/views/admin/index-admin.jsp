<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body>
<div class=container--admin>
	<div class="row">
		<div class="col-12 col-xl-12">
			<h2 class="site-name py-4">Thống kê trang web</h2>
				<div class="mx-5">
		</div>
	<h4></h4>
	<h4></h4>
	<main>
			<div class="row">
			<div class="col-9">
				<div class="row">
					<div class="col-12 table-admin">
						<div class="table-admin-layer">
		<div class="row">
			<div class="col s6">
				<div style="padding: 35px; height: 350px" align="center"
					class="card">
					<div class="row">
						<div class="left card-title">
							<b>Quản lý người dùng</b>
						</div>
					</div>

					<div class="row">
						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-person-fill"
									style="font-size: 50px; color: black"></i> <span
									class="indigo-text text-lighten-1"><h5>Sellers:
										${sellers.size()}</h5></span>
							</div>
						</a>

						<div class="col s1">&nbsp;</div>
						<div class="col s1">&nbsp;</div>

						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-person-fill"
									style="font-size: 50px; color: black"></i> <span
									class="indigo-text text-lighten-1"><h5>Users:
										${users.size()}</h5></span>
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="col s6">
				<div style="padding: 35px; height: 350px" align="center"
					class="card">
					<div class="row">
						<div class="left card-title">
							<b>Quản lí loại phòng</b>
						</div>
					</div>
					<div class="row">
						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-clipboard2-minus-fill"
									style="font-size: 50px; color: black"></i> <span
									class="indigo-text text-lighten-1"><h5>Loại phòng:
										${loaiphongs.size() }</h5></span>
							</div>
						</a>

						<div class="col s1">&nbsp;</div>
						<div class="col s1">&nbsp;</div>

					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col s6">
				<div style="padding: 35px; height: 350px" align="center"
					class="card">
					<div class="row">
						<div class="left card-title">
							<b>Quản lí phòng</b>
						</div>
					</div>

					<div class="row">
						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-house-check"
									style="font-size: 35px; color: black"></i> <span
									class="indigo-text text-lighten-1"><h5>Phòng đang
										hiện: ${phonghiens.size() }</h5></span>
							</div>
						</a>

						<div class="col s1">&nbsp;</div>
						<div class="col s1">&nbsp;</div>

						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-house-lock"
									style="font-size: 35px; color: black"></i> <span
									class="indigo-text text-lighten-1"><h5>Phòng đang
										ẩn: ${phongans.size() }</h5></span>
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="col s6">
				<div style="padding: 35px; height: 350px" align="center"
					class="card">
					<div class="row">
						<div class="left card-title">
							<b>Quản lí đặt hẹn</b>
						</div>
					</div>
					<div class="row">
						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-calendar-plus"
									style="font-size: 35px; color: black"></i> <span
									class="indigo-text text-lighten-1"><h5>Chờ xác
										nhận: ${dathenchos.size()}</h5></span>
							</div>
						</a>
						<div class="col s1">&nbsp;</div>
						<div class="col s1">&nbsp;</div>
						<a href="#!">
							<div style="padding: 30px;"
								class="grey lighten-3 col s5 waves-effect">
								<i
									class="indigo-text text-lighten-1 large material-icons bi bi-calendar2-check"
									style="font-size: 35px; color: black"></i> <span
									class="truncate indigo-text text-lighten-1"><h5>Đã
										xác nhận: ${dathenxns.size()}</h5></span>
							</div>
							<div class="col s1">&nbsp;</div>
							<div class="col s1">&nbsp;</div> <a href="#!">
								<div style="padding: 30px;"
									class="grey lighten-3 col s5 waves-effect">
									<i
										class="indigo-text text-lighten-1 large material-icons bi bi-calendar-x"
										style="font-size: 35px; color: black"></i> <span
										class="truncate indigo-text text-lighten-1"><h5>Đã
											hủy: ${dathenhuys.size()}</h5></span>
								</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!--<h2 class="site-name py-4">Tổng doanh thu hoa hồng: ${doanhthu} VND</h2>  -->

	</main>

	<footer class="indigo page-footer">
		<div class="container">
			<div class="row">
				<div class="col s12">
					<h5 class="white-text"><a style='font-weight: bold'
					target="_blank">Note thông tin</a></h5>
					<ul id='credits'>
						<li>Thống kê số lượng <a
							href="list-taikhoan" title="seller và user">seller và user</a> 
						</li>
						<li>Thống kê số lượng <a href="list-phong" title="phòng">phòng</a>,
							gồm các phòng đang hiện và ẩn trên web <a
							href="https://www.apache.org/licenses/LICENSE-2.0"
							target="_blank"></a>
						</li>
						<li>Thống kê số lượng <a href="list-loaiphong" title="phòng"> loại phòng</a>
						</li>
						<li>Thống kê số lượng <a href="ql-dathen" title="cuộc hẹn"> cuộc hẹn</a> đang chờ xác nhận, đã được xác nhận
						hoặc bị hủy
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				<span>Made By <a style='font-weight: bold;'
					target="_blank">Admin</a></span>
			</div>
		</div>
	</footer>
</body>

</html>