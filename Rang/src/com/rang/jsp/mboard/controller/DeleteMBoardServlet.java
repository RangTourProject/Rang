package com.rang.jsp.mboard.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.mboardComment.model.service.MBoardCommnetService;

/**
 * Servlet implementation class DeleteMBoardServlet
 */
@WebServlet("/delete.mb")
public class DeleteMBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 삭제할 글 번호
		int mbno = Integer.parseInt(request.getParameter("mbno"));
		
        int result = new MBoardService().deleteMBoard(mbno);

		response.setContentType("application/json; charset=UTF-8");

		new Gson().toJson(result, response.getWriter());

		response.sendRedirect("selectList.mb");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
