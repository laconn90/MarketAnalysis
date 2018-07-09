<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Business Frontpage - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/business-frontpage.css" rel="stylesheet">

</head>

<body>
	<font style="font-family: HY울릉도M"> <!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="#">골목상권 분석</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="index.html">HOME <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="about.html">TEAM</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="mapService.jsp">SERVICES</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.html">CONTACT</a>
						</li>
					</ul>
				</div>
			</div>
		</nav> <!-- Header with Background Image --> <header class="business-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="display-3 text-center text-white mt-4">골목상권 예상 매출
							분석</h1>
					</div>
				</div>
			</div>
		</header> <!-- Page Content -->
		<div class="container">

			<div class="row">
				<div class="col-sm-8">
					<h2 class="mt-4">
						<font color="#0C7EF8"><strong>예상 매출 금액 </strong></font>:
						${sessionScope.sales}
					</h2>
					<p>
						해당 상권 업종의 매출액 <font color="#FC6609">${sessionScope.sales}</font>원은
						창업 여부의 지표로 쓰일 수 있습니다.
					</p>
					<p>하지만 상권과 업종별 임대료와 마진이 다르기 때문에 이익률이 상이할 수 있습니다.</p>
					<p>
						보다 정확한 예측과 이익을 알고 싶으시다면 <a href="http://www.kpc.or.kr/"
							class="btn btn-primary">분석 컨설팅</a>을 신청하세요.
					</p>
				</div>
				<div class="col-sm-4">
					<h2 class="mt-4">Contact Us</h2>
					<address>
						<strong>으리 골목상권</strong> <br>서울특별시 종로구 <br>새문안로5가길 32
						KPC 7층 <br>
					</address>
					<address>
						<abbr title="Phone">P:</abbr> (02) 724-1114 <br> <abbr
							title="Email">E:</abbr> <a href="mailto:#">laconn@naver.com</a>
					</address>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-sm-4 my-4">
					<div class="card">
						<img class="card-img-top" src="card1.jpg" alt="">
						<div class="card-body">
							<h4 class="card-title">컨설팅</h4>
							<p class="card-text"></p>
						</div>
						<div class="card-footer">
							<a href="http://golmok.seoul.go.kr/sgmc/main.do"
								class="btn btn-primary">Click</a>
						</div>
					</div>
				</div>
				<div class="col-sm-4 my-4">
					<div class="card">
						<img class="card-img-top" src="card2.jpg" alt="">
						<div class="card-body">
							<h4 class="card-title">자료 출처</h4>
							<p class="card-text"></p>
						</div>
						<div class="card-footer">
							<a
								href="http://data.seoul.go.kr/dataList/datasetView.do?infId=OA-13339&srvType=S&serviceKind=1&currentPageNo=1"
								class="btn btn-primary">Click</a>
						</div>
					</div>
				</div>
				<div class="col-sm-4 my-4">
					<div class="card">
						<img class="card-img-top" src="card3.jpg" alt="">
						<div class="card-body">
							<h4 class="card-title">문의 및 상담</h4>
							<p class="card-text"></p>
						</div>
						<div class="card-footer">
							<a href="http://www.kpc.or.kr/" class="btn btn-primary">Click</a>
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->

		</div> <!-- /.container --> <!-- Footer --> <footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; 골목 상권 분석
					2018</p>
			</div>
			<!-- /.container -->
		</footer>
	</font>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>