package com.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.biz.UsertbDAO;
import com.shop.model.UsertbVO;

@WebServlet("/DeleteUsertbCtrl")
public class DeleteUsertbCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int usertbid=Integer.parseInt(request.getParameter("usertbid"));
		
		UsertbVO vo = new UsertbVO();
		vo.setUsertbid(usertbid);
		
		UsertbDAO dao = new UsertbDAO();
		UsertbVO usertb= new UsertbVO();
		//받을객체 = DAO객체명.메서드명(vo)
		int cnt = dao.deleteUsertb(vo);
	
		if(cnt>0) {
			response.sendRedirect("index.jsp");
		}  else {
			response.sendRedirect("MyPageCtrl");
		}
	}
}