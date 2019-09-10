<%@page import="java.util.ArrayList"%>
<%@page import="com.bag.vo.BoardVO"%>
<%@page import="com.bag.vo.MembersVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bag.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body{
text-align: center;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

 tr:hover {background-color:#f5f5f5;} 
/* tr:hover {background-color:#0099FF;} */

a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

/* a:hover {
  background-color: #ddd;
  color: black;
} */

 a:hover {
  background-color: #f5f5f5;
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

</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>


	<%
		PagingVO paging = (PagingVO) request.getAttribute("paging");
		int countList = paging.getCountList();
		int countPage = paging.getCountPage();
		int endPage = paging.getEndPage();
		int page2 = paging.getPage();
		int startPage = paging.getStartPage();
		int totalCount = paging.getTotalCount();
		int totalPage = paging.getTotalPage();

		ArrayList<BoardVO> list = (ArrayList) request.getAttribute("list");
	%>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String sId = null;

		if (session.getAttribute("sId") != null) {

			sId = (String) session.getAttribute("sId");
		}
	%>

	
					<br><br><br><br>
				      <h2 align="center">Q&A 문의하기</h2>
				      <br>
					<table border="1" style="text-align: center;    border: 1px solid #black;
    border-collapse: collapse; height:200px; width:60%; margin-left:400px;"> 
						<tr>
							<th style="background-color: #fce3f8; text-align: center; width:70px">글번호</th>
	
							<th style="background-color: #fce3f8; text-align: center;">글제목</th>
	
							<th style="background-color: #fce3f8; text-align: center; width:80px">조회수</th>
	
							<th style="background-color: #fce3f8; text-align: center; ">작성일</th>
	
							<th style="background-color: #fce3f8; text-align: center;">작성자</th>
						</tr>

						<%
							
							for (int i = list.size()-1; i >= 0; i--) {
								System.out.println("list.get("+i+") : "+list.get(i).getbTitle());
						%>
						<tr>
							<td><%=list.get(i).getbNum()%></td>
							<td ><a style="color:black;" href="boardView.jsp?bNum=<%=list.get(i).getbNum()%>"><%=list.get(i).getbTitle()%></a></td>
							<td><%=list.get(i).getbHit_cnt()%></td>
							<td><%=list.get(i).getbDate()%></td>
							<td><%=list.get(i).getbId()%></td>
						</tr>
						<%
							}
						System.out.println("글 갯수 : "+list.size()+"개");
						%>
					</table>
					
					
				<%
					if (session.getAttribute("sId") != null) {

				%>

					<form action="boardWrite.jsp">
					<br><br>
						<input type="submit" value="글쓰기" style="margin-left:1050px; height:40px; width:100px; background-color: black; color: white">
					</form>

				<%

					} else {

				%>
					
					<button  style=" height:40px; width:100px; background-color: black; color: white"
					onclick="if(confirm('로그인 하세요'))location.href='memberLoginForm.jsp';"
					type="button">글쓰기</button>

				<%

					}

				%>
	
					
					
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
   <a href="page.ido?page=<%=iCount%>" class="previous round"><%=iCount%></a>
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


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>