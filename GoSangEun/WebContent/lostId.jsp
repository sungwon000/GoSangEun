<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String id = "";

id = (String)session.getAttribute("id"); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	margin-left: 10px;
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
	height: 700px;
}

.col-md-5 {
	-ms-flex: 0 0 41.666667% !important;
	flex: 0 0 41.666667% !important;
	max-width: 41.666667% !important;
	height: 420px;
}
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp"%>
	<div id="pjax-container">
		<div class="blog-main-content">
			<div class="container">
				<div class="row">
					<div id="signup_wrapper" class="col-md-5 col-md-offset-1">
						<header class="form_header">
							<h3>ID 찾기</h3>
						</header>
						<div id="signup_box">
							<div class="text-center"></div>
							<br />
							<form id="login_form" method="post" action="lostid.do" onsubmit="return lostid()">
								<input type="hidden" name="nonce" value="69b8631805"> <input
									type="hidden" name="redirect" value="">
								<div class="form-group">
									<label for="name">이름 *</label> <input placeholder="NAME"
										type="text" required class="form-control" name="USER_NAME"
										id="USER_NAME"
										value="" />
								</div>
								<div class="form-group">
									<label for="phone">전화번호 *</label> <input required type="text"
										placeholder="PHONE" class="form-control" name="USER_PHONE"
										id="USER_PHONE"
										value="" />
								</div>
								<div class="form-group text-center">
									<input id="lostId" type="submit" value="ID찾기" 
										class="btn btn-success btn-lg btn-block" />
								</div>
								<div class="form-group text-center">
									<input value="비밀번호 찾기"
										onclick="location.href='lostPwd.jsp'"
										class="btn btn-success btn-lg btn-block" />
								</div>
							</form>
						</div>
					</div>
					<main class="cf my_account col-md-5 col-md-offset-1">
					<article class="full-width">
						<h1 class="offer_page_header" float="center">아이디 뭐였지?</h1>

						<ul class="account_features">
							<li>아이디는</li>
							<li>늘 쓰던거 쓰고 싶어도</li>
							<li>영문자, 숫자, 특수문자</li>
							<li>섞어 쓰라고 해서 헷갈리죠?</li>
							<li>비밀번호도 다 다르게 하라고 하고..</li>
							<li>저도 짜증납니다</li>
						</ul>
					</article>
					</main>
				</div>
			</div>
		</div>
	</div>
	<script>

	function lostid() {
		var result = confirm("ID는 (<%=id%>) 입니다!!!");
        
        if(result)
        {
        	alert("로그인 화면으로 갑니다");
        }
        else
        {
        	alert("다시 확인하고 싶어요!!");
        }
	} 
	</script>
	<%@ include file="views/common/footer.jsp"%>
</body>
</html>