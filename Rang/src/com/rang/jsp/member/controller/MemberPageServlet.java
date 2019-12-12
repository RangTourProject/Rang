package com.rang.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rang.jsp.follow.model.service.FollowService;
import com.rang.jsp.member.model.vo.Member;
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
		

		// 닉네임이 없을 때 나임
		if(nickName == null) {
			nickName = m.getNickName();
		}
		
		Member pageMember = new SearchService().searchMamber(nickName);
		FollowService fs = new FollowService();

		// 나를 팔로우 한 사람
		int follower = fs.followerCheck(m.getUserNo());

		// 내가 팔로우 한 사람
		int folling = fs.followingCheck(m.getUserNo());
		
		
		String page ="";
		if(pageMember != null) {
			request.setAttribute("mp", pageMember);
			request.setAttribute("follower", follower);
			request.setAttribute("folling", folling);
			
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
