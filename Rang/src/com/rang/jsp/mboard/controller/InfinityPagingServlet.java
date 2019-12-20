package com.rang.jsp.mboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboard.model.vo.MBoard;

/**
 * Servlet implementation class InfinityPagingServlet
 */
@WebServlet("/InfinityPaging.mb")
public class InfinityPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
    public InfinityPagingServlet() {
        super();
    
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		ArrayList<MBoard> list = null;

		MBoardService mb = new MBoardService();

		// 현재페이지 
		int currentPage;
		
		// limit
		int limit;
		
	

		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		limit = 3;

		int listCount = mb.getListCount();

		list = mb.selectList(currentPage, limit);

		
		response.setContentType("application/json; charset=UTF-8");
	      
	      new Gson().toJson(list, response.getWriter());
		
		
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
