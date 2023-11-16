<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<jsp:include page="/includePractice/bs4.jsp"/>
</head>
<script>
	'use strict'

	function sendCheck() {
		opener.window.document.myform.nickName.value = '${nickName}';
		opener.window.document.myform.name.focus();
		window.close();
	}
	
	function nickNameCheck() {
		let nickName = childForm.nickName.value;
		
		if(nickName.trim() == "") {
			alert("닉네임을 입력하세요");
			childForm.nickName.focus();
		}
		else {
			childForm.submit();
		}
	}
	
</script>
<body>
	<jsp:include page="/includePractice/header.jsp" />
	<p><br/></p>
	<div class="container">
	<h3>닉네임 체크폼</h3>
	<c:if test="${res == 1}">
		<h4><font color="blue"><b>${nickName}</b></font>닉네임은 사용 가능합니다.</h4>
		<p><input type="button" value="창닫기" onclick="sendCheck()"/></p>
	</c:if>
	<c:if test="${res != 1}">
		<h4><font color="blue"><b>${nickName}</b></font>닉네임은 이미 사용중인 아이디입니다.</h4>
		<form name="childForm" method="post" action="memberNickCheck.pMem">
			<p>
				<input type="text" name="nickName" />
				<input type="button" value="닉네임재검색" onclick="nickNameCheck()"/>
			</p>
		</form>
	</c:if>
	</div>
	<p><br/></p>
	<jsp:include page="/includePractice/footer.jsp" />
</body>
</html>