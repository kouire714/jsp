<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test13Logout.jsp -->
<%
	String name = request.getParameter("name");
	/* 꺼내서 저장 */
	pageContext.setAttribute("name", name);
%>

<script>
	alert("${name}님 로그아웃 되었습니다.(MVC)");
	<%-- 현위치 기반이므로 <%=request.getContextPath()%>/study/1026/ 생략 --%>
	/* location.href = "test13.jsp" */
	<%-- location.href = "<%=request.getContextPath()%>/study/1026/test13.jsp" --%>
	/* el표기법(현재 페이지에 있는 저장소) */
	// 동일한 위치선상에 있으므로 ${pageContext.request.contextPath}/study/1026/ 생략가능
	// location.href = "${pageContext.request.contextPath}/study/1026/test13.jsp";
	location.href = "test13.jsp";
</script>