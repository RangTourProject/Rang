package com.rang.jsp.mboard.model.dao;

import com.rang.jsp.mboard.model.vo.MAttachment;
import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.tBoard.model.dao.TBoardDAO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.rang.jsp.common.JDBCTemplate.close;

public class MBoardDAO {

    private Properties prop = new Properties();

    public MBoardDAO() {
        String filePath = TBoardDAO.class.getResource("/mappers/mBoard.properties").getPath();

        try {
            prop.load(new FileReader(filePath));
        } catch (FileNotFoundException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    // 게시글 등록용
    public int insertMBoard(Connection con, MBoard mb) {
        int result = 0;

        PreparedStatement pstmt = null;

        String sql = prop.getProperty("insertMBoard");

        try{


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
            String sql = prop.getProperty("selectCurrentMBno");

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
            String sql = prop.getProperty("insertMAttachment");

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

            String sql = prop.getProperty("selectList");

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
                mb.setLikecount(rset.getInt("MBLC"));
                mb.setCommentcount(rset.getInt("MCC"));

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

            String sql = prop.getProperty("selectOne");

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

    // 게시글 수정용
    public int updateMBoard(Connection con, MBoard mb) {
        int result = 0;
        PreparedStatement pstmt = null;

        try {
            String sql = prop.getProperty("updateMBoard");

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, mb.getMbtitle());
            pstmt.setString(2, mb.getMbcontent());
            pstmt.setString(3, mb.getHashtag());
            pstmt.setString(4, mb.getLocationname());
            pstmt.setInt(5, mb.getTotalcost());
            pstmt.setInt(6, mb.getMbno());

            result = pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    public int updateMAttachment(Connection con, ArrayList<MAttachment> list) {
        int result = 0;

        PreparedStatement pstmt = null;

        try{
            String sql = prop.getProperty("updateMAttachment");

            pstmt = con.prepareStatement(sql);

            for(int i = 0; i < list.size() ; i++){

                pstmt.setString(1, list.get(i).getMoriginName());
                pstmt.setString(2, list.get(i).getMchangeName());
                pstmt.setInt(3, list.get(i).getMfno());

                result += pstmt.executeUpdate();
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }

        return result;
    }

    // 게시글 삭제
    public int deleteMBoard(Connection con, int mbno) {
        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("deleteMBoard");

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mbno);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            close(pstmt);
        }

        return result;
    }

    // 내 마이페이지 게시글 불러오기
    public ArrayList<MBoard> myPageList(Connection con, String nickName) {
        ArrayList<MBoard> list = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try{

            String sql = "SELECT * FROM MATTACHMENT join MBOARD using (mbno) WHERE MBOARD.STATUS = 'N' and MFNO IN(SELECT MIN(MFNO) FROM MATTACHMENT GROUP BY MBNO) AND WRITER = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, nickName);

            rset = pstmt.executeQuery();

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
            close(pstmt);
        }

        return list;
    }

    // 사용자의 메인 게시글 작성 수 보여주기
    public int mBoardCount(Connection con, String nickName) {
        int mBoardCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = "SELECT COUNT(*) FROM MBOARD WHERE WRITER = ? AND STATUS = 'N'";

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, nickName);


            rset = pstmt.executeQuery();

            if(rset.next()) {
                mBoardCount = rset.getInt(1);
            }


        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return mBoardCount;
    }

    // 검색한 친구 게시글 보기
    public ArrayList<MBoard> myPageSearchList(Connection con, String keyword) {
        ArrayList<MBoard> list = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        try{

            String sql = "SELECT * FROM MATTACHMENT join MBOARD using (mbno) WHERE MBOARD.STATUS = 'N' AND MFNO IN(SELECT MIN(MFNO) FROM MATTACHMENT GROUP BY MBNO) AND WRITER = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, keyword);

            rset = pstmt.executeQuery();

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
            close(pstmt);
        }

        return list;
    }

    // 무한 페이징
    public ArrayList<MBoard> selectListPaging(Connection con, int startRow, int endRow) {
        ArrayList<MBoard> list = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectListPaging");

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, endRow);
            pstmt.setInt(2, startRow);

            rset = pstmt.executeQuery();

            list = new ArrayList<>();

            //selectList
            while(rset.next()) {

                MBoard m = new MBoard();

                m.setMbno(rset.getInt("MBNO"));
                m.setWriter(rset.getString("writer"));
                m.setMbtitle(rset.getString("mbtitle"));
                m.setMbcontent(rset.getString("mbcontent"));
                m.setHashtag(rset.getString("hashtag"));
                m.setLocationname(rset.getString("locationname"));
                m.setTotalcost(rset.getInt("totalcost"));
                m.setMbdate(rset.getDate("mbdate"));
                m.setMbcount(rset.getInt("MBCOUNT"));
                m.setMbfile(rset.getString("mchangename"));
                m.setLikecount(rset.getInt("MBLC"));
                m.setCommentcount(rset.getInt("MCC"));

                list.add(m);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }


    public int getListCount(Connection con) {
        int result = 0;
        Statement stmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("getListCount");

        try {
            stmt = con.createStatement();
            rset = stmt.executeQuery(sql);

            if(rset.next()) {
                result = rset.getInt(1);
            }
        } catch(SQLException e) {
            e.printStackTrace();

        } finally {
            close(rset);
            close(stmt);
        }
        return result;
    }
}
