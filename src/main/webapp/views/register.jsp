<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Register</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<body>
<c:url var="url" value="/account"></c:url>
	<%@include file="menuUser.jsp"%>
	<div class="main">
		<div class="box-form">
			<div class="left">
				<div class="overlay">
					<h1>WELCOME</h1>
					<p>
						Chúng tôi có thể làm gì? <br> Chúng tôi có thể giúp sự kiện
						của bạn trở nên vui hơn!
					</p>
					<span class="different"> <a href="#"><img
							src="${pageContext.request.contextPath}/images/facebook.png"
							alt=""> Register with Facebook</a> <a href="#"><img
							src="${pageContext.request.contextPath}/images/google.png" alt="">
							Register with Google</a>
					</span>
				</div>
			</div>

			<div class="right text-center">
				<div class="form">
					<form action="${url}/sign-up" method="post">
						<h1 class="h3 mb-3 fw-normal">${message}</h1>
						<div class="form-floating">
							<input name="id" type="text" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">Username</label>
						</div>
						<div class="form-floating">
							<input name="password" type="password" class="form-control" id="floatingPassword"
								placeholder="Password"> <label for="floatingPassword">Password</label>
						</div>
						<div class="form-floating">
							<input name="fullname" type="text" class="form-control" id="floatingPassword"
								placeholder="Fullname"> <label for="floatingPassword">Fullname</label>
						</div>
						<div class="form-floating">
							<input name="email" type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">Email address</label>
						</div>
						<div class="form-floating">
							<input name="admin" type="hidden" value="false" class="form-control" id="floatingInput"
								placeholder="Role">
						</div>
						<button class="w-100 btn btn-lg btn-primary" type="submit">Register</button>
						<p class="mt-5 mb-2 text-muted">Welcome to ND ENTERTAINMENT
							&reg;</p>
					</form>
				</div>
			</div>

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
<script>
	var backTo = document.getElementById("back");
	window.onscroll = function() {
		backToTop(), nav()
	};
</script>
</html>