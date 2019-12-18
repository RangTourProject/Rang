package com.rang.jsp.tBoardComment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rang.jsp.tBoardComment.model.service.tBoardCommentService;
import com.rang.jsp.tBoardComment.model.vo.tBoardComment;

/**
 * Servlet implementation class TboardInsertCommentServlet
 */
@WebServlet("/tboardInsertComment.tb")
public class TboardInsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TboardInsertCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tbno = Integer.parseInt(request.getParameter("tbno"));
		int userno = Integer.parseInt(request.getParameter("userno"));
		String tccontent = request.getParameter("tccontent");
		int reftcno = Integer.parseInt(request.getParameter("reftcno"));
		int tclevel = Integer.parseInt(request.getParameter("tclevel"));
		
		
		tBoardComment tbco = new tBoardComment();
		
		tbco.setTbno(tbno);
		tbco.setUserno(userno);
		tbco.setTccontent(tccontent);
		tbco.setRef_tcno(reftcno);
		tbco.setTclevel(tclevel);
		
		int result = new tBoardCommentService().insertComment(tbco);
		
		if(result > 0) {
			response.sendRedirect("selectOne.tb?tbno="+tbno);
			// 상관없을때는 sendRedirect(동적) url 주소 바뀜
		} else {
			request.setAttribute("msg", "댓글 작성 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			       .forward(request, response);
			// 상관있을때는 RequestDispatcher(정적) url 주소 바뀌지 않음
		}	
		/*
		 * int tbno = Integer.parseInt(request.getParameter("tbno")); int userno =
		 * Integer.parseInt(request.getParameter("userno")); String tccontent =
		 * request.getParameter("tccontent"); int tclevel =
		 * Integer.parseInt(request.getParameter("tclevel")); int reftcno=
		 * Integer.parseInt(request.getParameter("reftcno"));
		 * 
		 * tBoardComment tbco = new tBoardComment();
		 * 
		 * tbco.setTbno(tbno); tbco.setUserno(userno); tbco.setTccontent(tccontent);
		 * tbco.setTclevel(tclevel); tbco.setRef_tcno(reftcno);
		 * 
		 * int result = new tBoardCommentService().insertComment(tbco);
		 * 
		 * if(result > 0) { HttpSession session = request.getSession(false);
		 * session.setAttribute("tbco", tbco);
		 * 
		 * response.sendRedirect("selectOne.tb?tbno="+tbco.getTbno()); } else {
		 * request.setAttribute("msg", "댓글 작성 실패!!");
		 * 
		 * request.getRequestDispatcher("views/common/errorPage.jsp") .forward(request,
		 * response); }
		 */		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
