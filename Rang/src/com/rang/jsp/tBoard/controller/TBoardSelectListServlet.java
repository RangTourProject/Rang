package com.rang.jsp.tBoard.controller;

import com.rang.jsp.tBoard.model.service.TBoardService;
import com.rang.jsp.tBoard.model.vo.TBoard;
import com.rang.jsp.tBoard.model.vo.TBoardPageInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/selectList.tb")
public class TBoardSelectListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
    	
    	
        ArrayList<TBoard> list = null;
        TBoardService tbs = new TBoardService();
        
        // 회원 정보 체크용
        ArrayList<TBoard> plist = new TBoardService().TBListPartyCount();
        
        HashMap<String, Object> hmap = new HashMap<String, Object>();
        
        
       
        int startPage;
		int endPage;
		int maxPage; 
		int currentPage; 
		int limit; 
        
		currentPage = 1;
		
		limit = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
		}
		
		int listCount = tbs.getListCount();
		
		/* System.out.println(listCount); */
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (int)((double)currentPage/limit + 0.9) * limit - 9;
		
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

        list = tbs.selectList(currentPage, limit);

        String page = "";
        String page2 = "";

        if(list != null) {
        	
        	TBoardPageInfo pi = new TBoardPageInfo(startPage, endPage, 
					maxPage, currentPage, limit, listCount);
        	
        	// 서비스랑 연결해서 
        	
        	hmap.put("TbList", list);
        	
            page = "views/tBoard/tBoard.jsp";
            
            request.setAttribute("TbList", list);
            request.setAttribute("pi", pi);
           
        }

        request.getRequestDispatcher(page).forward(request, response);
        
    }
}
