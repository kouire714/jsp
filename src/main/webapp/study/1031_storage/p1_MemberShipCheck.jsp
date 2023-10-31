<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("name");
	String pwd = request.getParameter("password");
	
	Cookie cookieMid = new Cookie("cMid", mid);
	cookieMid.setMaxAge(60*60*24);
	
	Cookie cookiePwd = new Cookie("cPwd", pwd);
	cookieMid.setMaxAge(60*60*24);
	
	response.addCookie(cookieMid);
	response.addCookie(cookiePwd);
%>
<script>
	alert("회원가입이 완료 되었습니다!!");
	location.href="p1_LoginMain.jsp";
</script>