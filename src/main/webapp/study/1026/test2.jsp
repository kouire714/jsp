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
    	'use strict';
    	
    	function fCheck() {
    		let name = myform.name.value;
    		let age = document.getElementById("age").value;
    		// let flag = myform.flag.value;
    		
    		if(name.trim() == "") {
    			alert("성명을 입력하세요");
    			myform.name.focus();
    		}
    		else if(age.trim() == "") {
    			alert("나이을 입력하세요");
    			document.getElementById("age").focus();
    		}
    		else {
    			// alert("정상처리 되었습니다.");
    			// location.href = `test2Ok.jsp?name=${name}&age=${age}`; // 백엔드백틱사용안됨
    			// location.href = "test2Ok.jsp?name="+name+"&age="+age+"";
    			// location.href = "test2Ok.jsp";
    			// location.href = "test2Ok.jsp?name="+name+"&age="+age+"&name="+flag+"";
    			myform.submit();
    		}
    	}
    </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>값의 전송(GET/POST) - hidden값 전송하기</h2>
	<!--<form name="myform" method="get" action="test1Ok.jsp">-->
	<form name="myform" method="post" action="test2Ok.jsp">
		<div>성명
			<input type="text" name="name" class="form-control mb-3" autofocus />
		</div>
		<div>나이
			<input type="number" name="age" id="age" class="form-control mb-3" />
		</div>
		<div>버튼
			<input type="button" value="전송(button)" onclick="fCheck()" class="btn btn-primary form-control" />
		</div>
		<input type="hidden" name="flag" value="Ok~~~~~"/>
	</form>
</div>
<p><br/></p>
</body>
</html>