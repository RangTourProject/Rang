package com.rang.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rang.jsp.member.model.service.MemberService;
import com.rang.jsp.member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 // 뷰로 부터 받아오기
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String nickName = request.getParameter("nickName");
        String zipCode = request.getParameter("zipCode");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        
        
        // 데이터 전달 용 vo에 담기
        Member m = new Member(userNo, userName, password, nickName, zipCode, address, phone);

        System.out.println(m);
        // 서비스로 보내고 결과 담기
        MemberService ms = new MemberService();

        int result = ms.updateMember(m);

        // 처리
        if(result > 0){
            System.out.println("수정 성공");

            response.sendRedirect("index.jsp");
        }else {
            System.out.println("수정 실패");

            response.sendRedirect("index.jsp");
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
