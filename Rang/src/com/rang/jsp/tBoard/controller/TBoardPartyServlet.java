package com.rang.jsp.tBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.tBoard.model.service.TBoardService;
import com.rang.jsp.tBoard.model.vo.TBoard;

/**
 * Servlet implementation class TBoardPartyServlet
 */
@WebServlet("/party.tb")
public class TBoardPartyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardPartyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

        Member m = (Member) session.getAttribute("member");
        System.out.println(m);
        // m.getUserNo();
        
        int tbno = Integer.parseInt(request.getParameter("tbno"));
        
        int result = new TBoardService().joinParty(m.getUserNo(), tbno);
        
        
        if(result > 0) {
        	request.getRequestDispatcher("/selectOne.tb?tbno="+tbno).forward(request, response);
        }
        
        
        
		
		
		
		
		/*
		 * int userno = Integer.parseInt(request.getParameter("userno"));
		 * 
		 * TBoard pl = new TBoardService().selectOne(userno);
		 * 
		 * String page = "";
		 * 
		 * if (pl != null) { page = "views/board/tBoardParty.jsp";
		 * request.setAttribute("pl", pl);
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
