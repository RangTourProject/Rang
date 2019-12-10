package com.rang.jsp.mboard.controller;

import com.rang.jsp.mboard.model.service.MBoardService;
import com.rang.jsp.mboard.model.vo.MBoard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/selectList.mb")
public class SelectListMBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<MBoard> list = null;

        list = new MBoardService().selectList();

        System.out.println("dao 까지 갔다옴 : " + list);

        String page ="";

        if(list != null){
//            page = "views/thumbnail/thumbnailList.jsp";
            System.out.println("게시글 불러오기 성공");
            request.setAttribute("list", list);
            request.getRequestDispatcher("views/mBoard/mBoard.jsp").forward(request, response);

        }else{
//            page = "views/common/errorPage.jsp";
//            request.setAttribute("msg", "섬네일 불러오기 실패");
            System.out.println("게시글 불러오기 실패");
            response.sendRedirect("index.jsp");
        }

//        request.getRequestDispatcher(page).forward(request, response);
    }
}
