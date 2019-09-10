<%-- <%@page import="java.util.Iterator"%>
<%@page import="com.bag.vo.BagsBasketVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bag.vo.BagsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/header.jsp"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<style>
* {
	box-sizing: border-box;
}

.img-magnifier-container {
	position: relative;
}

.img-magnifier-glass {
	position: absolute;
	border: 3px solid #000;
	border-radius: 50%;
	cursor: none;
	/*Set the size of the magnifier glass:*/
	width: 100px;
	height: 100px;
}

.content {
	max-width: 1000px;
	margin: auto;
}

.menu01 li {
	padding-right: 150px;
	display: inline;
}

.qnamenu th {
	padding: 40px;
	text-align: center;
}

.qnamenu tr {
	text-align: center;
}

#div {
	margin-bottom: 1000px;
}

.writer-info {
	margin-left: 2px;
	font-size: 12px;
	line-height: 22px;
}

.review01 td {
	padding-top: 22px;
	padding-bottom: 22px;
	vertical-align: middle
}

.btn {
	border-radius: 4px;
	background-color: #CC0000;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 150px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
}

.btn span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.btn span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.btn:hover span {
	padding-right: 25px;
}

.btn:hover span:after {
	opacity: 1;
	right: 0;
}

.btn2 {
	border-radius: 4px;
	background-color: #6699FF;
	border: none;
	color: white;
	text-align: center;
	font-size: 13px;
	padding: 10px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
}

.btn3 {
	border-radius: 4px;
	background-color: #99FF66;
	border: none;
	color: black;
	text-align: center;
	font-size: 13px;
	padding: 10px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
}

#floatdiv {
	position: fixed;
	_position: absolute;
	_z-index: -1;
	width: 170px;
	overflow: hidden;
	right: 0px;
	top: 300px;
	background-color: transparent;
	margin: 0;
	padding: 0;
}

#floatdiv ul {
	list-style: none;
	padding-left: 0px;
}
</style>

