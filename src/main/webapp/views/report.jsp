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
	href="${pageContext.request.contextPath}/css/videosManagement.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>
<body>
	<%@ include file="menuAdmin.jsp"%>
	<aside>
		<div class="tabs">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a href="${url1}/report/video-liked" class="text-decoration-none"><button
							class="nav-link ${tab1Active} text-muted" id="nav-favorites-tab"
							data-bs-toggle="tab" data-bs-target="#nav-favorites"
							type="submit" role="tab" aria-controls="nav-edit"
							aria-selected="true">Favorites</button></a> <a
						href="${url1}/report/user-liked" class="text-decoration-none"><button
							class="nav-link ${tab2Active} text-muted"
							id="nav-favoriteUsers-tab" data-bs-toggle="tab"
							data-bs-target="#nav-favoriteUsers" type="submit" role="tab"
							aria-controls="nav-list" aria-selected="false">Favorite
							Users</button></a> <a href="${url1}/report/user-shared"
						class="text-decoration-none"><button
							class="nav-link ${tab3Active} text-muted" id="nav-shared-tab"
							data-bs-toggle="tab" data-bs-target="#nav-shared" type="submit"
							role="tab" aria-controls="nav-list" aria-selected="false">Shared
							Friends</button></a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade ${show1}" id="nav-favorites"
					role="tabpanel" aria-labelledby="nav-favorites-tab">
					<div class="box">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Video Title</th>
									<th scope="col">Favorite count</th>
									<th scope="col">Latest date</th>
									<th scope="col">Oldest date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list1}">
									<tr>
										<th scope="row">${item.title}</th>
										<td>${item.liked}</td>
										<td>${item.latestDate}</td>
										<td>${item.oldestDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade ${show2}" id="nav-favoriteUsers"
					role="tabpanel" aria-labelledby="nav-favoriteUsers-tab">
					<div class="box">
						<form action="${url1}/report/user-liked" method="post">
							<div class="input-group mb-3">
								<input name="videoTitle" type="text" class="form-control"
									placeholder="Title of video?" aria-label="Title of video?"
									aria-describedby="button-addon2">
								<button class="btn btn-outline-primary" type="submit"
									id="button-addon2">Search</button>
							</div>
						</form>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Username</th>
									<th scope="col">Fullname</th>
									<th scope="col">Email</th>
									<th scope="col">Favorite date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list2}">
									<tr>
										<th scope="row">${item.id}</th>
										<td>${item.fullname}</td>
										<td>${item.email}</td>
										<td>${item.likeDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade ${show3}" id="nav-shared" role="tabpanel"
					aria-labelledby="nav-shared-tab">
					<div class="box">
						<form action="${url1}/report/user-shared" method="post">
							<div class="input-group mb-3">
								<input name="videoTitle" type="text" class="form-control"
									placeholder="Title of video?" aria-label="Title of video?"
									aria-describedby="button-addon2">
								<button class="btn btn-outline-primary" type="submit"
									id="button-addon2">Search</button>
							</div>
						</form>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Sender Name</th>
									<th scope="col">Sender Email</th>
									<th scope="col">Receiver Email</th>
									<th scope="col">Sent date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list3}">
									<tr>
										<th scope="row">${item.sendName}</th>
										<td>${item.sendEmail}</td>
										<td>${item.receiverEmail}</td>
										<td>${item.sendDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>
</html>