<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberJoin.jsp</title>
	<jsp:include page="/includePractice/bs4.jsp"/>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>

  'use strict';

  let idCheckSw = 0;
  let nickCheckSw = 0;
  
  function fCheck() {
  	
  	let regMid = /^[a-zA-Z0-9_]{4,20}$/;
  	let regPwd = /(?=.*[0-9a-zA-Z]).{4,20}$/;
    let regNickName = /^[가-힣]+$/;
    let regName = /^[가-힣a-zA-Z]+$/;
    let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
  	let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
  	
  	let mid = myform.mid.value.trim();
  	let pwd = myform.pwd.value;
  	let nickName = myform.nickName.value;
  	let name = myform.name.value;
  	let email1 = myform.email1.value.trim();
  	let email2 = myform.email2.value;
  	let email = email1 + "@" + email2;
  	let homePage = myform.homePage.value;
  	let tel1 = myform.tel1.value;
  	let tel2 = myform.tel2.value.trim();
  	let tel3 = myform.tel3.value.trim();
  	let tel = tel1 + "-" + tel2 + "-" + tel3;
  	
  	let submitFlag = 0;
  	
  	if(!regMid.test(mid)) {
  		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
  		myform.mid.focus();
  		return false;
  	}
  	else if(!regPwd.test(pwd)) {
      alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
      myform.pwd.focus();
      return false;
    }
    else if(!regNickName.test(nickName)) {
      alert("닉네임은 한글만 사용가능합니다.");
      myform.nickName.focus();
      return false;
    }
    else if(!regName.test(name)) {
      alert("성명은 한글과 영문대소문자만 사용가능합니다.");
      myform.name.focus();
      return false;
    }
    else if(!regEmail.test(email)) {
      alert("이메일 형식에 맞지않습니다.");
      myform.email1.focus();
      return false;
    }
    else if((homePage != "http://" && homePage != "")) {
      if(!regURL.test(homePage)) {
	        alert("작성하신 홈페이지 주소가 URL 형식에 맞지않습니다.");
	        myform.homePage.focus();
	        return false;
      }
      else {
    	  submitFlag = 1;
	  }
    }
  	
  	if(tel2 != "" && tel3 != "") {
  	  if(!regTel.test(tel)) {
	    		alert("전화번호형식을 확인하세요.(000-0000-0000)");
	    		myform.tel2.focus();
	    		return false;
  	  }
  	  else {
  		  submitFlag = 1;
  	  }
  	}
  	else {
  		tel2 = " ";
  		tel3 = " ";
  		tel = tel1 + "-" + tel2 + "-" + tel3;
  		submitFlag = 1;
  	}
  	
  	let postcode = myform.postcode.value + " ";
  	let roadAddress = myform.roadAddress.value + " ";
  	let detailAddress = myform.detailAddress.value + " ";
  	let extraAddress = myform.extraAddress.value + " ";
  	myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
  	
  	if(submitFlag == 1) {
  		if(idCheckSw == 0) {
  			alert("아이디 중복체크버튼을 눌러주세요!");
  			document.getElementById("midBtn").focus();
  		}
  		else if(nickCheckSw == 0) {
  			alert("닉네임 중복체크버튼을 눌러주세요!");
  			document.getElementById("nickNameBtn").focus();
  		}
  		else {
	    		myform.email.value = email;
	    		myform.tel.value = tel;
	    		
		    	myform.submit();
  		}
  	}
  	else {
  		alert("회원가입 실패~~ 폼의 내용을 확인하세요.");
  	}
  	
  }
  
  function idCheck() {
  	let mid = myform.mid.value;
  	let url = "${ctp}/memberIdCheck.pMem?mid="+mid;
  	
  	if(mid.trim() == "") {
  		alert("아이디를 입력하세요!");
  		myform.mid.focus();
  	}
  	else {
  		idCheckSw = 1;
  		myform.mid.readOnly = true;
  		window.open(url,"nWin","width=580px,height=250px");
  	}
  }
  
  function nickCheck() {
  	let nickName = myform.nickName.value;
  	let url = "${ctp}/memberNickCheck.pMem?nickName="+nickName;
  	
  	if(nickName.trim() == "") {
  		alert("닉네임을 입력하세요!");
  		myform.nickName.focus();
  	}
  	else {
  		nickCheckSw = 1;
  		myform.nickName.readOnly = true;
  		window.open(url,"nWin","width=580px,height=250px");
  	}
  }
  
  </script>
</head>
<body>
	<jsp:include page="/includePractice/header.jsp" />
	<p><br/></p>
	<div class="container">
  <form name="myform" method="post" action="${ctp}/memberJoinOk.pMem" class="was-validated">
    <h2>회 원 가 입</h2>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-secondary btn-sm" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" id="nickNameBtn" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="form-group">
      <label for="email1">Email address:</label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
          <div class="input-group-append">
            <select name="email2" class="custom-select">
              <option value="naver.com" selected>naver.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="nate.com">nate.com</option>
              <option value="yahoo.com">yahoo.com</option>
            </select>
          </div>
        </div>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="남자" checked>남자
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="여자">여자
        </label>
      </div>
    </div>
    <div class="form-group">
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
            <select name="tel1" class="custom-select">
              <option value="010" selected>010</option>
              <option value="02">서울</option>
              <option value="031">경기</option>
              <option value="032">인천</option>
              <option value="041">충남</option>
              <option value="042">대전</option>
              <option value="043">충북</option>
              <option value="051">부산</option>
              <option value="052">울산</option>
              <option value="061">전북</option>
              <option value="062">광주</option>
            </select>-
        </div>
        <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
        <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
      </div>
    </div>
    <div class="form-group">
      <label for="address">주소</label>
      <div class="input-group mb-1">
        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
        <div class="input-group-append">
          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
        </div>
      </div>
      <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
      <div class="input-group mb-1">
        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
        <div class="input-group-append">
          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
        </div>
      </div>
    </div>
    <div class="form-group">
      <label for="homepage">Homepage address:</label>
      <input type="text" class="form-control" name="homePage" value="http://" placeholder="홈페이지를 입력하세요." id="homePage"/>
    </div>
    <div class="form-group">
      <label for="name">직업</label>
      <select class="form-control" id="job" name="job">
        <!-- <option value="">직업선택</option> -->
        <option>학생</option>
        <option>회사원</option>
        <option>공무원</option>
        <option>군인</option>
        <option>의사</option>
        <option>법조인</option>
        <option>세무인</option>
        <option>자영업</option>
        <option selected>기타</option>
      </select>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">취미</span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="등산" name="hobby"/>등산
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="낚시" name="hobby"/>낚시
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="수영" name="hobby"/>수영
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="독서" name="hobby"/>독서
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="영화감상" name="hobby"/>영화감상
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="바둑" name="hobby"/>바둑
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="축구" name="hobby"/>축구
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="checkbox" class="form-check-input" value="기타" name="hobby" checked/>기타
        </label>
      </div>
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
        </label>
      </div>
    </div>
    <div  class="form-group">
      회원 사진(파일용량:2MByte이내) :
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberLogin.pMem';">돌아가기</button>
    
    <input type="hidden" name="email" />
    <input type="hidden" name="tel" />
    <input type="hidden" name="address" />
  </form>
	</div>
	<p><br/></p>
	<jsp:include page="/includePractice/footer.jsp" />
</body>
</html>