<%@ page import="model.dao.MemberDao"%>

<title>NICKNAME 중복 확인</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
   String nick = request.getParameter("USER_NICKNAME");
   MemberDao dao = new MemberDao();
   int check = dao.confirmnickname(nick);

   if (check == 1) {
%>
<br>
<br>
<center>
	<b><font color="red"><%=nick%></font>는 이미 사용중인 닉네임 입니다</b>
	<form name="checkForm" method="post" action="confirmnickname.jsp">
		<b>다른 닉네임을 선택하세요</b><br> <br> 
		<input type="button" value="닫기" onclick="setnickname()">
	</form>
</center>
<%
   } else {
%>
<br>
<br>
<center>
	<b>입력하신 <font color="red"><%=nick%></font>는<br> 사용하실수 있는 닉네임 입니다
	</b><br> <br> <input type="button" value="닫기" onclick="setnickname()">
</center>
<%
   }
%>

<script language="javascript">
   function setnickname() {
      opener.document.join.USER_NICKNAME.value="<%=nick%>";
      self.close();
   }
</script>