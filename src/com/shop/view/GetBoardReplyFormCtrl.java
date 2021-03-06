package com.shop.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.BoardDAO;
import com.shop.model.BoardVO;

@WebServlet("/GetBoardReplyFormCtrl")
public class GetBoardReplyFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int num = Integer.parseInt(request.getParameter("num"));
        
        
        BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		
        BoardVO board = dao.getDetail(vo);
		if(board != null) {
	        request.setAttribute("board", board);
	        
			RequestDispatcher view = request.getRequestDispatcher("./board/boardReplyForm.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetBoardListCtrl");
		}
	}
}