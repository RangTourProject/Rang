package com.rang.jsp.tBoard.controller;

import com.rang.jsp.tBoard.model.service.TBoardService;
import com.rang.jsp.tBoard.model.vo.TBoard;
import com.rang.jsp.tBoardComment.model.service.tBoardCommentService;
import com.rang.jsp.tBoardComment.model.vo.tBoardComment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TboardSelectOneServlet
 */
@WebServlet("/selectOne.tb")
public class TBoardSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tbno = Integer.parseInt(request.getParameter("tbno"));

		TBoard stb = new TBoardService().selectOne(tbno);
		ArrayList<tBoardComment> clist = new tBoardCommentService().selectList(tbno);

		String page = "";
		System.out.println(stb);
		if (stb != null) {
			page = "views/tBoard/tBoardDetail.jsp";
			request.setAttribute("stb", stb);
			request.setAttribute("tclist", clist);
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




















