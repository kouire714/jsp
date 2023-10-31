<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>p1_MemberShip.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	function MemberShipCheck() {
		myform.submit();
	}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" action="p1_MemberShipCheck.jsp">
		<p>성명 : <input type="text" name="name" autofocus /></p>
		<p>비밀번호 : <input type="password" name="password" /></p>
		<input type="button" onclick="MemberShipCheck()" value="가입하기"  />
	</form>
</div>
<p><br/></p>
</body>
</html>