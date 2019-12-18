package com.rang.jsp.tBoardComment.model.service;

import static com.rang.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.rang.jsp.tBoardComment.model.dao.tBoardCommentDAO;
import com.rang.jsp.tBoardComment.model.vo.tBoardComment;

public class tBoardCommentService {
	Connection con;
	private tBoardCommentDAO tcdao = new tBoardCommentDAO();
	
	public int insertComment(tBoardComment tbco) {
		con = getConnection();
		
		int result = tcdao.insertComment(con, tbco);
		
		if ( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<tBoardComment> selectList(int tbno) {
		con = getConnection();
		
		ArrayList<tBoardComment> list = tcdao.selectList(con, tbno);
		
		close(con);
		
		return list;
	}

	public int updateComment(tBoardComment tbco) {
		con = getConnection();
		
		int result = tcdao.updateComment(con, tbco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int deleteComment(int tcno) {
		con = getConnection();
		
		int result = tcdao.deleteComment(con, tcno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
