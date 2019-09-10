<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Join.css">

<script type="text/javascript">
    
        // 유효성체크 함수
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



<form  id = "form" action="memberRegis.do" method="post" name="userInfo" onsubmit="return check(); ">
<h1 id="head">회원가입</h1>
<hr class = "line">
   <table>
   <tr>
      <td class = "id">
            아이디
      </td>
      <td>
         <input class = "text" type="text" name="id" placeholder="(영문 대소문자/숫자,4~16자)" onkeydown="inputIdChk()">
      </td>
   </tr>
   <tr>
      <td class = "id">비밀번호</td>
      <td>
         <input class = "text" type="password" name="pw" placeholder="(영문 대소문자/숫자 조합, 8~16자)">
      </td>
   </tr>
   <tr>
      <td class = "id">비밀번호 확인</td>
      <td>
         <input class = "text" type="password" name="pwCheck">
      </td>
   </tr>
   <tr>
      <td class = "id" >이름</td>
      <td>
      <input class = "text" type="text" name="name">
      </td>
   </tr>
   <tr>
      <td class = "id">휴대전화</td>
      <td>
         <input class = "text" type="text" name="tel" placeholder="'-'를 제외하고 입력해주세요">
      </td>
   </tr>
   <tr>
      <td class = "id">주소</td>
      <td>
         <input class = "text" type="text" name="addr">
      </td>
   </tr>
   </table>
<h3 id="head2">추가정보</h3>
<hr class= "line">
<table>
   <tr>
      <td rowspan="3">
         <h4 id="head3">계좌정보</h4>
      </td>
      <td class = "id" >예금주  </td>
      <td><input class = "text" type="text" name="accname"></td>
   </tr>
   <tr>
      <td class = "id">은행명 </td>
      <td>
      <select name="accbank" class = "text">
      <option>-은행선택-</option>
      <option value="신헌은행">신헌은행</option>
      <option value="국밍은행">국밍은행</option>
      </select>
      </td>
   </tr>
   <tr>
      <td class = "id">계좌번호  </td>
      <td><input class = "text" type="text" placeholder="'-'와 숫자만 입력해주세요" name="accnum"></td>
   </tr>
</table>

<input type="reset" value="취소" id = "reset">
<input type="submit" value="회원가입" onclick="return session()"  id = "join"/>
</form>


<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>