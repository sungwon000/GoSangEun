<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
.box {
	background: white;
	width: 300px;
	margin: 0 auto 0 auto;
	padding: 0px 20px 10px 50px;
	border: black 1px solid;
}

header.form_header {
	text-align: center;
	background-color: #363f48;
	color: #FFF;
	margin-left: -15px;
	margin-right: -15px;
	padding: 15px 5px;
	border-bottom: 1px solid #C7C4C4;
	border-radius: 2px 2px 0 0;
}

#signup_wrapper {
	margin-left: 30px;
	margin-top: 100px;
	margin-bottom: 30px;
	background: white;
	box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
}
/* 오른쪽 박스 */
main.cf.my_account {
	margin-top: 100px;
	margin-left: 70px;
	background: white;
	padding: 26px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
}

.page-template-page-login .blog-main-content {
	padding: 100px 0;
}

.blog-main-content {
	background: #fafafa;
	height: 720px;
}

.col-md-5 {
	-ms-flex: 0 0 41.666667% !important;
	flex: 0 0 41.666667% !important;
	max-width: 41.666667% !important;
	height: 430px;
}
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp"%>
	<br>
	<div id="pjax-container">
		<div class="blog-main-content">
			<div class="container">
				<div class="row">
					<div id="signup_wrapper" class="col-md-5 col-md-offset-1">
						<header class="form_header">
							<h3>Login</h3>
						</header>
						<div id="signup_box">
							<div class="text-center"></div>
							<br />
							<form id="login_form" method="post" action="login.do">
								<input type="hidden" name="nonce" value="69b8631805"> <input
									type="hidden" name="redirect" value="">
								<div class="form-group">
									<label for="id">ID *</label> <input placeholder="ID"
										type="text" required class="form-control" name="USER_ID"
										value="" />
								</div>
								<div class="form-group">
									<label for="first_name">Password *</label> <input required
										type="password" placeholder="Password" class="form-control"
										name="USER_PASSWORD" value="" />
								</div>
								<div class="form-group login-link">
									<a href="lostId.jsp">아이디 찾기</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="lostPwd.jsp">비밀번호
										찾기</a>
								</div>
								<div class="form-group text-center">
									<input id="login_submit" type="submit" value="Login"
										onclick="return checkz()"
										class="btn btn-success btn-lg btn-block" />
								</div>
								<div class="form-group text-center">
									<input id="unlogin_submit" type="submit" value="비회원주문"
										onclick="location.href='noMcart.go'"
										class="btn btn-success btn-lg btn-block" />
								</div>
								<div class="form-group login-link">
									<p>
										아직 회원이 아니신가요? <a href="join.jsp">회원 가입 하기 &rarr;</a>
								</div>
							</form>
						</div>
					</div>
					
					<main class="cf my_account col-md-5 col-md-offset-1">
					<article class="full-width">
						<h1 class="offer_page_header" float="center">회원 가입 특전</h1>

						<ul class="account_features">
							<li>배달 주소 저장</li>
							<li>내 주문 내역 확인</li>
							<li>별점 등록 가능</li>
							<li>즐겨찾는 식당 등록</li>
							<li>다양한 혜택이 있습니다</li>
							<li>무료로 가입 가능합니다</li>
							<li>NOW 가입 NO 후회</li>
						</ul>
					</article>
					</main>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function checkz() {
		//아이디 공백 확인
		if ($("#USER_ID").val() == "") {
			swal("아이디가 없어요!","아이디를 입력 해주세요");
			$("#USER_ID").focus();
			return false;
		}
		//비밀번호 공백 확인
		if ($("#USER_PASSWORD").val() == "") {
			swal("비밀번호가 없어요!","비밀번호를 입력 해주세요");
			$("#USER_PASSWORD").focus();
			return false;
		}
	}
	</script>


	<%@ include file="views/common/footer.jsp"%>
</body>
</html>