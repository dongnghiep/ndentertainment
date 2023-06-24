<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layoutAdmin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/usersManagement.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>
<body>
	<c:url var="url" value="/a/admin"></c:url>
	<%@ include file="menuAdmin.jsp"%>
	<aside>
		<div class="tabs">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link ${tabList} text-muted" id="nav-list-tab"
						data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
						role="tab" aria-controls="nav-list" aria-selected="true">User
						List</button>
					<button class="nav-link ${tabEdit} text-muted" id="nav-edit-tab"
						data-bs-toggle="tab" data-bs-target="#nav-edit" type="button"
						role="tab" aria-controls="nav-edit" aria-selected="false">User
						Edition</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade ${showEdit}" id="nav-edit" role="tabpanel"
					aria-labelledby="nav-edit-tab">
					<div class="box">
						<div class="right text-center">
							<div class="form">
								<form>
									<div class="form-floating">
										<input name="id" value="${user.id}" type="text" class="form-control" id="floatingInput"
											placeholder="name@example.com"> <label
											for="floatingInput">Username</label>
									</div>
									<div class="form-floating">
										<input name="password" value="${user.password}" type="password" class="form-control"
											id="floatingPassword" placeholder="Password"> <label
											for="floatingPassword">Password</label>
									</div>
									<div class="form-floating">
										<input name="fullname" value="${user.fullname}" type="text" class="form-control" id="floatingPassword"
											placeholder="Password"> <label for="floatingPassword">Fullname</label>
									</div>
									<div class="form-floating">
										<input name="email" value="${user.email}" type="email" class="form-control" id="floatingInput"
											placeholder="name@example.com"> <label
											for="floatingInput">Email address</label>
									</div>
									<div class="row float-end">
										<button class="btn btn-primary" type="submit" formaction="${url1}/update-user">Update</button>
										<button class="btn btn-primary" type="submit" formaction="${url1}/delete-user">Delete</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade ${showList}" id="nav-list" role="tabpanel"
					aria-labelledby="nav-list-tab">
					<div class="list">
						<table class="table border">
							<thead>
								<tr>
									<th scope="col">Username</th>
									<th scope="col">Password</th>
									<th scope="col">Fullname</th>
									<th scope="col">Email</th>
									<th scope="col">Role</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<th scope="row">${item.id}</th>
										<td>${item.password}</td>
										<td>${item.fullname}</td>
										<td>${item.email}</td>
										<td>${item.admin?'Admin':'User'}</td>
										<td><a href="${url1}/edit-user/${item.id}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<div class="row">
							<div class="col-2">
								<b class="count">${allUser} Users</b>
							</div>
							<div class="col-10 text-end">
								<a href="${url1}/users?page=${currentPage - 1}" class="nut btn btn-outline-primary ${currentPage == 1 ? 'disabled':''}">Previous</a>
								<c:forEach varStatus="i" begin="1" end="${maxPage}">
									<a href="${url1}/users?page=${i.index}"
										class="nut btn btn-outline-primary ${currentPage == i.index ? 'active':''}"><b>
											${i.index}</b> </a>
								</c:forEach>
								<a href="${url1}/users?page=${currentPage + 1}" class="nut btn btn-outline-primary ${currentPage == maxPage ? 'disabled':''}">Next</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>
</html>