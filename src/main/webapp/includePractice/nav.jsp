<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
  pageContext.setAttribute("level", level);  
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="${ctp}/indexPractice.jsp">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/guestPractice/GuestList">Guest</a>
      </li>
      <c:if test="${level <= 4}">
	  <li class="nav-item ml-2 mr-2">
	  	<div class="dropdown">
	  	<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">MyPage</button>
	  		<div class="dropdown-menu">
	  			<a class="dropdown-item" href="memberMain.pMem">회원메인방</a>
	  			<c:if test="${sLevel == 0}"><a class="dropdown-item" href="adminMain.pAd">관리자메뉴</a></c:if>
			</div>
		</div>
	  </li>
	  </c:if>
      <li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/memberLogin.pMem">Login</a></c:if>
        <c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/memberLogout.pMem">Logout</a></c:if>
       </li>
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/memberJoin.pMem">Join</a>
      </li>    
    </ul>
  </div>  
</nav>