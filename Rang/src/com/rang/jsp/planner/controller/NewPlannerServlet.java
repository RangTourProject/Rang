package com.rang.jsp.planner.controller;

import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.planner.model.service.PlanService;
import com.rang.jsp.planner.model.vo.City;
import com.rang.jsp.planner.model.vo.Planner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

// 새플래너 생성
@WebServlet("/newplan.do")
public class NewPlannerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HashMap<String, Object> hmap = null;

        System.out.println("로그인 상태");

        int userno = Integer.parseInt(request.getParameter("userNo"));
        String title = request.getParameter("title");
        String startday = request.getParameter("startday");
        int people = Integer.parseInt(request.getParameter("people"));

        Planner p = new Planner(userno, title, people, startday);

        hmap = new PlanService().newPlanlogic(p);

        if(hmap != null) {
            System.out.println("저장 및 로드 성공");

            request.setAttribute("plan", hmap);
            request.getRequestDispatcher("views/planner/map.jsp").forward(request, response);

        }else {
            System.out.println("플래너 오류");
        }

    }
}
