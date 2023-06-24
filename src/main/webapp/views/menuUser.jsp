<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/ndentertainment/account"></c:url>
<c:url var="url1" value="/ndentertainment/admin"></c:url>
<c:url var="url2" value="/ndentertainment"></c:url>
<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
<div id="loader-wrapper">
	<div id="loader"></div>
	
</div>
<header class="d-flex flex-wrap justify-content-center py-3 sticky-top">
	<a href="${url2}/home"
		class=" align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none logo"><img
		src="${pageContext.request.contextPath}/images/logo.png" alt="">
		<br> ND ENTERTAINMENT</a>

	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<ul class="nav nav-pills">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/views/login.jsp"
					class="nav-link init" aria-current="page">Login</a></li>
				<li class="nav-item"><a
					href="${pageContext.request.contextPath}/views/register.jsp"
					class="nav-link init">Register</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="${url2}/home"
					class="nav-link ${pageHome}" aria-current="page">Home</a></li>
				<li class="nav-item"><a
					href="${url2}/favorite/${sessionScope.user.id}"
					class="nav-link ${pageFavorite}">Favorite</a></li>
				<c:if test="${sessionScope.user.admin}">
					<li class="nav-item"><a href="${url1}/videos" class="nav-link"
						aria-current="page">Admin</a></li>
				</c:if>
			</ul>
			<div class="dropdown text-end account">
				<a href="#"
					class="d-block text-white text-decoration-none dropdown-toggle"
					id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					<img src="${pageContext.request.contextPath}/images/account.jpg"
					alt="mdo" width="32" height="32" class="rounded-circle">
					${sessionScope.user.fullname}
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
		</c:otherwise>
	</c:choose>
</header>
<script>
	var backTo = document.getElementById("back");
	window.onscroll = function() {
		backToTop(), nav()
	};
	$(window).on("load", function() {
		$('body').addClass('loaded');
	});
</script>