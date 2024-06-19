<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			*{margin:0;
			  padding:0;}
			
			nav { width: 100%;
				  height: 70px;
				  position: fixed;
				  background-color: #0099bc;	  
			}
			
			input {	padding: 3px;
					font-size: 20px;
			}
			
			.logo {	display: inline-block;
		            float: left;
		            margin: 5px;
	        }
			.left {	display: inline-block;
		            float: left;
		            margin-top: 13px;
		            margin-left: 20px;
	        }
	        
	        .right {display: inline-block;
	            	float: right;
	            	margin-top: 20px;
		            margin-right: 20px;
	        }
	        
			.searchbox {width: 250px;
						height: 36px;
						border:none;
						border-radius: 15px;
						text-align: center;
						font-size: 20px;
						 
			}
			
		</style>
		<script>
			//홈버튼 구현
			function home(){
				
			}//━━━━━━━━━━━━━━━━━━━━━┛
			
			//검색버튼 구현
			function search(){
				
			}//━━━━━━━━━━━━━━━━━━━━━┛
			
			//로그인 구현
			function signin(){
				
			}//━━━━━━━━━━━━━━━━━━━━━┛
			
			//회원가입 구현
			function signup(){
				
			}//━━━━━━━━━━━━━━━━━━━━━┛
			
		</script>
	</head>
	
	<body>
		<nav>
			<div class="logo">
				<img src="https://avatars.githubusercontent.com/u/172472719?s=60&amp;v=4" onclick="location.href='main.do???아직안정함???';">
			</div>
			<div class="left">
				<input class="searchbox" type="text" placeholder="검색어를 입력해주세요.">&nbsp;
				<input class="searchbutton" type="button" value="search" onclick="search(this.form);">
			</div>
			<div class="right">
				<input class="signin" type="button" value="SignIn" onclick="signin(this.form);">&nbsp;&nbsp;|&nbsp;
				<input class="signup" type="button" value="SignUp" onclick="signup(this.form);">
			</div>
		</nav>
	</body>
</html>