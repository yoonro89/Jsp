<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//EL(Expression Language) : jsp에서 사용하는 표현식을 간결하게 해 주는 표현방식(표현언어)
	//**EL로 값을 표현하려면 jsp의 내장객체 4개 영역중 한곳에 데이터가 저장되어 있어야 한다**
	/*
	1) pageScope : 현재 페이지에서만 값을 공유할 수 있도록 하는 영역					→ 페이지 내에서 지역변수처럼 사용된다.
	2)★requestScope : 최대 두 개의 페이지에서 값을 공유할 수 있도록 하는 영역			→ http요청을 WAS가 받아서 웹 브라우저에게 응답할 때까지 변수가 유지되는 경우 사용한다.
	3)★sessionScope : 하나의 웹 브라우저에서 모두가 값을 공유할 수 있도록 하는 영역		→ 웹 브라우저 별로 변수가 관리되는 경우 사용한다.
	4) applicationScope : 같은 프로젝트간 값의 공유가 가능하도록 하는 영역			→ 웹 어플리케이션이 시작되고 종료될 때까지 변수가 유지되는 경우 사용한다.
	*/
	
	String msg = "안녕";
	
	//page영역에 값 담기
	pageContext.setAttribute("my_msg", msg);
	
	//request영역에 값 담기
	request.setAttribute("my_msg", "나는 request");
	
	//session.영역에 값 담기
	session.setAttribute("my_msg2", "나는 session");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	JSP의 표현식 : <%= msg %><br>
	EL표현식1 : ${ pageScope.my_msg }<br>
	EL표현식2 : ${ requestScope.my_msg }<br>
	EL표현식3 : ${ sessionScope.my_msg2 }<br>
	EL표현식(생략식) : ${ my_msg2 }<br>
	EL표현식(생략식) : ${ my_msg }<br>
	EL표현식(파라미터) : ${ param.msg }<br>
	<!-- 생략식 사용시 영역 참조순서
		 1) page
		 2) request
		 3) session
		 4) application -->
</body>
</html>