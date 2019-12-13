package com.rang.jsp.mboardComment.model.service;

import com.rang.jsp.mboardComment.model.dao.MBoardCommentDAO;
import com.rang.jsp.mboardComment.model.vo.MBoardComment;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.*;
import static com.rang.jsp.common.JDBCTemplate.close;

public class MBoardCommnetService {

    Connection con;
    private MBoardCommentDAO mbcdao = new MBoardCommentDAO();

    // 댓글 등록용
    public int insertMBCommnet(MBoardComment mbc) {

        con = getConnection();

        int result = mbcdao.insertMComment(con, mbc);

        if (result > 0) {
            commit(con);
            // 최근 댓글 번호 가져오기
            result = mbcdao.selectLastMComment(con);
        } else {

            rollback(con);
        }

        close(con);

        return result;

    }

    // 게시글 댓글 조회용
    public ArrayList<MBoardComment> MBCommnetList(int mbno) {

        con = getConnection();

        ArrayList<MBoardComment> list = mbcdao.MBCommnetList(con, mbno);

        close(con);

        return list;

    }

    // 댓글 업데이트용
    public int updateMComment(MBoardComment mbco) {
        con = getConnection();

        int result = mbcdao.updateMComment(con, mbco);

        if(result > 0) commit(con);
        else rollback(con);

        close(con);

        System.out.println("service : " + result);

        return result;
    }

    // 댓글 삭제용
    public int deleteMComment(int mcno) {
        con = getConnection();

        int result = mbcdao.deleteMComment(con, mcno);

        if(result > 0) commit(con);
        else rollback(con);

        close(con);

        return result;
    }
}
