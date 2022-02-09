<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shop.model.*" %>    
<%@ page import="com.shop.controller.*" %>
<%@ page import="com.shop.biz.*" %>
<%@ page import="com.shop.view.*" %>
<%
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>) request.getAttribute("boardList"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 게시판 목록</title>
<%@ include file="../head.jsp" %>
<style>
.breadcrumb {height:700px;}
.one{ position:relative; }
.board_area{position:absolute; width:900px; }
</style>
</head>
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
			<%@ include file='../tnb11.jsp'%>
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
            		<h3>게시판</h3>
            		<div class="board_area">
						<table id="bList">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
							<c:set var="cnt" value="${boardList.size() }"/>
							<c:forEach items="${boardList }" var="board" varStatus="status">
								<tr>
									<td>${cnt }</td>
									<td>
										<c:if test="${board.getRe_lev() > 0}">
					                        <c:forEach begin="1" end="${board.getRe_lev() }">
					                            &nbsp;&nbsp; <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
					                        </c:forEach>
					                        RE : 
		                    			</c:if>
										<a href="GetBoardCtrl?num=${board.getNum() }">${board.getSubject() }</a>
									</td>
									<td>${board.getId() }</td>
									<td>${board.getDate() }</td>
									<td>${board.getCount() }</td>
								</tr>
								<c:set var="cnt" value="${cnt - 1 }" />
							</c:forEach>
							</tbody>
						</table>
						<div class="writePosibleArea">		
							<c:if test="${u_id != null}">
								<a href="./board/insertBoard.jsp" class="btn btn-default" id="write_btn">글쓰기</a>
							</c:if>
						</div>
						<script>
						$(function(){
							$("#bList").DataTable();		//#custom_tb는 반드시 table 태그일 것.
						});
						</script>
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
                            <li><a href="" class="cur">게시판</a></li>
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
		<%@include file='../footer2.jsp' %>
	</div>
</body>
</html>