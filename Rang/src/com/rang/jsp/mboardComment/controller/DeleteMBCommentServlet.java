package com.rang.jsp.mboardComment.controller;

import com.google.gson.Gson;
import com.rang.jsp.mboardComment.model.service.MBoardCommnetService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete.mc")
public class DeleteMBCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 삭제할 댓글 번호 받아온다.
        int mcno = Integer.parseInt(request.getParameter("mcno"));

        int result = new MBoardCommnetService().deleteMComment(mcno);

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(result, response.getWriter());
    }
}
