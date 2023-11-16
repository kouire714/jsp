<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>message.jsp</title>
	<jsp:include page="/includePractice/bs4.jsp"/>
	<script>
		'use strict';
		
		if("${msg}" != "NO") alert("${msg}");
		location.href = "${url}";
	</script>
</head>
<body>

</body>
</html>