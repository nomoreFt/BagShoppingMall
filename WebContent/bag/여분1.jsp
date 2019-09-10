<%@page import="com.bag.vo.PagingVO"%>
<%@page import="com.bag.vo.BagsVO"%>
<%@page import="com.bag.vo.MembersVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 페이지</title>

<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
  padding: 20px;
  font-family: Arial;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}

h1 {
  font-size: 50px;
  word-break: break-all;
}

.row {
  margin: 10px -16px;
}

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}


</style>

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

	<%
PagingVO paging = (PagingVO)request.getAttribute("paging");
int countList = paging.getCountList();
int countPage = paging.getCountPage();
int endPage = paging.getEndPage();
int page2 = paging.getPage();
int startPage = paging.getStartPage();
int totalCount = paging.getTotalCount();
int totalPage = paging.getTotalPage();

List<BagsVO> list = (List)request.getAttribute("list");


%>


<!-- MAIN (Center website) -->
<div class="main">

<h1>MYLOGO.COM</h1>
<hr>

<h2>PORTFOLIO</h2>


<!-- Portfolio Gallery Grid -->
<div class="row">
  <div class="column nature">
    <div class="content">
      <img src="/w3images/mountains.jpg" alt="Mountains" style="width:100%">
      <h4>Mountains</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column nature">
    <div class="content">
    <img src="/w3images/lights.jpg" alt="Lights" style="width:100%">
      <h4>Lights</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column people">
    <div class="content">
    <img src="/w3images/people2.jpg" alt="Car" style="width:100%">
      <h4>Man</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column people">
    <div class="content">
    <img src="/w3images/people3.jpg" alt="Car" style="width:100%">
      <h4>Woman</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
<!-- END GRID -->
</div>

<!-- END MAIN -->
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}

filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


</script>




<%-- <table border="2">
<tr>
<th colspan="4">상품</th>
</tr>
<%for(BagsVO li : list){ %>
<tr>
<td><%=li.getNum() %></td>
<td><img alt=<%=li.getNum() %> src="bagPicture/<%=li.getBag_src() %>"> </td>
<td><%=li.getBag_name() %></td>
<td><%=li.getBag_price() %></td>
<td><form action="bagbasket.do" method="post">
<input type="number" name ="selectedNum">
<input type="hidden" name="selectedBag" value="<%=li.getBag_name()%>">
<input type="submit" value="장바구니에 담기">
</form>
</td>
</tr>
<%} %>
</table> --%>

<% 
if (totalCount % countList > 0) {

    totalPage++;

}



if (totalPage < page2) {

    page2 = totalPage;

}




if (endPage > totalPage) {

    endPage = totalPage;

}



if (startPage > 1) {

    out.print("<a href=\"?page=1\">처음</a>");

}



if (page2 > 1) {

    out.print("<a href=\"?page=" + (page2 - 1)  + "\">이전</a>");

}



for (int iCount = startPage; iCount <= endPage; iCount++) {

    if (iCount == page2) {

       out.print(" <b>" + iCount + "</b>");

    } else {
%>
	<a href="/bag/page.ido?page=<%=iCount%>"><%=iCount%></a>
	<% 
    }

}


if (page2 < totalPage) {
    
    out.print("<a href=\"?page=" + (page2 + 1)  + "\">다음</a>");

}



if (endPage < totalPage) {

	out.print("<a href=\"?page=" + totalPage + "\">끝</a>");

}
%>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>