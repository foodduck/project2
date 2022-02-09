<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.*" %>    
<%@ page import="com.shop.controller.*" %>
<%@ page import="com.shop.biz.*" %>
<%@ page import="com.shop.view.*" %>
<!DOCTYPE html>
<html>
<title>여기에 제목 입력</title>
<head>
<meta charset="UTF-8">
	<%@ include file="../head.jsp" %>
</head>
<style>
	body, html { width: 100%; }
    ul { list-style: none; }
    a { text-decoration: none; }  
    .wrap { width: 100%; }
    proview {margin:5 }
	.proview p {text-align:center }
	.proview a {display:inline }
	li {line-height:1  margin-left:15px;}
	mason {marin-top:100px; }
</style>
<body>
	<div class="wrap">
<%   
		String u_id = (String) session.getAttribute("u_id");
		if (u_id!=null) {
%>
			<%@ include file='../tnb2.jsp'%>
<%
		} else {
%>
			<%@ include file='../tnb1.jsp'%>
<%
		}
%>
		<%@include file='../header.jsp' %>
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
                <h2 class="bread_tit">제목</h2>
                <div class="bread">
                    <a href="">대주제</a> <span>&gt;</span> 
                    <span>소주제</span>
                    <select name="loc" id="loc">
                        <option value="">123</option>
                        <option value="">234</option>
                        <option value="">345</option>
                        <option value="" selected>567</option>
                    </select>
                </div>
                <div class="sub_main">
            		<div class="proview" >
						<ul id="mason">
							<c:set var="num" value="${prolistList.size() }" />
							<c:forEach items="${prolistList }" var="prolist" >
							<li>
							<p class="protit"><a href="./GetProlistCtrl?prolistid=${prolist.getProlistid() }"><img src="${prolist.getImg() }" alt="상품이미지" /></a></p>
							<p><a href="./GetProlistCtrl?prolistid=${prolist.getProlistid() }">${prolist.getPname() }</a></p>
							<p>남은수량: ${prolist.getCnt() }</p>
							</li>		
							</c:forEach>
						</ul>
					</div>
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
		<%@include file='../footer.jsp' %>
	</div>
</body>
</html>