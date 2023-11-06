<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/includePractice/bs4.jsp"/>
</head>
<body>
<jsp:include page="/includePractice/header.jsp" />
<p><br/></p>
<div class="container">
	<h2>게 시 글 작 성 하 기</h2>
</div>
<p><br/></p>
<jsp:include page="/includePractice/footer.jsp" />
</body>
</html>