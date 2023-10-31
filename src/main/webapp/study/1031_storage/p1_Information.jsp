<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원 정보 확인</h2>
<%
	String gMid = request.getParameter("gMid");
	
	Cookie[] cookies = request.getCookies();
	
	for(int i=0; i<cookies.length; i++)
		if(cookies[i].getValue().equals(gMid))
		out.println("아이디 : " + cookies[i].getValue());
%>
</div>
<p><br/></p>
</body>
</html>