package com.rang.jsp.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.search.model.service.SearchService;

/**
 * Servlet implementation class SearchHashtagServlet
 */
@WebServlet("/searchHashtag.sh")
public class SearchHashtagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHashtagServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 키워드 받기
				String keyword = request.getParameter("keyword");
				ArrayList<MBoard> list = null;
				
				new SearchService();
				
				list = new SearchService().searchMBoard(keyword);

				System.out.println("리스트 확인 " + list);

				String page ="";
				
				if(list != null) {

					page = "views/mBoard/mBoard.jsp";
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
