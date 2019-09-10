
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

	</style>
	
	
<script type="text/javascript">
	function check()
		{
		    if(!document.update.title.value){
		        alert("제목을 입력하세요.");
		        return false;
		    }
		    
		    if(!document.update.contents.value){
		        alert("내용을 입력하세요.");
		        return false;
		    }

</script>
</head>
<body>

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
	%>

	<!-- 게시판 -->
	<br><br>
	<div class="container" >

		<div class="row">
				<form action="BoardUpdateController" method="post" name="update">
				<table class="table table-striped" style="text-align: center; border: 3px solid #dddddd; height:200px; width:60%; margin-left:400px;">

					<thead>

						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>

					</thead>
					
					<tbody>
						
						<tr>

							<td style="width: 20%;"> [글 제목] </td>

							<td colspan="2"><input type="text" value="<%= bv.getbTitle() %>" name="title"></td>

						</tr>

						<tr>

							<td colspan="2"><input type="hidden" value="<%= bv.getbNum() %>" name="num"></td>

						</tr>
						
						<tr>

							<td>[작성자]</td>	

							<td colspan="2"><input type="text" value="<%= bv.getbId() %>" name="sId" readonly="readonly"></td>

						</tr>
						

						<tr>

							<td>[작성일]</td>	
							
							<td colspan="2"><input type="text" value="<%=  bv.getbDate() %>" name="date" readonly="readonly"></td>

						</tr>

						<tr>

							<td>[내용]</td>	

							<td colspan="2" style="min-height: 200px; text-align: left;">
							<textarea name="contents" maxlength="3000" style="height: 100px; width:700px; margin-left:50px;" >
							<%-- <input type="text" value="<%=  bv.getbContents() %>" name="contents"> --%>
							<%=  bv.getbContents() %>
								</textarea>
							</td>

						</tr>

						

					</tbody>

				</table>
				<br>
				<input type="submit" value="수정완료" onclick="return check()" style="margin-left:1430px; height:40px; width:100px; background-color: black; color: white">
				</form>
				<br>
				<a href = "page.ido" class="btn btn-primary" style="margin-left:1460px;">[목록]</a>



		</div>

	</div>

</body>
</html>
