package com.rang.jsp.member.controller;

import com.rang.jsp.member.model.service.MemberService;
import com.rang.jsp.member.model.vo.Member;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 뷰로 부터 받아오기
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String nickName = request.getParameter("nickName");
        String birthDate = request.getParameter("birthDate");
        String zipCode = request.getParameter("zipCode");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // 데이터 전달 용 vo에 담기
        Member m = new Member(email, userName, password, nickName, birthDate, zipCode, address, phone);

        // 서비스로 보내고 결과 담기
        MemberService ms = new MemberService();

        int result = ms.insertMember(m);

        // 처리
        if(result > 0){
            System.out.println("가입 성공");

            response.sendRedirect("views/member/login.jsp");
        }else {
            System.out.println("가입 실패");

            response.sendRedirect("index.jsp");
        }


    }
}
