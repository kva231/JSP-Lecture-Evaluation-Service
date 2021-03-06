<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--
	반응형 웹에 사용.
	initial-scale: 페이지 처음 로드 시 초기 줌 레벨 설정
	shrink-to-fit=no: 애플의 사파리 브라우저(11이전 버전)에 영향. 내용이 viewport보다 크면 내용을 줄여서 보여주는데 그것을 방지. 
-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>강의평가 웹 사이트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

	<%
		String id = null;
	
		if (session.getAttribute("id") != null)
			id = (String) session.getAttribute("id");
		
		if (id == null) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('로그인을 해주세요.');");
			writer.println("location.href='userLogin.jsp';");
			writer.println("</script>");
			writer.close();
			return;
		}
	%>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>	<!-- 이 순서대로 라이브러리 불러와야함. bootstrap먼저 불러오면 안됨. -->
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<!--
			data-toggle="collapse": 정보를 접었다가 클릭하면 펼쳐짐
			data-target="#abc": id="abc"와 연결. id는 접으려고 하는 컨텐츠
		-->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown" href="#">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
					<%
						if (id == null) {
					%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
					<%
						} else {
					%>
						<a class="dropdown-item" href="userLogoutAction.jsp">로그아웃</a>
					<%
						}
					%>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" name="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	
	<section class="container mt-3" style="max-width: 560px;">
		<div class="alert alert-warning mt-4" role="alert">
			이메일 주소 인증을 해야합니다.
		</div>
		<a href="emailSendAction.jsp" class="btn btn-primary">인증 메일 받기</a>
	</section>
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #ffffff;">
		Copyright &copy; 2020 홍길동 All Rights Reserved.
	</footer>

</body>
</html>