package com.rang.jsp.myLike.model.service;

import static com.rang.jsp.common.JDBCTemplate.commit;
import static com.rang.jsp.common.JDBCTemplate.getConnection;
import static com.rang.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import static com.rang.jsp.common.JDBCTemplate.*;

import com.rang.jsp.myLike.model.dao.MBLikeDAO;
import com.rang.jsp.myLike.model.dao.TBLikeDAO;
import com.rang.jsp.myLike.model.vo.TbLike;

public class TBLikeService {
	Connection con;
	TBLikeDAO tlDao = new TBLikeDAO();
	public int insertTbLike(TbLike ml) {
		con = getConnection();
		// 좋아요 숫자 가져올 dao 실행
		int count = 0;
		
		// 좋아요 추가할 dao 실행
		int result = tlDao.insertTbLike(con, ml);
		
		
		// 인서트 실행 시 좋아요 숫자 조회 메소드 실행
		if(result > 0) {
			count = tlDao.TbLikeCount(con, ml);
			if(count > 0) commit(con);
			
		} else {
			rollback(con);
		}
		return count;
		
	}
	
	}


