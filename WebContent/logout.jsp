<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("u_id");
String pw = (String)session.getAttribute("pw");
if (id!=null) {
	session.invalidate();
	response.sendRedirect("index.jsp");
} else {
	response.sendRedirect("index.jsp");
}
%>
