<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			window.onload = function(){
				//페이지 로드와 함께 가장 먼저 동작하는 영역
				
				//재생하고자 하는 비디오 목록 얻어오기
				let url = "movie_list_json.jsp";
				sendRequest(url, null, resFn, "GET");
			}
			
			function resFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;

					//얻어온 data를 실제 json구조로 변환
					//let json = eval(data);	//→ 보안성이 조금 떨어짐으로 잘 사용x
					let json = JSON.parse(data);
					//let json = ( new function('return ' + data ) )();
					
					//select태그에option을 추가
					let movie_select = document.getElementById("movie_select");
					
					for( let i = 0; i < json.length; i++ ){
						let option = document.createElement("option");
						option.innerHTML = json[i].title;
						option.value = json[i].path;
						movie_select.appendChild(option);
					}
				}
			}
			
			function movie_play(){
				let path = document.getElementById("movie_select").value;
				
				let my_video = document.getElementById("my_video");
				my_video.src = path;
				my_video.play();//재생
			}
		</script>
		
	</head>
	
	<body>
		<select id="movie_select" onchange="movie_play();">
			<option>:::재생할 영상을 선택하세요:::</option>
		</select>
		
		<br>
		<br>
		
		<video src="" id="my_video" controls="controls"
				width="720" height="400">
		
		</video>
	</body>
</html>