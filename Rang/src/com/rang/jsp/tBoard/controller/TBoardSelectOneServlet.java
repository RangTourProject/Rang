package com.rang.jsp.tBoard.controller;

import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.planner.model.service.PlanService;
import com.rang.jsp.planner.model.vo.City;
import com.rang.jsp.planner.model.vo.CityPlan;
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
import javax.servlet.http.HttpSession;

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
		

		HttpSession session = request.getSession(false);

        Member m = (Member) session.getAttribute("member");

		int tbno = Integer.parseInt(request.getParameter("tbno"));

		TBoard stb = new TBoardService().selectOne(tbno);
		ArrayList<CityPlan> cp = new PlanService().readOnePlan(m.getUserNo());
		ArrayList<City> cityList = new PlanService().loadCity();
		System.out.println("cp 확인 : " + cp);
		int check = new TBoardService().checkParty(m.getUserNo(), tbno);
		
		ArrayList<tBoardComment> clist = new tBoardCommentService().selectList(tbno);

		System.out.println("로그인된 유저정보 : "+m.getUserNo());
		System.out.println("게시글번호 : " + tbno);
		System.out.println("체크결과(0or1) : "+check);
		String page = "";
		System.out.println(stb);
		if (stb != null) {
			page = "views/tBoard/tBoardDetail.jsp";
			request.setAttribute("stb", stb);
			request.setAttribute("tclist", clist);
			request.setAttribute("check", check);
			request.setAttribute("cp", cp);
			request.setAttribute("cityList", cityList);
			
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




















