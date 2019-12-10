package com.rang.jsp.mboard.controller;

import com.google.gson.Gson;
import com.rang.jsp.mboard.model.service.MBoardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/selectOne.mb")
public class SelectOneMBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 모달창 ajax
        
        MBoardService mbs = new MBoardService();

        int mbno = Integer.parseInt(request.getParameter("mbno"));

        System.out.println("mbno 확인 : " + mbno);

        HashMap<String, Object> mboard = mbs.selectOne(mbno);

        // 확인
        System.out.println(mboard);

        if(mboard != null){

            // DAO 에서 준 hashmap 키, 벨류 확인 해 보3.
//            request.setAttribute("mBoard", mboard.get("mBoard"));
//            request.setAttribute("mAttachment", mboard.get("mAttachment"));

            response.setContentType("application/json; charset=utf-8;");

            new Gson().toJson(mboard, response.getWriter());

        }else {
            System.out.println("에러발생");
        }


    }
}
