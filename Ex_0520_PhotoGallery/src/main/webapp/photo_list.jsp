<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/photo.css">
		
		<script>
			function del(f){
				let idx = f.idx.value;
				let pwd = f.pwd.value;	//원본 비번
				let pwd2 = f.pwd2.value;//삭제를 위해 입력한 비번
				
				if( pwd != pwd2 ){
					alert("비밀번호 불일치");
					return;
				}
				
				if(!confirm("정말 삭제 하시겠습니까?")){
					return;
				}
				
				f.method = "post";
				f.action = "photo_del.do";
				f.submit();
			}
			
			function download(filename){
				location.href="download.do?dir=/upload/&filename="+encodeURIComponent(filename);
			}
		</script>
		
	</head>
	
	<body>
		<div id="main_box">
			<h1>::: PHOTO GALLERY</h1>
			
			<div align="center" style="margin:10px">
				<input type="button" value="사진등록"
						onclick="location.href='photo_insert_form.jsp'">
			</div>
			
			<div id="photo_box">
				
				<c:if test="${ empty list }">
					<div align="center">등록된 사진이 없습니다.</div>
				</c:if>
				
				<c:forEach var="vo" items="${ list }">
					<div class="photo_type">
						<img src="upload/${ vo.filename }">
						
						<div class="title">${ vo.title }</div>
						
						<form>
							<input type="hidden" name="idx" value="${vo.idx}">
							<input type="hidden" name="pwd" value="${vo.pwd}">
							<input type="hidden" name="filename" value="${vo.filename}">
							
							<div align="center">
								<input type="password" name="pwd2" size="5">
								<input type="button" value="삭제" onclick="del(this.form);">
								<input type="button" value="다운" onclick="download('${vo.filename}');">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>