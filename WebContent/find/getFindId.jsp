<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>    
<%@ page import = "com.shop.model.UsertbVO" %>    
<%@ page import = "com.shop.biz.UsertbDAO" %>   
<%@ page import = "com.shop.view.GetUsertbCtrl" %>        
    
<%
	UsertbVO usertb = (UsertbVO) request.getAttribute("usertb");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기(결과)</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>
	<%@ include file="../header.jsp"%>
	
<div class = "container">
	<h2>ID 찾기 결과</h2>
<%
	if (usertb!=null) {
%>
	<table class = "table">
		<tr>
			<th class="item1">당신의 ID는</th>
			<td class="item1"><input type="text" name="email" value="${usertb.getU_id() }" readonly ></td>
		</tr>
	</table>
<%
	} else {
%>
	<p class="">이메일 혹은 이름이 잘못되었습니다.</p>
<%
	}
%>
	<!-- 버튼 그룹 -->
	<div class="btn-group">
	<a href="findid.jsp" class="btn btn-default">다시 찾기</a>
	<a href="../index.jsp" class="btn btn-default">메인 화면으로</a>
	</div>
</div>
<%@ include file="../footer.jsp" %>

	
</body>
</html>