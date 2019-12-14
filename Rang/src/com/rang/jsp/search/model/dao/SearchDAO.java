package com.rang.jsp.search.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.tBoard.model.dao.TBoardDAO;

import static com.rang.jsp.common.JDBCTemplate.*;

public class SearchDAO {

	private Properties prop = new Properties();

	public SearchDAO() {
		String filePath = TBoardDAO.class.getResource("/mappers/search.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	// 회원 검색용
	public Member searchMember(Connection con, String keyword) {
		
		Member mb = null;

        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        
        
        String sql = prop.getProperty("searchMember");
        
        try {
        	
        	
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
                mb = new Member();

                mb.setUserNo(rset.getInt(1));
                mb.setEmail(rset.getString(2));
                mb.setUserName(rset.getString(3));
                mb.setPassword(rset.getString(4));
                mb.setNickName(rset.getString(5));
                mb.setBirthDate(rset.getString(6));
                mb.setZipCode(rset.getString(7));
                mb.setAddress(rset.getString(8));
                mb.setPhone(rset.getString(9));
                mb.setEnrollDate(rset.getDate(10));
                mb.setStatus(rset.getString(11));
                mb.setGrade(rset.getString(12));

            }
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
    
		return mb;
	}

//
//	 public ArrayList<MBoard> searchOne(Connection con, String condition, String keyword) {
//		ArrayList<MBoard> list =null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//
//		String sql = null;
//
//	 	switch(condition) { case "nickName" : sql = ""; }
//
//	 	return list;
//	}

	// 게시글 검색
	public ArrayList<MBoard> searchMBoard(Connection con, String keyword) {
		
		MBoard mb = null;
		ArrayList<MBoard> list = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;

//		SELECT * FROM MATTACHMENT join MBOARD using (mbno) WHERE MFNO IN(SELECT MIN(MFNO) FROM MATTACHMENT GROUP BY MBNO)
//		SELECT * FROM MBOARD WHERE HASHTAG LIKE CONCAT( CONCAT('%', ?), '%')
        String sql = prop.getProperty("searchMBoard");
        
        try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while (rset.next()) {
				mb = new MBoard();

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
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	

}
