<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSON(Javascript Object Notation)
	: 서로다른 프랫폼에서 데이터를 교환하기 위한 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		let p = {'name':'일길동', 'age':20, "tel":'010-111-1111'};
		document.write("이름 : " + p.name + "<br>");
		document.write("나이 : " + p.age + "<br>");
		document.write("전화 : " + p['tel'] + "<br>");
		
		document.write("<hr>");
		
		let sido = [{'name':'일길동', 'age':30},
					{'name':'이길동', 'age':32},
					{'name':'삼길동', 'age':35}];
		document.write(sido[0].name + " / " + sido[0].age + "<br>");
		document.write(sido[2].name + " / " + sido[2].age + "<br>");
		
		document.write("<hr>");
		
		let course = {'name':'백앤드개발과정', 
					'start':'2024-02-01', 
					'end':'2024-08-01', 
					'sub':['java', 'sjp', 'js'], 
					'student':[{'name':'홍길동', 'age':25}, 
								{'name':'박길동', 'age':27}]};
		
		document.write("과목명 : " + course.name + "<br>");
		document.write("시작일 : " + course.start + "<br>");
		document.write("종료일 : " + course.end + "<br><br>");
		
		document.write("과목 : " + 
				course.sub[0] + " / " + 
				course.sub[1] + " / " + 
				course.sub[2] + "<br><br>");
		
		document.write("학생들<br>");
		document.write("1." + course.student[0].name + " / " + course.student[0].age + "<br>");
		document.write("2." + course.student[1].name + " / " + course.student[1].age + "<br>");
		
	</script>

</head>
<body>

</body>
</html>