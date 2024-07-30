<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Falling Snow Animation</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    	*{
    	margin:0;
    	padding:0;
    	}
        .snow_wrap {
            overflow: hidden;
            width: 100%;
            height: 100vh;
        }
        .snow {
            background: #141f3e;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <div class="snow_wrap">
        <canvas class="snow"></canvas>
    </div>
    
    
    <script>
        $(document).ready(function() {
            const canvas = $('.snow')[0];
            const context = canvas.getContext('2d');
            let canvasWidth = $('.snow_wrap').width();
            let canvasHeight = $('.snow_wrap').height();
            let lastDeviceType = window.innerWidth < 768 ? 'mobile' : 'desktop';
            let snowParticles = [];

            // Particle 생성 함수
            function createParticle() {
                this.x = Math.random() * canvasWidth;
                this.y = Math.random() * canvasHeight;
                this.vx = Math.random() * 2 - 1;
                this.vy = Math.random() * 4 + 1;
                this.color = `rgba(255, 255, 255, ${Math.random()})`;
                this.radius = Math.random() * 5 + 2;
            }

            // Particle 생성
            function createParticles() {
                snowParticles = [];
                const particleCount = lastDeviceType === 'mobile' ? 40 : 100;
                for (let i = 0; i < particleCount; i++) {
                    snowParticles.push(new createParticle());
                }
            }

            // Canvas 크기 조정
            function setCanvasSize() {
                const currentDeviceType = window.innerWidth < 768 ? 'mobile' : 'desktop';
                if (currentDeviceType !== lastDeviceType) {
                    lastDeviceType = currentDeviceType;
                    createParticles();
                }
                canvasWidth = $('.snow_wrap').width();
                canvasHeight = $('.snow_wrap').height();
                canvas.width = canvasWidth;
                canvas.height = canvasHeight;
            }

            // Particle 그리기
            function draw() {
                context.clearRect(0, 0, canvasWidth, canvasHeight);
                snowParticles.forEach(function(particle) {
                    context.beginPath();
                    let gradient = context.createRadialGradient(particle.x, particle.y, 0, particle.x, particle.y, particle.radius);
                    gradient.addColorStop(1, particle.color);
                    gradient.addColorStop(1, "rgb(66, 66, 66)");
                    context.fillStyle = gradient;
                    context.arc(particle.x, particle.y, particle.radius, Math.PI * 2, false);
                    context.fill();
                    particle.x += particle.vx;
                    particle.y += particle.vy;
                    if (particle.x < -50) particle.x = canvasWidth + 50;
                    if (particle.y < -50) particle.y = canvasHeight + 50;
                    if (particle.x > canvasWidth + 50) particle.x = -50;
                    if (particle.y > canvasHeight + 50) particle.y = -50;
                });
            }

            $(window).resize(setCanvasSize);
            setCanvasSize();
            createParticles();
            setInterval(draw, 33);
        });
    </script>
</body>
</html>
