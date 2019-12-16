package com.rang.jsp.mboard.controller;

import com.google.gson.Gson;
import com.rang.jsp.like.model.service.LikeService;
import com.rang.jsp.like.model.vo.ILike;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboardComment.model.service.MBoardCommnetService;
import com.rang.jsp.mboardComment.model.vo.MBoardComment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/selectOne.mb")
public class SelectOneMBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MBoardService mbs = new MBoardService();

        int mbno = Integer.parseInt(request.getParameter("mbno"));

        System.out.println("mbno 확인 : " + mbno);

        // 게시글 내용
        HashMap<String, Object> mboard = mbs.selectOne(mbno);
        // 게시글 댓글 내용
        ArrayList<MBoardComment> clist = new MBoardCommnetService().MBCommnetList(mbno);

        // 게시글 좋아요
        ArrayList<ILike> likeList = new LikeService().whoLike(mbno);

        // 게시글 댓글 조회한 내용을 게시글 HashMap에 추가하기
        mboard.put("clist", clist);
        mboard.put("likeList", likeList);

        // 확인
        System.out.println(mboard);

        if(mboard != null){

            response.setContentType("application/json; charset=utf-8;");

            new Gson().toJson(mboard, response.getWriter());

        }else {
            System.out.println("에러발생");
        }


    }
}
