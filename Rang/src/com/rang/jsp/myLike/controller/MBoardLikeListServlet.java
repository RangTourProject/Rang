package com.rang.jsp.myLike.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.myLike.model.service.MBLikeService;
import com.rang.jsp.myLike.model.vo.MbLike;


/**
 * Servlet implementation class LikeListServlet
 */
@WebServlet("/likeList.mb")
public class MBoardLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MBoardLikeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MBLikeService ls = new MBLikeService();
		
		int mbno = Integer.parseInt(request.getParameter("mbno"));
		
		// 게시글에 좋아요한 사용자 리스트 
		ArrayList<MbLike> MBLlist = new MBLikeService().MBLlist(mbno);
		
		//MBoard.put("MBLlist", MBLlist);
		
		if (MBLlist != null) {
			
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(MBLlist, response.getWriter());
		//MBLlist로 보내서 data자체가 MBList가 되기때문에 ajax에서 data만 써주면 됌 
		} else {
			
			 System.out.println("like list 에러발생");
			
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
