package com.rang.jsp.myLike.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rang.jsp.myLike.model.vo.MbLike;
import com.rang.jsp.myLike.model.service.MBLikeService;

/**
 * Servlet implementation class MBoardLikeServlet
 */
@WebServlet("/like.mb")
public class MBoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MBoardLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int memno = Integer.parseInt(request.getParameter("memno"));
		int mbno = Integer.parseInt(request.getParameter("mbno")); // mbno를 지금 못받아옵니다.

		
		System.out.println("mbno 확인2 : " + mbno);
		MBLikeService mbl = new MBLikeService();
		
		
		Map<String, Integer> result = mbl.myLikeLogic(memno, mbno);
		int myLikeCheck = mbl.myLikeCheck(memno, mbno);
		result.put("myLikeCheck", myLikeCheck);
		
		// likeCount 는 모달안에 불러오기 때문에 selectOneServlet 으로 보냈습니다
		/* int likeCount = mbl.mBoardLikeCount(mbno); */
		/* result.put("likeCount", likeCount); */
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result, response.getWriter());
		/*
		 * new Gson().toJson(likeCount, response.getWriter()); new
		 * Gson().toJson(myLikeCheck, response.getWriter());
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
