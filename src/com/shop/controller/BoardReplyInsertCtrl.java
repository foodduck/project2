package com.shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.biz.BoardDAO;
import com.shop.model.BoardVO;

@WebServlet("/BoardReplyInsertCtrl")
public class BoardReplyInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        BoardDAO dao = new BoardDAO();

        // 파리미터 값을 가져온다.
        int num = Integer.parseInt(request.getParameter("board_num"));
        String id = request.getParameter("board_id");
        String subject = request.getParameter("board_subject");
        String content = request.getParameter("board_content");
        int ref = Integer.parseInt(request.getParameter("board_re_ref"));
        int lev = Integer.parseInt(request.getParameter("board_re_lev"));
        int seq = Integer.parseInt(request.getParameter("board_re_seq"));
        
        BoardVO vo = new BoardVO();
        // 답글 저장
        vo.setNum(dao.getSeq()); // 답글의 글번호는 시퀀스값 가져와 세팅
        vo.setId(id);
        vo.setSubject(subject);
        vo.setContent(content);
        vo.setRe_ref(ref);
        vo.setRe_lev(lev+1);
        vo.setRe_seq(seq+1);
        int cnt= dao.boardReplyInsert(vo);
		if(cnt > 0) {
			response.sendRedirect("GetBoardListCtrl");
		} else {
			response.sendRedirect("BoardReplyFormCtrl");
		}
	}
}