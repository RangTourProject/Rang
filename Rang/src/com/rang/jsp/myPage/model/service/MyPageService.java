package com.rang.jsp.myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.rang.jsp.myPage.model.dao.MyPageDAO;
import com.rang.jsp.myPage.model.vo.ChangeImage;
import static com.rang.jsp.common.JDBCTemplate.*;

public class MyPageService {
	Connection con;
	MyPageDAO pDao = new MyPageDAO();

	public int insertMyPagePhoto(ArrayList<ChangeImage> list) {
		con = getConnection();
		
		int result = 0; 
		
		result = pDao.insertMyPagePhoto(con, list);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
