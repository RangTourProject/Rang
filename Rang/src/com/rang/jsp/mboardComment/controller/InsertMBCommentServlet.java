package com.rang.jsp.mboardComment.controller;

import com.google.gson.Gson;
import com.rang.jsp.mboardComment.model.service.MBoardCommnetService;
import com.rang.jsp.mboardComment.model.vo.MBoardComment;
import com.rang.jsp.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/insert.mc")
public class InsertMBCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mcContent = request.getParameter("content");
        int mbno = Integer.parseInt(request.getParameter("mbno"));

        // 세션을 불러와서 저장된 멤버 객체를 불러온다.
        HttpSession session = request.getSession(false);
        Member writer = (Member)session.getAttribute("member");

        MBoardComment mbc = new MBoardComment();

        mbc.setMbno(mbno);
        mbc.setUserno(writer.getUserNo());
        mbc.setMccontent(mcContent);

//        System.out.println("컨트롤러에서 뽑았니 : " + mbc);

        int result = new MBoardCommnetService().insertMBCommnet(mbc);

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(result, response.getWriter());
    }
}
