<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.card{	display: inline-grid;/* grid개념은 공부가 필수임 css하려면... */
				color: white;
				transition: transform 0.1s;/* 변하는 시간, 클릭시랑 호버시 등의 액션에 따라 다르게 줘야 극적임 */
				transform: perspective(800px)/* 원근감 */ rotateY(0deg);/* 축을 잡는 개념(돌리는 방향이 아님, 돌아가는 축) */
				transform-style: preserve-3d;/* 여기서 설정해두면 부모의 3D 효과가 자식에도 적용됨(없으면 잘 동작하지 않는다고 해서 넣어둠) */
		}
		
		.card:active{/* 마우스를 클릭하고 있는 동안 [hover, active, visited(원클릭이후)]*/
			transform: perspective(800px)/* 원근감 */ rotateY(180deg);/* 뒤집히는 정도 */
		}
		/* 원근감
			perspective값이 작으면 가까이서 보는 것처럼,
			값이 크면 멀리서 보는 것처럼 보이게 된다. */
		.card > *{
			grid-area: 1 / 1 / 1 / 1;/* grid를 사용해서 두개의 면을 합친것 */
			width: 150px;
			height: 100px;
			padding: 10px;
			border-radius: 8px;
			backface-visibility:hidden;/* 호버시에 backface가 안보이게 되는 설정 */
		}
		
		.front{
			background: radial-gradient(white 15%, #0099bc);
		}
		/* 	linear-gradient / radial-grandient 2종류
			
			radial사용시 기본값은Ellipse(타원형)이고 linear의 방향 대신 circle을 입력해서 정 원으로 변경 가능.
			색상은 안에서 밖으로 나가는 느낌(시작점이 안, 끝점이 밖)*/
		.back{
			background: radial-gradient(white 15%, #0099bc);
			transform: rotateY(180deg);/* 앞면이랑 반대로 보여져야하므로 반전시켜둠 */
		}
		/*	색상의 그라데이션을 주는 방식
			배경에 두 가지 색을 섞는 형태로 출력됨
			기본 형태는 linear-gradient(방향이나 각도, 색상이랑 정지점1, 색상이랑 정지점2, .... 색상이랑 정지점n);
			기본 방향및 각도를 설정하지 않을 경우 위에서 아래로 'to bottom'이 적용됨
			▶방향 및 각도 지정 키워드는 아래에 써둠
			　to bottom, to right, to top, to left
			　0deg, 90deg, 180deg, 270deg 등
			▶색상이랑 정지점
			　색상을 지정하고, 색상이 어느 정도 지점까지 선명하게 표시될 것인지를 수치로 지정하는 방식.
			　개수는 원하는 만큼 지정 가능하고(n이라고 표기함) 색상은 생략하면 사용 의미가 없어짐.
			　정지점은 생략 가능하고, 생략시에는 알아서 잘 섞임...;(수동으로 조절하시길;;)
			★정지점을 각색상에 적용하여, 섞을 수도 분리할 수도 있다는 얘기임(써보면 알게됨^^) */
	</style>
</head>
<body>
	<div class="card">
		<div class="front">앞면 로고</div>
		<div class="back">뒷면 로고</div>
	</div>
</body>
</html>