package com.rang.jsp.tBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rang.jsp.tBoard.model.vo.TBoard;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rang.jsp.tBoard.model.service.TBoardService;
/**
 * Servlet implementation class TboardInserList
 */
@WebServlet("/insert.tb")
public class TboardInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TboardInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024 * 1024 * 30;
		
		String root = request.getServletContext().getRealPath("/");
		
		// 저장할 폴더는 root 뒤에 자신의 경로만 붙이면 된다.
				String savePath = root + "resources/tBoardPhoto";
				
				MultipartRequest mre = new MultipartRequest(
						request, //파일을 꺼내올 요청
						savePath, // 파일의 저장 경로
						maxSize, // 파일의 최대크기
						"UTF-8", // 인코딩 방식
						new DefaultFileRenamePolicy()
						// 만약 똑같은 이름의 파일이 여러개 저장된다면 
						// 파일 이름 뒤에 숫자를 붙여 각 파일들을
						// 구분해주는 정책 이름이 겹치면 1..2..3~~
						);
				
				String writer = mre.getParameter("writer");
				String tbtitle = mre.getParameter("tbTitle");
				String content = mre.getParameter("tbContent");
				int userNo = Integer.parseInt(mre.getParameter("userNo"));
				String place = mre.getParameter("place");
				int maxmember = Integer.parseInt(mre.getParameter("maxmember"));

				// 4. 파일을 다운받아 폴더에 저장하면서 해당 경로를
				// 가져오는 메소드 실행하기
				
				String filePath = mre.getFilesystemName("pPhoto");

				// 데이터 전달용 tBoard 객체 만들기
				TBoard tb = new TBoard(userNo, writer, tbtitle, content, filePath, place, maxmember);

				int result = new TBoardService().insertTboard(tb);
				
				System.out.println("tboardinsertList에있는 " + result);
				
				if (result > 0) {
					
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
