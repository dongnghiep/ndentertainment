<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Change Password</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/changePassword.css">
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
		<div class="box-form text-center">
			<div class="form-signin">
				<form action="${url}/change-password" method="post">
					<img class="mb-3"
						src="${pageContext.request.contextPath}/images/logo.png" alt=""
						width="65" height="57">
					<h3 class="fw-normal">${message}</h3>
					<div class="form-floating">
						<input name="id" value="${user.id}" type="text" class="form-control" id="floatingInput"
							placeholder="Username"> <label
							for="floatingInput">Username</label>
					</div>
					<div class="form-floating">
						<input name="curentPass" type="password" class="form-control" id="floatingPassword"
							placeholder="Password"> <label for="floatingPassword">Curent
							Password</label>
					</div>
					<div class="form-floating">
						<input name="newPass" type="password" class="form-control" id="floatingPassword"
							placeholder="Password"> <label for="floatingPassword">New
							Password</label>
					</div>
					<div class="form-floating">
						<input name="confirmPass" type="password" class="form-control" id="floatingPassword"
							placeholder="Password"> <label for="floatingPassword">Confirm
							Password</label>
					</div>
					<button class="w-100 btn btn-lg btn-primary" type="submit">Change</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>