<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>p1_LoginMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
<%
	String cMid = "";
	// int cPwd = 0;
	String cPwd = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cMid")) {
			cMid = cookies[i].getValue();
		}
		else if(cookies[i].getName().equals("cPwd")) {
			// cPwd = Integer.parseInt(cookies[i].getValue());
			cPwd = cookies[i].getValue();
		}
	}
%>
	<script>
	
	function loginCheck() {
		myform.submit();
	}
	
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>로그인_쿠키</h2>
	<form name="myform" action="p1_LoginCheck.jsp">
		<p>성명 : <input type="text" name="name" value="<%=cMid%>" autofocus /></p>
		<p>비밀번호 : <input type="password" name="password" value="<%=cPwd%>" /></p>
		<p>
			<input type="button" onclick="location.href='p1_MemberShip.jsp';" value="회원가입"  />
			<input type="button" onclick="loginCheck()" value="로그인"  />
			<input type="button" value="로그아웃" />
		</p>
	</form>
</div>
<p><br/></p>
</body>
</html>