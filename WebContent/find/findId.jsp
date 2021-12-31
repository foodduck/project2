<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>id 찾기</title>
<head>
<meta charset="UTF-8">
	<%@ include file="../head2.jsp" %>
</head>
<style>
</style>
<body>
	<div class="wrap">
<%   
		String u_id = (String) session.getAttribute("u_id");
		if (u_id!=null) {
%>
			<%@ include file='../tnb22.jsp'%>
<%
		} else {
%>
			<%@ include file='../tnb111.jsp'%>
<%
		}
%>
		<%@include file='../header2.jsp' %>
		 <div class="content fix">
           <figure class="vs">
               <ul class="img_box">
                   <li>
                       <a href="introduce.jsp">
                           <img src="../img/figure_company.png" alt="회사이미지" class="vs_img">
                       </a>
                   </li>
                </ul>
            </figure>
          </div>
		 <div class="content fix">
            <div class="breadcrumb">
                <h2 class="bread_tit">ID 찾기</h2>
                <div class="bread">
                   <a href="">이용안내</a> <span>&gt;</span> 
                    <span>ID찾기</span>
                    <select name="loc" id="loc">
                        <option value="./findId.jsp" selected>아이디 찾기</option>
                        <option value="../login.jsp" >로그인</option>
                        <option value="./findQ.jsp">비밀번호 찾기</option>
                        <option value="" >------</option>
                    </select>
                </div>
                <div class="sub_main">
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
						<button type="submit" class="submit_btn">아이디 찾기</button>
					</form>	
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
                            <li><a href="findId.jsp" class="cur">ID찾기</a></li>
                            <li><a href="../login.jsp">로그인</a></li>
                            <li><a href="findQ.jsp">비밀번호 찾기</a></li>
                            <li><a href="">-</a></li>
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
		<%@include file='../footer.jsp' %>
	</div>
</body>
</html>