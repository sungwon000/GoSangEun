<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 실패</title>
<style>
body{
 background-color: white;
}
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp"%>
	<br><br><br><br><br>
	
	<div align="center">
	<img src="resources/images/joinf.gif" style="width: 350px;">
	<br><br><br>
	<h3>회원가입 실패</h3>
	<h4>아이디 중복확인 해주세요</h4>
	
	
	<a href="join.jsp" class="btn btn-primary" style="width: 140px;"button">회원가입 페이지</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp" class="btn btn-primary" style="width: 140px;"button">메인 페이지</a>
	</div>
	<br><br><br><br>

	<%@ include file="views/common/footer.jsp"%>
</body>
</html>