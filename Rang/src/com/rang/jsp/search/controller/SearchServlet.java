package com.rang.jsp.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.search.model.service.SearchService;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.ck")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("con");
		
		String keyword = request.getParameter("keyword");
		
		ArrayList<MBoard> list = new ArrayList<>();
		
		SearchService ss = new SearchService();
		
//		list = ss.searchOne(condition, keyword);
		
		String page =  "";
		
		if(list != null) {
			
			page = "views/index.jsp";
			request.setAttribute("list", list);
		} else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "검색 실패 !");
		}
		
		request.getRequestDispatcher(page)
		       .forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
