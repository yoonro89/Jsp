<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let title = f.title.value;
				let photo = f.photo.value;
				
				if(title == ''){
					alert("제목을 입력하세요");
					return;
				}
				if(photo = ''){
					alert("파일을 선택하세요");
					return;
				}
				
				f.action = "upload.do";
				f.submit();
				
			}
		</script>
		
		
	</head>
	
	<body>
		<!-- 파일 업로드시 고려사항
		1.전송방식 : post
		2.enctype : 파일을 전송할떄 사용할 인코딩 방법 -->
		<form method="post" enctype="multipart/form-data">
		
			제목<input name="title"><br>
			첨부<input type="file" name="photo"><br>
			<input type="button" value="업로드" onclick="send(this.form);">
		
		</form>
	</body>
</html>