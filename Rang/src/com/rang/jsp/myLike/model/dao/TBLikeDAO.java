package com.rang.jsp.myLike.model.dao;

import static com.rang.jsp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rang.jsp.myLike.model.vo.TbLike;

public class TBLikeDAO {

	public int insertTbLike(Connection con, TbLike ml) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println(ml);
		
		String sql = "INSERT INTO TBLIKE VALUES( ? , ? )";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ml.getUserNo());
			pstmt.setInt(2, ml.gettBno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int TbLikeCount(Connection con, TbLike ml) {
		int count = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = "SELECT COUNT(*) FROM TBLIKE WHERE TBNO = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ml.gettBno());
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}
}
