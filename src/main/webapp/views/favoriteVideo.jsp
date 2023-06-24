<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Favorite</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/favoriteVideo.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@include file="menuUser.jsp"%>
	<main>
		<div class="container">
			<h3>Liked videos</h3>
			<div class="video row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach var="video" items="${list}">
					<div class="col">
						<div class="card shadow-sm h-100">
							<a href="${url2}/video-detail/${video.id}"><img
								src="${pageContext.request.contextPath}/images/${video.poster}"
								alt=""></a>

							<div class="card-body">
								<p class="card-text">
									Tiểu phẩm: ${video.title} <br> ${video.description}
								</p>
							</div>
							<div
								class=" card-footer justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${url2}/disfavor/${video.id}"><button
											type="button" class="btn btn-sm btn-outline-secondary like">
											<img
												src="${pageContext.request.contextPath}/images/dislike.png"
												alt="" style="height: 20px;"> Dislike
										</button></a>
									<button type="button"
										class="btn btn-sm btn-outline-secondary share"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										<img src="${pageContext.request.contextPath}/images/share.png"
											alt="" style="height: 20px; margin-left: 10px;"> Share
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="${url2}/share/${video.id}" method="post">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Share to
									email</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<input name="emailShare" type="email" class="form-control"
									placeholder="name@example.com">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Send</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="footer.jsp"%>
</body>
</html>