<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

 .container{
width: 100%;
} 

</style>
</head>


<body>

<jsp:include page="header.jsp"></jsp:include>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String sId = null;

		if (session.getAttribute("sId") != null) {

			sId = (String) session.getAttribute("sId");



		}

	%>
	<br><br><br><br>
<div class="container">

		<div class="row">

			<form method="get" action="BoardInsertController">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd; margin-left:550px; width:750px; height:750px;">

					<thead>

						<tr>

							<th colspan="2"

								style="background-color: #eeeeee; text-align: center; height:35px;">게시판 글 작성</th>

						</tr>
						
					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" style="width:680px; height:30px; margin-left:22px;"/></td>


						</tr>

						<tr>

							<td><textarea class="form-control" placeholder="글 내용" name="contents" maxlength="3000" style="height: 600px; width:700px;margin-left:12px;"></textarea></td>

						</tr>

					</tbody>

				</table>	
<%

			//if logined userID라는 변수에 해당 아이디가 담기고 if not null

			if (session.getAttribute("sId") != null) {

%>
<br><br>
<input type="submit" value="글쓰기" style="margin-left:890px; height:40px; width:100px; background-color: black; color: white" class="btn btn-primary pull-right"/>
				
<%

			} else {

%>
				
				<button class="btn btn-primary pull-right" onclick="if(confirm('로그인 하세요'))location.href='memberLoginForm.jsp';" type="button" >
				글쓰기
				</button>

<%

			}

%>			
			</form>

		</div>

	</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>