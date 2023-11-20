<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  	'use strict';
  	
  	function partCheck() {
  		let part = $("#part").val();
  		location.href = 'pdsList.pds?part='+part;
  	}
  	
  	function pdsDeleteCheck(idx, fSName) {
  		let ans = confirm("선택된 자료파일을 삭제하시겠습니까?");
  		if(!ans) return false;
  		
  		let pwd = prompt("비밀번호를 입력하세요.");
  		let query = {
  				idx	: idx,
  				fSName	: fSName,
  				pwd	: pwd
  		}
  		
    	$.ajax({
    		url  : "pdsDeleteOk.pds",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("삭제 되었습니다.");
    				location.reload();
    			}
    			else alert("삭제 실패~~~");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
  	}
  	
  	// 다운로드수 증가시키기
  	function downNumCheck(idx) {
  		$.ajax({
  			url : "pdsDownNumCheck.pds",
  			type : "post",
  			data : {idx : idx},
  			success : function() {
  				location.reload();
  			},
  			error : function() {
  				alert("전송오류!");
  			}
  		})
  	}
  	
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = 'pdsList.pds?pag=${pag}&pageSize='+pageSize;
    }
  	
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 료 실 리 스 트(${part})</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td style="width:20%" class="text-left">
      	<form name="partForm">
      	  <select name="part" id="part" onchange="partCheck()" class="form-control">
      	    <option ${part=="전체" ? "selected" : ""}>전체</option>
      	    <option ${part=="학습" ? "selected" : ""}>학습</option>
      	    <option ${part=="여행" ? "selected" : ""}>여행</option>
      	    <option ${part=="음식" ? "selected" : ""}>음식</option>
      	    <option ${part=="기타" ? "selected" : ""}>기타</option>
      	  </select>
      	</form>
      </td>
      <td class="text-right">
        <a href="pdsInput.pds?part=${part}" class="btn btn-success">자료올리기</a>
      </td>
    </tr>
  </table>
  <table class="table table-borderless m-0 p-0">
  	<tr>
  	  <td>
  	    <select name="pageSize" id="pageSize" onchange="pageCheck()">
  	      <option <c:if test="${pageSize == 2}">selected</c:if>>2</option>
  	      <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
  	      <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
  	      <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
  	    </select> 건
  	  </td>
		  <!-- 페이지처리 시작(이전/다음) -->
  	  <td class="text-right">
  	    <c:if test="${pag > 1}">
  	    	<a href="pdsList.pds?pag=1&pageSize=${pageSize}" title="첫페이지">◁◁</a>
  	    	<a href="pdsList.pds?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>
  	    </c:if>
  	    ${pag}/${totPage}
  	    <c:if test="${pag < totPage}">
  	    	<a href="pdsList.pds?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>
  	    	<a href="pdsList.pds?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">▷▷</a>
  	    </c:if>
  	  </td>
  	  <!-- 페이지처리 끝(이전/다음) -->
  	</tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>자료제목</th>
      <th>올린이</th>
      <th>올린날짜</th>
      <th>분류</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${curScrStartNo}</td>
	      <td>${vo.title}</td>
	      <td>${vo.nickName}</td>
	      <td>${vo.fDate}</td>
	      <td>${vo.part}</td>
	      <td>
	      	<%-- ${vo.fName} --%>
	      	<c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
	      	<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
	      	<c:forEach var="fName" items="${fNames}" varStatus="st">
	      		<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br/>
	      	</c:forEach>
	      	<br/>
	      	(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0"/> kByte)
	      </td>
	      <td>${vo.downNum}</td>
	      <td>
	        <c:if test="${vo.mid == sMid || sLevel == 0}">
	          <a href="javascript:pdsDeleteCheck('${vo.idx}','${vo.fSName}')" class="btn btn-danger">삭제</a>
	        </c:if>
	      </tr>
    	<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    	<tr><td colspan="8" class="m-0 p-0"></td></tr>
    </c:forEach>
  </table>
  <div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="pdsList.pds?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
  	</c:forEach>
  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="pdsList.pds?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>