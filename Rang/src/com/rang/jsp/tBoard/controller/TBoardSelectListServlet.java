package com.rang.jsp.tBoard.controller;

import com.rang.jsp.tBoard.model.service.TBoardService;
import com.rang.jsp.tBoard.model.vo.TBoard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/selectList.tb")
public class TBoardSelectListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<TBoard> list = null;

        list = new TBoardService().selectList();

        String page = "";

        if(list != null) {

            page = "views/tBoard/tBoard.jsp";
            request.setAttribute("List", list);

        }

        request.getRequestDispatcher(page).forward(request, response);
    }
}
