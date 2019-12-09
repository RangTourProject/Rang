package com.rang.jsp.mboard.model.service;

import com.rang.jsp.mboard.model.dao.MBoardDAO;
import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;

import java.sql.Connection;
import java.util.ArrayList;

import static com.rang.jsp.common.JDBCTemplate.*;

public class MBoardService {
    Connection con = null;
    private MBoardDAO mbdao = new MBoardDAO();

    // 게시글 작성용 메소드
    public int insertMBoard(MBoard mb, ArrayList<MAttachment> list) {
        con = getConnection();

        int result = 0;

        // 1. 게시글 등록 DAO 연결 하여 결과 받아오기
        int boardInsertCheck = mbdao.insertMBoard(con, mb);

        // 첨부파일 등록용 변수
        int attachInsertCheck = 0;

        // 1 - 2. 등록된 게시글의 bno 가져오기
        if(boardInsertCheck > 0) {
            int currentBno = mbdao.selectCurrentMBno(con);

            // 2. 게시글에 대한 첨부파일 등록 insert sql(게시글의 bno 필요)
            for(int i = 0; i < list.size() ; i++){
                list.get(i).setMbno(currentBno);
            }

            // 게시글 사진 등록용
            attachInsertCheck = mbdao.insertMAttachment(con, list);

        }

        // 3. 두 결과를 확인하여 commit 혹은 rollback
        if(attachInsertCheck == list.size() && boardInsertCheck > 0){
            commit(con);
            result = 1;
        }else rollback(con);

        close(con);

        return result;
    }
}
