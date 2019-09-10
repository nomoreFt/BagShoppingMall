<%@page import="com.bag.service.MembersService"%>
<%@page import="com.bag.controller.HttpUtil"%>
<%@page import="com.bag.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String id= request.getParameter("id");
        String pw = request.getParameter("pw");
       
        // DB에서 아이디, 비밀번호 확인
		MembersService service = MembersService.getInstance();
		int check = service.loginCheck(id, pw);
		
        // URL 및 로그인관련 전달 메시지
        String msg = "";
        int point;
        
        if(check == 1) { 
        	
            session.setAttribute("sId", id);
            session.setMaxInactiveInterval(60*60);
            
            out.println("<script>");
            out.println("alert('로그인되었습니다. 환영합니다:)')");
            out.println("location.href='index.jsp'");
            out.println("</script>");
           /*  msg = "index.jsp"; */
        }
        else if(check == 0) // 비밀번호가 틀릴경우
        {
            msg = "memberLoginForm.jsp?msg=0";
            out.println("<script>");
            out.println("alert('비밀번호가 틀렸습니다 :)')");
            out.println("location.href='memberLoginForm.jsp'");
            out.println("</script>");
        /*     response.sendRedirect(msg); */
        }
        else    // 아이디가 틀릴경우
        {
            msg = "memberLoginForm.jsp?msg=-1";
            out.println("<script>");
            out.println("alert('아이디가 틀렸습니다 :)')");
            out.println("location.href='memberLoginForm.jsp'");
            out.println("</script>");
          /*   response.sendRedirect(msg); */
        }
         
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        
    %>
</body>
</html>