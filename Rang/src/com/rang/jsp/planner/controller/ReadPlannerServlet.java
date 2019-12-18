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

@WebServlet("/readPlan.do")
public class ReadPlannerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Member m = (Member) session.getAttribute("member");

//        m.getUserNo();

        HashMap<String, Object> hmap = null;

        if(m == null){
            // 로그인 상태가 아닐경우 그냥 기본 지도만 로딩
            ArrayList<City> cityList = new PlanService().loadCity();

            System.out.println("로그인 여부 상관 없이 기본 맵 로딩");

            hmap = new HashMap<>();

            hmap.put("cityList", cityList);
            request.setAttribute("plan", hmap);
            request.getRequestDispatcher("views/planner/map.jsp").forward(request, response);

        }else {
            // 로그인 상태일 경우 최근 저장된 플래너와 지도를 로딩
            int userno = m.getUserNo();

            hmap = new PlanService().readPlanlogic(userno);

            if(hmap != null) {
                System.out.println("로드 성공");

                request.setAttribute("plan", hmap);
                request.getRequestDispatcher("views/planner/map.jsp").forward(request, response);

            }else {
                System.out.println("플래너 오류");
            }

        }


    }
}
