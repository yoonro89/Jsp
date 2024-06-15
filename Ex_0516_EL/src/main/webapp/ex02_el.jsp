<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		EL표기법의 연산자들<br>
		\${ 1 + 1 } = ${ 1 + 1 }<br>
		\${ 2 - 1 } = ${ 2 - 1 }<br>
		\${ 3 * 2 } = ${ 3 * 2 }<br>
		\${ 10 / 3 } = ${ 10 / 3 }<br>
		\${ 10 % 3 } = ${ 10 % 3 } or ${ 10 mod 3 }<br>
		\${ 3 > 2 } = ${ 3 > 2 } or ${ 3 gt 2 }<br>
		\${ 3 >= 2 } = ${ 3 ge 3 }<br>
		\${ 3 < 2 } = ${ 3 lt 2 }<br>
		\${ 3 <= 2 } = ${ 3 le 2 }<br>
		\${ 3 == 2 } = ${ 3 eq 2 }<br>
		\${ 3 != 2 } = <%-- "${ 3 ne 2 }"<br>	!=의 경우 not equals의 약자 ne를 사용한다 --%>
		<hr>
		현재 파라미터 : ${ empty param.msg ? '값 없음' : param.msg }<br>
		
		파라미터 : ${ param.msg eq null or param.msg eq '' ? '갑 없음' : param.msg }
		
	</body>
</html>