package com.rang.jsp.planner.controller;

import com.google.gson.Gson;
import com.rang.jsp.planner.model.service.PlanService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/plancheck.do")
public class PlannerCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userno = Integer.parseInt(request.getParameter("userno"));

        int result = new PlanService().plannerCheck(userno);

        if(result > 0){
            response.setContentType("application/json; charset=utf-8;");
            new Gson().toJson(result, response.getWriter());
        }else {
            System.out.println("조회 실패");
        }

    }
}
