package com.rang.jsp.tBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rang.jsp.tBoard.model.service.TBoardService;
import com.rang.jsp.tBoard.model.vo.TBoard;

/**
 * Servlet implementation class TBoardUpdateServlet
 */
@WebServlet("/updateView.tb")
public class TBoardUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tbno = Integer.parseInt(request.getParameter("tbno"));
		
		TBoard tbu = new TBoardService().updateView(tbno);
		
		String page = "";
		
		if (tbu != null) {
			page = "views/tBoard/tBoardUpdate.jsp";
			request.setAttribute("tbu", tbu);
			
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
