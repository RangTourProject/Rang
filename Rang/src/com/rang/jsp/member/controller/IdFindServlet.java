package com.rang.jsp.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.rang.jsp.member.model.service.MemberService;
import com.rang.jsp.member.model.vo.Member;

@WebServlet("/idFind.me")
public class IdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IdFindServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		MemberService ms = new MemberService();
		
		Member m = new Member();
		m.setUserName(userName);
		m.setPhone(phone);
		
		m = ms.findId(m);
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(m);
		if(m != null) {
			// 아이디찾기 성공
			System.out.println("아이디 찾기 성공");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member",  m);
			map.put("email", m.getEmail());
			map.put("url", "login.jsp");
			
		} else {
			// 아이디찾기 실패
			System.out.println("아이디 찾기 실패");
			
			map.put("msg", "해당하는 계정이 없습니다.");
			map.put("url", "views/common/errorPage.jsp");
				
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(map, response.getWriter());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
