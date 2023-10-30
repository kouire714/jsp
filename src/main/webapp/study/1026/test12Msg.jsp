<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test12Msg.jsp -->
<script>
	alert("회원 가입되셨습니다. \n회원 메인창으로 이동합니다.");
	location.href = "<%=request.getContextPath()%>/study/1026/test12Res.jsp";
</script>