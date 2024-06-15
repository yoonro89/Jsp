<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Ajax(Asynchronus Javascript & XML) : 비동기 통신
	 자바스크립트를 이용한 백그라운드 통신기술로써 하나의 웹페이지 안에서
	 변경사항이 발생한 특정한 일부분에 대해서만 부분 갱신이 가능해 짐 -->
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Ajax연동을 위한 httpRequest.js참조 -->
		<script src="js/httpRequest.js">/* 외부영역 참조를 위해 생성한 스크립트의 경우 내부에 내용을 작성할 수 없다 */</script>
		<!-- 새로운 스크립트를 생성하여 내용을 작성한다 -->
		<script>
			function send(){
				let dan = document.getElementById("dan").value;
				
				//dan을 Ajax를 통해 서버로 전달
				let url = "gugudan_ajax.jsp";
				let param = "dan="+dan;
				
				//sendRequest(url, 전송할 파라미터, 콜백메서드, 전송방식);
				sendRequest(url, param, resultFn, "GET");/* GET이나 POST가 큰 영향을 미치지 않음 */
			}//send()
			
			function resultFn(){
				console.log(xhr.readyState + "/" + xhr.status);
				//xhr.readyState
				//0 - 초기화 오류
				//1, 2, 3 - 페이지 로딩
				//4 - 페이지 로드 완료
				
				//xhr.status
				//200 - 이상없음
				//404, 500 - 경로, 서버에러 등...
				if( xhr.readyState == 4 && xhr.status == 200 ){
					//콜백으로 도착한 데이터를 읽어오기
					let data = xhr.responseText;
					
					let disp = document.getElementById("disp");
					disp.innerHTML = data;
				}
			}
			
		</script>
		
	</head>
	
	<body>
		단 : <input id="dan">
		<input type="button" value="확인" onclick="send();">
		<br>
		<div id="disp"></div>
	</body>
</html>