<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberLogin.jsp</title>
	<jsp:include page="/includePractice/bs4.jsp"/>
</head>
<body>
	<jsp:include page="/includePractice/header.jsp" />
	<p><br/></p>
	<div class="container">
	<form name="loginForm" method="post" action="memberLoginOk.pMem" >
  	<table class="table table-bordered m-0">
  	  <tr>
  	    <td colspan="2" class="text-center"><h2>회원 로그인</h2></td>
  	  </tr>
  	  <tr>
  	    <th>아이디</th>
  	    <td><input type="text" name="mid" id="mid" value="${mid}" class="form-control" autofocus required /></td>
  	  </tr>
  	  <tr>
  	    <th>비밀번호</th>
  	    <td><input type="password" name="pwd" id="pwd" value="1234" class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2" class="text-center">
  	      <input type="submit" value="로그인" class="btn btn-success mr-2" />
  	      <input type="reset" value="다시입력" class="btn btn-warning mr-2" />
  	      <input type="button" value="회원가입" onclick="location.href='memberJoin.pMem';" class="btn btn-info" />
  	    </td>
  	  </tr>
  	 </table>
  	 <table class="table table-borderless p-0">
  	 	<tr>
  	 		<td colspan="2" class="text-center">
  	 			<input type="checkbox" name="idSave" checked /> 아이디저장 &nbsp;&nbsp;&nbsp;
  	 			<!-- [<a href="javascript:midSearch()">아이디찾기</a>] -->
  	 			<!-- [<a href="javascript:pwdSearch()">비밀번호찾기</a>] -->
  	 		</td>
  	 	</tr>
  	 </table>
  	 </form>
	</div>
	<p><br/></p>
	<jsp:include page="/includePractice/footer.jsp" />
</body>
</html>