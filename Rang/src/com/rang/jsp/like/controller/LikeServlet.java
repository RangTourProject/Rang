package com.rang.jsp.like.controller;

import com.google.gson.Gson;
import com.rang.jsp.like.model.service.LikeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/like.mb")
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int memno = Integer.parseInt(request.getParameter("memno"));
        int mbno = Integer.parseInt(request.getParameter("mbno"));

        HashMap<String, Integer> hmap = new LikeService().likeLogic(memno, mbno);

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(hmap, response.getWriter());

    }
}
