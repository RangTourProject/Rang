package com.rang.jsp.mboard.controller;

import com.rang.jsp.mboard.model.service.MBoardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/mUpView.mb")
public class UpdateMBoardViewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // mboard 수정 화면 서블릿

        int mbno = Integer.parseInt(request.getParameter("mbno"));

        HashMap<String, Object> hmap = new MBoardService().updateView(mbno);

        String page = "";

        if(hmap != null){
            page = "views/mBoard/updateMBoard.jsp";
            request.setAttribute("mBoard", hmap.get("mBoard"));
            request.setAttribute("mAttachment", hmap.get("mAttachment"));

        }else {
            page = "views/common/errorPage.jsp";
            request.setAttribute("msg", "페이지 수정화면 불러오기 실패");
        }

        request.getRequestDispatcher(page).forward(request, response);

    }
}
