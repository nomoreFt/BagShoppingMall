<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이 부분은 헤더입니다</title>

<style type="text/css">
a { 
  color: red;
   text-decoration: none;
}

#center {
   float: right;
   position: relative;
    left: -30px; 
}

#imgDiv {
width: 160px;
height: 100px;
position: absolute;
}


#imgDiv img {
width: 300px;
height: 100px;
position: absolute;
left: 50%;
top: 50%;
margin-left: 700px;
margin-top: -70px;
}



#imgDiv > #funny {                  
opacity: 0;
transition: opacity 0.2s
}

#imgDiv:hover > #funny {
opacity: 1;
}

.topnav {

   overflow: hidden;
   background-color:white;
   width:100%;
   margin-left:450px;
 /*  background-size:cover; */
}

.topnav a {
   float: left;
   color: black;
   text-align: center;
   padding: 12px 100px;
   text-decoration: none;
   font-size: 17px;
}

.topnav a:hover {
   background-color: #a4a4a4;
   color: white;
}

.topnav a.active {
   background-color: black;
   color: white;
}
</style>
</head>
<body>
<%
	if(session.getAttribute("sId")!= null){
%>

 <div style="float: right; margin-right:50px;">
      <a style="color: black;" href="memberMyPage.jsp">[마이페이지]</a> 
      <a style="color: black;" href="memberLogout.do">[로그아웃]</a> 
      <a style="color: black;" href="bagbasket2.do">[장바구니]</a>
   </div>
<%} else {%>
 <div style="float: right; margin-right:50px;">
      <a style="color: black;" href="memberJoin.jsp">[회원가입]</a> 
      <a style="color: black;" href="memberLoginForm.jsp">[로그인]</a> 
   </div>
  <%} %>
   <br>
   <div id="imgDiv">
<a id="serious" href="index.jsp"><img  src="./krim/pdb.png" ></a>
<a id="funny" href="index.jsp"><img  src="./krim/logo.JPG"></a>
</div>
   <br>
   <div id="center">
      <p>
       <img src="./krim/search2.png" style="padding-right:5px; height:25px;">
      <input type="text" placeholder="검색어를 입력하십시오." style="height:20px; margin-bottom:10px;">
      <input type="button" value="검색" style="background-color:black; color:white; height:30px;">
      </p>

   </div>
   <br>
   <br>

   <div class="topnav">
      <a class="active" href="index.jsp">Home</a> 
      <a href="baglist.ido">상품</a> 
      <a href="page.ido">게시판</a>
      <a href="jido.jsp">오시는길</a>
   </div>
 <!--  <img src="./krim/bagg.jpg" style="width:100%; height:400px;"> -->
</body>
</html>