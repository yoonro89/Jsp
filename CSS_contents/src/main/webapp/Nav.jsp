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
    position: fixed;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    width: 200px;
    border-radius: 20px;
  }

  .menu {
    list-style: none;
    padding: 0;
    margin: 10px;
  }

  
  .menu li {
    display: none;
    margin: 2px 10px; 
  }

  .menu li.active {
    display: block;
  }

  .menu li a {
    display: block;
    padding: 10px;
    color: black;
  }

  .menu li a:hover {
    background-color: white;
    text-decoration: none;
  }

  .menu:hover {
    border: 3px solid white;
    border-radius: 5px;
  }
  
  h2 {
    margin: 0;
    padding: 10px;
    color: white;
  }
  
  a {
    text-decoration: none;
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
