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
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/delete.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService ms = new MemberService();
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("회원 기존 정보 : "+session.getAttribute("member"));
		
		if(ms.deleteMember(m.getUserNo()) > 0) {
			System.out.println("회원 탈퇴 완료! : "+ m);
			
			session.invalidate();
			
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("msg", "회원 탈퇴 중 에러가 발생했3!.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
