<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
div#jido1{
width:500px; 
height:500px; 
margin-left:100px; 
margin-top:100px;
float:left;
}
#right{
width:500px; 
height:500px; 
margin-left:180px; 
margin-top:160px;
float:left;
}
</style>


</head>
<body>

   
   <jsp:include page="header.jsp"></jsp:include>
   
   <h1>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;찾아오시는 길</h1>
   <hr>
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14dcb7ed7060fe7bcdf6b11db6e71d99"></script>

<!-- <meta name="viewport"
content="initial-scale=1.0,user-scalable=no"> -->

<script>
window.onload=function(){ //IE나 chrome중 더 정확한 값 넣기
	var joongang1=new daum.maps.LatLng(37.571005, 126.992531);
	//해당 위도, 경도를 지도의 중앙으로 위치하기 위한 것
	var mapDesign1={ zoom:15,
			center:joongang1,
			mapTypeId:daum.maps.MapTypeId.ROADMAP
			//mapTypeId: google.maps.MapTypeId.HYBRID //(위성맵)
			};
	var map=new daum.maps.Map(document.getElementById("jido1"),mapDesign1);
	}
</script>
   <div id="jido1">
</div>
<div id="right">
<table>
<tr>
<td colspan="2">
<p>주소 : 서울특별시 종로구 돈화문로 26 단성사빌딩 4층<br>
지번) 서울특별시 종로구 묘동 56 단성사빌딩 4층<br>
<br>대표번호 : 02-3672-6900
</p>
</tr>
<tr><td colspan="2" height="100"> </td> </tr>
<tr>
<td><img src="./krim/bus.png"></td>
<td>
종로3가 버스정류장 하차<br>
105, 201, 202, 241, 260, 270, 271, 272<br>
</td>
</tr>
<tr><td colspan="2" height="30"> </td> </tr>
<tr>
<td><img src="./krim/subway.png"></td>
<td>
1,3,5호선 종로3가 하차<br>
</td>
</tr>
</table>
</div>



<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>