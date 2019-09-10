<%@page import="com.bag.vo.BagsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bag.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

* {
  box-sizing: border-box;
}

body {
  font-family: Arial;
  text-align: center;
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

.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #4CAF50;
  color: white;
}

.round {
  border-radius: 50%;
}

.bnt-basket{
color: white;
background-color: black;
background: url( './krim/bag25.png' ) no-repeat;
width:30px;
height:30px;
}

</style>
</head>
<body>


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

<jsp:include page="../header.jsp"></jsp:include>
<br>
<br>
<hr>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="bagNav/4.jpg" style="width:100%">
  <div class="text">PANDABAG</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="bagNav/5.jpg" style="width:100%">
  <div class="text">PANDABAG</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="bagNav/6.jpg" style="width:100%">
  <div class="text">PANDABAG</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
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
</script>


<!-- MAIN (Center website) -->
<div class="main">


<!-- Portfolio Gallery Grid -->

<div class="row">
<%for(BagsVO li : list){ %>
  <div class="column nature">
    <div class="content">
      <a href="baglist2.ido?name=<%=li.getBag_name()%>&price=<%=li.getBag_price()%>&src=<%=li.getBag_src()%>"   ><img src="bagPicture/<%=li.getBag_src()%>" alt="Mountains" style="width:100%" ></a>
      <h4><%=li.getBag_name() %></h4>
      <p><%=li.getBag_price() %></p>
      <p><form action="bagbasket.do" method="post">
<input type="number" name ="selectedNum">
<input type="hidden" name="selectedBag" value="<%=li.getBag_name()%>">
<input class="bnt-basket" type="submit" >
</form>
    </div>
  </div>

<%} %>
  <!-- END GRID -->
</div>

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



if (startPage > 1) {%>

   <a href="?page=1" class="previous round">처음</a>");
<%
}


if (page2 > 1) {%>
<a href="?page=<%=page2 - 1%>" class="previous round">이전</a>
   <!--  /* out.print("<a href=\"?page=" + (page2 - 1)  + "\">이전</a>");
 */ -->
 <%
}



for (int iCount = startPage; iCount <= endPage; iCount++) {

    if (iCount == page2) {

       out.print(" <b>" + iCount + "</b>");

    } else {
%>
   <a href="/bags1/baglist.ido?page=<%=iCount%>" class="previous round"><%=iCount%></a>
   <% 
    }

}


if (page2 < totalPage) {%>
    
    <a href="?page=<%=page2 + 1%>"class="previous round">다음</a>
<%
}



if (endPage < totalPage) {%>

   <a href="?page=<%=totalPage%>"class="previous round">끝</a>");

<%
}
%>
<!-- END MAIN -->
</div>

<script>
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

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
