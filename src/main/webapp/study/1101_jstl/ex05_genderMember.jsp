<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl5Res.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
	 <h3>성별 출력</h3>
	 <table class="table table-hover text-center">
	 	<tr class="table-dark text-dark">
	 		<th>성명</th>
	 		<th>나이</th>
	 		<th>성별</th>
	 		<th>직업</th>
	 		<th>주소</th>
	 	</tr>
	 	<c:forEach var="i" begin="0" end="${fn:length(vos)-1}" varStatus="st">
	 		<%-- <c:if test="${}"> --%>
		 		<tr>
		 			<td>${vos[i].name}</td>
		 			<td>${vos[i].age}</td>
		 			<td>${vos[i].gender}</td>
		 			<td>${vos[i].job}</td>
		 			<td>${vos[i].address}</td>
		 		</tr>
	 		<%-- </c:if> --%>
	 	</c:forEach>
	 	<tr><td colspan="5" class="m-0 p-0"></td></tr>
	 </table>
	 <hr/>
	<p><a href="${ctp}/study/1101_jstl/jstl5.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>