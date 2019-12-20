package com.rang.jsp.mboard.model.service;

import com.rang.jsp.mboard.model.dao.MBoardDAO;
import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

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

    public ArrayList<MBoard> selectList() {

        con = getConnection();

        ArrayList<MBoard> list = mbdao.selectList(con);

        close(con);

        return list;

    }

    // modal ajax 메소드
    public HashMap<String, Object> selectOne(int mbno) {

        con = getConnection();

        System.out.println("ajax 서비스 도착 체크");

        HashMap<String,Object> hmap = null;

        hmap = mbdao.selectOne(con, mbno);

        close(con);

        return hmap;
    }

    // mboard 수정 화면 서블릿
    public HashMap<String, Object> updateView(int mbno) {

        con = getConnection();

        HashMap<String, Object> hmap = mbdao.selectOne(con, mbno);

        close(con);

        return hmap;
    }

    // 게시글 수정 내용 업데이트 용
    public int updateMBoard(MBoard mb, ArrayList<MAttachment> list) {
        con = getConnection();

        int result = 0;

        int result1 = mbdao.updateMBoard(con, mb);

        int result2 = mbdao.updateMAttachment(con, list);

        if(result1 > 0 && result2 > 0){
            commit(con);
            result = 1;
        }else rollback(con);

        close(con);

        return result;
    }

    // 게시글 삭제
    public int deleteMBoard(int mbno) {

        con = getConnection();

        int result = mbdao.deleteMBoard(con, mbno);

        if(result > 0) commit(con);
        else rollback(con);

        return result;
    }

    // 내 게시글 보여주깅
    public ArrayList<MBoard> myPageList(String nickName) {
        con = getConnection();

        ArrayList<MBoard> list = mbdao.myPageList(con, nickName);

        close(con);

        return list;
    }

    // 사용자메인 게시글 수 보여주기
    public int mBoardCount(String nickName) {
        con = getConnection();

        int mBoardCount = mbdao.mBoardCount(con,nickName);

        if(mBoardCount > 0) commit(con);
        else rollback(con);

        close(con);
        return mBoardCount;
    }

    // 검색한놈 게시글 보깅
    public ArrayList<MBoard> selectList(String keyword) {
        con = getConnection();

        ArrayList<MBoard> list = mbdao.myPageSearchList(con, keyword);


        return list;
    }

    // 총 몇페이지가 나와서 끝은 무엇이있는지 계산
    public ArrayList<MBoard> selectList(int currentPage, int limit) {
        con = getConnection();

        int startRow = (currentPage - 1) * limit;
        int endRow = startRow + 3;

        ArrayList<MBoard> list = mbdao.selectListPaging(con, startRow, endRow);

        close(con);

        return list;
    }

    public int getListCount() {
        con = getConnection();

        int result = mbdao.getListCount(con);

        close(con);

        return result;
    }
}
