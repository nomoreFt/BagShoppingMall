<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
   margin: 0;
   padding: 0;
}
/* body{
  /*  font: .75em Nanum Gothic,Verdana,Dotum,AppleGothic,sans-serif,xeicon; */
} */

h3 {
   /* font-size: 25px; */
    margin-right: 10px;
}

#loginForm{
margin-top:5%;
margin-left:35%;
position: absolute;
}

.text{
width: 321px;
height: 45px;
padding: 2px 2px 2px 10px;
border: 1px solid #ddd;
color: #333;
font-size: 14px;
line-height: 45px;
letter-spacing: 0.08em;
font-weight: normal;
}

#loginbtn{
background-image: url('./krim/login.png');
width: 335px;
height: 50px;
margin-left: 92px;
font-family: 함초롬돋움,NanumGothic,돋움,Dotum;
color: white;
font-size: 18px;
margin-top: 20px;
margin-bottom: 10px;
margin-left : 30%;
}

#foot{
font-family: 함초롬돋움,NanumGothic,돋움,Dotum;
margin-left : 60%;
}

#table{
margin-left: 13%;
}

.id{
width:80px;
margin-right:20px;
font-family: 함초롬돋움,NanumGothic,돋움,Dotum;
font-size: 20px;"
}

#welcome{
display: block;
clear: both;
margin: 0 0 30px;
text-align: center;
font-size: 12px;
font-weight: 400;
color: #999;
letter-spacing: -0.03em;
margin-left : 30%;
}

#head{
display: block;
clear: both;
margin-bottom : 10px;
margin-left : 30%;
border-bottom: 0;
text-align: center;
font-size: 35px;
font-weight: 400;
color: #333;
letter-spacing: -0.03em;
}

</style>


<script type="text/javascript">
	function checkValue()
		{
		    if(!document.login.id.value){
		        alert("아이디를 입력하세요.");
		        return false;
		    }
		    
		    if(!document.login.pw.value){
		        alert("비밀번호를 입력하세요.");
		        return false;
		    }

</script>

</head>
<body>


<jsp:include page="header.jsp"></jsp:include>


<div class="container">
<form action="memberLogin.do" method="post" name="login" onsubmit="return checkValue()" id="loginForm">
   <div class="titleArea">
   	<h2 id = "head">PANDABAG</h2>
    <span id = "welcome">WELCOM BACK</span>
   </div>
   
   <table id = "table">
      <tr> 
         <th>
            <h1 class = "id">
           		 아이디
            </h1>
         </th>
         <td>
            <input type="text" name="id" class="text">
         </td>
     </tr>
     <tr>
     <th>
            <h1 class = "id">
            		비밀번호
            </h1>
         </th>
        <td>
            <input type="password" name="pw" class = "text">
         </td>
     </tr>
   </table>
           <input type="submit" value="로그인" id="loginbtn">
   <br>
   
<div id = "foot">

<a href="whatId.jsp">아이디</a>
<a href="whatPw.jsp">비밀번호 찾기</a>
</div>
</form>

</div><jsp:include page="footer.jsp"></jsp:include>


</body>
</html>