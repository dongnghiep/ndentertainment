<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Video Detail</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/videoDetail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>
<body>
	<%@include file="menuUser.jsp"%>
	<main>
		<div class="box">
			<div class="left">
				<div class="video">
					<iframe width="100%" height="530"
						src="https://www.youtube.com/embed/${video.id}?autoplay=1&loop=1"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen> </iframe>
				</div>
				<div class="box1">
					<div class="name">
						<h3>${video.title}</h3>
					</div>
					<c:if test="${not empty sessionScope.user}">
					<div class="button text-end">
						<c:choose>
							<c:when test="${liked}">
								<a href="${url2}/like/${video.id}" class="text-decoration-none"><button
										type="button" class="btn btn-sm btn-outline-secondary">
										<img src="${pageContext.request.contextPath}/images/like.png"
											alt="" style="height: 20px;"> Like
									</button></a>
							</c:when>
							<c:otherwise>
								<a href="${url2}/disfavor/${video.id}"><button type="button"
										class="btn btn-sm btn-outline-secondary like">
										<img
											src="${pageContext.request.contextPath}/images/dislike.png"
											alt="" style="height: 20px;"> Dislike
									</button></a>
							</c:otherwise>
						</c:choose>
						<button type="button" class="btn btn-sm btn-outline-secondary"
							data-bs-toggle="modal" data-bs-target="#exampleModal"
							style="margin-left: 10px;">
							<img src="${pageContext.request.contextPath}/images/share.png"
								alt="" style="height: 20px; margin-left: 10px;"> Share
						</button>
					</div>
					</c:if>
				</div>
				<div class="descript">
					<p>${video.description}</p>
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
			<div class="right">
				<c:forEach var="video" items="${list}">
					<a href="${url2}/video-detail/${video.id}">
						<div class="orther">
							<div class="img">
								<img
									src="${pageContext.request.contextPath}/images/${video.poster}"
									alt="">
							</div>
							<div class="title">MV: ${video.title}</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</main>
	<%@include file="footer.jsp"%>
</body>
<script>
	var backTo = document.getElementById("back");
	window.onscroll = function() {
		backToTop(), nav()
	};
	$(window).on("load", function() {
		$('body').addClass('loaded');
	});
</script>
</html>