<script>
function magnify(imgID, zoom) {
  var img, glass, w, h, bw;
  img = document.getElementById(imgID);
  /*create magnifier glass:*/
  glass = document.createElement("DIV");
  glass.setAttribute("class", "img-magnifier-glass");
  /*insert magnifier glass:*/
  img.parentElement.insertBefore(glass, img);
  /*set background properties for the magnifier glass:*/
  glass.style.backgroundImage = "url('" + img.src + "')";
  glass.style.backgroundRepeat = "no-repeat";
  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
  bw = 3;
  w = glass.offsetWidth / 2;
  h = glass.offsetHeight / 2;
  /*execute a function when someone moves the magnifier glass over the image:*/
  glass.addEventListener("mousemove", moveMagnifier);
  img.addEventListener("mousemove", moveMagnifier);
  /*and also for touch screens:*/
  glass.addEventListener("touchmove", moveMagnifier);
  img.addEventListener("touchmove", moveMagnifier);
  function moveMagnifier(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    x = pos.x;
    y = pos.y;
    /*prevent the magnifier glass from being positioned outside the image:*/
    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
    if (x < w / zoom) {x = w / zoom;}
    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
    if (y < h / zoom) {y = h / zoom;}
    /*set the position of the magnifier glass:*/
    glass.style.left = (x - w) + "px";
    glass.style.top = (y - h) + "px";
    /*display what the magnifier glass "sees":*/
    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}



function fnMove(seq) {
   var offset = $("#div" + seq).offset();
   $('html, body').animate({
      scrollTop : offset.top
   }, 400);
}
</script>

</head>
<body>



	<%
      String name = (String) request.getParameter("name");
      String price = (String) request.getParameter("price");
      String src = (String) request.getParameter("src");
      System.out.println(src);
   %>


	<div class="content">
		<!-- <center> -->
		<h1>상품</h1>


		<table border=0>
			<td rowspan="7">
				<div class="img-magnifier-container">
					<img id="myimage" src="bagPicture/<%=src%>" width="600" height="600">
				</div>
			</td>

			<tr>
				<td colspan="4"
					style="padding: 10px; text-align: center; font-size: 53px"><%=name%></td>
			</tr>
			<tr>
				<td style="padding: 10px;">가격 :</td>
				<td style="padding: 10px; text-align: center; font-size: 22px">
					<fmt:formatNumber value="<%=price %>" pattern="#,###" /> 원
				</td>
			</tr>

			<tr>
				<td colspan="2" style="padding: 5px; font-size: 15px">무료배송 <br>16시
					이전 주문시 오늘 출발 예정 - CJ택배
				</td>
			</tr>

			<tr>
				<td style="padding: 10px;">원산지 :</td>
				<td style="padding: 10px; text-align: center; font-size: 22px">중국</td>
			</tr>
			<form action="bagbasket.do" method="post">
			<tr>
				<td style="padding: 10px;">주문 수량 :</td>
				<td><input type="number" name="selectedNum"
					style="text-align: center;"></td>
			</tr>

			<tr>
				<td><input class="btn2" type="submit" value="장바구니 담기">
					<input type="hidden" name="selectedBag" value="<%=name%>">
					</form></td>
				<td>
					<form action="" method="get">
						<input class="btn2" type="submit" value="구매">
					</form>
				</td>

			</tr>

		</table>


		<td>
			<form action="bagbasket.do" method="post">
				<input type="number" name="selectedNum"> <input
					type="hidden" name="selectedBag" value="<%=name%>"> <input
					class="btn2" type="submit" value="장바구니에 담기">
			</form>
		</td> <br> <br>

		<hr>

		<div class="menu01">
			<ul>
				<li><button class="btn" onclick="fnMove('1')">
						<span>Detail</span>
					</button></li>
				<li><button class="btn" onclick="fnMove('2')">
						<span>Review</span>
					</button></li>
				<li><button class="btn" onclick="fnMove('3')">
						<span>QnA</span>
					</button></li>
			</ul>
		</div>
		<hr>
		<!-- --------------------------구분선------------------------- -->
		<div id="div1"></div>
		<h2>Detail</h2>
		<img src="krim/kabang4.jpg" style="height: 1000px"> <img
			src="krim/kabang3.jpg" style="height: 1000px"> <img
			src="krim/kabang2.jpg" style="height: 1000px">


		<hr>
		<!-- --------------------------구분선------------------------- -->
		<div id="div2"></div>
		<h2>Review</h2>
		<br>

		<h3>상품평</h3>

		<table border="1" class="review01">
			<td><img src="krim/newbag1.jpg"></td>
			<td>배송도 빠르고 제품도 좋습니다</td>
			<td>
				<dl class="writer-info">
					<dt>작성자 : kka***</dt>
					<dt>등록일 : 2019.09.06</dt>

					<dt>조회수 : 12538</dt>
				</dl>
			</td>
			<tr>
				<td><img src="krim/newbag2.jpg"></td>
				<td>배송도 빠르고 제품도 좋습니다</td>
				<td>
					<dl class="writer-info">
						<dt>작성자 : kka***</dt>
						<dt>등록일 : 2019.09.06</dt>

						<dt>조회수 : 12538</dt>
					</dl>
				</td>
			</tr>
			<tr>
				<td><img src="krim/newbag3.jpg"></td>
				<td>배송도 빠르고 제품도 좋습니다</td>
				<td>
					<dl class="writer-info">
						<dt>작성자 : kka***</dt>
						<dt>등록일 : 2019.09.06</dt>

						<dt>조회수 : 12538</dt>
					</dl>
				</td>
			</tr>
			<tr>
			</tr>
		</table>


		<hr>
		<!-- --------------------------구분선------------------------- -->
		<div id="div3"></div>
		<h2>QnA</h2>

		<table class="qnamenu" border="0">
			<th>번호</th>
			<th>문의종류</th>
			<th>답변상태</th>
			<th>제목</th>
			<th>문의자</th>
			<th>등록일</th>
			<tr>
				<td>1</td>
				<td>교환</td>
				<td>답변대기</td>
				<td>배송관련문의드립니다.</td>
				<td>1234*****</td>
				<td>2019.09.06</td>
			</tr>
			<tr>
				<td>2</td>
				<td>배송</td>
				<td>답변대기</td>
				<td>배송관련문의드립니다.</td>
				<td>1234*****</td>
				<td>2019.09.06</td>
			</tr>
			<tr>
				<td>3</td>
				<td>AS</td>
				<td>답변대기</td>
				<td>배송관련문의드립니다.</td>
				<td>1234*****</td>
				<td>2019.09.06</td>
			</tr>


		</table>
		<hr>
		<br> <br> <br> <br> <br> <br> <br>
		<ul>
			<li>소화물 택배의 배송은 발송일로부터 1~2 영업일이 소요되나, 지역/대형 화물/설치/예약/발송지체 등의
				특이사항에 따라 배송기간은 달라질 수 있습니다.</li>
			<li>상품의 특성과 거래조건에 따라 청약철회(변심반품/취소)가 일부 제한되거나 청약철회에 소요되는 비용이 다르게
				책정될 수 있습니다. 반품/교환 불가사유 보기</li>
			<li>청약철회는 상품 수령일로부터 7일 이내에 신청하실 수 있으며, 판매자는
				‘전자상거래등에서의소비자보호에관한법률’이 정하는 바에 따른 지연이자 지급의 책임이 있습니다.</li>
			<li>제품 사용 상 불만과 피해보상에 관하여는 제조사, 수입원, 판매자 등에게 문의하여주시기 바라며, 당사의
				고객센터로 문의 주시면 관계법령과 규정에 부합하는 기준에 따라 문제 해결에 도움을 드리겠습니다.</li>
			<li>거래에 관한 약관은 판매자의 상품 상세설명 화면과 당사 이용약관(링크)에서 확인하실 수 있습니다.</li>
		</ul>








	</div>

	<div id="floatdiv">
		<ul>
			<li><a class="btn2" href="#" style="font-size: 30px">Top</a></li>
			<br>
			<li><button class="btn3" onclick="fnMove('1')">Detail</button></li>
			<li><button class="btn3" onclick="fnMove('2')">Review</button></li>
			<li><button class="btn3" onclick="fnMove('3')">QnA</button></li>

		</ul>
	</div>


	<script>
magnify("myimage", 3);
</script>
</body>
<%@ include file="/footer.jsp"%>
</html> --%>

<%@page import="java.util.Iterator"%>
<%@page import="com.bag.vo.BagsBasketVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bag.vo.BagsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/header.jsp"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<style>
* {
	box-sizing: border-box;
}

.img-magnifier-container {
	position: relative;
}

.img-magnifier-glass {
	position: absolute;
	border: 3px solid #000;
	border-radius: 50%;
	cursor: none;
	/*Set the size of the magnifier glass:*/
	width: 100px;
	height: 100px;
}

.content {
	max-width: 1000px;
	margin: auto;
}

.menu01 li {
	padding-right: 150px;
	display: inline;
}

.qnamenu th {
	padding: 40px;
	text-align: center;
}

.qnamenu tr {
	text-align: center;
}

#div {
	margin-bottom: 1000px;
}

