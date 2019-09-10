<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/memberDelete.css">

<script type="text/javascript">
    function check()
   {
      
	 if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
   } 
</script>


</head>
<body class="font">

<jsp:include page="/header.jsp"></jsp:include>


   <form id = "form" method="post" action="memberDeleteCheck.jsp" name="userInfo" onsubmit="return check()">
 <h1>회원탈퇴</h1>
   <hr class = "line">
      <table>
         <tr>
            <td>
               <input class = "text" type="password" name="pw" placeholder="비밀번호 확인">
            </td> 
            <td rowspan="3">
               <input id = "btn" type="submit" value="확인">
            </td>
         </tr>
      </table>
   </form>


<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>