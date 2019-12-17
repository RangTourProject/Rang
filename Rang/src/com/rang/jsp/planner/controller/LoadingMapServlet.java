package com.rang.jsp.planner.controller;

import com.rang.jsp.planner.model.service.PlanService;
import com.rang.jsp.planner.model.vo.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/loadmap.mp")
public class LoadingMapServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HashMap<String, Object> hmap = null;

        // 전체 도시 정보 가져오기
        ArrayList<City> cityList = new PlanService().loadCity();

        System.out.println("로그인 여부 상관 없이 기본 맵 로딩");

        hmap = new HashMap<>();

        hmap.put("cityList", cityList);
        request.setAttribute("plan", hmap);
        request.getRequestDispatcher("views/planner/map.jsp").forward(request, response);

    }
}
