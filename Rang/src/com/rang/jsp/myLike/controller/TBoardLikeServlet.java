package com.rang.jsp.myLike.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rang.jsp.myLike.model.vo.MbLike;
import com.rang.jsp.myLike.model.vo.TbLike;
import com.rang.jsp.myLike.model.service.MBLikeService;
import com.rang.jsp.myLike.model.service.TBLikeService;

/**
 * Servlet implementation class TBoardLikeServlet
 */
@WebServlet("/like.tb")
public class TBoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memno = Integer.parseInt(request.getParameter("memno"));
		int tbno = Integer.parseInt(request.getParameter("tbno"));
		
		TbLike ml = new TbLike();
		
		ml.setUserNo(memno);
		ml.settBno(tbno);
		
		TBLikeService tbl = new TBLikeService();
		
		int result = tbl.insertTbLike(ml);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result, response.getWriter());
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
