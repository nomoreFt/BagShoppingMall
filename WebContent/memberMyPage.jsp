<%@page import="com.bag.vo.MembersVO"%>
<%@page import="com.bag.service.MembersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Mypage.css">

<script type="text/javascript">
function check()
{
   
    if(!document.userInfo.id.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    //아이디 유효성 검사 (영문소문자, 숫자만 허용)
    for (i = 0; i < document.userInfo.id.value.length; i++) {
        ch = document.userInfo.id.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 대소문자, 숫자만 입력가능합니다.")
            document.userInfo.id.focus();
            document.userInfo.id.select();
            return false;
        }
    }
    
     
  //아이디에 공백 사용하지 않기
    if (document.userInfo.id.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        document.userInfo.id.focus();
        document.userInfo.id.select();
        return false;
    }
  
    //아이디 길이 체크 (4~12자)
    if (document.userInfo.id.value.length<4 || document.userInfo.id.value.length>16) {
        alert("아이디를 4~16자까지 입력해주세요.")
        document.userInfo.id.focus();
        document.userInfo.id.select();
        return false;
    }
    
    if(!document.userInfo.pw.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
  //비밀번호 유효성 검사 (영문소문자, 숫자만 허용)
    for (i = 0; i < document.userInfo.pw.value.length; i++) {
        ch = document.userInfo.pw.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("비밀번호는 대소문자, 숫자만 입력가능합니다.")
            document.userInfo.pw.focus();
            document.userInfo.pw.select();
            return false;
        }
    }
  
    //비밀번호 길이 체크(4~8자 까지 허용)
    if (document.userInfo.pw.value.length<8 || document.userInfo.pw.value.length>16) {
        alert("비밀번호를 8~16자까지 입력해주세요.")
        document.userInfo.pw.focus();
        return false;
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.userInfo.pw.value != document.userInfo.pwCheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
    
    
    if(!document.userInfo.name.value) {
        alert("이름을 입력해 주세요");
        return false;
    }
    
    if(document.userInfo.name.value.length<2){
        alert("이름을 2자 이상 입력해주세요.")
        document.userInfo.name.focus();
        return false;
    }
    
    if(!document.userInfo.tel.value) {
        alert("핸드폰번호를 입력해 주세요");
        return false;
    }
    if (document.userInfo.tel.value.indexOf("-") >= 0) {
        alert("핸드폰번호는'-'를 제외하고 입력해주세요.")
        document.userInfo.tel.focus();
        document.userInfo.tel.select();
        return false;
    }
    
    if (document.userInfo.tel.value.length>11) {
    alert("핸드폰번호를 정확하게 입력해 주세요")
 }
    
    
    if(!document.userInfo.juso.value) {
        alert("주소를 입력해 주세요");
        return false;
    }
    
    if(!document.userInfo.juso.value.length<11){
       alert("주소를 자세하게 입력해 주세요");
    }
    
}
</script>
</head>
<body>


<jsp:include page="/header.jsp"></jsp:include>


<%
   
	String sId = (String)session.getAttribute("sId");
	MembersVO mv = MembersService.getInstance().searchMe(sId);
	
	if(sId.isEmpty()){
		response.sendRedirect("index.jsp");
	}
	
%>

<form id= "form" action="memberUpdate.do" name="userInfo" method="post" onsubmit="return check()">
<h1 id = "head">마이페이지</h1>
<h2 id="head2">어서오세요. <%=mv.getName() %> 님 :)</h2>
<h3 id="head3">기본정보</h3>
<hr>
<br>
   <table>
   <tr>
      <td class= "id">아이디
      </td>
      <td>
         <input class= "text" type="text" name="id" value="<%=mv.getId() %>">
      </td>
   </tr>
   <tr>
      <td class= "id">비밀번호
      </td>
      <td>
         <input class= "text"  type="password" name="pw">
      </td>
   </tr>
   <tr>
      <td class= "id">비밀번호 확인
      </td>
      <td>
         <input class= "text"  type="password" name="pw2">
      </td>
   </tr>
   <tr>
      <td class= "id">이름
      </td>
      <td>
      <input class= "text"  type="text" name="name" value=<%=mv.getName() %>>
      </td>
   </tr>
   <tr>
      <td class= "id">휴대전화
      </td>
      <td>
         <input class= "text"  type="text" name="tel" value=<%=mv.getTel() %>>
      </td>
   </tr>
   <tr>
      <td class= "id">주소
      </td>
      <td>
         <input class= "text" type="text" name="addr" value=<%=mv.getAddr() %>>
      </td>
   </tr>
   </table>
<h3 id="head3">추가정보</h3>
<hr class ="line">
<table>
   <tr>
   <%
   String accName = null;
      if(mv.getAccname() == null || mv.getAccname() == "" || mv.getAccname() == "null"){
         accName = "";
      } else {
    	  accName = mv.getAccname();
      }
   %>
      <td rowspan="3"><h4 id="head4">계좌정보</h4></td>
      <td class= "id">예금주  </td>
      <td><input class= "text" type="text" name="accname" value=<%=accName%>></td>
   </tr>
   <tr>
      <td class= "id">은행명 </td>
      <td>
      <select name="accbank" class= "text" >
      <option value="은행선택" >-은행선택-</option>
      <option value="신헌은행">신헌은행</option>
      <option value="국밍은행">국밍은행</option>
      </select>
      </td>
   </tr>
   <tr>

   <%
   String accNum = null;
      if(mv.getAccnum() == null || mv.getAccnum() == "" || mv.getAccnum() == "null"){
         accNum = "";
      } else {
    	  accNum = mv.getAccnum();
      }
   %>
      <td class= "id" >계좌번호  </td>
      <td><input class= "text" type="text" name="accnum" value=<%=accNum %>></td>
   </tr>
</table>
 <table id = "point">
   <tr>
         <td>
            <h4 id = "head5">보유포인트</h4>
         </td>
            
         <td>
            <p> 100 </p>
         </td>
         
         <td>
            <h4 class="id">Point</h4>
         </td>
   </tr>
</table>
<input id = "out" type="button" value="회원탈퇴" onclick="location.href='memberDelete.jsp'">
<input id = "go" type="submit" value="수정완료">
</form> 


<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>