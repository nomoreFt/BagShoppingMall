<%@page import="java.util.Iterator"%>
<%@page import="com.bag.vo.BagsBasketVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bag.vo.BagsVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/basket.css">

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>


<%
HashMap<String, Object> map = (HashMap)session.getAttribute("map");
List<BagsVO> list = (ArrayList)request.getAttribute("list");
BagsBasketVO vo1[] = new BagsBasketVO[map.size()];
Iterator<String> keys = map.keySet().iterator();
int i = 0;
while( keys.hasNext() ){
    String key = keys.next();
    vo1[i] = (BagsBasketVO)map.get(key);
	i++;
}
 %>
<div class = "Form">
	<div id = "TextArea">
		<h1>SHOPPING CART</h1>
		<hr class = "line">
	</div>
<table class = "table">
<tr><th>이미지</th><th>상품정보</th><th>판매가</th><th>수량</th><th>합계</th></tr>

<%

i = 0;
for(BagsVO vo :  list){
	//int var = vo1[i].getSelectedNum() * Integer.parseInt(vo.getBag_price());
	%>
<tr width ="500" height="130" align = "center" style="margin:30px">
<td><img id = "sang_img" alt=<%=vo.getBag_name()%> src="bagPicture/<%=vo.getBag_src() %>"></td>
<td><%=vo.getBag_name()%></td>
<td><%=vo.getBag_price()%>원</td>
<td><%=vo1[i].getSelectedNum() %>개</td>
<td>총 <%=vo1[i].getSelectedNum() * Integer.parseInt(vo.getBag_price())%>원</td>
</tr>
<%i++; %>
	
	<% 
	}
%>
</table>

	<form action="baglist.ido">
	<input class = "btn" type="submit" value="계속 쇼핑하기">
	</form>
</div>

<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>