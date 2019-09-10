<%@page import="java.io.PrintWriter"%>
<%@page import="com.bag.dao.BoardDAO"%>
<%@page import="com.bag.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- 뷰포트 -->

	<meta name="viewport" content="width=device-width" initial-scale="1">

	<!-- 스타일시트 참조  -->

	<link rel="stylesheet" href="css/bootstrap.css">

	<title>jsp 게시판 웹사이트</title>

	<style type="text/css">

		a, a:hover {

			color: #000000;

			text-decoration: none;

		}

table {
  border-collapse: collapse;
  width: 100%;
  height:200px; 
  width:60%; 
  margin-left:400px;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}

	</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<%

		//로긴한사람이라면 sId 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String sId = null;

		if (session.getAttribute("sId") != null) {

			sId = (String) session.getAttribute("sId");

		}

		int bNum = 0;

		if (request.getParameter("bNum") != null) {

			bNum = Integer.parseInt(request.getParameter("bNum"));

		}

		if (bNum == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'page.ido'");

			script.println("</script>");

		}
		
		
		 	  BoardVO bv = BoardDAO.getInstance().getBoard(bNum);
		      int result = BoardDAO.getInstance().updateHit(bv.getbNum(), bv.getbHit_cnt());
		      System.out.println(result);
		      BoardVO bv1 = null;
		      if(result != -1){
		         bv1 = BoardDAO.getInstance().getBoard(bNum);
		      } 
	%>


	<!-- 게시판 -->
<br><br>
	<div class="container">

		<div class="row">

				<table class="table table-striped" style="text-align: center; border: 3px solid #dddddd">

					<thead>

						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>

					</thead>

					<tbody>

						<tr>

							<td style="width: 20%;"> [글 제목] </td>

							<td colspan="2"><%= bv1.getbTitle() %></td>

						</tr>

						<tr>

							<td>[작성자]</td>	

							<td colspan="2"><%= bv1.getbId() %></td>

						</tr>

						<tr>

							<td>[작성일]</td>	
							
							<td colspan="2"><%=  bv1.getbDate() %></td>

						</tr>

						<tr>

							<td>[내용]</td>	

							<td colspan="2" style="min-height: 200px; text-align: left;"><%= bv1.getbContents() %></td>

						</tr>

						

					</tbody>

				</table>	
				<br>
				<a href = "page.ido" class="btn btn-primary" style="margin-left:1380px;">[목록]</a>

				<%

				//글작성자 본인일시 수정 삭제 가능 

					if(sId != null && sId.equals(bv.getbId())){

				%>

						<a href="boardUpdate.jsp?bNum=<%= bNum %>" class="btn btn-primary">[수정]</a>

						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="BoardDeleteController?bNum=<%= bNum %>" class="btn btn-primary">
							[삭제]
						</a>

				<%					

					}

				%>

		</div>

	</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>