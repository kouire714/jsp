<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	String age = request.getParameter("age")==null ? "" : request.getParameter("age");
	
	// Server에 저장 (브라우저에 보이지 않음)
	// 저장소에 담기
	// Application은 서버가 기동해서 닫힐때 까지
	// Session은 브라우저가 꺼질때 까지
	// pageContext 페이지를 사용하는 동안은 유지됨
	pageContext.setAttribute("name", name);
	// request는 보내주는것으로 끝
	request.setAttribute("age", age);
	// Client에 저장
	// Cookies는 생성주기를 지정
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t3Ok.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>처리된 자료를 View에 출력시켜보자</h2>
	<table class="table table-borderd">
		<tr>
			<th>성명</th>
			<td><%=name %>/${name}</td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=age %>/${age}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td></td>
		</tr>
		<tr>
			<th>취미</th>
			<td></td>
		</tr>
		<tr>
			<th>직업</th>
			<td></td>
		</tr>
		<tr>
			<th>주소</th>
			<td></td>
		</tr>
	</table>
	<p><a href="t3.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>