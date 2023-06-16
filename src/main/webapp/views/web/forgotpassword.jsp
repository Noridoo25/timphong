
<!--     <div class="NUS">
        <div class="container">
            <div class="grid wide">
                <div class="container__header">
                    <span class="container__header__logo">
                        <img src="./assits/image/logo.jpg" class="container__header__img">
                    </span>
                    <span class="container__header__text">Find Room<br><span class="text_underline container__header__text--underline">Forget Password</span></span>
                </div>

                <div class="container__content">
                    <div class="container__content__header">
                        Find your account
                    </div>
                    <div class="container__content__body">
                        <label for="input" class="container__content__body__label">Please enter your email address or mobile number to search for your account.</label>
                        
                        <input class="container__content__body__input input" type="text" placeholder="Your Email or Phone number">
                    </div>
                    <div class="container__content__footer">
                        <button class="">Cancel</button>
                        <button class="">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-section site-section-phong" id="property-details">
	<div class="container">
		<div class="card text-center" style="width: 300px; margin:0 auto;">
		    <div class="card-header h5 text-white bg-primary">Quên mật khẩu</div>
		    <div class="card-body px-5">
		        <p class="card-text py-2">
		            Nhập tên tài khoản và email đã đăng ký, mật khẩu sẽ được gửi qua mail của bạn
		        </p>
		        <form action="quen-mk" method="post">
			        <div class="form-outline">
			            <input placeholder="Tên tài khoản" type="text" class="form-control my-3" name="tentk" />
			        </div>
			       	<div class="form-outline">
			            <input placeholder="Email" type="email" id="typeEmail" class="form-control my-3" name="email" />
			        </div>
			        <button type="submit" class="btn btn-primary w-100">Xác nhận</button>
			        <div class="d-flex justify-content-between mt-4">
			            <a class="" href="<c:url value="/login"/>">Login/Register</a>
			        </div>
		        </form>
		    </div>
		</div>
	</div>
</div>