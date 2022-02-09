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

@WebServlet("/GetBoardUpdateFormCtrl")
public class GetBoardUpdateFormCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		int num = Integer.parseInt(request.getParameter("num"));
        BoardVO vo = new BoardVO();
		vo.setNum(num);
		
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getBoard(vo);

		if(board != null) {
			request.setAttribute("board", board);
			
			RequestDispatcher view = request.getRequestDispatcher("./board/updateBoard.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetBoardListCtrl");
		}
	}
}