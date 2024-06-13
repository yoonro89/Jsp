<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>네비게이션 바</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }

  nav {
    background-color: #489CFF;
    margin: 0 auto;
    /* 
    width: 100%;
    border-radius: 20px;
    display: flex;
    justify-content: center; 가로방향으로 늘어놓고 li역시 가로로 늘어나는 ui느낌 */
    justify-content: space-between; /* 간격을 좁히기 위해 space-between 사용 */
    width: 80%;
    border-radius: 20px;
    display: flex;
    justify-content: space-around;
    padding: 20px 0;
  }

  .menu {
    list-style: none;
    padding: 0;
    margin: 0 10px; /* 각 ul 요소 사이의 간격을 줄이기 위해 마진 추가 */
    /* margin: 10px;
    display: flex;
    flex-direction: row; 
    margin: 0; 가로방향으로 늘어놓고 li역시 가로로 늘어나는 ui느낌 */
    position: relative;/* a태그 클릭시 그림자 넣어보기 설정*/
  }

  .menu li {
    display: none;
    /* margin: 2px 10px; 가로방향으로 늘어놓고 li역시 가로로 늘어나는 ui느낌*/ 
    margin: 2px 0;
  }

  .menu li.active {
    display: block;
  }

  .menu li a {
    display: block;
    padding: 10px;
    color: black;
    transition: color 0.3s, text-shadow 0.3s;/* 가장 마지막에 눌린 친구 흔적남기기 */
  }

  .menu li a:hover {
    /* background-color: white; 그냥 하얀색으로 늘어나는 설정*/
    background-color: #B4FFFF; /* li 호버 시 배경색 설정 */
    text-decoration: none;
    border-radius: 5px; /* 호버시 배경색에 둥근 모서리 추가 */
  }

  .menu:hover {
    /* border: 3px solid white;
    border-radius: 5px; 선택시 하얀태두리 출력 but 살짝살짝 움직이는게 거슬림...;*/
    
    background-color: #ffffff; /* 호버 시 배경색 변경 */
    border-radius: 5px; /* 둥근 모서리 */
    padding: 5px; /* 테두리 대신 패딩 추가 */
  }
  .menu:hover h2 {
    color: black; /* 테두리 거슬려서 추가해본 호버 시 제목 글자 색상 변경 추가*/
  }
  
  h2 {
    margin: 0;
    padding: 10px;
    color: white;
  }
  
  a {
    text-decoration: none;
  }
  
  /* 클릭된 상태의 스타일 */
  .menu li a.clicked {
    color: white;
    text-shadow: 0 0 15px magenta;
  }
</style>
<script>
  function showMenu(menuNumber) {
    var menu = document.getElementById('menu' + menuNumber);
    var lis = menu.getElementsByTagName('li');
    for (var i = 0; i < lis.length; i++) {
      lis[i].style.display = lis[i].style.display === 'block' ? 'none' : 'block'; 
    }
  }
  
  //a 요소 클릭 시 스타일 변경
  document.addEventListener('DOMContentLoaded', function() {
    var links = document.querySelectorAll('.menu li a');
    links.forEach(function(link) {
      link.addEventListener('click', function(event) {
        event.preventDefault(); // 링크 기본 동작 방지
        links.forEach(function(lnk) {
          lnk.classList.remove('clicked');
        });
        link.classList.add('clicked');
      });
    });
  });
</script>
</head>
<body>
  <nav>
    <ul class="menu" id="menu1">
      <h2><a href="#" class="menu-link" onclick="showMenu(1)">1번 메뉴</a></h2>
      <li><a href="#">1번 메뉴1</a></li>
      <li><a href="#">1번 메뉴2</a></li>
      <li><a href="#">1번 메뉴3</a></li>
    </ul>
    <ul class="menu" id="menu2">
      <h2><a href="#" class="menu-link" onclick="showMenu(2)">2번 메뉴</a></h2>
      <li><a href="#">2번 메뉴1</a></li>
      <li><a href="#">2번 메뉴2</a></li>
      <li><a href="#">2번 메뉴3</a></li>
    </ul>
    <ul class="menu" id="menu3">
      <h2><a href="#" class="menu-link" onclick="showMenu(3)">3번 메뉴</a></h2>
      <li><a href="#">3번 메뉴1</a></li> 
      <li><a href="#">3번 메뉴2</a></li>
      <li><a href="#">3번 메뉴3</a></li>
    </ul>
  </nav>
</body>
</html>