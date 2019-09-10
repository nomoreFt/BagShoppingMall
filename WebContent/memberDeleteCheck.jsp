<%@page import="com.bag.controller.HttpUtil"%>
<%@page import="com.bag.service.MembersService"%>
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
	String sId = (String)session.getAttribute("sId");
	String pw = request.getParameter("pw");
	System.out.println("deleteCheck"+sId);
	System.out.println("deleteCheck"+pw);
	
	// DB에서 아이디, 비밀번호 확인
	MembersService service = MembersService.getInstance();
	int check = service.loginCheck(sId, pw);
	
	// URL 및 로그인관련 전달 메시지
	String msg = "";
	int point;
	
	if(check == 1) { 
		
	    System.out.println("deleteCheck"+check);
	    
	    HttpUtil.forward(request, response, "memberDelete.do");
	    
	    
	}
%>

</body>
</html>