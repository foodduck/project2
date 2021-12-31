<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>로그인</title>
<head>
<meta charset="UTF-8">
	<%@ include file="head.jsp" %>
</head>

<style>

</style>

<body>
	<div class="wrap">
<%   
		String u_id = (String) session.getAttribute("u_id");
		if (u_id!=null) {
			response.sendRedirect("index.jsp");
%>
			<%@ include file='tnb2.jsp'%>
<%
		} else {
%>
			<%@ include file='tnb1.jsp'%>
<%
		}
%>
		<%@include file='header.jsp' %>
		 <div class="content fix">
           <figure class="vs">
               <ul class="img_box">
                   <li>
                       <a href="introduce.jsp">
                           <img src="./img/figure_company.png" alt="회사이미지" class="vs_img">
                       </a>
                   </li>
                </ul>
            </figure>
          </div>
		 <div class="content fix">
            <div class="breadcrumb">
                <h2 class="bread_tit">로그인</h2>
                <div class="bread">
                    <a href="">이용안내</a> <span>&gt;</span> 
                    <span>로그인</span>
                    <select name="loc" id="loc">
                        <option value="login.jsp" selected >로그인</option>
                        <option value="./find/findId.jsp">아이디 찾기</option>
                        <option value="./find/findQ.jsp">비밀번호 찾기</option>
                        <option value="join.jsp" >회원가입</option>
                    </select>
                </div>
                <div class="sub_main">
            		<form method="post" action="LoginCtrl" novalidate>
				<table class="table_login">
					<tbody>
						<tr>
							<th><label for="u_id">아이디</label></th>
							<td>
								<input type="text" name="u_id" id="u_id" required />
							</td>
						</tr>
						<tr>
							<th><label for="pw">비밀번호</label></th>
							<td>
								<input type="password" name="pw" id="pw"  required />
							</td>
						</tr>
					</tbody>
				</table>
					<input type="submit" value="로그인" class="submit_btn" style="margin-left:250px;"/>
					</form>
					<hr>
					<input type="button" value="아이디 찾기" class="submit_btn" style="margin-left:130px;"/>
					<input type="button" value="비밀번호 찾기" class="submit_btn" style="margin-left:20px;"/>
            	</div>
             
                <script>
                $(function(){
                    $("#loc").change(function(){
                        if(this.value != ""){
                            location.href=this.value;
                        }
                    });
                });
                </script>  
            </div>
            
            <section class="left_con">
                <aside class="sidebar">
                    <nav class="lnb">
                        <ul>
                            <li><a href="login.jsp" class="cur">로그인</a></li>
                            <li><a href="./find/findId.jsp">아이디 찾기</a></li>
                            <li><a href="./find/findQ.jsp">비밀번호 찾기</a></li>
                            <li><a href="join.jsp">회원가입</a></li>
                            <li><a href="">-</a></li>
                            <li><a href="">-</a></li>
                            <li><a href="">-</a></li>
                        </ul>
                    </nav>
                </aside>
            </section>
            <div class="one">
            	
            </div>    
        </div>
		<%@include file='footer.jsp' %>
	</div>
</body>
</html>