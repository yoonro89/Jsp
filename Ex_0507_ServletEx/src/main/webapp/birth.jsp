<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let birth = document.getElementById("num").value;
				if( birth.length != 8 ){
					alert("주민번호는 8자리를 입력해야함")
					return;
				}
				
				//출생년도
				let y = birth.substr(0, 4);
				f.year.value = y;
				
				//나이
				let a = 2024 - Number(f.year.value) + 1;
				f.age.value = a;
				
				//계절
				switch( birth.substr(4, 2) ){
				case "03": case "04": case "05":
					f.season.value = "봄";
					break;
				case "06": case "07": case "08":
					f.season.value = "여름";
					break;
				case "09": case "10": case "11":
					f.season.value = "가을";
					break;
				case "01": case "02": case "12":
					f.season.value = "겨울";
					break;
				}
				
				f.action = "sub.do";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form action="sub.do">
			주민번호 앞자리 : <input id="num" placeholder="(ex)20201225">
			<input type="button" value="알아보기" onclick="send(this.form);">
			
			<input type="hidden" name="year">
			<input type="hidden" name="age">
			<input type="hidden" name="season">
		</form>
	</body>
</html>