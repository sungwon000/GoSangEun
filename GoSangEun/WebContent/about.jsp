<%@page import="model.vo.Review"%>
<%@page import="model.vo.Shop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.vo.ShopMenu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Shop s = (Shop) request.getAttribute("shop");
	ArrayList<ShopMenu> list = (ArrayList<ShopMenu>) request.getAttribute("list");
	ArrayList<Review> rlist = (ArrayList<Review>) request.getAttribute("rlist");
%>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title><%= s.getShopName() %></title>

</head>

<body>


	<%@ include file="views/common/header.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<br>
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-5 mb-2">
			<%=s.getCategoryId()%>
			<small> <%=s.getShopName()%>
			</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="category.go?category=<%=s.getCategoryId()%>">Home</a></li>
			<li class="breadcrumb-item active"><%=s.getCategoryId()%></li>
		</ol>

		<!-- Intro Content -->
		<div class="row">
			<div class="col-lg-4">
				<%
					if (s.getShopId() >= 100) {
				%>
				<img class="img-fluid rounded mb-4" src="resources/images/FoodMenu/<%=s.getShopLogo()%>.jpg" alt="LOGO">
				<%
					} else {
				%>
				<img class="img-fluid rounded mb-4" src="<%=s.getShopLogo()%>" alt="LOGO">
				<%
					}
				%>
			</div>

			<div class="col-lg-4">
				<h2><%=s.getShopName()%></h2>
				<h5>
					<%
						for (int i = 0; i < 5; i++) {
							if (i < s.getPoint()) {
					%>
					★
					<%
						} else {
					%>
					☆
					<%
						}
						}
					%>
					<!-- 별점 개수 -->
					<%=s.getPoint()%>
				</h5>
				<br>
				<p>
					영업 시간 :
					<%=s.getShopTime()%></p>
				<p>
					전화번호 :
					<%=s.getShopPhone()%></p>
				<p>
					설명 :
					<%=s.getShopInfo()%></p>
			</div>

			<div class="col-lg-4">
				<div class=" pre-scrollable" style="max-height: 300px;">

					<!-- 리뷰 -->
					<!-- 반복문을 늘리면 될뜻 
                     일단 임시로 복붙 블록 생성 -->

					<div id="Review">
						<%
							if (m != null) {
								for (int i = 0; i < rlist.size(); i++) {
						%>
						<div class="card mr-2 p-2">
							<div class='text-left'>
								<%=rlist.get(i).getUserName()%>
							</div>
							<div><%=rlist.get(i).getInfo()%></div>
							<div class="text-right">
								<%
									for (int j = 0; j < 5; j++) {
												if (j < rlist.get(i).getPoint()) {
								%>
								★
								<%
									} else {
								%>
								☆
								<%
									}
											}
								%>
							</div>
							<%
								if (m != null) {
							%>
							<%
								if (m.getUSER_ID().equals(rlist.get(i).getUserId())) {
							%>
							<div class="text-right">
								<a href="#" class="" style="" onclick="UpdateReview();">수정</a> <a href="#" class=""
									style="color: red;" onclick="DeleteReview();">삭제</a>
								<form action="/GoSangEun/ReviewUpdate.s" method="get" name="rUpdate">
									<input type="hidden" name="No" value="<%=rlist.get(i).getNo()%>"> <input
										type="hidden" name="shopId" value="<%=s.getShopId()%>">
									<input type="hidden" name="Info"> <input type="hidden" name="Point">
								</form>
								<form action="/GoSangEun/ReviewDelete.s" method="get" name="rDelete">
									<input type="hidden" name="No" value="<%=rlist.get(i).getNo()%>"> <input
										type="hidden" name="shopId" value="<%=s.getShopId()%>">
								</form>

								<script>
									function UpdateReview() {
										var info = prompt('수정할 리뷰내용을 입력해주세요.',
											'이곳에 입력해주세요');
										var point = prompt('별점의 개수를 입력해주세요',
											'0~5개 사이');

										if (info != null && point != null) {
											$('input[name=Info]').val(info);
											$('input[name=Point]').val(point);

											if (point >= 0 && point <= 5) {
												$('form[name=rUpdate]')
													.submit();
											} else {
												alert('별점을 0~5사이로 입력해주세요');
											}
										}
									};

									function DeleteReview() {
										$('form[name=rDelete]').submit();
									};

								</script>

							</div>
							<%
								}
										}
							%>
						</div>

						<%
							}
							}
						%>
					</div>

				</div>
				<%
					if (m != null) {
				%>
				<div class="text-right" style="font-size: 25px;">
					<a href="#" class="" style="" onclick="CreateReview();">리뷰 작성</a>
					<form action="/GoSangEun/Review.s" method="get" name="review">
						<input type="hidden" name="shopId" value="<%=s.getShopId()%>">
						<input type="hidden" name="Info"> <input type="hidden" name="userId"
							value="<%=m.getUSER_ID()%>"> <input type="hidden" name="userName"
							value="<%=m.getUSER_NICKNAME()%>">
						<input type="hidden" name="Point">
					</form>
				</div>

				<script>
					function CreateReview() {
						var info = prompt('리뷰내용을 입력해주세요.', '이곳에 입력해주세요.');
						var point = prompt('별점의 개수를 입력해주세요', '0~5개 사이');

						if (info != null && point != null) {
							$('input[name=Info]').val(info);
							$('input[name=Point]').val(point);

							if (point >= 0 && point <= 5) {
								$('form[name=review]').submit();
							} else {
								alert('별점을 0~5사이로 입력해주세요');
							}
						}
					}

				</script>

				<%
					}
				%>

			</div>
		</div>
		<!-- /.row -->

		<!-- Team Members -->
		<h2>
			메뉴 <small>인기/추천 메뉴</small>
		</h2>


		<div class="row">

			<%
				// 메인 메뉴 3종
				int num = 0;
				if (0 < list.size()) {
					for (int i = 0; i < 3; i++) {
			%>
			<div class="col-lg-4 mb-4">
				<div class="card h-100 text-center">
					<img class="card-img-top" src="resources/images/FoodMenu/<%=list.get(num).getCode()%>.jpg" alt=""
						height="250px;">
					<div class="card-body">
						<h4 class="card-title"><%=list.get(num).getName()%></h4>
						<h6 class="card-subtitle mb-2 text-muted"><%=list.get(num).getPrice()%>원
						</h6>
						<p class="card-text">
							<%
								if (list.get(num).getInfo() == null) {
							%>
							<%
								} else {
							%>
							<%=list.get(num).getInfo()%>
							<%
								}
							%>
						</p>
					</div>
					<div class="card-footer">
						<form action="/GoSangEun/Order.s" method="get" onsubmit="return OrderCount();" name="addOrder">
							<input type="hidden" name="shopId" value="<%=s.getShopId()%>">
							<%
								if (m != null) {
							%>
							<input type="hidden" name="userId" value="<%=m.getUSER_ID()%>">
							<%
								}
							%>
							<input type="hidden" name="menuNo" value="<%=list.get(num).getNo()%>"> <input type="hidden"	name="oCount"> 
							<input type="hidden" name="oSum" value="<%=list.get(num).getPrice()%>">
							<input type="submit" value="구매하기"
								style="font-size: 20px; background: none; padding: 0; border: none; color: rgb(0, 132, 255);">
						</form>
					</div>
				</div>
			</div>

			<%
				num++;
					}
				}
			%>

			<script>
				// 구매하기 버튼 스크립트
				function OrderCount() {
					var Count = parseInt(prompt('몇개를 주문할까요?',
						'숫자만 입력해주세요. (1개 이상)'));

					if (Count > 0) {
						$('input[name=oCount]').val(Count);
						return true;
					} else {
						alert("1이상의 숫자만 입력해주세요!");
						return false;
					}
				};

			</script>

		</div>
		<!-- /.row -->

		<!-- Our Customers -->
		<h4>모든 메뉴</h4>
		<div class="row">
			<%
				int num2 = 0;
				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="col-lg-2">
				<div class="card text-center h-100">
					<img class="img-thumbnail card-img-top" style="height: 120px;"
						src="resources/images/FoodMenu/<%=list.get(num2).getCode()%>.jpg" alt="">
					<div class="card-body">
						<h6 class="card-title">
							<%=list.get(num2).getName()%></h6>
						<h6 class="card-subtitle mb-2 text-muted"><%=list.get(num2).getPrice()%>원
						</h6>
					</div>
					<div class="card-footer">
						<form action="/GoSangEun/Order.s" method="get" onsubmit="return OrderCount();">
							<input type="hidden" name="shopId" value="<%=s.getShopId()%>">
							<% if ( m != null ) { %>
							<input type="hidden" name="userId" value="<%=m.getUSER_ID()%>">
							<% } %>
							<input type="hidden" name="menuNo" value="<%=list.get(num2).getNo()%>"> <input type="hidden"
								name="oCount"> <input type="hidden" name="oSum" value="<%=list.get(num2).getPrice()%>">
							<input type="submit" value="구매하기"
								style="font-size: 20px; background: none; padding: 0; border: none; color: rgb(0, 132, 255);">
						</form>
					</div>
				</div>
			</div>
			<%
				num2++;
				}
			%>
		</div>

	</div>
	<!-- /.row -->

	</div>
	<!-- /.container -->

	<br>


	<%@ include file="views/common/footer.jsp"%>
</body>

</html>
