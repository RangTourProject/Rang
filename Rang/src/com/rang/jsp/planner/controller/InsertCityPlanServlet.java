package com.rang.jsp.planner.controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.rang.jsp.member.model.vo.Member;
import com.rang.jsp.planner.model.service.PlanService;
import com.rang.jsp.planner.model.vo.CityPlan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/insert.cp")
public class InsertCityPlanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println( "서블릿으로 온 값 확인 : " + request.getParameter("arrList"));

//        int plancode = Integer.parseInt(request.getParameter("plancode"));

//        System.out.println("플랜 코드 : " + plancode);

        Gson gson = new Gson();
        String jsonString = request.getParameter("arrList");

        CityPlan[] array = gson.fromJson(jsonString, CityPlan[].class);

        // 1
        List<CityPlan> list = Arrays.asList(array);

        // 방법 2
//        List<CityPlan> list = gson.fromJson(jsonString, new TypeToken<List<CityPlan>>(){}.getType());

        System.out.println( "쪼개기 확인 : " + list);

        int result = new PlanService().insertCityPlan(list);

        if(result > 0){
            response.setContentType("application/json; charset=utf-8;");
            new Gson().toJson(result, response.getWriter());
        }else {
            System.out.println("에러발생");
        }

    }
}
