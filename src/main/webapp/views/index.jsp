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
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>

</head>
<body>
	<%@include file="menuUser.jsp"%>
	<main>
		<div class="nen">
			<div class="banner">
				<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="${pageContext.request.contextPath}/images/sehuadicungnhau.jpg"
								alt="">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/images/divenha.jpg"
								alt="">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/images/whynotme.jpg"
								alt="">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#myCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#myCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		<div class="container">
			<h2 class="text-white py-3">Suggest</h2>
			<div class="video row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach var="video" items="${list}">
					<div class="col">
						<div class="card shadow-sm h-100">
							<a href="${url2}/video-detail/${video.id}"><img
								src="${pageContext.request.contextPath}/images/${video.poster}"
								alt=""></a>

							<div class="card-body">
								<p class="card-text">
									MV: ${video.title} <br> ${video.description}
								</p>
							</div>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="page">
			<div
				class="nav nav-pills col-12 d-flex justify-content-between align-items-center tm-paging-col">
				<a href="${url2}/home?page=${currentPage - 1}"
					class="btn btn-outline-primary ${currentPage == 1 ? 'disabled':''}"
					style="width: 100px;"><b> Previous</b> </a>
				<div class="tm-paging d-flex">
					<c:forEach varStatus="i" begin="1" end="${maxPage}">
						<a href="${url2}/home?page=${i.index}"
							class="nav-link ${currentPage == i.index ? 'active':''}"><b>
								${i.index}</b> </a>
					</c:forEach>
				</div>
				<a href="${url2}/home?page=${currentPage + 1}"
					class="btn btn-outline-primary ${currentPage == maxPage ? 'disabled':''}"
					style="width: 100px;"><b> Next</b> </a>
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