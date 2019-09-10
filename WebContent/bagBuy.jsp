<%@page import="java.util.Iterator"%>
<%@page import="com.bag.vo.BagsBasketVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

h1{
text-align: center;
}
table {
  border-collapse: collapse;
  width: 70%;
  margin: auto;
  text-align: center;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #0099FF;
  color: white;
  text-align: center;
  font : 25px arial, sans-serif;
}
td{
 font : 13px arial, sans-serif;
}
.haha{
color : #0099FF;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
HashMap<String,Object> map = (HashMap<String,Object>) session.getAttribute("map");
BagsBasketVO vo1[] = new BagsBasketVO[map.size()];
Iterator<String> keys = map.keySet().iterator();
String sum = request.getParameter("sum");

int i = 0;
while( keys.hasNext() ){
    String key = keys.next();
    vo1[i] = (BagsBasketVO)map.get(key);
	i++;
}
 %>
<h1>고객님의 <span class = "haha">주문</span>이 완료되었습니다.</h1>
<br>
<hr>
<br>

<table>
  <tr>
    <th colspan="4"><h3>결제정보</h3></th>
  </tr>
  <tr>
    <td>총 주문금액</td>
    <td><%=sum %></td>
    <td>총 결제금액</td>
    <td><%=sum %></td>
  </tr>
    <tr>
    <td>결제방법</td>
    <td>신용카드</td>
    <td>입금자명</td>
    <td>김현우</td>
  </tr>
    <tr>
    <td>결제정보</td>
    <td colspan="3">국민은행 425-***44-**543 / 예금주 (주)단성사 골드빌딩</td>
  </tr>
</table>

<hr>

<table>
  <tr>
    <th colspan="2"><h3>주문정보</h3></th>
  </tr>
  <tr>
    <td>주문번호</td>
    <td>124683</td>
  </tr>
  <tr>
    <td>주문자 정보</td>
    <td>김현우 / 010-3333-**** / Gold 회원</td>
  </tr>
  <tr>
  <td>주문 상품</td>
    <td>
     <%
 for(int j = 0; j <vo1.length;j++){
 %>
 <p><%=vo1[j].getSelectedBag() %></p>
 <%} %>
    </td>
  </tr>
  <tr>
    <td>배송 정보</td>
    <td>CJ대한통운</td>
  </tr>
  <tr>
    <td>받으시는 분</td>
    <td>김현우 / 010-3333-**** / 구천면로 83길 3-23 대한건아골드빌딩 3층</td>
  </tr>
</table>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>