<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기(입력 전)</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>
	<%@ include file="../header.jsp"%>
	
<div class = "container">
	<h2>ID 찾기</h2>
	<form action="../GetFindIdCtrl" method="post" name="frm">
	<table class = "table">
		<tr>
			<th class="item1">이메일</th>
			<td class="item1"><input type="text" name="email" required ></td>
		</tr>
		<tr>
			<th class="item2">이름</th>
			<td class="item2"><input type="text" name="uname" required></td>
		</tr>
	</table>
	<input type="submit" class ="btn btn-default" value="ID찾기"/>
</form>	
	<!-- 버튼 그룹 -->
	<div class="btn-group">
	<a href="index.jsp" class="btn btn-default">메인 화면으로</a>
	</div>
</div>
<%@ include file="../footer.jsp" %>

	
</body>
</html>