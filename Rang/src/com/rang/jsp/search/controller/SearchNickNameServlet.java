package com.rang.jsp.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rang.jsp.follow.model.service.FollowService;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.search.model.service.SearchService;

/**
 * Servlet implementation class SearchNickNameServlet
 */
@WebServlet("/searchNickName.sn")
public class SearchNickNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchNickNameServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 검색 키워드 받기
		String keyword = request.getParameter("keyword");
		HttpSession session = request.getSession(false);
		Member me = (Member)session.getAttribute("member");
		Member mb = null;
		ArrayList<MBoard> list = null;

		SearchService ss = new SearchService();
		FollowService fs = new FollowService();
		mb = ss.searchMamber(keyword);
		int result = fs.followCheck(me.getUserNo(), mb.getUserNo());


		// 검색한 애 게시글 조회
		list = new MBoardService().selectList(keyword);

		// 검색한놈 게시글 수 조회
		int mBoardCount = new MBoardService().mBoardCount(mb.getNickName());

		int mpLowing = fs.followingCheck(mb.getUserNo());  // 검색한놈 팔로잉 값
		int mpLower = fs.followerCheck(mb.getUserNo());   // 검색한놈 팔로우 값

		String page = "";

		if (mb != null) {

			page = "views/myPage/myPage.jsp";
			request.setAttribute("mp", mb);
			request.setAttribute("followCheck", result);
			request.setAttribute("mpLowing", mpLowing);
			request.setAttribute("mpLower", mpLower);
			request.setAttribute("mBoardCount", mBoardCount);
			request.setAttribute("list", list);

		} else {

			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 검색 실패!");
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
