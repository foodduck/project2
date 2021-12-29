<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Sample</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="panel-heading">
		<h3 align="center">Login</h3>
	</div>

	<div class="panel-body">
		<form method="post" action="LoginCtrl" novalidate>
			<table class="table">
				<tr>
					<td>ID</td>
					<td><input type="text" name="u_id" size="50"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pw" size="50"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Send"> 
						<input type="reset" value="Cancel">
				</tr>
			</table>

		</form>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	
	if(name == null) {
		out.println("로그인을 하지 않으셨습니다");
	} else {
		out.println("안녕하세요 " + name + "님..<br>");
		out.print("<a href=./../A04Logout>Logout</a>");
	}
%>
	</div>


</body>
</html>



