<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String gMid = request.getParameter("name");
	String gPwd = request.getParameter("password");

	String cMid = "";
	String cPwd = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cMid")) {
			cMid = cookies[i].getValue();
		}
		else if(cookies[i].getName().equals("cPwd")) {
			cPwd = cookies[i].getValue();
		}
	}
%>
<script>
<% if(gMid.equals(cMid) && gPwd.equals(cPwd)) { %>
		alert("로그인에 성공하였습니다!!");
		location.href="p1_Information.jsp?gMid=<%=cMid%>";
<% } %>
</script>
