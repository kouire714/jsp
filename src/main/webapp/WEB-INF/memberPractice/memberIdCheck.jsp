<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberIdCheck.jsp</title>
	<jsp:include page="/includePractice/bs4.jsp"/>
	<script>
		'use strict';
		
		function sendCheck() {
			opener.window.document.myform.mid.value = '${mid}';
			opener.window.document.myform.pwd.focus();
			window.close();
		}
		
		function idCheck() {
			let mid = childForm.mid.value;
			
			if(mid.trim() == "") {
				alert("���̵� �Է��ϼ���");
				childForm.mid.focus();
			}
			else {
				childForm.submit();
			}
		}
		
	</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
	<h3>���̵� üũ��</h3>
	<c:if test="${res == 1}">
		<h4><font color="blue"><b>${mid}</b></font>���̵�� ��� �����մϴ�.</h4>
		<p><input type="button" value="â�ݱ�" onclick="sendCheck()"/></p>
	</c:if>
	<c:if test="${res != 1}">
	<h4><font color="blue"><b>${mid}</b></font>���̵�� �̹� ������� ���̵��Դϴ�.</h4>
	<form name="childForm" method="post" action="memberIdCheck.pMem">
		<p>
			<input type="text" name="mid"/>
			<input type="button" value="���̵���˻�" onclick="idCheck()"/>
		</p>
	</form>
	</c:if>
	</div>
	<p><br/></p>
</body>
</html>