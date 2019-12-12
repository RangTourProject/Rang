package com.rang.jsp.mboardComment.controller;

import com.google.gson.Gson;
import com.rang.jsp.mboardComment.model.service.MBoardCommnetService;
import com.rang.jsp.mboardComment.model.vo.MBoardComment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update.mc")
public class UpdateMBCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // view 로 부터 필요한 데이터를 받아온다. 댓글번호, 댓글 내용
        int mcno = Integer.parseInt(request.getParameter("mcno"));
        String content = request.getParameter("content");

        // 객체에 담아서 전달
        MBoardComment mbco = new MBoardComment();

        mbco.setMcno(mcno);
        mbco.setMccontent(content);

        int result = new MBoardCommnetService().updateMComment(mbco);

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(result, response.getWriter());
    }
}