.writer-info {
	margin-left: 2px;
	font-size: 12px;
	line-height: 22px;
}

.review01 td {
	padding-top: 22px;
	padding-bottom: 22px;
	vertical-align: middle
}

.btn {
	border-radius: 4px;
	background-color: #CC0000;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 150px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
}

.btn span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.btn span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.btn:hover span {
	padding-right: 25px;
}

.btn:hover span:after {
	opacity: 1;
	right: 0;
}

.btn2 {
	border-radius: 4px;
	background-color: #6699FF;
	border: none;
	color: white;
	text-align: center;
	font-size: 13px;
	padding: 10px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
}

.btn3 {
	border-radius: 4px;
	background-color: #99FF66;
	border: none;
	color: black;
	text-align: center;
	font-size: 13px;
	padding: 10px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	display: inline;
}

#floatdiv {
	position: fixed;
	_position: absolute;
	_z-index: -1;
	width: 170px;
	overflow: hidden;
	right: 0px;
	top: 300px;
	background-color: transparent;
	margin: 0;
	padding: 0;
}

#floatdiv ul {
	list-style: none;
	padding-left: 0px;
}
</style>

<script>
function magnify(imgID, zoom) {
  var img, glass, w, h, bw;
  img = document.getElementById(imgID);
  /*create magnifier glass:*/
  glass = document.createElement("DIV");
  glass.setAttribute("class", "img-magnifier-glass");
  /*insert magnifier glass:*/
  img.parentElement.insertBefore(glass, img);
  /*set background properties for the magnifier glass:*/
  glass.style.backgroundImage = "url('" + img.src + "')";
  glass.style.backgroundRepeat = "no-repeat";
  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
  bw = 3;
  w = glass.offsetWidth / 2;
  h = glass.offsetHeight / 2;
  /*execute a function when someone moves the magnifier glass over the image:*/
  glass.addEventListener("mousemove", moveMagnifier);
  img.addEventListener("mousemove", moveMagnifier);
  /*and also for touch screens:*/
  glass.addEventListener("touchmove", moveMagnifier);
  img.addEventListener("touchmove", moveMagnifier);
  function moveMagnifier(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    x = pos.x;
    y = pos.y;
    /*prevent the magnifier glass from being positioned outside the image:*/
    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
    if (x < w / zoom) {x = w / zoom;}
    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
    if (y < h / zoom) {y = h / zoom;}
    /*set the position of the magnifier glass:*/
    glass.style.left = (x - w) + "px";
    glass.style.top = (y - h) + "px";
    /*display what the magnifier glass "sees":*/
    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}



function fnMove(seq) {
   var offset = $("#div" + seq).offset();
   $('html, body').animate({
      scrollTop : offset.top
   }, 400);
}
</script>

</head>
<body>



	<%
		String name = (String) request.getParameter("name");
		String price = (String) request.getParameter("price");
		String src = (String) request.getParameter("src");
		System.out.println(src);
	%>


	<div class="content">
		<!-- <center> -->
		<h1>상품</h1>


		<table border=0>
			<td rowspan="7">
				<div class="img-magnifier-container">
					<img id="myimage" src="bagPicture/<%=src%>" width="600"
						height="600">
				</div>
			</td>

			<tr>
				<td colspan="4"
					style="padding: 10px; text-align: center; font-size: 53px"><%=name%></td>
			</tr>
			<tr>
				<td style="padding: 10px;">가격 :</td>
				<td style="padding: 10px; text-align: center; font-size: 22px">
					<fmt:formatNumber value="<%=price%>" pattern="#,###" /> 원
				</td>
			</tr>

			<tr>
				<td colspan="2" style="padding: 5px; font-size: 15px">무료배송 <br>16시
					이전 주문시 오늘 출발 예정 - CJ택배
				</td>
			</tr>

			<tr>
				<td style="padding: 10px;">원산지 :</td>
				<td style="padding: 10px; text-align: center; font-size: 22px">중국</td>
			</tr>
			<form action="bagbasket.do" method="post">
				<tr>
					<td style="padding: 10px;">주문 수량 :</td>
					<td><input type="number" name="selectedNum"
						style="text-align: center;"></td>
				</tr>

				<tr>
					<td><input class="btn2" type="submit" value="장바구니 담기">
						<input type="hidden" name="selectedBag" value="<%=name%>">
					</td>
					<td><input class="btn2" type="submit" value="구매"></td>
			</form>
			</tr>

		</table>


		<td>
			<form action="bagbasket.do" method="post">
				<input type="number" name="selectedNum"> <input
					type="hidden" name="selectedBag" value="<%=name%>"> <input
					class="btn2" type="submit" value="장바구니에 담기">
			</form>
		</td> <br> <br>

		<hr>

		<div class="menu01">
			<ul>
				<li><button class="btn" onclick="fnMove('1')">
						<span>Detail</span>
					</button></li>
				<li><button class="btn" onclick="fnMove('2')">
						<span>Review</span>
					</button></li>
				<li><button class="btn" onclick="fnMove('3')">
						<span>QnA</span>
					</button></li>
			</ul>
		</div>
		<hr>
		<!-- --------------------------구분선------------------------- -->
		<div id="div1"></div>
		<h2>Detail</h2>
		<img src="krim/kabang4.jpg" style="height: 1000px"> <img
			src="krim/kabang3.jpg" style="height: 1000px"> <img
			src="krim/kabang2.jpg" style="height: 1000px">


		<hr>
		<!-- --------------------------구분선------------------------- -->
		<div id="div2"></div>
		<h2>Review</h2>
		<br>

		<h3>상품평</h3>

		<table border="1" class="review01">
			<td><img src="krim/newbag1.jpg"></td>
			<td>배송도 빠르고 제품도 좋습니다</td>
			<td>
				<dl class="writer-info">
					<dt>작성자 : kka***</dt>
					<dt>등록일 : 2019.09.06</dt>

					<dt>조회수 : 12538</dt>
				</dl>
			</td>
			<tr>
				<td><img src="krim/newbag2.jpg"></td>
				<td>배송도 빠르고 제품도 좋습니다</td>
				<td>
					<dl class="writer-info">
						<dt>작성자 : kka***</dt>
						<dt>등록일 : 2019.09.06</dt>

						<dt>조회수 : 12538</dt>
					</dl>
				</td>
			</tr>
			<tr>
				<td><img src="krim/newbag3.jpg"></td>
				<td>배송도 빠르고 제품도 좋습니다</td>
				<td>
					<dl class="writer-info">
						<dt>작성자 : kka***</dt>
						<dt>등록일 : 2019.09.06</dt>

						<dt>조회수 : 12538</dt>
					</dl>
				</td>
			</tr>
			<tr>
			</tr>
		</table>


		<hr>
		<!-- --------------------------구분선------------------------- -->
		<div id="div3"></div>
		<h2>QnA</h2>

		<table class="qnamenu" border="0">
			<th>번호</th>
			<th>문의종류</th>
			<th>답변상태</th>
			<th>제목</th>
			<th>문의자</th>
			<th>등록일</th>
			<tr>
				<td>1</td>
				<td>교환</td>
				<td>답변대기</td>
				<td>배송관련문의드립니다.</td>
				<td>1234*****</td>
				<td>2019.09.06</td>
			</tr>
			<tr>
				<td>2</td>
				<td>배송</td>
				<td>답변대기</td>
				<td>배송관련문의드립니다.</td>
				<td>1234*****</td>
				<td>2019.09.06</td>
			</tr>
			<tr>
				<td>3</td>
				<td>AS</td>
				<td>답변대기</td>
				<td>배송관련문의드립니다.</td>
				<td>1234*****</td>
				<td>2019.09.06</td>
			</tr>


		</table>
		<hr>
		<br> <br> <br> <br> <br> <br> <br>
		<ul>
			<li>소화물 택배의 배송은 발송일로부터 1~2 영업일이 소요되나, 지역/대형 화물/설치/예약/발송지체 등의
				특이사항에 따라 배송기간은 달라질 수 있습니다.</li>
			<li>상품의 특성과 거래조건에 따라 청약철회(변심반품/취소)가 일부 제한되거나 청약철회에 소요되는 비용이 다르게
				책정될 수 있습니다. 반품/교환 불가사유 보기</li>
			<li>청약철회는 상품 수령일로부터 7일 이내에 신청하실 수 있으며, 판매자는
				‘전자상거래등에서의소비자보호에관한법률’이 정하는 바에 따른 지연이자 지급의 책임이 있습니다.</li>
			<li>제품 사용 상 불만과 피해보상에 관하여는 제조사, 수입원, 판매자 등에게 문의하여주시기 바라며, 당사의
				고객센터로 문의 주시면 관계법령과 규정에 부합하는 기준에 따라 문제 해결에 도움을 드리겠습니다.</li>
			<li>거래에 관한 약관은 판매자의 상품 상세설명 화면과 당사 이용약관(링크)에서 확인하실 수 있습니다.</li>
		</ul>








	</div>

	<div id="floatdiv">
		<ul>
			<li><a class="btn2" href="#" style="font-size: 30px">Top</a></li>
			<br>
			<li><button class="btn3" onclick="fnMove('1')">Detail</button></li>
			<li><button class="btn3" onclick="fnMove('2')">Review</button></li>
			<li><button class="btn3" onclick="fnMove('3')">QnA</button></li>

		</ul>
	</div>


	<script>
magnify("myimage", 3);
</script>
</body>
<%@ include file="/footer.jsp"%>
</html>