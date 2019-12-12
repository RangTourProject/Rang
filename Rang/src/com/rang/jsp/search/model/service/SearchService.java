package com.rang.jsp.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.rang.jsp.mboard.model.vo.MBoard;
import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.search.model.dao.SearchDAO;
import static com.rang.jsp.common.JDBCTemplate.*;

public class SearchService {

	Connection con;

	private SearchDAO sDao = new SearchDAO();

	public Member searchMamber(String keyword) {
		
		con = getConnection();

		Member mb = new Member();

		// if(condition.length() > 0 ) list = nDao.searchNotice(con, condition, keyword);
		// else list = nDao.selectList(con);
		
		 
		mb = sDao.searchMember(con, keyword);
			

		close(con);
		
		return mb;
	
	}


//	 public ArrayList<MBoard> searchOne(String condition, String keyword) {
//	 Connection con = getConnection();
//
//	 ArrayList<MBoard> list = null;
//
//	 list = sDao.searchOne(con, condition, keyword);
//
//	 if(list != null) commit(con); else rollback(con);
//
//	 return list; }


	public ArrayList<MBoard> searchMBoard(String keyword) {
		con = getConnection();

		ArrayList<MBoard> list = sDao.searchMBoard(con, keyword);

		close(con);

		return list;
	}



		

}
