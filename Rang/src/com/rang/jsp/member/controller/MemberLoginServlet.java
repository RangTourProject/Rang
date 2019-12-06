package com.rang.jsp.member.controller;

import com.rang.jsp.member.model.service.MemberService;
import com.rang.jsp.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member m = new Member(email, password);

        MemberService ms = new MemberService();

        m = ms.selectOne(m);

        if(m != null){
            // 로그인 성공
            System.out.println("성공");
            HttpSession session = request.getSession();

            session.setAttribute("member", m);

            response.sendRedirect("index.jsp");

        }else {
            // 실패
            System.out.println("실패");
            response.sendRedirect("index.jsp");
        }

    }
}
