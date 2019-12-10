package com.rang.jsp.mboard.model.dao;

import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import static com.rang.jsp.common.JDBCTemplate.close;

public class MBoardDAO {

    // 게시글 등록용
    public int insertMBoard(Connection con, MBoard mb) {
        int result = 0;

        PreparedStatement pstmt = null;

        try{
            String sql = "insert into MBOARD values (SEQ_MBNO.nextval, ?, ?, ?, ?, ?, ?, ?,default , null , default , default )";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mb.getUserno());
            pstmt.setString(2, mb.getWriter());
            pstmt.setString(3, mb.getMbtitle());
            pstmt.setString(4, mb.getMbcontent());
            pstmt.setString(5, mb.getHashtag());
            pstmt.setString(6, mb.getLocationname());
            pstmt.setInt(7,mb.getTotalcost());

            result = pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 최근 게시글 조회용
    public int selectCurrentMBno(Connection con) {
        int result = 0;

        Statement stmt = null;
        ResultSet rset = null;

        try{
            String sql = "select MBNO from (select * from MBOARD ORDER BY MBDATE DESC) where ROWNUM = 1";

            stmt = con.createStatement();

            rset = stmt.executeQuery(sql);

            if(rset.next()){
                result = rset.getInt(1);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(stmt);
        }

        return result;
    }

    // 게시글 사진 등록용
    public int insertMAttachment(Connection con, ArrayList<MAttachment> list) {
        int result = 0;

        PreparedStatement pstmt = null;

        try{
            String sql = "insert into MATTACHMENT values (SEQ_MFNO.nextval, ?, ?, ?, default , ?, null , default)";

            pstmt = con.prepareStatement(sql);

            // list를 위한 for문
            for(int i = 0 ; i < list.size() ; i++){

                pstmt.setInt(1, list.get(i).getMbno());
                pstmt.setString(2, list.get(i).getMoriginName());
                pstmt.setString(3, list.get(i).getMchangeName());
                pstmt.setString(4, list.get(i).getMfilePath());
//
//                // 첫 이미지는 0 level (대표)
//                // 나머지는 1 level (서브)
//                if (i == 0) pstmt.setInt(5, 0);
//                else pstmt.setInt(5, 1);

                result += pstmt.executeUpdate(); // 실행된 수 만큼 result에 담는다
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 게시글 리스트 조회
    public ArrayList<MBoard> selectList(Connection con) {
        ArrayList<MBoard> list = null;
        Statement stmt = null;
        ResultSet rset = null;

        try{

            String sql = "SELECT * FROM MATTACHMENT join MBOARD using (mbno) WHERE MFNO IN(SELECT MIN(MFNO) FROM MATTACHMENT GROUP BY MBNO)";

            stmt = con.createStatement();

            rset = stmt.executeQuery(sql);

            list = new ArrayList<>();

            while(rset.next()){

                MBoard mb = new MBoard();

                mb.setMbno(rset.getInt("MBNO"));
                mb.setWriter(rset.getString("writer"));
                mb.setMbtitle(rset.getString("mbtitle"));
                mb.setMbcontent(rset.getString("mbcontent"));
                mb.setHashtag(rset.getString("hashtag"));
                mb.setLocationname(rset.getString("locationname"));
                mb.setTotalcost(rset.getInt("totalcost"));
                mb.setMbdate(rset.getDate("mbdate"));
                mb.setMbcount(rset.getInt("MBCOUNT"));
                mb.setMbfile(rset.getString("mchangename"));

                list.add(mb);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(rset);
            close(stmt);
        }

        return list;
    }

    // modal ajax 메소드
    public HashMap<String, Object> selectOne(Connection con, int mbno) {

        HashMap<String, Object> hmap = null;

        MBoard mb = null;
        ArrayList<MAttachment> list = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try {

            String sql = "select B.*, A.* from MBOARD B join MATTACHMENT A ON (B.MBNO = A.MBNO) WHERE B.STATUS = 'N' and A.STATUS = 'N' and B.MBNO = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, mbno);

            rset = pstmt.executeQuery();

            list = new ArrayList<>();

            // 반복하여 리스트 와 mb 담기
            while (rset.next()){

                // 1. 게시글은 항상 같기 때문에 그냥 반복하여 덮어씌움
                mb = new MBoard();

                mb.setMbno(mbno);
                mb.setUserno(rset.getInt("userno"));
                mb.setWriter(rset.getString("writer"));
                mb.setMbtitle(rset.getString("mbtitle"));
                mb.setMbcontent(rset.getString("mbcontent"));
                mb.setHashtag(rset.getString("hashtag"));
                mb.setLocationname(rset.getString("locationname"));
                mb.setTotalcost(rset.getInt("totalcost"));
                mb.setMbdate(rset.getDate("mbdate"));
                mb.setMbcount(rset.getInt("MBCOUNT"));

                // 2. attachment 담기
                MAttachment mat = new MAttachment();

                mat.setMfno(rset.getInt("mfno"));
                mat.setMbno(mbno);
                mat.setMoriginName(rset.getString("moriginname"));
                mat.setMchangeName(rset.getString("mchangename"));
                mat.setMfilePath(rset.getString("mfilepath"));
                mat.setUploadDate(rset.getDate("uploaddate"));
                mat.setStatus(rset.getString("status"));

                list.add(mat);
            }

            hmap = new HashMap<>();

            hmap.put("mBoard", mb);
            hmap.put("mAttachment", list);

        }catch (SQLException e ){
            e.printStackTrace();
        }finally {
            close(rset);
            close(pstmt);
        }

        return hmap;
    }
}
