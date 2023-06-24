<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layoutAdmin.css">
</head>
<body>
	<c:url var="url" value="/ndentertainment/account"></c:url>
	<c:url var="url1" value="/ndentertainment/admin"></c:url>
	<c:url var="url2" value="/ndentertainment"></c:url>
	<article class="bg-secondary position-relative">
		<div class="menu">
			<div class="text-center bg-dark p-3">
				<a href="${url2}/home"
					class=" align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none text-white"><img
					src="${pageContext.request.contextPath}/images/logo.png" alt="">
					<br> ND ENTERTAINMENT</a>
			</div>

			<div class="d-grid p-3 nav nav-pills menuAdmin">
				<a href="${url2}/home"
					class="text-decoration-none nav-link"> <img
					src="${pageContext.request.contextPath}/images/home.png" alt="">
					Home
				</a> <a href="${url1}/videos"
					class="text-decoration-none nav-link ${pageVideos}"> <img
					src="${pageContext.request.contextPath}/images/video.png" alt="">
					Videos
				</a> <a href="${url1}/users" class="text-decoration-none nav-link ${pageUsers}"> <img
					src="${pageContext.request.contextPath}/images/user.png" alt="">
					Users
				</a> <a href="${url1}/report/video-liked" class="text-decoration-none nav-link ${pageReport}">
					<img src="${pageContext.request.contextPath}/images/pie-chart.png"
					alt=""> Report
				</a>
			</div>
			<p
				class="text-white position-absolute bottom-0 start-50 translate-middle"
				style="font-size: 10pt;">ND ENTERTAINMENT &reg;</p>
		</div>
	</article>
	<div class="account p-3 text-end">
		<div class="dropdown">
			<a href="#"
				class="d-block link-dark text-decoration-none dropdown-toggle"
				id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="${pageContext.request.contextPath}/images/account.jpg"
				alt="mdo" width="32" height="32" class="rounded-circle">
				${user.fullname}
			</a>
			<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
				<li><a class="dropdown-item"
					href="${pageContext.request.contextPath}/views/login.jsp">Login</a></li>
				<li><a class="dropdown-item"
					href="${pageContext.request.contextPath}/views/editProfile.jsp">Edit
						Profile</a></li>
				<li><a class="dropdown-item"
					href="${pageContext.request.contextPath}/views/changePassword.jsp">Change
						password</a></li>
				<li><a class="dropdown-item"
					href="${pageContext.request.contextPath}/views/forgotPassword.jsp">Forgot
						password</a></li>
				<li><a class="dropdown-item"
					href="${pageContext.request.contextPath}/views/register.jsp">Register</a></li>
				<li>
					<hr class="dropdown-divider">
				</li>
				<li><a class="dropdown-item" href="${url}/sign-out">Logout</a></li>
			</ul>
		</div>
	</div>
</body>
</html>