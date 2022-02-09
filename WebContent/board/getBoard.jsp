<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.*" %>    
<%@ page import="com.shop.controller.*" %>
<%@ page import="com.shop.biz.*" %>
<%@ page import="com.shop.view.*" %>
<!DOCTYPE html>
<html>
<title>게시글 내용 보기</title>
<style>

</style>
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
            		<h3>test</h3>
				    	<div class="container">
					
						<h2>게시판 글보기</h2>
							<div class="content">
							    <div id="board">
							        <table id="detailBoard" class="table">
							            <tr>
							                <td id="title">작성일</td>
							                <td>${board.getDate() }</td>
							            </tr>
							            <tr>
							                <td id="title">작성자</td>
							                <td>${board.getId() }</td>
							            </tr>
							            <tr>
							                <td id="title">
							                	제 목
							                </td>
							                <td>
							                    ${board.getSubject() }
							                </td>        
							            </tr>
							            <tr>
							                <td id="title">
							                   	 내 용
							                </td>
							                <td>
							                    ${board.getContent() }
							                </td>        
							            </tr>
							            <tr>
							                <td id="title">
							                   	 첨부파일
							                </td>
							                <td>
							                    <a href='${board.getFile() }'>${board.getFile() }</a>
							                </td>    
							            </tr>
							    
							            <tr align="center" valign="middle">
							                <td colspan="5">
							                    <a href="./GetBoardUpdateFormCtrl?num=${board.getNum() }" class="btn btn-primary">수정</a>
							                    <a href="./DeleteBoardCtrl?num=${board.getNum() }" class="btn btn-primary">삭제</a>
							                    <a href="./GetBoardReplyFormCtrl?num=${board.getNum() }" class="btn btn-primary">답글</a>    
							                    <input type="button" value="목록" 
							                        onclick="javascript:location.href='GetBoardListCtrl?page=${pageNum }'" class="btn btn-primary">            
							                </td>
							            </tr>
							        </table>
							    </div>
							</div>
					
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