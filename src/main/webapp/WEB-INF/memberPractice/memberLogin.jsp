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
  	    <td colspan="2" class="text-center"><h2>ȸ�� �α���</h2></td>
  	  </tr>
  	  <tr>
  	    <th>���̵�</th>
  	    <td><input type="text" name="mid" id="mid" value="${mid}" class="form-control" autofocus required /></td>
  	  </tr>
  	  <tr>
  	    <th>��й�ȣ</th>
  	    <td><input type="password" name="pwd" id="pwd" value="1234" class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2" class="text-center">
  	      <input type="submit" value="�α���" class="btn btn-success mr-2" />
  	      <input type="reset" value="�ٽ��Է�" class="btn btn-warning mr-2" />
  	      <input type="button" value="ȸ������" onclick="location.href='memberJoin.pMem';" class="btn btn-info" />
  	    </td>
  	  </tr>
  	 </table>
  	 <table class="table table-borderless p-0">
  	 	<tr>
  	 		<td colspan="2" class="text-center">
  	 			<input type="checkbox" name="idSave" checked /> ���̵����� &nbsp;&nbsp;&nbsp;
  	 			<!-- [<a href="javascript:midSearch()">���̵�ã��</a>] -->
  	 			<!-- [<a href="javascript:pwdSearch()">��й�ȣã��</a>] -->
  	 		</td>
  	 	</tr>
  	 </table>
  	 </form>
	</div>
	<p><br/></p>
	<jsp:include page="/includePractice/footer.jsp" />
</body>
</html>