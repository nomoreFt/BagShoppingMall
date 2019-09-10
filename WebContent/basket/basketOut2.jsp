<%@page import="com.bag.vo.BagsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bag.controller.HttpUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bag.vo.BagsBasketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/basket.css">

</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>

	${error}
	<%
		HashMap<String, Object> map = (HashMap) session.getAttribute("map");
		List<BagsVO> list = (ArrayList) request.getAttribute("list");
		BagsBasketVO vo1[] = new BagsBasketVO[map.size()];
		Iterator<String> keys = map.keySet().iterator();
		int i = 0;
		while (keys.hasNext()) {
			String key = keys.next();
			vo1[i] = (BagsBasketVO) map.get(key);
			i++;
		}
	%>
	<div class="Form">
		<div id="TextArea">
			<h1>SHOPPING CART</h1>
			<hr class="line">
		</div>


		<table class="table">
			<tr>
				<th>이미지</th>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>합계</th>
			</tr>
			<%
				int sum = 0;
				i = 0;
				for (BagsVO vo : list) {
					sum += vo1[i].getSelectedNum() * Integer.parseInt(vo.getBag_price());
			%>
			<tr width="500" height="300" align="center" style="margin: 30px">
				<td><img alt=<%=vo.getBag_name()%>
					src="bagPicture/<%=vo.getBag_src()%>"></td>
				<td><%=vo.getBag_name()%></td>
				<td><%=vo.getBag_price()%></td>
				<td><%=vo1[i].getSelectedNum()%></td>
				<td><%=vo1[i].getSelectedNum() * Integer.parseInt(vo.getBag_price())%></td>
			</tr>
			<%
				i++;
			%>

			<%
				}
			%>
			<tr>
				<td colspan="5" style="text-align: right;">총 합계는 <%=sum%></td>
			</tr>
		</table>

		<%
			List<String> arr = new ArrayList<String>();
			i = 0;
			for (BagsVO vo : list) {
				arr.add(i, vo.getBag_name());
				System.out.println(arr.get(i).toString());
				i++;
			}
			System.out.println(arr);
			session.setAttribute("buyList", arr);
		%>

		<table>
			<tr>
				<th><form action="bagbuy.ido">
						<input class = "btn" type="submit" value="구매하기"> <input type="hidden"
							name="sum" value="<%=sum%>">
					</form></th>
				<th><form action="baglist.ido">
						<input class = "btn" type="submit" value="계속 쇼핑하기">
					</form></th>
			</tr>
		</table>


		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>