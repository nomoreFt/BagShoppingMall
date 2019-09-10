<!-- 메인 페이지 -->

<%@page import="com.bag.vo.MembersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bag.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
div#s_left{
padding:10px;

margin-left:100px;
margin-right:50px;
margin-top:100px;
width:400px;
height:500px;
float:left;
}
#contents{
width:700px;
height:500px;
float:left;
}
#s_right{
padding:10px;
margin-left:50px;
width:450px;
height:500px;
float:left;
}


.topnav a {
   float: left;
   color: #ffffff;
   text-align: center;
   padding: 12px 100px;
   text-decoration: none;
   font-size: 17px;
}

.topnav a:hover {
   background-color: #ddd;
   color: black;
}

.topnav a.active {
   background-color: black;
   color: white;
} */

</style>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<!-- <a href="memberLoginForm.jsp">로그인</a><br>
<a href="memberJoin.jsp">회원가입</a><br>
<a href="memberMyPage.jsp">마이페이지</a><br>
<a href="memberDelete.jsp">회원 정보 삭제</a><br>
<a href="memberList.do">모든 회원 정보 보기</a><br>
<form action="page.ido">
	<input type="submit" value="게시판">
</form> -->


<img src="./krim/um32.gif" style="width:53%; height:400px; margin-left:450px"> 
 	<br><br><br><br>
  	<div align="center">
  	<pre>
		 PandaBag은 혁신적이고 진취적인 자세로 패션의 현대적 감성을 극대화하는 영향력 있는 브랜드입니다. 
		  크리에이티브 디렉터 알레산드로 미켈레의 창의적인 비전 아래에서 21세기 명품 시장에 새로운 변혁을 일으키며, 
		  누구나 꿈에 그리는 패션 하우스로서의 높은 명성을 강화하고 있습니다. 
		  절충적이면서도 현대적인 로맨티시즘이 반영되어 있는 PandaBag 제품은 이탈리아의 장인 정신과 더불어 
		  작은 디테일 하나까지도 놓치지 않는 탁월한 품질을 대표하는 아이콘과도 같습니다.
		
		 PandaBag은 강력한 럭셔리 & 스포츠 브랜드를 비롯하여 라이프스타일 브랜드를 소유하고 있는 
		 의류 및 액세서리 부분의 선두업체인 케어링 그룹의 일원입니다.
		
		 PandaBag 스토리에서 알레산드로 미켈레 컬렉션에 숨겨진 비하인드 스토리를 만나보세요.
	</pre>
	<br><br>
	<hr>
	</div>

<br><br><br><br>


<div id="s_left">
	<img class="mySlides" src="./krim/newbag1.jpg" >
	<img class="mySlides" src="./krim/newbag2.jpg">
	<img class="mySlides" src="./krim/newbag3.jpg">
	<img class="mySlides" src="./krim/newbag4.jpg">   
	<script>
		var slideIndex = 0;
		carousel();
		
		function carousel() {
		    var i;
		    var x = document.getElementsByClassName("mySlides");
		    for (i = 0; i < x.length; i++) {
		      x[i].style.display = "none"; 
		    }
		    slideIndex++;
		    if (slideIndex > x.length) {slideIndex = 1} 
		    x[slideIndex-1].style.display = "block"; 
		    setTimeout(carousel, 2000); // Change image every 2 seconds
		}
	</script>
	<div style="color:red; "><h3>New</h3></div>
</div>

<div id="contents" style="background-color:ivory; height:200px" >


<img src="./krim/truck.png" style="margin-left:10px;margin-top:10px;">
<h3>당/일/배/송/상/품</h3>

<p> 
- 본 카테고리 내 상품은 평일 오후 2시 이전 결제 시 당일 출고됩니다.<br>
- 일반 상품과 함께 주문 시 당일 출고가 불가능 합니다.<br>
- 당일 출고 후 택배사 사정에 의하여 배송지연이 발생할 수 있습니다.<br>
</p>
<br><br><br>
<table style="margin-left:100px;">
<tr>
<td>
<h4>CUSTOMER SERVICE</h4>
<p>T.02-1234-1234</p>
<p>MON-FRI 09:00~18:00 OPEN</p>
<p>SAT/SUN/HOLIDAY OFF</p>
</td>
<td>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </td>
<td>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </td>
<td>
<h4>BANKING ACCOUNT</h4>
<p>123456-01-987654</p>
<p>우리은행</p>
<p>예금주: 집가자</p>
</td>
</tr>
<tr>
<td colspan="4" height="40"></td>
</tr>
<tr><td colspan="4" align="center">
<img src="./krim/face.png">&nbsp;&nbsp;&nbsp;
<img src="./krim/insta.png">&nbsp;&nbsp;&nbsp;
<img src="./krim/twitter.png">&nbsp;&nbsp;&nbsp;
</td>
</tr>
</table>


</div>
<div id="s_right">
<table>
<tr>
<td>
<img src="./krim/kabang0.jpg">
</td>
<td>
<img src="./krim/kabang1.jpg">
</td>
<td>
<img src="./krim/kabang2.jpg">
</td>
</tr>
<tr>
<td>
<img src="./krim/kabang3.jpg">
</td>
<td>
<img src="./krim/kabang4.jpg">
</td>
<td>
<img src="./krim/kabang5.jpg">
</td>
</tr>
<tr>
<td>
<img src="./krim/kabang6.jpg">
</td>
<td>
<img src="./krim/kabang7.jpg">
</td>
<td>
<img src="./krim/kabang8.jpg">
</td>
</tr>
</table>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>