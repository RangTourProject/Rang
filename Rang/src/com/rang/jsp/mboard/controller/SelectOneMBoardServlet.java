package com.rang.jsp.mboard.controller;

import com.google.gson.Gson;
import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboardComment.model.service.MBoardCommnetService;
import com.rang.jsp.mboardComment.model.vo.MBoardComment;
import com.rang.jsp.myLike.model.service.MBLikeService;

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

        // 게시글 댓글 조회한 내용을 게시글 HashMap에 추가하기
        mboard.put("clist", clist);


        // 좋아요 숫자 불러오기
        int likeCount = new MBLikeService().mBoardLikeCount(mbno);

        // 게시글 댓글 조회한 내용을 게시글 HashMap에 추가하기
        mboard.put("clist", clist);

        // 좋아요 숫자 조회한 내용를 게시글 HashMap에 추가하기
        mboard.put("likeCount",likeCount);

        // 확인
        System.out.println(mboard);



        // 게시글에 좋아요한 사용자 리스트
        // ArrayList<LikeUserVo> LUlist = new LikeService().LikeUserList(mbno);

        // 확인
        // System.out.println("lulist확인 : " + LUlist);

        // mboard.put("LUlist", LUlist);

        if(mboard != null){

            response.setContentType("application/json; charset=utf-8;");

            new Gson().toJson(mboard, response.getWriter());

        }else {
            System.out.println("에러발생");
        }


    }
}