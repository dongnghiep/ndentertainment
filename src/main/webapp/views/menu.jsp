<%@ page pageEncoding="UTF-8"%>
<header class="d-flex flex-wrap justify-content-center py-3 sticky-top">
	<a href=""
		class=" align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none logo"><img
		src="${pageContext.request.contextPath}/images/logo.png" alt="">
		<br> ND ENTERTAINMENT</a>

	<div class="dropdown text-end account">
		<a href="#"
			class="d-block text-white text-decoration-none dropdown-toggle"
			id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			<img src="${pageContext.request.contextPath}/images/account.jpg"
			alt="mdo" width="32" height="32" class="rounded-circle"> ${user.id}
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
			<li><a class="dropdown-item"
				href="${pageContext.request.contextPath}/views/login.jsp">Logout</a></li>
		</ul>
	</div>
</header>
