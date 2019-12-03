<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<style>
body{
 background-color: #eae9e8 !important;
}
</style>
</head>
<body>
	<%@ include file="views/common/header.jsp"%>
	<br><br><br><br><br>
	
	<div align="center">
	<img src="resources/images/404.gif" style="width: 500px;">
	<br><br><br>
	<h3>로그인 실패</h3>
	<h4>아이디와 비밀번호를 확인하세요</h4>
	
	
	<a href="login.jsp" class="btn btn-primary" style="width: 140px;"button">로그인 페이지</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="index.jsp" class="btn btn-primary" style="width: 140px;"button">메인 페이지</a>
	</div>
	<br><br><br><br>

	<%@ include file="views/common/footer.jsp"%>
</body>
</html>