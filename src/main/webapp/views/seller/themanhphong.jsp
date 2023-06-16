<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class=container--admin>
	<div>
		<h2>Thêm ảnh cho phòng:</h2>
		<form action="them-anh-phong" method="post"
			enctype="multipart/form-data">
			<input type="password" name="id_p" value="${id_p }" hidden>
			<div class="col-12 mb-3">
				<label class="label-info-admin__small pr-3 col-4">Hình ảnh: </label> 
				<img height="180" width="240" id="previewImg1"
					class="img-thumbnail img--phong" src=""> <label
					class="ml-3 label-img" for="hinhanh1"><i
					class="bi bi-upload"></i> Upload</label> <input id="hinhanh1" type="file"
					hidden onchange="previewFile1(this);" name="hinhanh">
			</div>
			<button type="submit" class="btn btn-primary">Tải ảnh</button>
		</form>
	</div>
</div>
<script>
	function previewFile1(input) {
		var file = $("#hinhanh1").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg1").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
</script>