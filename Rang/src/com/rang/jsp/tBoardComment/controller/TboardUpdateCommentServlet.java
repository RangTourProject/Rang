package com.rang.jsp.tBoardComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rang.jsp.tBoardComment.model.service.tBoardCommentService;
import com.rang.jsp.tBoardComment.model.vo.tBoardComment;

/**
 * Servlet implementation class TboardUpdateCommentServlet
 */
@WebServlet("/tboardUpdateComment.tb")
public class TboardUpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TboardUpdateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int tcno = Integer.parseInt(request.getParameter("tcno"));
		int tbno = Integer.parseInt(request.getParameter("tbno"));
		String tccontent = request.getParameter("tccontent");
		
		tBoardCommentService cs = new tBoardCommentService();
		tBoardComment tbco = new tBoardComment();

		tbco.setTcno(tcno);
		tbco.setTbno(tbno);
		tbco.setTccontent(tccontent);
		
		int result = cs.updateComment(tbco);
		
		if(result > 0) {
			response.sendRedirect("selectOne.tb?tbno="+tbno);
		} else {
			request.setAttribute("msg", "댓글 수정 중 에러 발생");
			request.getRequestDispatcher("views/common/errorPage.jsp")
				   .forward(request, response);
		}


	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
