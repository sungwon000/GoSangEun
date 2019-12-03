<%@page import="java.util.ArrayList"%>
<%@page import="model.vo.ShopOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.vo.Member"%>
<%
	Member m = (Member) session.getAttribute("member");
	ArrayList<ShopOrder> olist = (ArrayList<ShopOrder>) session.getAttribute("ShopOrder");
	ArrayList<ShopOrder> nlist = (ArrayList<ShopOrder>) session.getAttribute("NonShopOrder");
%>
<!DOCTYPE html>
<html>

<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap core CSS -->
<link href="resources/vendor/src/ihover.css" rel="stylesheet">

<script src="resources/js/bootstrap.bundle.min.js"></script>

<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- CSS font -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- favicon erroe -->
<link rel="shortcut icon" href="/path/to/icons/favicon.ico">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">

<style>
*, a, h1 {
	font-family: 'Sunflower';
}
</style>

</head>

<body>
	<!-- Navigation -->
	<script>
		function deleteOrderMenu() {
			var returnURL = document.URL;
			$('input[name="reURI"]').val(returnURL);
			$(this).submit();
		}
	</script>

	<%
		if (m == null) {
	%>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> <img
				src="resources/images/logo.gif" alt="logo" style="width: 120px;">
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active dropdown">
					<% if (nlist == null) { %>
					<a class="nav-link dropdown-toggle" href="MyPage.jsp" id="navbarDropdownBlog2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 장바구니 </a>
					<% } else { %>
					<a class="nav-link dropdown-toggle" href="MyPage.jsp" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 장바구니 </a> <!-- servlet으로 이동 -->
					<% } %>
						<form action="/GoSangEun/NonSelect.s" method="get" id="selectNonOrder">
						</form>
						<script>
							$('#navbarDropdownBlog2').one("mouseenter",function(){
								var result = confirm('과거에 방문한 적이 있나요?');
								
								if(result){
									alert('과거 구매하지 않은 기록을 불러옵니다.');
									$('#selectNonOrder').submit();
								}else{
									
								}
							});
						</script>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio"
							style="width: 220px; height: auto;">
							<div class="dropdown-item-text" style="font-size: 18px;">장바구니
								목록</div>
							<%
								int ntotal = 0;
							if( nlist != null ) {
									for (int i = 0; i < nlist.size(); i++) {
							%>
							<form action="/GoSangEun/OrderDelete.s" method="get"
								name="deleteOrder" id="DeleteOrder<%=i%>">
								<div class="card">
									<div style="font-size: 20px;"><%=nlist.get(i).getMenuName()%></div>
									<div class="text-right" style="font-size: 20px;">
										<%=nlist.get(i).getOrderCount()%>개 : &nbsp;&nbsp;<%=nlist.get(i).getOrderSum() / nlist.get(i).getOrderCount()%>원
									</div>
									<div class="text-right">
										<input type="submit" value="취소" style="color: red; padding: 0; border: none; background: none;" onclick="deleteOrderMenu();">
									</div>
										<input type="hidden" name="orderNo" value="<%=nlist.get(i).getOrderId()%>"> 
										<input type="hidden" name="reURI">
							</form>
							
						</div> <% ntotal += nlist.get(i).getOrderSum(); %> 
						<% 	} } %>
						<hr>
						<div class="card" style="color: red;">
							<div style="font-size: 20px;">총 금액</div>
							<div class="text-right" style="font-size: 35px;"><%=ntotal%>원
							</div>
						</div> 
						<% if ( ntotal != 0 ) { %>
						<a class="dropdown-item;" href="login.jsp" style="font-size: 20px; float: right; margin-right: 10px;">구매하기</a>
						<% } %>
				</div>
			</li>

					<li class="nav-item"><a class="nav-link dropdown-toggle"
						href="login.jsp" style="color: #fff;">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
		} else {
	%>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> <img
				src="resources/images/logo.gif" alt="logo" style="width: 120px;">
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active dropdown"><a
						class="nav-link dropdown-toggle" href="MyPage.jsp"
						id="navbarDropdownBlog" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 장바구니 </a> <!-- servlet으로 이동 -->
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio"
							style="width: 220px; height: auto;">
							<div class="dropdown-item-text" style="font-size: 18px;">장바구니
								목록</div>
							<%
								int total = 0;
									for (int i = 0; i < olist.size(); i++) {
							%>
							<form action="/GoSangEun/OrderDelete.s" method="get"
								name="deleteOrder" id="DeleteOrder<%=i%>">
								<div class="card">
									<div style="font-size: 20px;"><%=olist.get(i).getMenuName()%></div>
									<div class="text-right" style="font-size: 20px;">
										<%=olist.get(i).getOrderCount()%>개 : &nbsp;&nbsp;<%=olist.get(i).getOrderSum() / olist.get(i).getOrderCount()%>원
									</div>
									<div class="text-right">
										<input type="submit" value="취소"
											style="color: red; padding: 0; border: none; background: none;"
											onclick="deleteOrderMenu();">
									</div>
									<input type="hidden" name="orderNo"
										value="<%=olist.get(i).getOrderId()%>"> <input
										type="hidden" name="reURI"> <input type="hidden"
										name="USER_ID" value="<%=m.getUSER_ID()%>">
							</form>
						</div> <% total += olist.get(i).getOrderSum(); %> 
						<% 	} %>
						<hr>
						<div class="card" style="color: red;">
							<div style="font-size: 20px;">총 금액</div>
							<div class="text-right" style="font-size: 35px;"><%=total%>원
							</div>
						</div> 
						<% if ( total != 0 ) { %>
						<a class="dropdown-item;" href="sCart.go" style="font-size: 20px; float: right; margin-right: 10px;">구매하기</a>
						<% } %>
			</div>
			</li>
			<li class="nav-item active dropdown"><a
				class="nav-link dropdown-toggle" href="MyPage.jsp"
				id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <img style="width: 25px; height: 25px;"
					src="resources/images/Rank/<%=m.getRANK()%>.png" alt=""><%=m.getUSER_NICKNAME()%>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="navbarDropdownBlog">
					<a class="dropdown-item" href="MyPage.jsp">나의 정보</a> <a
						class="dropdown-item" href="MyPage.jsp">주문 확인</a> <a
						class="dropdown-item" onclick='logout()'>로그아웃</a>
				</div></li>
			</ul>
		</div>
		</div>
	</nav>
	<%
		}
	%>

	<script>
		function logout() {
			location.href = "/GoSangEun/logout.me";
		}
	</script>
</body>

</html>
