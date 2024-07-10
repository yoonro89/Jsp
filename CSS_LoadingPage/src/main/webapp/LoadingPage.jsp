<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	box-sizing: border-box;
	padding: 0;
	margin: 0 auto;
}

.mask {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0);
	z-index: 9999;
	opacity: .5;
	transition: 0.5s ease;
}

.wrap {
	position: relative;
	height: 100%;
	background: #157ed1;
	text-align: center;
}

.loadingImg {
	position: relative;
	display: block;
	top: 50vh;
	transform: translateY(-50%);
}
</style>

<script>
	const mask = document.querySelector('.mask');
	const html = document.querySelector('html');

	html.style.overflow = 'hidden'; //로딩 중 스크롤 방지
	window.addEventListener('load', function() {
		//아래 setTimeout은 로딩되는 과정을 임의로 생성하기 위해 사용. 실제 적용 시에는 삭제 후 적용해야함.
		setTimeout(function() {
			mask.style.opacity = '0'; //서서히 사라지는 효과
			html.style.overflow = 'auto'; //스크롤 방지 해제
			mask.style.display = 'none';
		}, 2000);
	})
</script>

</head>
<body>
	<!-- 로딩 화면 -->
	<div class="mask">
		<img class="loadingImg" src='https://i.ibb.co/20zw80q/1487.gif'>
	</div>
	<!-- 로딩화면 끝 -->
	<div class="wrap">
		<img src="https://images.unsplash.com/photo-1689122777005-44185708d220?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80" alt=""> <img src="https://images.unsplash.com/photo-1670831945939-c8ec61856016?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80" alt=""> <img src="https://images.unsplash.com/photo-1670899555263-4546f62ebce9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80" alt="">
	</div>
</body>
</html>