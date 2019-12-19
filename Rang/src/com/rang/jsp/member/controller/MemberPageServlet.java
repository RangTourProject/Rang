package com.rang.jsp.member.controller;

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
import com.rang.jsp.myPage.model.service.MyPageService;
import com.rang.jsp.myPage.model.vo.ChangeImage;
import com.rang.jsp.search.model.service.SearchService;

/**
 * Servlet implementation class MemberPageServlet
 */
@WebServlet("/memberPage.mp")
public class MemberPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberPageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName");
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		ArrayList<MBoard> list = null;
		ArrayList<ChangeImage> clist = (ArrayList<ChangeImage>)session.getAttribute("clist");
		
		System.out.println("clist 확인 : "+clist);
		
		// 닉네임이 없을 때 나임
		if(nickName == null) {
			nickName = m.getNickName();
		}
		
		
		Member pageMember = new SearchService().searchMamber(nickName);
		FollowService fs = new FollowService();
		MyPageService ms = new MyPageService();
		list = new MBoardService().myPageList(nickName);
		// 사용자의 메인 게시글 숫자 보여주기
		int mBoardCount = new MBoardService().mBoardCount(nickName);
		
		// 사용자의 새로운 사진을 추가하기
		if(clist != null) ms.insertMyPagePhoto(clist); 
		
		
		
		// 나를 팔로우 한 사람
		int follower = fs.followerCheck(m.getUserNo());

		// 내가 팔로우 한 사람
		int folling = fs.followingCheck(m.getUserNo());
		
		

		String page ="";
		if(pageMember != null) {
			request.setAttribute("mp", pageMember);
			request.setAttribute("follower", follower);
			request.setAttribute("folling", folling);
			request.setAttribute("list", list);
			request.setAttribute("mBoardCount", mBoardCount);
			 request.setAttribute("clist", clist); 
			 

			page = "views/myPage/myPage.jsp";
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
