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
<title>회원 가입</title>
<head>
<meta charset="UTF-8">
	<%@ include file="head.jsp" %>
</head>
<body>
	<div class="wrap">
<%   
		String u_id = (String) session.getAttribute("u_id");
		if (u_id!=null) {
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
                <h2 class="bread_tit">회원 가입</h2>
                <div class="bread">
                    <a href="">이용안내</a> <span>&gt;</span> 
                    <span>회원가입</span>
                    <select name="loc" id="loc">
                        <option value="">123</option>
                        <option value="">234</option>
                        <option value="">345</option>
                        <option value="" selected>567</option>
                    </select>
                </div>
                <div class="sub_main">
            		<form action="JoinUsertbCtrl" method="post" name="joinform" onsubmit="return joinCheck(this)" >
						<table class = "table">
							<tr>
								<th class="item1">아이디</th>
								<td class="item1"><input type="text" name="u_id" required autofocus ></td>
								<td>
									<input type="button" value="중복확인" class="submit_btn" onclick="idCheck()">
									<input type="hidden" name="passbtn1" id="passbtn1" >
								</td>
							</tr>
							<tr>
								<th class="item2">비밀번호</th>
								<td class="item2"><input type="password" name="pw" required ></td>
							</tr>
							<tr>
								<th class="item2">비밀번호확인</th>
								<td class="item2"><input type="password" name="pw2" required></td>
							</tr>
							<tr>
								<th class="item3">이름</th>
								<td class="item3"><input type="text" name="uname" required ></td>
							</tr>
							<tr>
								<th class="item4">이메일</th>
								<td class="item4"><input type="email" name="email" ></td>
							</tr>
							<tr>
								<th class="item5">질문</th>
								<td class="item5"><input type="text" name="q"required ></td>
							</tr>
							<tr>
								<th class="item6">답</th>
								<td class="item6"><input type="text" name="a"required ></td>
							</tr>
							<tr>
								<th class="item7">우편번호</th>
								<td class="item7"><input type="text" name="add1" id="add1"></td>
								<td><input type="button" value="주소찾기" onclick="findAddr()" class="submit_btn" /></td>	
							</tr>
								<tr>
								<th class="item7">주소</th>
								<td class="item7"><input type="text" name="add2" id="add2"></td>
							</tr>
						</table>
						<button type="submit" class="submit_btn" style="margin-left:230px;">회원가입</button>
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
                            <li><a href="" class="cur">현재 항목</a></li>
                            <li><a href="">-</a></li>
                            <li><a href="">-</a></li>
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
		<%@include file='footer.jsp' %>
	</div>
	<!-- 회원가입시 바뀐 형식의 주소 및 우편번호 취급 처리 스크립트 -->
    <script>
       //다음카카오의 주소 API이용
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);                   
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('add1').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("add2").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("add2").value = jibunAddr;
                    }
                }
            }).open();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
	<!-- 아이디 중복 체크 및 유효성 검증 체크 스크립트 -->
	<script>
	function idCheck() { //열 페이지, 페이지명, 기타속성
		window.open("idCheckForm.jsp","idwin","width:400, height:620")
	}
	
	function joinCheck(f) {
		if (f.passbtn1.value!="yes") {
			alert("아이디 중복 검사를 해주세요");
			return false;
		}
		if(f.pw.value!=f.pw2.value) {
			alert("비밀번호와 비밀번호 확인을 일치시키세요")
			return false;
		}
		
	}
	</script>
</body>
</html>