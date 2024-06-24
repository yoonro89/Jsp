<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로고가 박힌 정육면체 만들기 도전</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	perspective: 1000px;
}

.cube {
	width: 200px;
	height: 200px;
	position: relative;
}

.face {
	position: absolute;
	width: 200px;
	height: 200px;
	background-color: #EAEAEA;
	opacity: 0.3;
	display: grid;
	place-content: center;
	font-size: 50px;
}
.water_face {
	position: absolute;
	width: 200px;
	height: 200px;
	opacity: 0.9;
	display: grid;
	place-content: center;
	font-size: 50px;
}


/* 물 애니메이션 */
    .water_face {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 0;
        background: rgba(0, 128, 255, 0.5);
        animation: fill 3s forwards;
    }

    @keyframes fill {
        to {
            height: 70%;
        }
    }
</style>
</head>
<body>
	<div class="cube">
		<!-- 큐브를 만들건데 스크립트 안쓰고 CSS의 @키프레임스를 사용해서 만들예정 -->
		<div class="face"></div>
		
		
		<div class="water_face"></div>
	</div>
</body>
</html>