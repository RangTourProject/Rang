package com.rang.jsp.follow.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rang.jsp.follow.model.service.FollowService;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/follow.mm")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memno = Integer.parseInt(request.getParameter("memno"));
		
		int target_memno = Integer.parseInt(request.getParameter("target_memno"));
		
		FollowService fs = new FollowService();
		
		Map<String, Integer> result = fs.followLogic(memno, target_memno);
		

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
