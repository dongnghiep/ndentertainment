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
<body ng-app="b1">
	<c:url var="url" value="/ndentertainment/admin"></c:url>
	<%@ include file="menuAdmin.jsp"%>
	<aside>
		<div class="tabs">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a href="${url1}/videos" class="text-decoration-none"><button
							class="nav-link ${tabList} text-muted" id="nav-list-tab"
							data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
							role="tab" aria-controls="nav-list" aria-selected="true">Video
							List</button></a> <a href="${url1}/edit-video" class="text-decoration-none"><button
							class="nav-link ${tabEdit} text-muted" id="nav-edit-tab"
							data-bs-toggle="tab" data-bs-target="#nav-edit" type="button"
							role="tab" aria-controls="nav-edit" aria-selected="false">Video
							Edition</button></a>

				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent" ng-controller="check">
				<div class="tab-pane fade ${showList}" id="nav-list" role="tabpanel"
					aria-labelledby="nav-list-tab">
					<div class="box">
						<table class="table border">
							<thead>
								<tr>
									<th scope="col">Youtube ID</th>
									<th scope="col">Video title</th>
									<th scope="col">View count</th>
									<th scope="col">Status</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<th scope="row">${item.id}</th>
										<td>${item.title}</td>
										<td>${item.views}</td>
										<td>${item.active?'Active':'Inactive'}</td>
										<td><a href="${url1}/edit-video/${item.id}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row" style="margin-top: 30px;">
							<div class="col-2">
								<b class="count">${allVideo} Videos</b>
							</div>
							<div class="col-10 text-end">
								<a href="${url1}/videos?page=${currentPage - 1}"
									class="nut btn btn-outline-primary ${currentPage == 1 ? 'disabled':''}">Previous</a>
								<c:forEach varStatus="i" begin="1" end="${maxPage}">
									<a href="${url1}/videos?page=${i.index}"
										class="nut btn btn-outline-primary ${currentPage == i.index ? 'active':''}"><b>
											${i.index}</b> </a>
								</c:forEach>
								<a href="${url1}/videos?page=${currentPage + 1}"
									class="nut btn btn-outline-primary ${currentPage == maxPage ? 'disabled':''}">Next</a>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade ${showEdit}" id="nav-edit" role="tabpanel"
					aria-labelledby="nav-edit-tab">
					<div class="box">
						<form action="${url1}/videos" method="post"
							enctype="multipart/form-data">
							<div class="poster">
								<div class="image">
									<img
										src="${pageContext.request.contextPath}/images/${video.poster}"
										alt="" id="imgPreview">
								</div>

								<div class="mb-3">
									<input name="poster" value="${video.poster}"
										class="form-control" type="text" placeholder="image file name">
								</div>

							</div>
							<div class="input">
								<div class="form-floating">
									<input name="id" value="${video.id}" type="text"
										class="form-control" id="floatingInput" placeholder="">
									<label for="floatingInput">Youtube ID</label>
								</div>
								<div class="form-floating">
									<input name="title" value="${video.title}" type="text"
										class="form-control" id="floatingInput" placeholder="">
									<label for="floatingInput">Video title</label>
								</div>
								<div class="form-floating">
									<input name="views" value="${video.views}" type="number" min="0"
										class="form-control" id="floatingInput" placeholder="">
									<label for="floatingInput">View count</label>
								</div>
								<label style="margin: 0 20px;"> <input name="active"
									${video.active?'checked="checked"':''} type="radio" value="1">
									Active
								</label> <label> <input type="radio" value="0" name="active"
									${video.active?'':'checked="checked"'}> Inactive
								</label>
							</div>
							<div class="descript">
								<label class="mb-3">Description</label> <br>
								<textarea name="description" id="" cols="60" rows="5"
									class="form-control">${video.description}</textarea>
								<hr>
								<div class="text-end">
									<button type="submit" class="btn btn-primary"
										formaction="${url1}/create-video">Create</button>
									<button type="submit" class="btn btn-success" id="update" onclick="checkForm()"
										formaction="${url1}/update-video"
										${disabled == 1 ? 'disabled':''}>Update</button>
									<button type="submit" class="btn btn-danger"
										formaction="${url1}/delete-video"
										${disabled == 1 ? 'disabled':''}>Delete</button>
									<button type="submit" class="btn btn-secondary"
										formaction="${url1}/edit-video">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>
<script>
function checkForm() {
        var id = document.getElementByName('id').value.trim();
        var title = document.getElementByName('title').value.trim();
        var views = document.getElementsByName('views');
        var poster = document.getElementsByName('poster');
        var test = 0;
        if (id == "") {
            alert("Vui lòng nhập id của video!");
            return;
        }
        if (title == "") {
            alert("Vui lòng nhập tiêu đề của video!");
            return;
        }
        if (views == "") {
            alert("Vui lòng nhập số lượt xem của video!");
            return;
        }
        if (isNaN(views) == true) {
            alert("Vui lòng nhập số!");
            return;
        }
        if (poster == "") {
            alert("Vui lòng nhập tên file ảnh của video!");
            return;
        }
        if (id != "" && title != "" && views != "" && poster != "") {
            test = 1;
        }
        if (test == 1) {
            alert("Cập nhật thành công!");
        }
    }
</script>
</html>