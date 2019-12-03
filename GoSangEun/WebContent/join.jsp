<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

/* 배경 */
body {
	background-color: #F8EFFB !important;
}

/* 회원가입 박스 */
div.row {
	background-color: white !important;
}
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mb-4">
				<div id="signup_wrapper">
					<br> <br> <br>
					<h3>회원가입</h3>
					<h6 style="text-align: right;">*표는 꼭 기입해주세요</h6>

					<form action="join.do" name="join" id="contactForm" method="post">
						<div class="control-group form-group">
							<div class="controls">
								<label>이름*</label> <input type="text" class="form-control"
									name="USER_NAME" id="USER_NAME">
								<div class="alert alert-danger" id="name-danger">이름을 정확히
									입력해주세요</div>
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>ID*</label>
								<div style="display: flex;">
									<input type="text" class="form-control" name="USER_ID"
										id="USER_ID" style="width: 87%">&nbsp;&nbsp;&nbsp; <input
										type="button" name="confirm_id" value="중복확인"
										class="btn btn-primary" onclick="openConfirmid(this.form)"
										style="border-radius: 4px; border: 1px solid;" />
								</div>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>닉네임*</label>
								<div style="display: flex;">
									<input type="text" class="form-control" name="USER_NICKNAME"
										id="USER_NICKNAME" style="width: 87%">&nbsp;&nbsp;&nbsp;
									<input type="button" name="confirm_nickname" value="중복확인"
										class="btn btn-primary" onclick="openConfirmnickname(this.form)"
										style="border-radius: 4px; border: 1px solid;" />
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>비밀번호*</label> <input type="password" id="pwd1"
										class="form-control" name="USER_PASSWORD" id="USER_PASSWORD">
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>비밀번호 확인*</label> <input type="password" id="pwd2"
										class="form-control" name="USER_PASSWORDENT">
									<div class="alert alert-success" id="alert-success">비밀번호가
										일치합니다.</div>
									<div class="alert alert-danger" id="alert-danger">비밀번호가
										일치하지 않습니다.</div>
									<p class="help-block"></p>
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>전화번호*</label> <input type="tel" class="form-control"
										name="USER_PHONE" id="USER_PHONE">
									<div class="alert alert-danger" id="phone-danger">010-0000-0000
										형식으로 입력해주세요</div>
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>이메일*</label> <input type="email" class="form-control"
										name="USER_EMAIL" id="USER_EMAIL">
									<div class="alert alert-danger" id="email-danger">000@000.000
										형식으로 입력해주세요</div>

								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>주소*</label> <input type="text" class="form-control"
										name="USER_ADDRESS" id="USER_ADDRESS">
								</div>
							</div>

							<div id="success" align="center">
								<input type="submit" id="submit" class="btn btn-primary"
									onclick="return checkz()" style="width: 140px;" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="index.jsp" class="btn btn-primary"
									style="width: 140px;">비회원주문</a>
							</div>
					</form>

					<script type="text/javascript">
						$(function() {

							$("#name-danger").hide();
							$("#phone-danger").hide();
							$("#email-danger").hide();

							// 비밀번호 확인
							$("#alert-success").hide();
							$("#alert-danger").hide();
							$("input").keyup(
									function() {
										var pwd1 = $("#pwd1").val();
										var pwd2 = $("#pwd2").val();
										if (pwd1 != "" || pwd2 != "") {
											if (pwd1 == pwd2) {
												$("#alert-success").show();
												$("#alert-danger").hide();
												$("#submit").removeAttr(
														"disabled");
											} else {
												$("#alert-success").hide();
												$("#alert-danger").show();
												$("#submit").attr("disabled",
														"disabled");
											}
										}
									});
						});

						// 로그인 유효성 검사
						function checkz() {
							var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
							var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
							var getName = RegExp(/^[가-힣]+$/);
							var getPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
							var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정

							//이름 공백 확인
							if ($("#USER_NAME").val() == "") {
								swal("이름이 없어요!", "이름을 입력 해주세요");
								$("#USER_NAME").focus();
								return false;
							}
							//아이디 공백 확인
							if ($("#USER_ID").val() == "") {
								swal("아이디가 없어요!", "아이디를 입력 해주세요");
								$("#USER_ID").focus();
								return false;
							}
							//닉네임 공백 확인
							if ($("#USER_NICKNAME").val() == "") {
								swal("닉네임이 없어요!", "닉네임을 입력 해주세요");
								$("#USER_NICKNAME").focus();
								return false;
							}
							//전화번호 공백 확인
							if ($("#USER_PHONE").val() == "") {
								swal("전화번호가 없어요!", "전화번호를 입력 해주세요");
								$("#USER_PHONE").focus();
								return false;
							}
							//주소 공백 확인
							if ($("#USER_ADDRESS").val() == "") {
								swal("주소가 없어요!", "주소를 입력 해주세요");
								$("#USER_ADDRESS").focus();
								return false;
							}

							//이메일 유효성 검사
							if (!getMail.test($("#USER_EMAIL").val())) {
								swal("이메일 에러", "형식에 맞게 입력 해주세요");
								$("#USER_EMAIL").val("");
								$("#USER_EMAIL").focus();
								return false;
							}

							//이름 유효성
							if (!getName.test($("#USER_NAME").val())) {
								swal("이름 에러", "한글로 2글자 이상 넣어주세요");
								$("#USER_NAME").val("");
								$("#USER_NAME").focus();
								return false;
							}

							//전화번호 유효성
							if (!getPhone.test($("#USER_PHONE").val())) {
								swal("전화번호 에러", "010으로 시작해주세요");
								$("#USER_PHONE").val("");
								$("#USER_PHONE").focus();
								return false;
							}

						}

						function openConfirmid(join) {

							if (join.USER_ID.value == "") {
								swal("아이디가 없어요", "아이디를 입력해주세요");
								return;
							}
							// ID 전송
							url = "confirmid.jsp?USER_ID=" + join.USER_ID.value;

							// 윈도우 창 생성
							open(url, "confirm",
									"status=no,menubar=no,scrollbars=no,width=310,height=180,left=869,top=294");
						}
						
						function openConfirmnickname(join) {

							if (join.USER_NICKNAME.value == "") {
								swal("닉네임이 없어요", "닉네임을 입력해주세요");
								return;
							}
							// ID 전송
							url = "confirmnickname.jsp?USER_NICKNAME=" + join.USER_NICKNAME.value;

							// 윈도우 창 생성
							open(url, "confirm",
									"status=no,menubar=no,scrollbars=no,width=310,height=180,left=869,top=294");
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="views/common/footer.jsp"%>
</body>
</html>