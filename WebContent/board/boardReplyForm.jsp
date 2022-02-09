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
            		<h3>답글 쓰기</h3>
            		<div class="container">
					    <form method="post" action="BoardReplyInsertCtrl?" name="boardForm">
					    <input type="hidden" name="board_id" value="${u_id }">
					    <input type="hidden" name="board_num" value="${board.getNum() }"/>
					    <input type="hidden" name="board_re_ref" value="${board.getRe_ref() }"/>
					    <input type="hidden" name="board_re_lev" value="${board.getRe_lev() }"/>
					    <input type="hidden" name="board_re_seq" value="${board.getRe_seq() }"/>
					    <table class="table">
					        <tr>
					            <td id="title">작성자</td>
					            <td>${u_id }</td>
					        </tr>
					            <tr>
					            <td id="title">
					                제 목
					            </td>
					            <td>
					                <input name="board_subject" type="text" size="70" maxlength="100" value=""/>
					            </td>        
					        </tr>
					        <tr>
					            <td id="title">
					                내 용
					            </td>
					            <td>
					                <textarea name="board_content" cols="72" rows="20">
					                </textarea>            
					            </td>        
					        </tr>
					 
					        <tr align="center" valign="middle">
					            <td colspan="5">
					                <input type="reset" value="작성취소" class="btn btn-primary">
					                <input type="submit" value="등록"  class="btn btn-primary">
					                <input type="button" value="목록" onclick="javascript:history.go(-1)"  class="btn btn-primary">            
					            </td>
					        </tr>
					    </table>    
					    </form>
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