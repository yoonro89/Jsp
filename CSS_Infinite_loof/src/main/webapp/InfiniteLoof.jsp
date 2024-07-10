<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	font-family: Arial, sans-serif;
}

.carousel-container {
	overflow: hidden;
	width: 300px;
	border: 2px solid #333;
}

.carousel {
	display: flex;
	transition: transform 0.5s ease;
	will-change: transform;
}

.carousel-item {
	min-width: 300px;
	text-align: center;
	background-color: #f1f1f1;
	line-height: 200px;
	font-size: 2em;
	border-right: 2px solid #333;
}

.carousel-button {
	margin: 10px;
	padding: 10px 20px;
	font-size: 1em;
	cursor: pointer;
}
</style>

<script>
const carousel = document.querySelector('.carousel');
const items = document.querySelectorAll('.carousel-item');
const prevButton = document.querySelector('.carousel-button.prev');
const nextButton = document.querySelector('.carousel-button.next');

let currentIndex = 0;

function showItem(index) {
    const offset = -index * 300;
    carousel.style.transform = `translateX(${offset}px)`;
}

function nextItem() {
    currentIndex = (currentIndex + 1) % items.length;
    showItem(currentIndex);
}

function prevItem() {
    currentIndex = (currentIndex - 1 + items.length) % items.length;
    showItem(currentIndex);
}

nextButton.addEventListener('click', nextItem);
prevButton.addEventListener('click', prevItem);

// Initialize the carousel to show the first item
showItem(currentIndex);

</script>

</head>
<body>
	<div class="carousel-container">
		<div class="carousel">
			<div class="carousel-item">1</div>
			<div class="carousel-item">2</div>
			<div class="carousel-item">3</div>
			<div class="carousel-item">4</div>
			<div class="carousel-item">5</div>
		</div>
	</div>
	<button class="carousel-button prev">Previous</button>
	<button class="carousel-button next">Next</button>

</body>
</html>