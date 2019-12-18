package com.rang.jsp.tBoardComment.model.dao;

import static com.rang.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.rang.jsp.tBoardComment.model.vo.tBoardComment;

public class tBoardCommentDAO {
	
	private Properties prop = new Properties();
	
	public tBoardCommentDAO() {
		String filePath = tBoardCommentDAO.class
				          .getResource("/mappers/tBoardComment.properties")
				          .getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertComment(Connection con, tBoardComment tbco) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, tbco.getTbno());
			pstmt.setInt(2, tbco.getUserno());
			pstmt.setString(3, tbco.getTccontent());
			pstmt.setInt(4, tbco.getTclevel());
			
			// 다른 참조하는 댓글이 만약 없다면 null이 들어가고,
			// 참조하는 댓글이 존재한다면 해당 댓글의 정보가 들어가야 한다.
			if(tbco.getRef_tcno() > 0) {
				pstmt.setInt(5, tbco.getRef_tcno());
			} else {
				// pstmt.setNull(4, java.sql.Types.NULL);
				pstmt.setNull(5, 0);
			}
				
				
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<tBoardComment> selectList(Connection con, int tbno) {
		ArrayList<tBoardComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, tbno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				
				tBoardComment tbco = new tBoardComment();
				
				tbco.setTcno(rset.getInt(1));                   // 1
				tbco.setTbno(rset.getInt("TBNO"));              // 2
				tbco.setUserno(rset.getInt("USERNO"));          // 3
				tbco.setTccontent(rset.getString("TCCONTENT")); // 4
				tbco.setTcdate(rset.getDate("TCDATE"));          //5
				tbco.setTclevel(rset.getInt("TCLEVEL"));         //6
				tbco.setStatus(rset.getString("STATUS"));       // 7
				tbco.setRef_tcno(rset.getInt("REF_TCNO"));      // 8
				
				list.add(tbco);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateComment(Connection con, tBoardComment tbco) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, tbco.getTccontent());
			pstmt.setInt(2, tbco.getTcno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}
	
	public int deleteComment(Connection con, int tbno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, tbno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {			
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
}
