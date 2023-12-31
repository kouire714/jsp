<!-- 지시자 (디렉티브(directive)) : < % @ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test2.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	// 이곳은 자바스크립트 1줄 주석입니다.
    	/*
    		이곳은 자바스크립트 여러줄 주석입니다.
    	*/
    	<%-- 이곳은 JSP 주석입니다.(자바스크립트영역) --%>
    </script>
    <style>
    	/* 이곳은 스타일시트 (여러줄)주석입니다. */
    	<%-- 이곳은 JSP 주석입니다.(스타일시트영역) --%>
    </style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP 각종 주석</h2>
	<!-- 이곳은 HTML 주석입니다. -->
	<%-- 이곳은 JSP 주석입니다.(본문) --%>
	<%	// 스크립틀릿(scriptlet)
		// 이곳은 자바코드를 작성하는 곳입니다.
		System.out.println("이곳은 JSP파일안 입니다. ");
	
		out.println("브라우저에 출력됩니다.");
		out.println("<font size='5'><b>안녕하세요</b></font>");
		out.println("<script>");
		out.println("alert('반갑습니다.!!!')");                                                                                                                           
		out.println("</script>");
	%>
	<hr/>
	<div>본문이 계속 됩니다.</div>
	<%
		int tot = 0;
	%>
	<h3>1~100까지의 합</h3>
	<%
		for(int i=1; i<=100; i++) {
			tot += i;
		}
		out.println("1~100까지의 합은? "+tot+" 입니다. ");
	%>
	<hr/>
	<div>1~100까지의 합은? <%=tot %> 입니다.</div> <!--  < % = 표현식(expression) -->
	<hr/>
</div>
<p><br/></p>
</body>
</html>