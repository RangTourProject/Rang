package com.rang.jsp.myPage.model.dao;

import static com.rang.jsp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.rang.jsp.myPage.model.vo.ChangeImage;

public class MyPageDAO {

	public int insertMyPagePhoto(Connection con, ArrayList<ChangeImage> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO CHANGEIMAGE VALUES(? ,? ,? ,DEFAULT ,?)";
				
		try {
		
			for(int i = 0 ; i < list.size() ; i++) {
				
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, list.get(i).getUserno());
				pstmt.setString(2, list.get(i).getImgoriginname());
				pstmt.setString(3, list.get(i).getImgchangename());
				pstmt.setString(4, list.get(i).getImgfilepath());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			
		}		
		
		return result;
	}

}
