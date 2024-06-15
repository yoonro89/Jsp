<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//JSP(JAVA Server Page) : 연산능력을 갖고있는 HTML이다.
	//< % 스크립트 릿(scriptLet) % > : jsp에서 자바코드를 사용하고자 할 때 지정하는 영역
	
	//request는 서블릿의 객체지만, 구조상jsp가 서블릿으로 변환되기 때문에
	//jsp에서도 사용이 가능하다.
	String ip = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		&lt;%@ 내용 %&gt; : jsp헤더 - 페이지 로드시 인코딩, import등의 기본 설정<br>
		&lt;% 자바코드 %&gt; : 스크립트 릿 - jsp에서 자바코드를 사용하고자 할 때 지정하는 영역<br>
		&lt;%= 변수명 %&gt; : 스크립트 릿에서 생성한 변수를 출력하는 영역<br>
		&lt;%= 변수명; %&gt; : 출력코드에서는 ;을 사용할 수 없다<br> 
		<%= ip %>님 환영합니다
	</body>
</html>