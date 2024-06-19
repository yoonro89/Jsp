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
        perspective: 1000px;	/* perspective : 원근법 거리를 설정하여 3D 효과를 부여한다고함. */
    }
    .cube {
        width: 200px;
        height: 200px;
        position: relative;
        transform-style: preserve-3d;	/* 자식 요소의 3D 변환을 유지하는 역할 */
        animation: rotate 5s infinite linear;
    }
    .face {
        position: absolute;
        width: 200px;
        height: 200px;
        background-color: #0099bc;
        border: 1px solid #333;
        opacity: 0.7;
        display: grid;
        place-content: center;
        font-size: 50px;
    }
    
    /* 각면을 자식으로 순서대로 지정 */
    .face:nth-child(1) { /* 앞면 */
        transform: translateZ(100px);
    }
    .face:nth-child(2) { /* 뒷면 */
        transform: rotateY(180deg) translateZ(100px);
    }
    .face:nth-child(3) { /* 왼쪽면 */
        transform: rotateY(-90deg) translateZ(100px);
    }
    .face:nth-child(4) { /* 오른쪽면 */
        transform: rotateY(90deg) translateZ(100px);
    }
    .face:nth-child(5) { /* 위쪽면 */
        transform: rotateX(90deg) translateZ(100px);
    }
    .face:nth-child(6) { /* 아래쪽면 */
        transform: rotateX(-90deg) translateZ(100px);
    }
    
    /* 회전에니메이션을 정의해주는 애. 아래는 x축, y축 동시에 회전을 줌 */
    @keyframes rotate {
        0% { transform: rotateX(0deg) rotateY(0deg); }
        100% { transform: rotateX(360deg) rotateY(360deg); }
    }
</style>
</head>
<body>
<div class="cube"><!-- 큐브를 만들건데 스크립트 안쓰고 CSS의 @키프레임스를 사용해서 만들예정 -->
    <div class="face">sponi<br>vers</div> <!-- 앞면 -->
    <div class="face">스포니버스</div> <!-- 뒷면 -->
    <div class="face">윤세영</div> <!-- 왼쪽면 -->
    <div class="face">김민승</div> <!-- 오른쪽면 -->
    <div class="face">김민정</div> <!-- 위쪽면 -->
    <div class="face">문진영</div> <!-- 아래쪽면 -->
</div>
</body>
</html>