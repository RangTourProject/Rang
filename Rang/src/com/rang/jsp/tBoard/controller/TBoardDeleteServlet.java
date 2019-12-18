package com.rang.jsp.tBoard.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rang.jsp.tBoard.model.service.TBoardService;
import com.rang.jsp.tBoard.model.vo.TBoard;

/**
 * Servlet implementation class TBoardDeleteServlet
 */
@WebServlet("/del.tb")
public class TBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tbno = Integer.parseInt(request.getParameter("tbno"));
		TBoardService tbs = new TBoardService();
		
		int result = tbs.deleteTBoard(tbno);
		System.out.println("티보드델리트서블렛 오긴하냐"+ result);
		if(result > 0) {
			response.sendRedirect("selectList.tb");
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
