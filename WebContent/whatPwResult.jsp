<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Pwresult.css">

</head>
<body class="font">

<jsp:include page="header.jsp"></jsp:include>


<%
	String pw = (String)request.getAttribute("pw");
  	String id = (String)request.getAttribute("id");
%>
<div id="form">
<h1>비밀번호찾기</h1>
<hr class="line">
<br>
<div class = "div">
   <span><%=id %>회원님의 비밀번호는</span>
   <br><br>
   <span id= "id"><%=pw %> 입니다!!</span>
   <br><br>
	<p>고객님 즐거운 쇼핑하세요!</p>
   <br><br>
   <p>고객님의 아이디 찾기가 성공적으로 이루어졌습니다.</p>
   <p>항상 고객님의 즐겁고 편리한 쇼핑을 위해</p>
   <p>최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.</p>
</div>
<br><br>
<button id = "login" onclick="location.href='memberLoginForm.jsp'">
로그인</button>

</div>

<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>